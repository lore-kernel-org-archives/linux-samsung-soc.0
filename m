Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EF331F9BE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302255; cv=none; b=EbAmaH3FhWtZhUWNEOjd2d+wzFpmSCJNBBr7uOYnCxijWsbqKfddqk3cezLfZnhdkMtlYr/AE50kntjM/ooH6HOdQpkf+WpQla04yEqDvE0EnYUGyFs/g4QrhWJrniPMbYXz7/Fv10+C2cdyiCbE0XbnK5f3CLe2lN29v0b08sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302255; c=relaxed/simple;
	bh=TreFdYinnhSJgXpknKYqTtPyjIcb0I8seNUyWKt+xKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbPD2VNc7i+o5szCt7zddM84GNDw2OA5vDWgUgRjcMGf99PivTdvn8lcyeVOSBD66vwZnWgI4B2f01n/yepP+h2mUNSqiSMcHo6BKgzcgCtC4aO/zPFNpwEYNWVhZ93glGx2Knl+sFB7BMxM9afyrv+rn1mkdkvl15bWga7H7FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iMKN7afk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMKN7afk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so70365925e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Apr 2026 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302252; x=1777907052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ti2400kELeoTTXiRLb/VuTvlneI8nPmBzCy26OVf/VQ=;
        b=iMKN7afkrInt7oVARd/n6mkfDjqN8HlWdFVlEU/UPU+GiBSv7FpD1jV1gkUwyVu5ZB
         QxJpRVF5xPHff4/c47pd+1TUD1xEpWE+IBKC4XFtM/ViXCD6NtW5bEOjVqmh7yVtLccp
         eyuG8Kupngpia3ysQWZwNMH0pgoREVytlGX2x8m4ixV+DNfTtjj10b5gUa6jEHW2Pz4/
         VtK16ONC4756Hbjo9lcdnEADcway9kLwBuFUCe4D43I6ea/nl9FR+Y1dsXAz7ddO5INT
         QgR2K2xjCVMRXTp99LxMwAdygElex4u3YWcjPomOJBVNq+i1+x9z3qK8+6EKjPuBNs9y
         YOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302252; x=1777907052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ti2400kELeoTTXiRLb/VuTvlneI8nPmBzCy26OVf/VQ=;
        b=Q3OBbxhj6F5HQZOC5P/oYxWo02FEoe1LQ60qeF+p5xyruTIfuTWGbPYFlYgM/lnSC/
         bn512Ld5mszEJsGiH9Z1Y/ndcmtnLEeBZgaj+onAum8hxGjsJ7vmBPkXdB5zhrXztVf9
         nn4z7r2PC9RT1rok01n2cydm8dISbX6RawyTrUcVo1ryvDbrmpfarN1pzMu1SekaI1qy
         7VdDua0laU92p3yYyi7agG7WjqtIImznW/76OFKdcvZBvOME+FTAe/MXk4l6SdCx1IgI
         ENN84lpzK1IRK6KHPHGgbCO4WzLRZDzFEo0Erl8DsjYcbpsd/dcGKJOnDSfZZlOPwsja
         frqg==
X-Forwarded-Encrypted: i=1; AFNElJ8SHZwDV0IeSP3EHut2pS0PJeG23A+lyvyJqGJy6KapT1t5QrfX30SVP/CfG1Ec4uCL5zGFu8gp+ZBEn86+NIPIvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO+DChuKirPEJaZkqHMQzCLi4WXj9etzrx6XdyrobO/1N8tmkC
	g0+fGIlGFLa/O4LxUVn7dLvsoMQ0KY27Q3flQYIKzw7xatc//ESdMy4DSWDWtyKTvko=
X-Gm-Gg: AeBDieviHNv1TGLWJOlVUAc9KnI2+fzrmi9S59dehUTvdNY1HXcJHlWeGKDzPtQdgJo
	bem1g8pQ4shPfniU+JAe92B3Z21GsRFsgB0BzHqWgFpqTHqXkZyNz281n5vz0YlMgeG4wSw7M0K
	HbGhx1QLKJOrZSVurnitXNv0IeT6XBQkfO2RRXUcZ1xGiG3MW0nBwLrWcpw8AqdT4VbV1OMT4J8
	5NYmc7TX20eTrDSW9ke0bwXfJZvuPtX+ux3fVXHcLcy25KXgEReSTKHlVNAygWSw3WXpT8DR+vQ
	GwbV8zzo4b2YE0Crc17ke5kQjZU4fGXxm+yO5Xquuaz6/SK2HlvyUZRMTpqrD4hxGgiFOp2I9Jp
	3mGsdW+n09Qzb0GYA/jBXj/GSic4+/pmPAXD5UjWXybfdjV3/rgEXqKonFGZPBCZY+ce/+ZZHud
	JkmTt4mHDH1116lO0FhvY++ac60shHPVMJgd+9zAMw0RagWdfd4YAXKo+9kF7oJCkLCTVx7aN/w
	F4WsllrwEV9AaydaIf5h4PoGpOC
