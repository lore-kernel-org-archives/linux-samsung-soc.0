Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B143DA3B
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067568; cv=none; b=YLXPicXQHEG9YgZSlJCzyg/4L+pAbWrgdeAOMzjhGqXbkk8+W8Sr2p9hmHl/ETlRWmy0zFjgtvtYBgUWoeCbI0teGBuuRekQGzqK9zsrvBD/Dbfw0JR/5k55ZeuVGlleSvFw6B6RVuDYoGT28tBTeH47DmGsA6jcr8c1KocCjQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067568; c=relaxed/simple;
	bh=rvG1FU/yzeppWfRfa1yi/pl0sQB7nwSNY4B9HK/7PzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCseIHTy46l+HqtgP0+PObHZ4i+uszEdXJsUC01N3xjIBpWTgZ0nlTJarMnm4GYEycRVRgjR/uevMFeF9ADFdYHlJoUQCoqImne3iL49N/0knkAw1YlLJEPT8ZrXCcj/EDpz4tbqY+8BQEsL0mhsVEn5utvf+w1preWxXBdGpY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vuq1r+Gl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vuq1r+Gl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ad135063so59725675e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 04:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067565; x=1778672365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LC2V7L5MNeD6JRSN42bm026kYg+hHIPEct1+4nQZRpY=;
        b=Vuq1r+GlpKnkBp/kv9UifzMBm/u7r8D2vOU2ZKzxBtk7VqqTIgRV59juZmrmm2FXux
         DxQ68CJYiLC7pg5RNJkcqUiJhe6Iq50kpbguX0nJK9T5Dc++MEl6cC1Jf3kcu+MYrIex
         EGn8kzBISCE9uxPnPsOlvZ/N9edFHKhHlITzXDAgmlIMhSux/+aBuML0VGePHvwEpx/I
         AGVQfIOmW2OJaJNas8tHF53376iq7+nP+Npn/AJl5hOAjf4OhayH1EqBbMaaYGbAw1P0
         9OSVjHQsyOSgZ/aYOZpKGhcmWTZahwdz0/Eaw1a68AEcPwOcEfASLc6LqrilDgvaYNOE
         RYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067565; x=1778672365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LC2V7L5MNeD6JRSN42bm026kYg+hHIPEct1+4nQZRpY=;
        b=KcMfDPzRSC08ba/fep8hA5rA42Eg3AK1LpdIjPgqDHN7guQbq1UgXJr3Lr4jvp/1OJ
         MS64TxXZyMPGUIQJQjBXpRbGU/nRRPPh+N8VQo7tRVDUa5FfW2Wk1Hojz7HPhlznguHY
         sgJl2MRc1VOoY0EiHe4s8SuWgpuPFouxX6GSoHjSJXGYhOhI+2ftnvbJgsaXWIuk1x7S
         N2L8vo1WKApwwQCYTb5zRfDRcck2GLKwPdKsVsQi+l/GraBCBPmQSUl8TbF+iA8B7fPd
         ZOgDiKBDOs/qvi+sGrqkQv5WFCfT9SGBTWqeXD8zeaK3NxbYCrKRs0CP2aZ1bgKgGvWD
         KQRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+S5OJHSiQwXpxoBkCpdd5gh2SNrFWoHaimnaxunOvejZSqRIzN7f+lrdLu8PdVMgjA7Z/FaODi0e2PaYRK/kVAGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDYc13LAGr3OUW088yeIf3PBjnNWwr9/V6HAUHRius0WbikmcM
	d7ynor/EXtpOsTBk8spU55ikUOvQPOTTdbeYaBVbwKtkRRDU8f6sa7pwJaNKr1a98UY=
X-Gm-Gg: AeBDieuBtdpNz3/VHpNuH0Ij1K5AUKG7DlY+VEuq1o49Q9/u5ZDPtDkQ6E9oj2asjzB
	B9q0Iz63nSYhnswGWEHgx796llMveW1FOIxVyMr9Yy4uFsCw0FMDFICKxQck2GSj8mi/MFsUpLs
	9r8qkgJAZYBg5MgasedUQFfEu6yn+ineEykpKwbbpxsimGTp6uI6asepkD+q/OYCsxzMJV13x1m
	Nuvh538cqtonbBYYp/+x0yePHH4yekVYbryCrMNRGnMvoGzvRnfJ3MAMueemYFaSWzPkhaI2BA8
	63xnc2gf+THwPTuLNcycCbG3uf0bcTkUMcGEDhbFeYm1sF8wtPRZLGCoMV5ifjlQ4Ar0l9iB+QL
	pg+9IXHPAudPtSkS5hpcUVYgYScrcDj9urbpdXOp2yGvWRF90bitVsDZjdDSJUoQI4g0wjrjR5R
	NccjwFaK7pqQLB2hQoK3+se7wroNicC6sSuKw99TzFjhuBKFtSfm25Ey3iQFjUQRe0u/JyL/Aky
	K5cHTk2mUBj8EM1sQ==
X-Received: by 2002:a05:600c:8011:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48e51e1a545mr48855035e9.10.1778067564787;
        Wed, 06 May 2026 04:39:24 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:06 +0000
Subject: [PATCH 4/6] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-4-a9cd5daf8355@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=6065;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=rvG1FU/yzeppWfRfa1yi/pl0sQB7nwSNY4B9HK/7PzY=;
 b=q7uxU2+x4M5v5Y7lgDRgH3mPouc9ZTFFuaU6VeV5us/VlznbPWvWpvFipIAUKrRTi3snxP0gW
 okPof9XAajAAaiPYBGDvOUvmWT0ve0ac68SgF5T1G8zj+VJ4ve9rS89
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
2.54.0.545.g6539524ca2-goog

