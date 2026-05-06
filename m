Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587B43DA30
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067567; cv=none; b=swFTEzK8+RGmSIy5aAk+B5bqok0dW4vBjot36uFS1/n5yH0MQKXJMb5Wbvm/AUyqwTOcuSg/GD3NA4xNgsP0zxaFSk1hcyEuGRWU1RboTZRr71nEeLog7E3M463sUuRtu0rXBib40zGWMeoIGhDJxR4lU77Ox4A6M4ONDYW0218=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067567; c=relaxed/simple;
	bh=naSA/b8vmDt1R7gpuyFrHyOUwxvQ1EhD/2Hft+vc8Lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=osjmMo4Rg/08HUWXXdnNh1cWTW6R9dg8/YgM1sZQAdDqxzxRUWaj1YHmLYQdi01IB0mt/YYljt3p5Bx7385sKMVEkor8bYHEribNorgNxLc9zKnPnYq28XEeMPsQjm7pDBlfTDjNPm9bNNfDzbyEhqb1Mgk4Girpjmiebpe15mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EmE6A/rn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmE6A/rn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44da2de25f3so2249836f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067563; x=1778672363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq+r+ui6AdgiIfyUgPR+5nEHwOM+a2J0haQufQDNVuw=;
        b=EmE6A/rnZnd/yiI9bXnfLB/VTGlz7Her3w1wTj8PrcG07IgZtoKIvh8IpI+cDWRs5L
         7AAEc9gRcSbQ+plc/co7J43aeEQU8siqd7XXpVOGwSddvujNFazr2ikW4hg0Pw06mTiD
         gwRjcXbduvU0RJwhXmepisgxnSt4LojbUtb735rDjCyY0CMO74mBXy9TMN6L2GGWdqa5
         bml3n+57uDnOM0BZwZRbAoCDrIeudN6p0pwQUlrZIm1wPXm4vj3asuBdHw3C8JVBm7gR
         PymMk5A7yd4Tr6lqAQnXpvyegIIxOfs4koexsRtgFhLJNpUvSoeugzLIa55QGVlURUp0
         pt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067563; x=1778672363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hq+r+ui6AdgiIfyUgPR+5nEHwOM+a2J0haQufQDNVuw=;
        b=Twl3x7SewBeAo2Z1SdrOt4EnGZpnoTx6JFQHsToRx3EP96wV9XapL/UInlibd+ELHH
         Y/JS0sMIw1plhykoeHnWstgCbX16E4t4vjn1hWgsRgyb+pOpxF62nNPmty+rRjqJyZyX
         mOi/bG+i2mTh8tbHXiiQ6517shDGOfeeZvTaqvDdz5k+LwCo2oUyoyHAFUn0syfKXdnx
         zY/EgKSPwvyhWFeEDk4YafMrd+e9kbuOJsq2YkZefuf/nn+AEWz8kM3AEqQZo3QYBPiw
         QbYXPOAHysNNnZ+EqnBuVsaMx1Zw7VHnupqN9UdlMSbUgXTMvcf0Q+crgCH0LiXaB3Rn
         uFVg==
X-Forwarded-Encrypted: i=1; AFNElJ/gQgxOlXjGggm2Gkfm2VbnYRds/VWHcFvQIZuDGRdteq+bbmjgUE65AHaj3p2q9HCq7atpcrnjnzU1RpFabTIBTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqYWOg7s4O53iHKB+ll0RBrDcg2PQ4v7QD5TaV4f7BlJAwTx5A
	CQ9TEBL7vVsRJzxzWfY5xYQ5KDc30le8euuE8iEDMO05Euwa59DyLi4Tt+cvMsv3/v0=
X-Gm-Gg: AeBDievpHCp4/ahkFrh2NORxdym6YAe0+bwlBD3xV5Fty86Xhm5QYk9S9++PzqDbc1o
	Drh9iDlsRQP/rrXZp1nTENICMsCbCimpLaI8Pot63xPX5RJtos5NKVbxKTo4TsRdUSDzWNxNauV
	EWoYwWkXoUPpxsrYQPcuRGYHHihfiTNkVpXmoVyX2MpUq/kxx069DCJCGhmFq73bwXIsqdAb/8O
	Rwa278nCouPhhEwaI931Do9LgLe/FcgT17SFzobhmNfl3Ol0OAXQhHQoJ2LzgqwlCXArtYnpW1d
	wDzFaH7nVo91n1ZNY6ZVaQsDCGcPuVp+fVIypRfqLPuvqk2EZnDIk9hCQK2IHUHxOj/Ac+bEBMT
	9N626hwRCOP6JJE1e0qTe1yllTX8HWxmkBcPBqjugeI4QbCDwwhnyddMQfSKUjJsr6S3FWNMAnd
	5RGBiKcwvLWkQ6VDkesfbQGbV2x5ho05DzcBiQcZrtKhy8+YqtQV2lBadMT0WLUjw3Z1KMZv0Bg
	7uCWS9BWerchF2VuA==
X-Received: by 2002:a5d:5f82:0:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-4515b42ec0emr5288317f8f.10.1778067562509;
        Wed, 06 May 2026 04:39:22 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:03 +0000
Subject: [PATCH 1/6] firmware: samsung: acpm: Consolidate transfer
 initialization helper
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-1-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=7114;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=naSA/b8vmDt1R7gpuyFrHyOUwxvQ1EhD/2Hft+vc8Lg=;
 b=RbK1DyoIZvVW8EbQjVaIsE5FjeKyL1pUqWpXgJ22BCLWZLFP1+O9Wu5Q69rNe7oxj9XZ3+RdR
 djY+aRBcVayD/lqiL/FR20B3ZmivMWJ0KG7uPbV/HXcvUPgq2ncoEMe
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Both the DVFS and PMIC ACPM sub-drivers implement similar local helper
functions (acpm_dvfs_set_xfer and acpm_pmic_set_xfer) to initialize the
acpm_xfer structure before sending an IPC message.

