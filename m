Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE28392C24
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 May 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889751; cv=none; b=LjiIIW5ctSTI4GVIoO0D2MBbtM8qRz1gW7b3WZSo4B/Q3ObSmJUrxPtYx8pAzFCZ/JrIPx5A3Pg5ZZDctzRUB7quQhDfqec5Py/v8oxW6Zj1yqIxuQuABtMuQlTmeiU7qqbb3IWPH9D5c5tHk2zB9a+Z6iMdFKNPy7T/SaOK8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889751; c=relaxed/simple;
	bh=QTePW60Bb9iT8APl2jkQnh+1qmdtoSopKY5nHEff6yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWbJk0D22Zcums8eXeikMT278mlXjkTmqc6GPLmH/gKlua3IFUCE+nQy9GaAgAzDaTsn8foyP8PVyFkktuHf2BywKTsSVXtXeDQ93BWH7n9kzdXlmNYU239tv6AHSixmf2pq4fdHPXlxxcj298X6M6rXvrF5IX3a7+EG2tZVTzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GRNitGcF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GRNitGcF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d75312379so2730512f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2026 03:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889748; x=1778494548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=GRNitGcFvMvuAi977LRZRrppY1SVzrdTE8XkklQTb5PB4CaWHhnidXL1q1ibap2rAZ
         AVGQeh1m4XegoRWwUxfV1v65SaqqU/iS53LwbNuIJIN+Q2sb38jFmwYMJfoB1L1HTcOZ
         mBsgor4T+/lUTshT3v5T15cZKGj5pSTfyD7vjrdV/MQ1DkkPOy+cBppkY3KRIY4E079h
         W3f4VXDl3rPgcuWsFMtlV1P3hKkpFohsOap0PrzCvm9ayTa8R5QAJL/tzzXFrm3cBoI1
         DfoI4EI59LITIqHO+SdpR7cbhKNQ4b1JTKsspPJZLa6gzwQLvQYSxAywkbg7xRfBL54k
         7fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889748; x=1778494548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=r81E8Slb4S4S5cUkfkFH65qhhjOFICbPSTGPgsUZRQAqKptEtnYst0ZwOoh5P8RfPw
         I+/CdYHW+EVUi4U43KkTjb3hSLstSDSpUiqWLxaGzfLyiywqk6C7kIZFUJx6sZVtahs2
         8IoI02GcUX0yaQuvmIrmq6XA9Bwh2gk4ChtlkpTADQ48aeF2TO8vLepmlLYBbkxSsxfc
         kT9axCvKvP1ma0VfGBGJpiipHk20k6FD8PX8+GDHjZeTgxQnBts/9+woL1wZ1K59i/b9
         Xooy9Yk5J7+fZgvnp0XBg6KWYTlcJZceh9IVaOBP9+QugZIay9K09nN7FInp+OOAkK7S
         7l1g==
X-Forwarded-Encrypted: i=1; AFNElJ/B40M+5bWuj10/hLCoF+2kCPF8KcmUTIovFyVLq2UgBF6fncFTHF2Qh88ZTRd8eTSIy11EirPXPP2gBFCdd93ADg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8BjmIt0FbS5EDnMldHdwssQdaMhysnsiX7daYLTu0hSqsQtGE
	45SkD2cci59u+D+7BdGcE06MM31E+TkpC5cKG7wU/PXO1g5NV7ADZzKJx4M/DhJ0XTA=
X-Gm-Gg: AeBDievVIQmXZz/mNCWEhNjL5zOorX9htqfvA6W7PTqB21VsgnqJ+hV+4Lk4tApZg1k
	GaKrINwG2UC1G7qNdU8iQvjOg3rzlStWg+Q8kL+1KVZtsbxpztMOU1u5RYGB9u1DlDnEUJvslVL
	1VkSrxQKtqrMMaLvwZihYmlshost+JZlxrb0Iy8DM9eQP7BfuA/6JgajaJJSR/Te0+1v3i8CWPj
	JnzL/3XSRfTzdWjIVXkZLFIi2VTW3ZaGoSQ7ZfhQTjz7LQSGA1F4eOk87yssJyjArrXZH8LqZ+x
	N+aidUwr/ptxUTb/DXTICFQVoer8OSH6oiG2vtFcoPN/S/GWb/U1UTHKNsF3j5WERTCl8cLzyjA
	K0gAL3i5nlGYbm0LXnnX8yjsil3jjDJKsim4k5sbmxncjzQ856R05uGepIOZzywTWBFblbRUuaM
	2NFA47LUIMDd0iZI128UH9xsjlXROS6JCVAGMa9ltQXSEMD8MqKXkMMnTUJzlKf9jk66RVcNNQk
	SQ9x636xekCkTi/Xg==
X-Received: by 2002:a05:6000:3109:b0:44d:821:1a07 with SMTP id ffacd0b85a97d-44d08211be5mr10020820f8f.13.1777889747958;
        Mon, 04 May 2026 03:15:47 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:47 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:44 +0000
Subject: [PATCH v4 1/7] firmware: samsung: acpm: Fix cross-thread RX length
 corruption
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-1-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=4319;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=QTePW60Bb9iT8APl2jkQnh+1qmdtoSopKY5nHEff6yQ=;
 b=80zUlQrtsKlzxDbNPAjqKdF4gRyC7gSE+jSLVylLga3lpLyJFqwFJkPuwnnw17f/SpUk/JAGu
 D5Ns70AdZ2IAayurrPZxSkCThctnUnNJWZhSO/BWwzOez8JvXE3lf8N
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
2.54.0.545.g6539524ca2-goog

