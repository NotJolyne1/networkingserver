RELAYNETWORKING — RENDER DEPLOYMENT

This package uses the compiled .NET 8 build from your uploaded ZIP.
Your browser HTTP / WebSocket game will be reachable on Render HTTPS.
Unity/LiteNetLib incoming UDP (default 7777) will NOT work over a Render Web Service URL.

1. Extract this ZIP on your computer.
2. Create a GitHub repository and upload the CONTENTS of this extracted folder:
   Dockerfile, start.sh, README_DEPLOY.txt and the app folder.
   Keep Dockerfile at the GitHub repository root (not within another folder).
3. In Render dashboard, open your existing Web Service.
   If it was created for Node/Python, use Settings to choose Docker runtime if available;
   otherwise create a new Web Service from the GitHub repo with Language: Docker.
4. Set Root Directory: blank (repository root).
   Dockerfile Path: ./Dockerfile (if asked).
   Docker Build Context Directory: . (if asked).
   Build Command: none; Start Command: none (Docker ENTRYPOINT handles startup).
   Environment variables: leave PORT as Render's default (10000), or set PORT=10000.
5. Deploy latest commit (or create Web Service). Watch Logs for:
   [Web] Browser players: open http://<this computer's address>:8080
   [Server] Running
6. Visit https://YOUR-SERVICE.onrender.com/ and test Create Room from another browser.
   The WebSocket connection should use wss://YOUR-SERVICE.onrender.com without :8080.

Important:
- Free Render instances can spin down when idle, disconnecting active rooms.
- Rooms and state are in memory and reset on restarts/redeploys.
- Do not upload the original ZIP as one file to GitHub; upload extracted files.
- This contains an existing compiled server, NOT a reproducible rebuild from source.
  To rebuild from source later, you also need your RelayNetworking.Common project.
