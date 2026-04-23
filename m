Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D26837DEB8
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957793; cv=none; b=DX2L+zTfuHthxjlKHXpxZZrod1auuNilYHyPeiAv7JEOcSnAIV3k1XD0rqnuXQhbB1gVv35fPfOYwaEe4Z/e7SjVaASDYbbr1/URDUQLQlm15VPWg3QzqgIjNG/FNpIOQls+jfm1+imLCytG/bU16q9G6p6L20ooNCKX22TOGAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957793; c=relaxed/simple;
	bh=YbKU8bNkuqniUi6opUD1cEX17xfpbeAqZSEM023mUjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ApPIdqDQCw5ofUDHBYW/WJHW2eCP+17htKwS/Hdqt2sLcnOiW/PPKrlCojWGAQgtMGxGoM4DFbo2rBMjq+2xzgkfvBRb6tHgkFGemckaklSJ1nixNUq1j0xL9dH2ff9npEiJVTnA2AlfmuXovltwZQr8eCt9U/Dtl6dI80dVwCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2ElZQhg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2ElZQhg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so48848145e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Apr 2026 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957788; x=1777562588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFRx8vQlRrTBYadIbF6D8n4BAlzLtgQdTMGBUepLq/s=;
        b=q2ElZQhgzpPNvjm8Hqlmgit4F76pxRGOgXb+MAgQS3Kk7mYqFcdU9eV0mf6eYNvcXZ
         gIBdHSFfLjSv91UtARUGu5vZfymi0dEsKyEucw8FS09A8f2LoH058uDF4lOKWjxch9F/
         EyanrZJ5A+xmjS/iKiuOGonn3ES9gPkSLrmjC9Sy1dxL3DLTcrPhbWKpdWqq0oIDZg9J
         ruAFbV0NjbUbQTbanXw7FxJYJoz3JwE/ic8LE5s9BZXl2vuYas1d+B0eCGe298J+i+Kn
         5miCAqOwGu8sltZHpKKh5J3kicOXKj5Lq+fHcppduFoaZdsMychyS08YEajn9AMHV6xJ
         v5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957788; x=1777562588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SFRx8vQlRrTBYadIbF6D8n4BAlzLtgQdTMGBUepLq/s=;
        b=WLHLswFO8XtyfRnqnAkRvQjgx8Ef3jB0MVcGbppgC5ll6JRjH2qOWRWSNzTs6tv9q7
         IHlVEUkNjheip57TuLQsrbPH2Di1zUBzxpYCrwcy8k4DXV+GzDu1z3Pr0kWLtLx4ZfTc
         NrIT9Eq6/v0z9fd7/Ya1s77ZJDJ5b7f4B3qZo3I2KX5wcFeezvtlu28m7VzLfxbkICtO
         w/a36NQfteTGJNWwdISuCMyfeV54Ja67p3vvwcVOWopCoKhdi0+EMgHCfsn0vSJgsqHJ
         BCLX6thPkf4e0Rr3AIX0ajH4In491c5uvj4sOupew/9sy1ZJB1ex9ODN3BhkTOGWaJ5v
         WrZg==
X-Forwarded-Encrypted: i=1; AFNElJ8Yk23OpbdLMe3NCR+yV/+MqKUSP6raC3AJWNjaLuFlXBv4CKQT6xbDUQ6Hp3gM4WIi8QYsdNJURvQqD35LkIp9rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypeUBGT6EmVy3Nx2i7eYvwljcls6kuIQBTWMkK0YBqZ6bK30oZ
	G+AuWPvaVInDzg+rWP25ppIk4oGff/KEHOFuBugSWLx/xEWvm2ZqlKKEOl+mTFMR/vI=
X-Gm-Gg: AeBDietM6pg9NhvxaQz1RSFHAlPwQQ6+P1NQE03BKWPYfhc9/fYUzrzgx3dVPXyQcDK
	In/sBtrNQtgqmOJGtdmJKnuJZCTVGjXDpUS9xtibgTIHjQiJNrW5wf3ug3MBa2XQWds3+NnHaDy
	RS/y3/1r6hFwLsoxqlfVSGpggVO6rNcBUG6YVIhR4pSBd89pHbIUoK73MHI5fLPy0/EV4Msa65u
	dRI1R46mU4XaJBGE2rSwMefH77H+1L4IpUzg53k4QWTRrD39s0x1UhCp2tJIdRRbn3FweiUDIrr
	7fEkM/IaEcyym+RCbQYCjpQfvy/O0nvUNkriJd0Ixd38vgYr5QPAN9UIy2xBVSJ/k8Q6un914HR
	Cf/4f1hLNZUWsk0uAfcWTfr2W5MfFmIDRxaqKT+MJOAJkYmiOuIZlAbUYSbRDrVmfaIlaH6IwQw
	8cGBrMCUy3lyDp9xCPCygWmnEG6qTWjDyUPz6/Sluei8EXy9PK2Jj7KXaIYK+tQUlXWkOTMBhi2
	yA0CzCjscPMtuuPnA==
X-Received: by 2002:a05:600c:3b14:b0:48a:52d9:54ab with SMTP id 5b1f17b1804b1-48a52d95604mr227748485e9.30.1776957783700;
        Thu, 23 Apr 2026 08:23:03 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:03 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:55 +0000
Subject: [PATCH v4 07/11] firmware: samsung: acpm: Add
 devm_acpm_get_by_phandle helper
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-7-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=3024;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=YbKU8bNkuqniUi6opUD1cEX17xfpbeAqZSEM023mUjQ=;
 b=gWU8Thuqdu+garSPEjoTkbNiCDA9yevszfEqnNqdri4bAmJgHoIk33bjFw1V63C+yxyWRNccp
 1IZUWsWg+OQBSrbw4xbsja5qvOYRQjVDFPrpXNZYNlcZfXVGIx37b57
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Introduce devm_acpm_get_by_phandle() to standardize how consumer
drivers acquire a handle to the ACPM IPC interface. Enforce the
use of the "samsung,acpm-ipc" property name across the SoC and
simplify the boilerplate code in client drivers.

The first consumer of this helper is the Exynos ACPM Thermal Management
Unit (TMU) driver. The TMU utilizes a hybrid management approach: direct
register access from the Application Processor (AP) is restricted to the
interrupt pending (INTPEND) registers for event identification.
High-level functional tasks, such as sensor initialization, threshold
programming, and temperature reads, are delegated to the ACPM firmware
via this IPC interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 655b80fc635f..6dee461f5827 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -812,6 +812,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+/**
+ * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
+ * "samsung,acpm-ipc" handle.
+ * @dev: consumer device
+ *
+ * Returns a pointer to the acpm_handle on success, or an ERR_PTR on failure.
+ */
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	struct acpm_handle *handle;
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
index 08d9f5c95701..83cbd425b652 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -71,6 +71,7 @@ struct device;
 #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
 struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 					  struct device_node *np);
+struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
 #else
 
 static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
@@ -78,6 +79,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 #endif /* __EXYNOS_ACPM_PROTOCOL_H */

-- 
2.54.0.545.g6539524ca2-goog

