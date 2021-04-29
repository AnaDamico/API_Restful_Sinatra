#ecoding: utf-8

describe "POST /books" do

    context "quando o payload é ok" do
        before do
            payload = {
                title: "O livro dos Bugs",
                author: "João Junior",
                isbn: Faker::Code.isbn
            }
            @resp = BaseApi.post(
                "/books",
                body: payload.to_json,
            )
        end
        it "deve retornar 201" do
            expect(@resp.code).to eql 201
        end
    end

    context "quando payload é nulo" do
        before do
            @resp = BaseApi.post(
                "/books", 
                body: nil,
            )
        end

        it "deve retornar 400" do
            expect(@resp.code).to eql 400
        end
    end

    context "quando o isbn ja existe" do

        before do
            payload = {
                title: "Dom Casmurro",
                author: "Machado de Assis",
                isbn: Faker::Code.isbn
            }
            BaseApi.post(
                "/books",
                body: payload.to_json,
            )
            @resp = BaseApi.post(
                "/books",
                body: payload.to_json,
            )
        end
            # Status code 409 = conflito

            it "deve retornar 409" do
               expect(@resp.code).to eql 409
        end
    end

    context "quando o titulo não existe no payload" do

        before do

            payload = {
                author: "Machado de Assis",
                isbn: Faker::Code.isbn
            }
            BaseApi.post(
                "/books",
                body: payload.to_json,
            )
            @resp = BaseApi.post(
                "/books",
                body: payload.to_json,
            )

        end

        it "deve retornar 409" do
            expect(@resp.code).to eql 409
        end


        it "deve retornar mensagem de erro" do
            # puts @resp.parsed_response
            expect(@resp.parsed_response["error"]).to eql "Title is Required."
        end
    end


    context "quando o autor não existe no payload" do

        before do

            payload = {
                title: "A coragem de não agradar",
                isbn: Faker::Code.isbn
            }
            BaseApi.post(
                "/books",
                body: payload.to_json,
            )
            @resp = BaseApi.post(
                "/books",
                body: payload.to_json,
            )

        end

        it "deve retornar 409" do
            expect(@resp.code).to eql 409
        end


        it "deve retornar mensagem de erro" do
            # puts @resp.parsed_response
            expect(@resp.parsed_response["error"]).to eql "Author is Required."
        end
    end

    context "quando o isbn não existe no payload" do

        before do

            payload = {
                title: "A parte que falta",
                author: "Shel",
            }
            BaseApi.post(
                "/books",
                body: payload.to_json,
            )
            @resp = BaseApi.post(
                "/books",
                body: payload.to_json,
            )

        end

        it "deve retornar 409" do
            expect(@resp.code).to eql 409
        end


        it "deve retornar mensagem de erro" do
            # puts @resp.parsed_response
            expect(@resp.parsed_response["error"]).to eql "ISBN is Required."
        end
    end

end
