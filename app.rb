require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  redirect("/add")
end

get("/add") do
  erb(:add_form)
end

get("/wizard_add") do
  @first_numb = params.fetch("first_num").to_f
  @second_numb = params.fetch("second_num").to_f

  @result = @first_numb + @second_numb
  erb(:add_result)
end

get("/subtract") do
  erb(:sub_form)
end

get("/wizard_subtract") do
  @first_numb = params.fetch("first_num").to_f
  @second_numb = params.fetch("second_num").to_f

  @result = @second_numb - @first_numb 
  erb(:sub_result)
end

get("/multiply") do
  erb(:mult_form)
end

get("/wizard_multiply") do
  @first_numb = params.fetch("first_num").to_f
  @second_numb = params.fetch("second_num").to_f

  @result = @first_numb * @second_numb

  erb(:mult_result)
end

get("/divide") do
  erb(:div_form)
end

get("/wizard_divide") do
  @first_numb = params.fetch("first_num").to_f
  @second_numb = params.fetch("second_num").to_f

  @result = @first_numb / @second_numb

  erb(:div_result)
end
