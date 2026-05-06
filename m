Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711F243D513
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067567; cv=none; b=ZMFMT6d+jDgh3tXLwwPHkh/NRP160oVFL498p5ypciACPOmZ5rLObQGQHVHsHW4YsMfGJ7c4/+IuvaTlqVOiuPxGkv9Axy961y1Rx/NiSm0l9Opvvh9jp9370wwBwMs8gUJsO5ftPkGWTUcvNizGs3ai3DqRbh7V54GwYKgcMpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067567; c=relaxed/simple;
	bh=g7W+VZ4iU0XoANYUCcwBaeUQrWsATMZyd8vfMjiV5sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoY+VwJflfQ0ockPhiPOhurzzPlyPet6bjjDHPhUEy+HxRgFvVMwe6h6n6c0sMNCYebuSaR//liGvwUHSn0sQmrNovO8qRxyOms70JXDfkdJNtnqQD8otdzcrGffPy993Qqh+174B0pl/TOJYiW6iTpORsczqE2xn/7XaCwVOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y+nP0WBK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y+nP0WBK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488d2079582so65723495e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 04:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067564; x=1778672364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HctO9PHPxVVbYlg8980nTUBYVtmtaaSBay62x7H26xc=;
        b=y+nP0WBKg6gDteH7CBfCVoxbWcWtYypIAZfORFAZZO47q1c3hFOzsupNKfMqOEVO/w
         +vUDvBJnolwUYrFvO8MCWyizhaRkdLRDo4G+htqOzzf2vP+bzmRSXTEuKBhph1Yp618K
         iqVQWF30zUHzsVqcJzrOIKmTJsBSepVbm+xH/zmgybiPpxgM+guiPkaUzF6eA3O79ysK
         iFavS2epDXPTokIDwykAfAAfjMsbR38aE9B7koFJKi8TNgFI7EBvJHy3j9GgLhB1wbg7
         BK2nofa4rLh0tYZTfxzNEMkuvOiifJUjlQF5iXc10kGtoRM8f5oBEbEqxegxU8juJ6XL
         iE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067564; x=1778672364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HctO9PHPxVVbYlg8980nTUBYVtmtaaSBay62x7H26xc=;
        b=Hw9AQQw+iHYoJ9bv6c1tVbbX2+K8i/zEXgj5ZC/91unxV8iWCRrMEMsCeVFaKOyV12
         AIIYXNqydmdpRogim9/uv1HFcxPdZmhLHsRnRmoPIGlmE4Gz8D4fyo7U8Q6VG6MIlA1t
         N/Re5s36y2M66GYwUpQDN6cQGJQp4IGwOcIoPO4X3Bu14tE6HZXVBwX4ZGqrQuD/zYWl
         Y+OXMdUeQBKbs/csowhLjCI7iBnDIgX6H7/lxGy3WK2oFiVw4IgA3v1rAsOYZX82w4+F
         0G6YBs5DK8BGOtJBnyOMlvEClc2qGZCyy/a1PhJvj4bwlFbsu9mISuuznEq0JBGJhtYC
         j8JQ==
X-Forwarded-Encrypted: i=1; AFNElJ83xDdmeGq9klfANEQknceR4+wJSEXE6wVKZcJSFtvOyXTnMjvih0RBDvGauVFh8djx4AF4qrDdJNleyW9doFogHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/BR7Ee0xTwWtyCip4GZ6swbGt+Gv4ONPREsB9RTcp6MaLs7kS
	Mdq8hAYeYEl4NsdKy/+h8RwL7AMkuupadqlNWQkUzoaj2WP7shykDedFVKp7h11u3jg=
X-Gm-Gg: AeBDietQpDdUrVbPG6coE9DoGKiYHFYbr5KH1G5KRIVG1njEnOYJKrN5+j8OAVb3QfK
	bxdstxPAX+qHCOMyrbEadsddgTRpMz/t0yCQgQXYPwPEe8nkiItaB6wkSgB5o/8pf/lo/D21buo
	XkBFd4aS8IWEhz8MfJ7PxkYZ2OO4ywteiObg3OysW/fPFzEuUYUttJ21b8js9MRV8NmUQZX13kC
	vke6peWhimLyHUmzwKrv1yF8usELg/T0XFKqIIdtKQVdJL1vEgq777N+FKmaqiSbzCbvsA+qqh6
	/naYT3ae5wizWWjbx0S5El7OglQXNePYXGX//HhKaaC3CmHGBOtWObumdqKl7+XMVVf4wpDh2V4
	uNLkKnAizef/aFZpYTXCP0tf9Jyb48ww8RYleTVqwhTOtt+at/N8s72DF46zSjld7Z7HkpY3S4x
	v7efcxCB81Ja9E2mvTVUHBL1zdt80b14NrM8jCXP1WkfsJWBOMANkG35CKDaQVbF54QtkbMsx8i
	im3+xcfhPVZdbAsrA==
X-Received: by 2002:a05:6000:2082:b0:43d:7a97:78af with SMTP id ffacd0b85a97d-4515da963d1mr5166511f8f.42.1778067563680;
        Wed, 06 May 2026 04:39:23 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:05 +0000
Subject: [PATCH 3/6] firmware: samsung: acpm: Drop redundant _ops suffix in
 acpm_ops members
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-3-a9cd5daf8355@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=4435;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=g7W+VZ4iU0XoANYUCcwBaeUQrWsATMZyd8vfMjiV5sA=;
 b=7tox4iGBbtjxHercNunu+1vkvebqHsR0UywhkufQKg9lb7ncF4dNBIKHyZGZZ+pWcx7WvYOJ4
 YJJ7RSbj0g/AxE/8yalf0mtSBgepg04rk9b9gD8puaZAaHZYrLLPeNu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
`dvfs` and `pmic` respectively.

Since these members are housed within the `acpm_ops` structure and
utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).

This cleanup removes the stuttering, leading to cleaner consumer code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
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
2.54.0.545.g6539524ca2-goog

