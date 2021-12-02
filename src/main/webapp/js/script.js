

function add_to_cart(pID, pName, pPrice) {

	let cart = localStorage.getItem("cart");

	if (cart == null) {
		//no cart yet
		let products = [];
		//	let product = { productID: pID, productName: pName, productQuantity: 1, productPrice: pPrice }
		let product = { productID: pID, productName: pName, productQuantity: 1, productPrice: pPrice }

		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("Product addded first time");
	} else {
		//cart is already present
		let pcart = JSON.parse(cart);

		let oldProduct = pcart.find((item) => item.productID == pID);

		if (oldProduct) {

			//we have to increase the quantity
			oldProduct.productQuantity = oldProduct.productQuantity + 1;

			pcart.map((item) => {

				if (item.productID == oldProduct.productID) {
					item.productQuantity = oldProduct.productQuantity;
				}

			})
			console.log("Product quantity increased")
		} else {

			//we have to add the product
			let product = { productID: pID, productName: pName, productQuantity: 1, productPrice: pPrice }
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("Product added")

		}
	}


}



//update cart
function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);

	if (cart==null || cart.length==0){
		console.log("Cart is empty!!");
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>Cart does not have any item</h3>");
		$(".checkout-btn").addClass('disabled',true);

	} else {
		//there is something in cart
		console.log(cart);
		$(".cart-items").html("($(cart.length))");
		let table=`
		<table class='table'>
		<thead class='thead-light'>
		<tr>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Item Name</th>
		<th>Total Price </th>
		<th>Action</th>
		</tr>
		</thead>
	
	`;
        let totalPrice=0;
		cart.map((item) => {
			table += `
		<tr>
		<td>${item.productName}</td>
		<td>${item.productPrice}</td>
		<td>${item.productQuantity}</td>
		<td>${item.productName}</td>
		
		<td>${item.productQuantity * item.productPrice}</td>
		<td><button onclick='deleteItemFromCart({item.productID})' class='btn btn-danger btn-sm'>Remove</button></td>
		
		</tr>
		
		
		`
		totalPrice+=item.productPrice * item.productQuantity;
		})


		table= table + `
		
		<tr>
		<td colspan='5' class="text-right text-font-weight-bold m-5">Total Price : ${totalPrice}
		</tr>
		
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").removeClass('disabled',false);
	}
}

//delete item
function deleteItemFromCart(pID){
let cart	=JSON.parse(localStorage.getItem('cart'));
let newcart =     cart.filter((item)=>item.productID !=pID)
localStorage.setItem('cart',JSON.stringify(newcart))

updateCart();


}




$(document).ready(function() {
	updateCart();
})



function goToCheckout(){
	window.location="checkout.jsp"
}
