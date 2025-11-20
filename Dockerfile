ARG PYTHON_VERSION=3.14
FROM python:${PYTHON_VERSION}

WORKDIR /usr/src

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PATH="/usr/src/.venv/bin:$PATH"

RUN pip install --upgrade pip \
    && pip install uv

RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --locked --no-install-project
