Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D9A40B6EA
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2026 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675840; cv=none; b=YI6JhPSkPndmYEh6h0ZJ1q4JH+aeyzPGA6mxfB/1auH3EauiaPrdnFfZo59q0+AWx4X/WcmqxuyNfXdcBsfIiouixehA+w5LToKQ7tT5VCqQ2FzRYPJp80d72yS2/mkRm/nyd6zhqeoPrcfq2fO5QG5Q2f875xy2EIH6oMXADvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675840; c=relaxed/simple;
	bh=RpRMvW5iYap9UdQ+48wHOpbTlFeKShOI8IiDuea9S2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGGnFThQk6z0f4x+suJkE+o+eBHvTHy7QO0eSpObvDk/79jbGHY+PPCgR2ZxYxwyH0he/W5lyfx13TaQZZVtufkBcdPd3ShLLAVo7qUo9NupJTdH81j3p7jtzvSQ6pBUMYtUGmd0KLryezX0uUs2NNvugCwHscYGAtTEbwyB53s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bM3+w4oq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bM3+w4oq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44e1860558fso4324563f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675837; x=1779280637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=bM3+w4oq+2ThTtN8g3SNT31ew8s/dmrwAoHtVvaarezk8/K8HSHIlMSgiEkEyaBm8K
         WVkdjVSTFuEk1AJXXDfDJfiG2ECGgiU3GgzR8FvSTTKw0l32+WURhEZkGgtveylGfB/n
         d9Xv3HgWrVB4aYO1GJ7DCV1DW48rFtUeg0dFZZDxutEzeG4g9e0kek0c1BWlbq169UKP
         4VJqK0kH1qhwedwSjeheTeHvd4dFIJgS2Olv9OAPqK2KTpYqAplfJ/Z0bLRKDp/7OeCe
         k0NoOV8G+/8tPue12upxYsmJQ1NG/5hIB0eKq7YEwe/C0kVXQic+41s2hJ2spDVbf7kM
         9BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675837; x=1779280637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=iYv9we0CiRWZ6zsRGZFAa7tpT4qqR8aeiVFKfnmxBQJNsWqpVE/6RshNM+wOeiST8x
         f516KM1yKFo/zb8IC2aXHjh0/OFlDbe4DKgS4q2cNGG0yxi8T27D0kikrI0QNcqLnuJr
         wvvrj19k9F+bN7oKHV93CbNAKrVmOLLpOpQLfGHScXuSiQ7b7iwlPhkwsjwtjEfNUDKR
         +AQ4VTRglzGwkrpn/5iVB5MJm/dTdFb/rsiDUuSWAbvelBWixqc/CZDE4zIa+FTvJ5Ou
         2MTp2ORgURvoSKLUTejDa8lfGt+5nlXStOIu5A7u5epSAD8MLaSnRDFKfkB0uiI9EN7T
         nkqg==
X-Forwarded-Encrypted: i=1; AFNElJ+b0fW+S9ZJZYuTKgGTbkScpDvm4xtMrCrOdU2KrqHoBaSkzSvhLmy5UC5HE2meN6glvNNIttr/fmJADBtqxm2/sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKBljF9K+Z0Djqlg1xnU90UoTw8JdzTffYbRdEEiSj7zdl99l
	lmThpYn8FJMbajxhONq+qv+zpNIbj9DIHsNxIw7T0BrQhX9XznWB0Bv2D2GWbyO2zGs=
X-Gm-Gg: Acq92OF6ZGu4AJ09N4kuBx9TftFSdsedSQ7Jeov/2kvA0Kea9IaklJN2tI2onbs35DF
	oob2kydgnzGAlpbNJ1eWTvp6oMs4PFgINpmn1gqfLvkwiHYbGZyPhWmbj8PIOwdqh/bFzx8794/
	1nj8Ag+9VVRPi9/iG59Edd4IWJeBdZJkbpqETEW8rcfyluZJ2b8qb5x4Nm/jniiFTKpkYEsyEQQ
	QGsEUQRZC98loQSDtTlEHfafL64xCSc7XqJ2kAFF8s8AcWK2xoXP4hYrgfvly0MA/PeTzwQEbau
	uNMD4hyiMt1OGwQK9Bk6vIqi0sn1c7fm8IxBu0dxTvDXWZEZUqT3mdkqqlfzktiwg2k6Wlkg2Tt
	JqI9dvk3W85CF0MMx2u91KdjBue1GsnkNfQIKJYJrtNtyeFy8sOR150eEYoYAvbrXe6Zs3azK0q
	aXLwFUSQHXHhspQ4mXJu9n6Y+fB58xQcCDu55GLCs958E7YeHQmQc7mjjV76SFZ0jr+2U0S55EZ
	2oo4ApYIJsn4mha
X-Received: by 2002:a5d:5f82:0:b0:449:4079:4c39 with SMTP id ffacd0b85a97d-45c5a1a791bmr4966657f8f.29.1778675837045;
        Wed, 13 May 2026 05:37:17 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:16 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:13 +0100
Subject: [PATCH v4 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-1-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index 86ca9297edab..498ca30a00c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10952,7 +10952,6 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
-F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
@@ -23652,6 +23651,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+F:	Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
 F:	arch/arm64/boot/dts/exynos/exynos850*
 F:	drivers/clk/samsung/clk-exynos850.c
 F:	include/dt-bindings/clock/exynos850.h

-- 
2.51.0

