Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952F359713
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824540; cv=none; b=ifXFEE2lpJjCe37QV3vKsAjRomRpa/Zud0TjPUaRKSx+VpUKxR7JFR+bMbapY37R4yaUFX3cH2Uvw8j2iJclVmVm9y3N1HHgSKN4KiZfSswyZ1qfQuID2B/8+xuxAUwMWUlOIMuYVwKVVeejhNYUqVtPiLIvsAmlJmBFmKTpkJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824540; c=relaxed/simple;
	bh=pykdip+kkXufUlfCYLkhdMwhxg3VFd8rMtL8HJrLcEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dx4YHDpzLdipfz1dPUKMKUnwzKLssSj9nRutBGOr7+qqf+zk4pRfb72FMdibwby5tZhd4lp7BAlOHmj5VImqcLZXV/LCDhVhgZagYJaSw9hLB68PDalDn487vGL1pl/bAid+7iOpppSzZ8m89/YDdiPYG8NsbdZjGMAmpaMIQcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xHXRgmFz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHXRgmFz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fed090e5fso2304595f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 04:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768824535; x=1769429335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sT+McEH0mapvqHwCrxtH/EF4dLPev+0QCK1+TJXdyk=;
        b=xHXRgmFzETIZcWa5HE5EhJ5+64tJAbKQ1twr0y6aBerc+Q8BlfPEXBIuFX0+Ymjrdp
         UxShKe5lO0/H3Ywpx7CgUji4gE1uZptjSpklLZ0jfNSTUUtHvfoadlkcPk5utLg4WvXy
         ARqmyVZmz62hB+vF2R90WZa8LtXc3N2X0eKyfs3W3REKDKom1RSqVQxCwzsWBF3pvSbD
         XZnv4KzedK3tILV0LtQPHgN+Pm/egNWikLilPURTQi9tc9NeX2TGt3UkDuxWtFwaNqId
         325DeLOS5MKKr/i9LoEjwrbYZFjAjmk16ujzKG5rzLpb6XBSA1DJnYzy0Y1XignAS2jw
         aKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824535; x=1769429335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3sT+McEH0mapvqHwCrxtH/EF4dLPev+0QCK1+TJXdyk=;
        b=WYQJfnqWlRdmb6IhOCxxfUsnTXJNG5n/hLVs9lNeQpeK+sR2b1yekcpF4Qk+ImckJW
         UcZSKIQBAL9pSPfHVQFnqzsuxqlSYEfEteeDAo7YBb/6ZBUWvsU+tNXkSy2QF4nfsJYL
         eFtIN3aNR0ifTFud++tDWcal+QH3iYcZ+DcxOdIiZGgnz+3xS4Zkz5T4gP+YhFPtGJNn
         IV3/ND33V68fu6DCjnWnnh/C3q2u2QskO9oJDo+neYGfnj0HgCeojmqhKKD5s++dZh2x
         X8OFYgQioUJH2G3bodxIEu2O4Q3nXSIjkppSn2CbJ6BUwbMrV0rn6zHcEt8Mt4ajp7tx
         303w==
X-Forwarded-Encrypted: i=1; AJvYcCUIFQ8+jFgEZnBL2LVFNhsWI4c0ZouatgGIABkJ9FwqMwQbkbOO+Yq34DsRDRTzOXkse2ZcCJ6zrsoARjEnLTiWdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlLFcs82bD6GGlbSnFwx2LULxLg+4W9hHUcaXYS7DKVGS4LaWz
	QKjHLMHkfvaa4Xq5/HOHMWM/td8zS0M9lOovws+vv2GLOazl4Pbfs7l3tKtPhjVRCGc=
X-Gm-Gg: AZuq6aI/rMU0K0xi6fpkCUf8zk4Vg0NE5n00In2UY7MZ3FtYA3Q1qnLSdK1aw2SQCgF
	m+R08nwN6/iVb0ffADt+QotldZAcQLsvFFxsY2KNDf3h4yT4idZ61SRimBjAB5uceaBgvJBiPEe
	3fqinYcloegPARG39OnEcnHqPeMSLX7naw2qHRACM5PNJrNqfoE9uSif6OlaFBKSXIxEysZ8tjy
	ckYgoiQlWqIOpNPISlfWSkRdvxM8kz818t8UWXVlsw5JJrl2R+esWC+wVYudcM+FP2YKJvlgYTa
	c+vKYpOZURryGmP0u5cYlQkwPUby+xdg+TvWMGE1ytdDybH9s2OHyi3Hf5XpYxq1gTIpI+YSkr2
	EJBWGgbwauP1J7SmDYNMfR3C4DVM5UAC910PaSo9qmG81fzKk5w/QWGa2ABpQEU+Ezayp2SjReQ
	u5D0P2IAsEZI9M6P56MtLxMShp/ZPRXFXR44HftAumP6VHc+Yzkpho+vXPqxYwGlJmAI2Q+g==
X-Received: by 2002:a05:6000:2505:b0:432:5b81:49c with SMTP id ffacd0b85a97d-43569bd463bmr11645564f8f.55.1768824534827;
        Mon, 19 Jan 2026 04:08:54 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm20698421f8f.30.2026.01.19.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:08:54 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 19 Jan 2026 12:08:49 +0000
Subject: [PATCH v2 3/7] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-acpm-tmu-v2-3-e02a834f04c6@linaro.org>
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768824532; l=2702;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=pykdip+kkXufUlfCYLkhdMwhxg3VFd8rMtL8HJrLcEc=;
 b=mq6tHfgFD5v+dBnv9e/9P/zH0n4O+kG2DeWw28a7k1Ie25bdm6byhx1O/Jsmir3D59rhSmRB2
 PCtjiH30SmtCASeMud922mbZVmChdLaD2MzvcIIs6KDlOrDaN2jrrTO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Introduce devm_acpm_get_by_phandle() to standardize how consumer
drivers acquire a handle to the ACPM IPC interface. Enforce the
use of the "samsung,acpm-ipc" property name across the SoC and
simplify the boilerplate code in client drivers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index cc045370f4b0dc6ccea99e3c2d6f86a43b2e9671..cf849ba23f09d8b1e7f91734a0a1cc064f7407c7 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -776,6 +776,29 @@ const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+/**
+ * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
+ * "samsung,acpm-ipc" handle.
+ * @dev: consumer device
+ *
+ * Returns a pointer to the acpm_handle on success, or an ERR_PTR on failure.
+ */
+const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	const struct acpm_handle *handle;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "samsung,acpm-ipc", 0);
+	if (!np)
+		return ERR_PTR(-ENODEV);
+
+	handle = devm_acpm_get_by_node(dev, np);
+	of_node_put(np);
+
+	return handle;
+}
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index 43d41e11ad2eb985e27a918ce3f9e9ac15a194ee..9485cdc1d91e86f9a9a8fc00722f3313e3000c6a 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -82,6 +82,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 						struct device_node *np);
+const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline const struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -89,6 +90,11 @@ static inline const struct acpm_handle *devm_acpm_get_by_node(struct device *dev
 {
 	return NULL;
 }
+
+static inline const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return NULL;
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.52.0.457.g6b5491de43-goog

