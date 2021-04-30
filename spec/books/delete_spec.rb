describe "DELETE /books/:_id" do

    context "quando deleto pelo id" do
        before do
            @payload = { title: "Comportamento Aleatorio", author: "Leonardo Molinari", isbn: Faker::Code.isbn }

            book = BaseApi.post("/books", body: @payload.to_json)
            book_id = book.parsed_response["_id"]
            
            # @resp = BaseApi.get("/books/_id")
            @resp = BaseApi.delete("/books/#{book_id}")
        end

        it "deve retornar 204" do
            expect(@resp.code).to eql 204
        end
    end

    context "quando o id não existe" do

        before do

            book_id = Faker::Alphanumeric.alpha(number: 24)
            @resp = BaseApi.delete("/books/#{book_id}")
        end
        
        it "deve retornar 204" do
            expect(@resp.code).to eql 204
        end
    end
end