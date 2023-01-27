import httpx
import uvicorn
from fastapi import FastAPI, HTTPException, Path, status
from httpx import Response


app: FastAPI = FastAPI()


@app.get(path="/{number}", status_code=status.HTTP_200_OK)
async def get_pokemon(
    number: int = Path(title="The Pokemon to get (based on number)", ge=1, le=1010)
) -> dict:
    pokemon_url: str = f"https://pokeapi.co/api/v2/pokemon/{number}"

    async with httpx.AsyncClient() as client:
        response: Response = await client.get(url=pokemon_url)

        if response.status_code == status.HTTP_200_OK:
            return response.json()
        else:
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail=f"Could not send a request to {pokemon_url}",
            )


if __name__ == "__main__":
    uvicorn.run(app="app:app", host="localhost", port=9000, reload=True)
