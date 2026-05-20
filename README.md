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

## 验收命令（对应 TASK_PLAN.md DoD）

> 建议先在不同终端执行 `make api` 与 `make demo`，再执行以下命令。

### 1) 接口健康检查

```bash
curl -sS http://127.0.0.1:8000/healthz
```

预期：返回 `{"status":"ok"}`（或等价健康状态 JSON）。

### 2) 图表数据接口返回结构检查

```bash
curl -sS "http://127.0.0.1:8000/api/demo/series?code=600519" | python -m json.tool
```

预期：返回合法 JSON，且至少包含以下结构字段（名称以当前接口实现为准）：

- `code`：股票代码
- `series`：图表序列容器
- `series.kline`：K 线数据
- `series.pe_ttm`：PE(TTM) 序列
- `series.iv`：内在价值序列

### 3) 参数变更重算路径（TODO 占位，含请求格式）

```bash
curl -X POST "http://127.0.0.1:8000/api/demo/recalc" \
  -H "Content-Type: application/json" \
  -d '{
    "code": "600519",
    "params": {
      "r": 0.1,
      "g": 0.03,
      "N": 10,
      "gt": 0.02
    }
  }'
```

说明：该接口可作为 DoD #3（参数变更触发重算并回显新曲线）的验收入口；若当前版本尚未实现，可返回 `501/TODO`，但请求格式固定如上。
