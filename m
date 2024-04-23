Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8E31D6AA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891989; cv=none; b=WwSou8fda5clXRLXXu/cVbXrxnKfUUbHJEWv4VPMEz/Cbap0Ct4AMGrzX+WETypYziaNaWd/m/VAA9UfRnk1vPcaOUnnrcxQwLGhOKtU83na9Y3jSIEjJJcgSSfvrWyzjYf9rgk47ZyRNGsxZoEp+H3TDRrpa/jnsub86sgBOIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891989; c=relaxed/simple;
	bh=ymOuuOJbCj0Dq0+vkj5dWWbd/fQk6GUywJHE38P/a3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sv6sV5GYGGn52e7KH9mtUSbmzkGqNQzgXMfQ4oDcvLuX3wQIpvyTW/p6nS5JaC17orzSJv5D/wSuncbWzYG4noitcyT9S0yryTXOpy2nNvpTIqxA+ASlAfI/AjFSKnbcDaD7dSh6/fTCMG6b5DR4Kg4pX/ZUKDlJVhiJwyj6eW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4zrSe2Z; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4zrSe2Z"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a55ab922260so347426966b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713891986; x=1714496786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GFmm1lXG8IRDZ7oQOROxJWRILdkR+JVdhVLDYhofYU=;
        b=i4zrSe2Z2Tlfr0BBC1CDtpPbZ9jzO5tHXCm0hK6tARneAmG6AyUcz/6xX4PlWtj3lV
         Fz4fh8woXmvx/mUSPFbwGCvP9cN/NTvjdOaqQrKf8zJ8IiTPH0Bc0YbIa+f3Ijb3ftXr
         esGWitZCawp3z2LC9oPU1HUV01FmxulrSHzua2+Tvehojxrr/dFhafLkdFTU2dzRk3Tz
         ogaxxucToiE7bzRtBr2G9lcFl55WJholHBeoMfFiwxKEHAB9h5lyI9cMkOd09+lsYSEU
         FBbPBKjF4lUKIM5W7XEaQtuT9VOLEI9lEctHPk7UPrMUM0DQiTW79SYvtMeLN7hSsUFP
         m1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891986; x=1714496786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GFmm1lXG8IRDZ7oQOROxJWRILdkR+JVdhVLDYhofYU=;
        b=Tzqo8CBojwfyPld6e65YBc76XipuFZeGGjydRVK2299Ld/y13EQv2PsNFCl9n+u2Ih
         qiHw9bcOyQcpTWrd9I20HMPYTbmD8nkzXYCpR3Qg2fOUsa4Ysvk8GDEhNskRLm2E6dBe
         ijw8wRaWLh0GNUkywPcIAsubF+trslP/dk2QnrKX+KLQ/00eJ8AQmELTbJBxjvCP47pG
         odXSmHKFc65MlK5hHy46blm3olLSJRrn5LbEp2KKLFKcya/GqXNbsgLSi3KDQmHdoKeR
         /Lb3KDGg7P2LBfxU39gzPTmy/z/RFkT+T7BmwOQG8qSO0moAXQ6hRReOccpE/aLANIkI
         DjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoX8BUY9xba0uasZtlCFEe6D1bYxvH7vRuV9lynQa5Pyb0ExyhOTV7NNgP+0uc9k0V2MN52xDv/YA+bXeKCYuRean38Kfb9+xZIzd88Mpe5Jg=
X-Gm-Message-State: AOJu0YxmBsltTqKFh0vZKPN1wjcWYZEsulXMyHO2SWgkDjiiZCvC+gM/
	8nfboKIbNi7RcApy0ZhySjTE73F6YiALKq+tHzQ5m4KsEnEB1x3lskp+K0X1Icg=
X-Google-Smtp-Source: AGHT+IELSQMCCaxbBsIXMUuZUEHUL5pQZw+OSlDBpsZVCdsybeaLKXQSWkyki7sDtsHzyRdBoDfqTA==
X-Received: by 2002:a17:906:4fcc:b0:a55:6f2e:b87f with SMTP id i12-20020a1709064fcc00b00a556f2eb87fmr12163408ejw.8.1713891985752;
        Tue, 23 Apr 2024 10:06:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id t22-20020a1709063e5600b00a5209dc79c1sm7351624eji.146.2024.04.23.10.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:06:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 18:06:04 +0100
Subject: [PATCH 2/7] phy: exynos5-usbdrd: use
 exynos_get_pmu_regmap_by_phandle() for PMU regs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-phy-gs101-v1-2-ebdcb3ac174d@linaro.org>
References: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
In-Reply-To: <20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
security hardening reasons so that they are only write accessible in
EL3 via an SMC call.

The Exynos PMU driver handles this transparently when using
exynos_get_pmu_regmap_by_phandle().

Switch to using that API to support such SoCs. As this driver now no
longer depends on mfd syscon remove that header and Kconfig dependency.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/Kconfig              | 1 -
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index f10afa3d7ff5..bb63fa710803 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -82,7 +82,6 @@ config PHY_EXYNOS5_USBDRD
 	depends on HAS_IOMEM
 	depends on USB_DWC3_EXYNOS
 	select GENERIC_PHY
-	select MFD_SYSCON
 	default y
 	help
 	  Enable USB DRD PHY support for Exynos 5 SoC series.
diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 04171eed5b16..ac208b89f5a6 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -18,9 +18,9 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
-#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/soc/samsung/exynos-pmu.h>
 #include <linux/soc/samsung/exynos-regs-pmu.h>
 
 /* Exynos USB PHY registers */
@@ -1034,7 +1034,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	reg_pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
+	reg_pmu = exynos_get_pmu_regmap_by_phandle(dev->of_node,
 						   "samsung,pmu-syscon");
 	if (IS_ERR(reg_pmu)) {
 		dev_err(dev, "Failed to lookup PMU regmap\n");

-- 
2.44.0.769.g3c40516874-goog

