# ValueInvest Scaffold

## 本地启动顺序

1. 启动后端（FastAPI）
   ```bash
   cd backend
   pip install -r requirements.txt
   uvicorn app:app --reload --host 0.0.0.0 --port 8000
   ```
2. 启动前端静态服务（新开终端）
   ```bash
   cd frontend
   python -m http.server 8080
   ```

## 最小验证路径

- 后端健康检查：`GET /healthz`（例如访问 `http://127.0.0.1:8000/healthz`）
- 示例序列接口：`/api/demo/series`（例如 `http://127.0.0.1:8000/api/demo/series?code=600519`）
