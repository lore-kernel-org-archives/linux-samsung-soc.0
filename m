Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081F43C04E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837555; cv=none; b=hG86qpEjpJn+lBvv1hrt8Rom80XdVMnfXgXMkn6cfMYk69X1DM9i/p3cC2bnmFB2SrAoQ0wakNmKMISfTbAIPVSiVpDfveFqu0NMYEiftOQNckaE1A+j9Ya+u5Pix4YsFieyzAuxkamNk0EBKnyihsxSddk7yc8iFcKhBRX9hBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837555; c=relaxed/simple;
	bh=DGMgRKBcQct6SvRrV5090Y3iu6T7EpjfNpyPo6Ptfr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tt4ZYkOYxmMlXqdDVSiOJ0qG77PsGxSS1IPdOVFSRXLhckyRUnaHuV6nCRyatmRbY6s9DDdATkvqseuyv5vbigUVYL1ztH+JveJ87JVO6KAyf/eY4gR8JQurHxln8owYaw3Arxuoxz5SDcLyy/+g/oydR7kovjj/ulBX2oHOND8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BHQiu3l0; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BHQiu3l0"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a877510541so8814957e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837552; x=1779442352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5faQiqLzhy5VluCrLMwiwnkWFNjtvkFCiJgOz2hI0s=;
        b=BHQiu3l006nR+k/zJWZ+44R9f1HlsG7OEF860AUn8HLyC+vv7LpAYem4Q6GxiFpI0o
         1Beu63w3Dn3AX5gw+o+y+E2R5VY6fNNjZwOjqhRU9lmqoFixzsPlMlpKW21V/6IarZVY
         SAPDQh49wNC5Oha5J3wxgyqWFWMYOu7yEgRczuElZlUMKsTb54VV6ukmIB8jGOTJxPnT
         VGvb+Ft5/lXmvkpYbONOjOJiD8gU4VyqmYnwyiqQPeNFN2EANxD6QigV9YAEKovkOLDW
         wujDT4BRkJx/lqpju62Y+cV0DlTg1jPtY8SDeW+1qjUEVwtGhRamuT+35XIQGAfKCfW6
         N41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837552; x=1779442352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5faQiqLzhy5VluCrLMwiwnkWFNjtvkFCiJgOz2hI0s=;
        b=Z/UnpVWMNQ05fxNi6fp0GxsoBzM8SiLGQw25ZqI0mOK3C3K65lTtv+6wPVev/5UNXM
         vU0vhYDGi2013f3ph8Y0kUsBgGzLGcaRpndxjowkuAWnBzBWoFNMRhQBZJVBR33UOE82
         /g9tUGqL3YFfzqApqh98RWRW5w3dN0mAbr1AnOETAAB99pHcRQS5i/hL8VPfq26CadUk
         a6QUnO4nnvBlStriw8eHxCrnuj1iXlv5De+gb2ck9TfjKyFZaonfVP4LtwtPzg+zYwg2
         CEh+Pzm+f7D2thX6qgVvCB/WbuQlVTIzAYNkY4LSLSq1jhyGSFs/tlRLz5V52JuCHBZk
         OFkA==
X-Forwarded-Encrypted: i=1; AFNElJ/fBnid+GuaMjMOQOXO7TMz8xcVCd1dlBn235HzMbasHb5L/taDZWo5bb3LdhcXt0rMegeQ+yXQqqhxBoVaWIr4bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywub148Ou/gdeX9U0+IwGiT/naQP1zfJn/pUKMsXUBmNVhAQTJ4
	rcr+PNOEns7UoRnS3SxUBvIEnf8eIuMX+WyjLVIoYwXUisHImJgbX+9KPg4SIHMVxT8=
X-Gm-Gg: Acq92OHp5QH/BqI7WuIZg0FEGhQwnUunDrT2K5d/Fg1O6ujdd164goxbFk5GlBto80R
	vbWHXCU2hk8cfZ28h/hwZ0L0cx7Dj5xe+7g27r2aMA6gy1VZtJ4FmFSJOiI7E2Genms1kXQ7aYQ
	kdR0ysV6A1efN5zNnJ3MuTpCDFfBVtUCVNRCTGzP2aib45uqnAb7RmGe9TVuEQszLf3H95cMiMf
	GJ9UVRLRZ/llfCMrw5aL16aamSUEI8Up0tJl0AgYdoQMK1svOgeYgvLWTk2PyRFGDGE465XFofY
	Eu6H7lZZOsx2Hg+2cHgc2kJV9zf7ojWPwUSu3Ry4o457sZRXlAsv0SLdYj4C8fsps0StK0iT88y
	vQD032PnMzpGik3TcQZv1tfOskB/QzHVm76QVzge7rSBJE+CeS01ccKtZI3AThZ+J2+Nk2eKym+
	5YvfhHpIOX6Rq5LKNiBgMie+cwezLTuWhN4bUnP3iHihzGCfsSWCwBG32QeWFhLusti6JAfcac+
	LTNHhQH
X-Received: by 2002:a05:6512:10c9:b0:5a8:e340:487 with SMTP id 2adb3069b0e04-5aa0e734039mr932408e87.9.1778837552152;
        Fri, 15 May 2026 02:32:32 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:27 +0000
Subject: [PATCH v2 3/6] firmware: samsung: acpm: Drop redundant _ops suffix
 in acpm_ops members
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-3-8ca011d5a965@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=4528;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=DGMgRKBcQct6SvRrV5090Y3iu6T7EpjfNpyPo6Ptfr8=;
 b=oUgk+W+9ie/v9Qg1HmqzI4CBnVs8xE1qprJt/Y9TI/1OGNvHDAKpRZ4m5a9zS3aTBM6bilJdC
 hLavEvjfcpMAK00bpledGnzKPgamHkXmPPWSmvG2soRHjTf8hsTpvWH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
`dvfs` and `pmic` respectively.

Since these members are housed within the `acpm_ops` structure and
utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).

This cleanup removes the stuttering, leading to cleaner consumer code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-acpm.c                        | 8 ++++----
 drivers/firmware/samsung/exynos-acpm.c                | 4 ++--
 drivers/mfd/sec-acpm.c                                | 6 +++---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index d8944160793a..93667777094c 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
-					clk->mbox_chan_id, clk->id);
+	return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
+					      clk->id);
 }
 
 static int acpm_clk_determine_rate(struct clk_hw *hw,
@@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
-					clk->mbox_chan_id, clk->id, rate);
+	return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
+					      clk->id, rate);
 }
 
 static const struct clk_ops acpm_clk_ops = {
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index fac88c427d2a..da960d3e1145 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -676,8 +676,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
  */
 static void acpm_setup_ops(struct acpm_info *acpm)
 {
-	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
-	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
+	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
+	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
 
 	dvfs_ops->set_rate = acpm_dvfs_set_rate;
 	dvfs_ops->get_rate = acpm_dvfs_get_rate;
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 0e23b9d9f7ee..9e15b260b8df 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 	size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
 	const u8 *d = data;
 	const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
@@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 	const u8 *r = reg_buf;
 	u8 reg;
 
@@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 
 	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
 				    ctx->shared->speedy_channel, val, mask);
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index d4db2796a6fb..b206efa62be6 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -36,8 +36,8 @@ struct acpm_pmic_ops {
 };
 
 struct acpm_ops {
-	struct acpm_dvfs_ops dvfs_ops;
-	struct acpm_pmic_ops pmic_ops;
+	struct acpm_dvfs_ops dvfs;
+	struct acpm_pmic_ops pmic;
 };
 
 /**

-- 
2.54.0.563.g4f69b47b94-goog

