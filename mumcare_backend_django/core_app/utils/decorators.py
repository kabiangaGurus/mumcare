from . import custom_responses


def has_role(func):
    def decorator(**kw):
        role = kw['role']

        def wrapper(*args, **kwargs):
            request = args[0]

            if request.user.is_authenticated:
                if request.user.has_role(role):
                    return func(args, kwargs)
                else:
                    return custom_responses.forbidden_response
            else:
                return custom_responses.forbidden_response

        return wrapper

    return decorator
