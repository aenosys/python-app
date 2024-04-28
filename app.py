from flask import Flask, jsonify

app = Flask(__name__)

# Define the product data directly in the Flask app
products = {
    "products": [
        {
            "id": 1,
            "name": "Product 1",
            "price": 20.99,
            "description": "This is the description of Product 1."
        },
        {
            "id": 2,
            "name": "Product 2",
            "price": 15.99,
            "description": "This is the description of Product 2."
        }
    ]
}

# Define a route to serve the products JSON data
@app.route('/')
def get_products():
    return jsonify(products)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
