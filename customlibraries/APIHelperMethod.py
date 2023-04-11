from robot.api.deco import library, keyword


@library
class APIHelperMethod:
    def __init__(self):
        pass

    @keyword
    def get_dictionary_key_value(self, dictionary_data: list, book_id: str) -> dict | None:
        book_id_num = book_id[3::]
        for book_data_dict in dictionary_data:
            if book_id_num in book_data_dict.values():
                return book_data_dict
        return None