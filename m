Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0604C3624C9
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 04:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019121; cv=none; b=NFenAMuKDf9Vh7eUEbSoL1Ox1mX77C3LvItBRFSY3J1M9GLYRvf2sCZyO+YAahOwzC0tcLfj/tX1EWqsIXhmTgmK7xzUMnbhzJsXlILIvuI6RJaA8PTk//6/0iEftm6xY6L4X+XtVxG7EMsArwCHmPA9mdYxYpUXs+Ryu8hPSVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019121; c=relaxed/simple;
	bh=9fWvu2AgU7IBwmaoYqowNInEO+gM8FjMCr/yz2qlfGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCgje6hXyiFxKYYSq1SuEaUtGcE8gpPKLgLsY4C9KJCRy3Q2udPCbBMbZJ5sDVIZpMiFk/mbw4+AvpULz4LhhA18Zf9bW3/Ji6+jxoYHPqztdSzxAVBTOMYkJnvRcpTQiiLAM+LttYW3M942CGL1jvaeOCKawEE9orXUyqJh76U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zIhY21Kd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zIhY21Kd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48541edecf9so77118475e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 21:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019117; x=1775623917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4XnAKFPVmyYTHO+P1XBUrrMd2S0zggRsNHe39W700w=;
        b=zIhY21Kdm9KmKoYpve+Kk8T8Je7htt28EomsiJlkpFwQ5LAVg89X5bZ2s4QsA2p0wK
         wqeKmF2wKg56IK2cp2kwbx9Gi1iSKmDKQMsAi/orj3FSaSsJP1PztFerYHZj0+c0XSvP
         maYV/n87lxznZRrTINDPs3pt7lY51b995dgU6D4YhcM2kDHYafUjCqOIx74oRPq7roHt
         TFPVP0YAvnngPEhM9kuaI6R8sRC/O0uojILRbIkHPHtNYt8NzsC4LiKVVrE11B+vuw6M
         ns8UaJt389QpHJHUIgfsGot3jBxuuzRWcKNl4ikCg4unQa5P6RjvvXjl+kRGaJ2e4sN1
         ypUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019117; x=1775623917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U4XnAKFPVmyYTHO+P1XBUrrMd2S0zggRsNHe39W700w=;
        b=cNX3W7prGY59VFpsOjV0/f+BJ94rvG75nPq2jHXVRDH1UkGts+UX/KNT+TsN6Z3oTO
         d+CBA6Q5rw07L/i6hK7LWT7b6aipxIwYt1mHuahmPnFgJ4dZP/lt7CxFDCsDr65KyW5D
         2aBYfkrEITHxX1NK+dFfk2C25sDu7ZbizyyoFI5zGaZrysP8NQkyR1yngY4GmY4MfJoZ
         /7kAB0CwHawIlzwJmL5CeNT+EFY7TG9sHeWjczJPcwX++VKqTDSrNvQ0EbEJnV1TOHco
         +Y0QaA84/UmUYpBAjGjTXhsoIlF477KLW5UU8HHMArOcWcIg6ozJ/UStrVZKFkrsbcdZ
         xIzw==
X-Forwarded-Encrypted: i=1; AJvYcCUeHseemBYvEFrZKegiYwEgF8fe/8MXXZ8zGeheVjy/fMemkMS8rxZHc/RmSkyWnd5jk1akoP/ASmtZ11f64MvpPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNgapMD5we85tjxhN2n+o+BWidIQA2PimTBLQ5P+5u/Em6h6iH
	9kEKoqBw6BlfHEq1ODn0cIZU1Ds/wpTbDvvcv6a5wEqAZ0OjC7NbZ0AxwZzD2Tz9j2EATeOuOL2
	7HfBLHT0=
X-Gm-Gg: ATEYQzy/lX7WdEd80P43TfcupaqNE4rbo9Q0HHnemH/v+1wbI9HA+eM6r0oSHNYh8tg
	9Y351FWAon+fC4dqReafybEBLbN3cLSs9thj25cSF73xL/xNjU8RpDBgtHOyVhtTBZBmKXeLFdc
	9CJGhf3NK6FIhOmeeD8j3gknggvyF7m+EnfZY0JKf933cOKCx8xnTHUUD+1/hAVXFUI6hZNKk9c
	lQSjgu2xkmbYtGPd3EdUZWHQOM9D0NNssfWSr1iueLYP6FAqiqSP3l9ek6pVbGA4CvRM2FGf5Ut
	iv1fJvOElhJundHzgW8uACaim47D9/e89aXUZdUHdhIt0v3hodknn68FzpJA2EAtxpfi15BqV7Y
	FPZLdHUph5NWUT+0RPqa2K25qdQisY7hwj9l0zPilRb5+ekQUgVlz64Z7rSX12IErM1Tn+sN00f
	kCGiPd4I/3hc0QUal6uIGwUvE5PzU+GzzB+U84gbNcdpbHoti8DM0F9UeJGV60aowh9q7uaDrcP
	/+Hrw1gJIIRwSHt
X-Received: by 2002:a05:600c:c04a:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-488835b2f54mr22338195e9.20.1775019117430;
        Tue, 31 Mar 2026 21:51:57 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:56 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:51:54 +0100
Subject: [PATCH v2 1/7] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-1-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

The PMU interrupt generation block introduced for the Google GS101 is
actually a standard Samsung Exynos IP block found in older SoCs, such
as the Exynos850, and is not exclusive to Google SoCs. To accurately
reflect its origin, move the schema file to under soc/samsung/
directory and rename it.
Concurrently, add the new "samsung,exynos850-pmu-intr-gen" compatible
string to the bindings. Support for this block is required to enable
power management features like CPU hotplug and idle states on Exynos850
platforms.
Also, move this file under Exynos850 SoC in MAINTAINERS entry.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../samsung,exynos850-pmu-intr-gen.yaml}                          | 8 +++++---
 MAINTAINERS                                                       | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
similarity index 70%
rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
index 2be022ca6a7d..df23467d0e0e 100644
--- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
+$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Power Management Unit (PMU) Interrupt Generation
+title: Samsung Power Management Unit (PMU) Interrupt Generation
 
 description: |
   PMU interrupt generator for handshaking between PMU through interrupts.
@@ -15,7 +15,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: google,gs101-pmu-intr-gen
+      - enum:
+          - google,gs101-pmu-intr-gen
+          - samsung,exynos850-pmu-intr-gen
       - const: syscon
 
   reg:
diff --git a/MAINTAINERS b/MAINTAINERS
index ff935e197c21..e14e6f874e05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10947,7 +10947,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -23606,6 +23605,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0

