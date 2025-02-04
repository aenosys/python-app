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
        },
              {
            "id": 3,
            "name": "Product 3",
            "price": 19.99,
            "description": "This is the description of Product 3."
        },
              {
            "id": 4,
            "name": "Product 4",
            "price": 19.99,
            "description": "This is the description of Product 4."
        },
                 {
            "id": 5,
            "name": "Product 5",
            "price": 19.99,
            "description": "This is the description of Product 5."
        },
                    {
            "id": 6,
            "name": "Product 6",
            "price": 19.99,
            "description": "This is the description of Product 6."
        },
                     {
            "id": 6,
            "name": "Product 6",
            "price": 19.99,
            "description": "This is the description of Product 6."
        }
    ]
}

# Define a route to serve the products JSON data
@app.route('/')
def get_products():
    return jsonify(products)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
