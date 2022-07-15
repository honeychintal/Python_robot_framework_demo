from robot.api.deco import keyword
import requests
from robot.api.deco import library
from ReqresSchema import *


@library(scope='GLOBAL', version='5.0.2')
class RequestsDemo(object):
    def __init__(self, *p, **k):
        pass

    @keyword('Sports Schema from ${response} should be valid', types={'response': requests.Response})
    def sports_schema_from_response_should_be_valid(self, response) -> requests.Response:
        result = ReqresSchema().load(response.json())  # load serialize the json as object
        return True