Move this logic into a single centralized helper, acpm_set_xfer(),
in the core ACPM driver to reduce boilerplate, eliminate code
duplication, and prepare for the upcoming ACPM TMU helper sub-driver
which will also utilize this method.

Note that there is no change in underlying functionality. While the old
acpm_pmic_set_xfer() unconditionally assigned the RX buffer parameters
(xfer->rxd and xfer->rxcnt), the new unified helper introduces a
'response' boolean. All updated PMIC call sites now explicitly pass
'true' for this argument. This ensures the unified helper takes the
'if (response)' branch, performing the exact same assignments and
preserving the original PMIC behavior.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c | 20 ++------------------
 drivers/firmware/samsung/exynos-acpm-pmic.c | 20 +++++---------------
 drivers/firmware/samsung/exynos-acpm.c      | 26 ++++++++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h      |  2 ++
 4 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index fdea7aa24ca0..7266312ef5a6 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -21,22 +21,6 @@
 #define ACPM_DVFS_FREQ_REQ		0
 #define ACPM_DVFS_FREQ_GET		1
 
-static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
-			       unsigned int acpm_chan_id, bool response)
-{
-	xfer->acpm_chan_id = acpm_chan_id;
-	xfer->txcnt = cmdlen;
-	xfer->txd = cmd;
-
-	if (response) {
-		xfer->rxcnt = cmdlen;
-		xfer->rxd = cmd;
-	} else {
-		xfer->rxcnt = 0;
-		xfer->rxd = NULL;
-	}
-}
-
 static void acpm_dvfs_init_set_rate_cmd(u32 cmd[4], unsigned int clk_id,
 					unsigned long rate)
 {
@@ -54,7 +38,7 @@ int acpm_dvfs_set_rate(struct acpm_handle *handle,
 	u32 cmd[4];
 
 	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
-	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
 
 	return acpm_do_xfer(handle, &xfer);
 }
@@ -74,7 +58,7 @@ unsigned long acpm_dvfs_get_rate(struct acpm_handle *handle,
 	int ret;
 
 	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
-	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
index 0c50993cc9a8..f032f2c69685 100644
--- a/drivers/firmware/samsung/exynos-acpm-pmic.c
+++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
@@ -58,16 +58,6 @@ static inline u32 acpm_pmic_get_bulk(u32 data, unsigned int i)
 	return (data >> (ACPM_PMIC_BULK_SHIFT * i)) & ACPM_PMIC_BULK_MASK;
 }
 
-static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
-			       unsigned int acpm_chan_id)
-{
-	xfer->txd = cmd;
-	xfer->rxd = cmd;
-	xfer->txcnt = cmdlen;
-	xfer->rxcnt = cmdlen;
-	xfer->acpm_chan_id = acpm_chan_id;
-}
-
 static void acpm_pmic_init_read_cmd(u32 cmd[4], u8 type, u8 reg, u8 chan)
 {
 	cmd[0] = FIELD_PREP(ACPM_PMIC_TYPE, type) |
@@ -86,7 +76,7 @@ int acpm_pmic_read_reg(struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -119,7 +109,7 @@ int acpm_pmic_bulk_read(struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -159,7 +149,7 @@ int acpm_pmic_write_reg(struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -199,7 +189,7 @@ int acpm_pmic_bulk_write(struct acpm_handle *handle,
 		return -EINVAL;
 
 	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
@@ -229,7 +219,7 @@ int acpm_pmic_update_reg(struct acpm_handle *handle,
 	int ret;
 
 	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
-	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
+	acpm_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
 
 	ret = acpm_do_xfer(handle, &xfer);
 	if (ret)
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a2cac913b2bd..88a06842753d 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -517,6 +517,32 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 	return acpm_wait_for_message_response(achan, xfer);
 }
 
+/**
+ * acpm_set_xfer() - initialize an ACPM IPC transfer structure.
+ * @xfer:	pointer to the ACPM transfer structure that is being initialized.
+ * @cmd:	pointer to the buffer containing the command to be transmitted
+ *              to the ACPM firmware.
+ * @cmdcnt:	length of the command in 32-bit words.
+ * @acpm_chan_id: mailbox channel identifier.
+ * @response:	boolean flag indicating whether the kernel expects the ACPM
+ *              firmware to send a reply to this specific command.
+ */
+void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
+		   unsigned int acpm_chan_id, bool response)
+{
+	xfer->acpm_chan_id = acpm_chan_id;
+	xfer->txcnt = cmdcnt;
+	xfer->txd = cmd;
+
+	if (response) {
+		xfer->rxcnt = cmdcnt;
+		xfer->rxd = cmd;
+	} else {
+		xfer->rxcnt = 0;
+		xfer->rxd = NULL;
+	}
+}
+
 /**
  * acpm_chan_shmem_get_params() - get channel parameters and addresses of the
  * TX/RX queues.
diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
index 5df8354dc96c..708f6b0102ac 100644
--- a/drivers/firmware/samsung/exynos-acpm.h
+++ b/drivers/firmware/samsung/exynos-acpm.h
@@ -17,6 +17,8 @@ struct acpm_xfer {
 
 struct acpm_handle;
 
+void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
+		   unsigned int acpm_chan_id, bool response);
 int acpm_do_xfer(struct acpm_handle *handle,
 		 const struct acpm_xfer *xfer);
 

-- 
2.54.0.545.g6539524ca2-goog

