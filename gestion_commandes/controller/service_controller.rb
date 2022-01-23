# include Sample::Models
# include Sample::Services
# include Sample::Repository

# Sample::Backend.namespace '/altTable/api' do

#   post '/restaurant' do
#     body = request.body.read
#     data = JSON.parse(body)
#     restaurant = Restaurant.new(data["nom"])
#     repo = RestaurantRepository.new()
#     restaurant_service = RestaurantService.new(repo)
#     response = restaurant_service.creation_restaurant_service restaurant
#     status STATUS_MAP[response][:status]
#     return STATUS_MAP[response][:message]
#   end

#   patch '/restaurant/:nomRestaurant/planTable' do |nomRestaurant|
#     body = request.body.read
#     data = JSON.parse(body)
#     repo = RestaurantRepository.new()
#     restaurant = Restaurant.new(nomRestaurant)
#     restaurantService = RestaurantService.new(repo)
#     response = restaurantService.modification_plan_de_table(restaurant, data["nom_plan_table"])
    
#     status STATUS_MAP[response][:status]
#     return STATUS_MAP[response][:message]
#   end


# end