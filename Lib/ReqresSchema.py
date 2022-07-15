from pprint import pprint

from marshmallow import Schema
from marshmallow import fields
from marshmallow import validate


def validLastname(s):
    if len(str(s)) < 10:
        return True
    else:
        return False


class Dataum(Schema):
    id = fields.Integer(required=True)
    email = fields.Email(required=True)
    first_name = fields.String(required=True)
    last_name = fields.String(required=True, validate=validLastname)
    avatar = fields.URL(required=True)


class Support(Schema):
    url = fields.URL(required=False)
    text = fields.String(required=True)


class ReqresSchema(Schema):
    page = fields.Integer(required=True, validate=validate.Range(min=1, max=10))
    per_page = fields.Integer(required=False)
    total = fields.Integer(required=True)
    total_pages = fields.Integer(required=True)
    data = fields.List(fields.Nested(Dataum), required=True)
    support = fields.Nested(Support, required=True)


if __name__ == '__main__':
    # main method for testing the schema validation
    input_data = {"page": 2, "per_page": 6, "total": 12, "total_pages": 2, "data": [
        {"id": 7, "email": "michael.lawson@reqres.in", "first_name": "Michael", "last_name": "Lawson",
         "avatar": "https://reqres.in/img/faces/7-image.jpg"},
        {"id": 8, "email": "lindsay.ferguson@reqres.in", "first_name": "Lindsay", "last_name": "Ferguson",
         "avatar": "https://reqres.in/img/faces/8-image.jpg"},
        {"id": 9, "email": "tobias.funke@reqres.in", "first_name": "Tobias", "last_name": "Funke",
         "avatar": "https://reqres.in/img/faces/9-image.jpg"},
        {"id": 10, "email": "byron.fields@reqres.in", "first_name": "Byron", "last_name": "Fields",
         "avatar": "https://reqres.in/img/faces/10-image.jpg"},
        {"id": 11, "email": "george.edwards@reqres.in", "first_name": "George", "last_name": "Edwards",
         "avatar": "https://reqres.in/img/faces/11-image.jpg"},
        {"id": 12, "email": "rachel.howell@reqres.in", "first_name": "Rachel", "last_name": "Howell",
         "avatar": "https://reqres.in/img/faces/12-image.jpg"}],
                  "support": {"url": "https://reqres.in/#support-heading",
                              "text": "To keep ReqRes free, contributions towards server costs are appreciated!"}}
    pprint(input_data)
    schema = ReqresSchema()
    result = schema.load(input_data)