X-Received: by 2002:a05:600c:6296:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488fb73d764mr592141905e9.1.1777302251486;
        Mon, 27 Apr 2026 08:04:11 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:06 +0000
Subject: [PATCH v2 1/6] firmware: samsung: acpm: Fix cross-thread RX length
 corruption
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-1-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=4323;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TreFdYinnhSJgXpknKYqTtPyjIcb0I8seNUyWKt+xKw=;
 b=pAQoGOrdB9aglx1LoZ4o96ai+lG9Ru4bx/cyfczVUvFORThYC9GKBIcXcQY0ZFt5VUSyHBvQy
 eyHq/pMisNABff5Vkr8uR57Y8FVlmYKouun6Wac6MFT32bKcRwYv9Vc
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Sashiko identified a cross-thread RX length corruption bug when
reviewing the thermal addition to ACPM [1].

When multiple threads concurrently send IPC requests, the ACPM polling
mechanism can encounter responses belonging to other threads. To drain
the queue, the driver saves these concurrent responses into an internal
cache (`rx_data->cmd`) to be retrieved later by the owning thread.

Previously, the driver incorrectly used `xfer->rxcnt` (the expected
receive length of the *current* polling thread) when copying data for
*other* threads into this cache. If the threads expected responses of
different lengths, this resulted in buffer underflows (leading to reads
of uninitialized memory) or potential buffer overflows.

Fix this by replacing the boolean `response` flag in
`struct acpm_rx_data` with `rxcnt`, caching the exact expected receive
length for each specific transaction during transfer preparation. Use
this cached length when saving concurrent responses.

Consequently, ensure that `xfer->rxcnt` is explicitly zeroed in driver
helpers (e.g., `acpm_dvfs_set_xfer`) for fire-and-forget messages to
prevent uninitialized stack garbage from being interpreted as a massive
expected receive length.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c |  3 +++
 drivers/firmware/samsung/exynos-acpm.c      | 15 ++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 06bdf62dea1f..fdea7aa24ca0 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -31,6 +31,9 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 	if (response) {
 		xfer->rxcnt = cmdlen;
 		xfer->rxd = cmd;
+	} else {
+		xfer->rxcnt = 0;
+		xfer->rxd = NULL;
 	}
 }
 
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 16c46ed60837..e95edc350efa 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -104,12 +104,12 @@ struct acpm_queue {
  *
  * @cmd:	pointer to where the data shall be saved.
  * @n_cmd:	number of 32-bit commands.
- * @response:	true if the client expects the RX data.
+ * @rxcnt:	expected length of the response in 32-bit words.
  */
 struct acpm_rx_data {
 	u32 *cmd;
 	size_t n_cmd;
-	bool response;
+	size_t rxcnt;
 };
 
 #define ACPM_SEQNUM_MAX    64
@@ -199,7 +199,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 	const struct acpm_rx_data *rx_data = &achan->rx_data[tx_seqnum - 1];
 	u32 rx_seqnum;
 
-	if (!rx_data->response)
+	if (!rx_data->rxcnt)
 		return;
 
 	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
@@ -256,7 +256,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		seqnum = rx_seqnum - 1;
 		rx_data = &achan->rx_data[seqnum];
 
-		if (rx_data->response) {
+		if (rx_data->rxcnt) {
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
@@ -268,7 +268,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * clear yet the bitmap. It will be cleared
 				 * after the response is copied to the request.
 				 */
-				__ioread32_copy(rx_data->cmd, addr, xfer->rxcnt);
+				__ioread32_copy(rx_data->cmd, addr,
+						rx_data->rxcnt);
 			}
 		} else {
 			clear_bit(seqnum, achan->bitmap_seqnum);
@@ -380,8 +381,8 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
-	if (xfer->rxd)
-		rx_data->response = true;
+	/* zero means no response expected */
+	rx_data->rxcnt = xfer->rxcnt;
 
 	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
 	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog

