Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4DB43C067
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837558; cv=none; b=qLDFvB+nVljsfmqvatlSJnAhzTwEfZ80fJJua9KDi+f7DIi/AH1836gOlV8f1T2TS4QWVl4vwx8SPKt+t2bdd5kBXHnH5ua1sv/QJ2kdsYcc0kW9eGYBSLl7xg3QjJGCm3PUU7Dc8t/mW7RTk15fYaJ8AB47PrXphSY6tYHWVgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837558; c=relaxed/simple;
	bh=CoP0NftcObikN9l/cqR8xC1/WPnUUUtOTxMCtFFGUC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLhYi/fAhtnhhFb/EaXHEf1uOoBYrDj2VCLugFMl6ryQYAJv9w3RpeOckV/24sf8ENNwDes/Jsdfqw53yzgGSQYlQbi3+d+mCfyrbEfrCjj30vM/ndpiSZnasLuxeFjW7xXh3nK7Kb9Ox//o9XHTXol+PHXDGL8KqsGzhGf68LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xq2eY1WT; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xq2eY1WT"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a88db610ccso10175251e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837555; x=1779442355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXEOz2QeKOCh0TWnA0XGyH+pUT8xTMvIoFYTLYn5JsA=;
        b=Xq2eY1WTfWpV7zLp7rY420lMH0wlDX7Di4RBVrKGp125AcpFPqvsCuBxH8gTl3+ld4
         frdhCasLKO8aWIxfTDKWyie2Kab+fDcUM5kvRudW8IryO57qWm9ZdERrQtfio56gN7H8
         KnMPBjT3OKQjnHvQciTsYiFLuIUnFGJXNrXc2QUBVMIOWrvHaOXPxCTorHRMkH+xNwb9
         XwaLLuMADfQX01pwXn5QXvKThhAI4Q9T+J3tcXU8VaA2g1ehpGmEbtlcyV01NEAe3a0p
         jdt6cd4AlQ03Bipeuow49it+SeudrhU8RpEe2dGyhRZzhFVRRRwap3LZa1xly/VRmts6
         rU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837555; x=1779442355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXEOz2QeKOCh0TWnA0XGyH+pUT8xTMvIoFYTLYn5JsA=;
        b=SRsFHcY4yN4vonFsD+GlKjuEvgK4O+fMQWcxR6lmiYgu9XfIR+bQWAJPc+om9rvoNg
         fSKLD6F/oe4ccQ5bsgaZNchTBjTcMyVwUwVQPLxCV8Q5iJtpdZExk2YbOBMzB7ZaocF7
         UGCH9ZCPGEvxNWoYIH+doLBFsbRj95av/ME9+lbGhndApqtROEArvGul8MzupzPT400t
         OgXfS7F3U86DSJ/pAoqD/y7NrtTP17vpOxsQI1mc65CY3ZRqZe7i0LusPD7GXVXjGdfj
         Or6BByXiuT+1Hv5WvYnOI9ISN3cCGtQDlpHttDOBtxfLsl6TtXB5F930XHfyHeDirQtn
         P5wg==
X-Forwarded-Encrypted: i=1; AFNElJ8pDu/Wk6+/FHWjGh8XvuAi9TW1/U6BQl6OhE5rIiJOSWrrZcFx7owSnwcZNXGviEWKIWXmG84lgLJjEbWaFzsSTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3E30feLDdhlcevBeAzRnhSEB9EbY5BxIlXW0/1bGDLWVwAoV2
	TYvbBKJbT3bqq4mYaIgielmJxQor0UbAbW3rboKia3RhIJ/jUY6xufdcLe1aUr9WSuI=
X-Gm-Gg: Acq92OFiBgwOtU8Sd5Y678tdu18wlxn5ZtOQ/PLetVUpC/xzK3wZflN+xtkGfOxomtj
	z9wIDiz2cUH9rIYjYQ488lzEhiVvMjF8mcCK0B1Xtny2ZRBUqhTB1iVWd94PyKErj+/oo1pCj9S
	4EqV8WHC4e6wZmSn1+GQRLmLuqrlUN7nnu85txuR6KmjsaOskrQYBl4Z9qvaLlo4b3U8I8/FuWH
	StS73PiJMdL8XfQB6bgfWQk0lVVCdfL6dKomMGiJ2RgPgEUZeEbAAd8oW1UMtPqPVa31URg/oCL
	+3PVVlh330C8mibIfTaetfC8D1NjIoPMLhAmY7TXYxv3wk1lea3Vh6VeYSvk+h/VCaqqsRs2BNC
	8kSCOX7H7d9V0gqrKZpl9Kd6Tp3/46NdGT9ZZdXV4OL4tcm8eA/yYcQGgJe0y4lSzlWxV0ONra2
	LRQ5eja1EQMvHKKf9LLODXOyOab7/wDf71DMJtKwbi1Es7LTIpvixCEcF48nogMltzU+2wU/o8N
	zPGp7FA
X-Received: by 2002:a05:6512:3b86:b0:5a3:ff48:f7db with SMTP id 2adb3069b0e04-5aa0e770e43mr771565e87.34.1778837553313;
        Fri, 15 May 2026 02:32:33 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:32 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:28 +0000
Subject: [PATCH v2 4/6] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-4-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=6120;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=CoP0NftcObikN9l/cqR8xC1/WPnUUUtOTxMCtFFGUC0=;
 b=JykrzFSkaugjyVv2ZC1Afc38Icl+cZPzHA0PelYSx0/Aod56VAyjzXXnp71T8x6UfdDhWg6+d
 +DxXNeVgIACBpEFooXdOpNKHF8ZNEpeMerhyWRsjrPKO+/35Jp4URZQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Replace the embedded `struct acpm_ops` inside `struct acpm_handle` with
a pointer to a `const struct acpm_ops`.

Previously, the operations structure was embedded directly within the
handle and populated dynamically at runtime via `acpm_setup_ops()`.
This resulted in mutable function pointers and unnecessary per-instance
memory overhead.

By defining `exynos_acpm_driver_ops` statically as a `const` structure,
the function pointers are now safely housed in the read-only `.rodata`
section. This improves security by preventing function pointer
overwrites, saves memory, and slightly reduces initialization overhead
in `acpm_probe()`.

Consequently, update all consumer drivers (clk, mfd) to access the
operations via the new pointer indirection (`->ops->`). Finally, fix
the previously empty kernel-doc description for the ops member to
reflect its new pointer nature.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c                     |  8 ++---
 drivers/firmware/samsung/exynos-acpm.c             | 36 ++++++++++------------
 drivers/mfd/sec-acpm.c                             |  6 ++--
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  4 +--
 4 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index 93667777094c..953ca8d5720a 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
-					      clk->id);
+	return clk->handle->ops->dvfs.get_rate(clk->handle, clk->mbox_chan_id,
+					       clk->id);
 }
 
 static int acpm_clk_determine_rate(struct clk_hw *hw,
@@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
-					      clk->id, rate);
+	return clk->handle->ops->dvfs.set_rate(clk->handle, clk->mbox_chan_id,
+					       clk->id, rate);
 }
 
 static const struct clk_ops acpm_clk_ops = {
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index da960d3e1145..1a0d98b55439 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -670,30 +670,26 @@ static int acpm_channels_init(struct acpm_info *acpm)
 	return 0;
 }
 
-/**
- * acpm_setup_ops() - setup the operations structures.
- * @acpm:	pointer to the driver data.
- */
-static void acpm_setup_ops(struct acpm_info *acpm)
-{
-	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
-	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
-
-	dvfs_ops->set_rate = acpm_dvfs_set_rate;
-	dvfs_ops->get_rate = acpm_dvfs_get_rate;
-
-	pmic_ops->read_reg = acpm_pmic_read_reg;
-	pmic_ops->bulk_read = acpm_pmic_bulk_read;
-	pmic_ops->write_reg = acpm_pmic_write_reg;
-	pmic_ops->bulk_write = acpm_pmic_bulk_write;
-	pmic_ops->update_reg = acpm_pmic_update_reg;
-}
-
 static void acpm_clk_pdev_unregister(void *data)
 {
 	platform_device_unregister(data);
 }
 
+static const struct acpm_ops exynos_acpm_driver_ops = {
+	.dvfs = {
+		.set_rate = acpm_dvfs_set_rate,
+		.get_rate = acpm_dvfs_get_rate,
+	},
+
+	.pmic = {
+		.read_reg = acpm_pmic_read_reg,
+		.bulk_read = acpm_pmic_bulk_read,
+		.write_reg = acpm_pmic_write_reg,
+		.bulk_write = acpm_pmic_bulk_write,
+		.update_reg = acpm_pmic_update_reg,
+	},
+};
+
 static int acpm_probe(struct platform_device *pdev)
 {
 	const struct acpm_match_data *match_data;
@@ -734,7 +730,7 @@ static int acpm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	acpm_setup_ops(acpm);
+	acpm->handle.ops = &exynos_acpm_driver_ops;
 
 	platform_set_drvdata(pdev, acpm);
 
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 9e15b260b8df..3397d13d3b7f 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 	size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
 	const u8 *d = data;
 	const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
@@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 	const u8 *r = reg_buf;
 	u8 reg;
 
@@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 
 	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
 				    ctx->shared->speedy_channel, val, mask);
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index b206efa62be6..fbf1829b33db 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -42,10 +42,10 @@ struct acpm_ops {
 
 /**
  * struct acpm_handle - Reference to an initialized protocol instance
- * @ops:
+ * @ops:	pointer to the constant ACPM protocol operations.
  */
 struct acpm_handle {
-	struct acpm_ops ops;
+	const struct acpm_ops *ops;
 };
 
 struct device;

-- 
2.54.0.563.g4f69b47b94-goog

