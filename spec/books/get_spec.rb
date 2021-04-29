
describe "GET /books" do

    before do
        @resp = BaseApi.get("/books")
    end

    it "deve retornar status 200" do
        expect(@resp.code).to eql 200
    end

    it "deve retornar retornar uma lista" do
        #puts @resp.parsed_response
        #puts @resp.parsed_response.class
        #puts @resp.parsed_response.size

        # 2 expects apenas para estudos
        expect(@resp.parsed_response.size).to be >= 0
        #expect(@resp.parsed_response.class).to eql Array
    
    end
end

describe "GET /books/:_id" do

    context "quando busco pelo id" do

        before do
            payload = {
                title: "Helena",
                author: "Machado de Assis",
                isbn: Faker::Code.isbn
            }
            @book = BaseApi.post(
                "/books",
                body: payload.to_json

            )
        end

        it "deve retornar 200" do
        
        end

        it "deve retornar os dados" do

        end
    end
end