Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA635274B46
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 01:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777514218; cv=none; b=IAnTJlNbKMiLrwUIbnNs2KvQ/9FOSaIfYa1Lj2Wj7awMe/ofSDZnFT3vQ7wrwFEq3gCGlwJ2mjExZ6RXuCqvfWYjYtGqb/KgDqSpB1x9EXiOVo+zrOTupGXQQqESBOJRQXCee0Ky5KCWhVXaF+z+yNJ+cnC4ghL69PJv7OgInfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777514218; c=relaxed/simple;
	bh=RpRMvW5iYap9UdQ+48wHOpbTlFeKShOI8IiDuea9S2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2mSgf2LemoYWWj5rxkq8yMzSc+/Zus4cRo3wHn60TH6Jh8vcNx8XCMcMHcHbc7TLzCO1jxnKFXGsdQCAQzRpBbKrqdTBeQPRFys20QSaPS3KI6nfPiSNPDEgHiGs9biCIhTn7eh7EWZxvP1JE8IAsthrMBYECor9AY3yIlfaT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uB+BXcq8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uB+BXcq8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so4742345e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 18:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514215; x=1778119015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=uB+BXcq8p8Qm/bXIfjhHZRWsqmiNIYi+8L40zQWY7JzWRDZ/w0rw264ZxKIyi8X8lI
         IfqY4NvTvWR5oM5ZBmBG+GllUSCXurQSapHmBzzkkJO1uacdcwnXFu2mMJAFt8Yyzq0O
         W6fCLKv3gMGpYLEDocupHM+/I/SpzrrkN4G3AoI78BiiztLr2gnUK1f2tQYJ+F8VzGfA
         qQsySQ8BYrC2zfaaN7SkcV8HzeHkoCZBMBtuzrmxDmyrbeMIM9bfgWi+eTDUAr/tALmJ
         lcioKRmcGYbp54yh3stUm3CnYEN5atpIgLaE9Ej3ZqEqK53835lSn6rLClkhzElcN41W
         P0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514215; x=1778119015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX6ZPm2D502cqZx4/+zrPYcRnZ97EQtYMDg4SYAmRws=;
        b=s4jc5+9XSBF9tcdaGsxdl1pgtqWOg+KmG8sEuNXF5wdBclupiwYF6xX1samJImyCNi
         jOotyTAaYoHX1TfZTEBNUIWB1Up/Kfom3CjAYeiUZ5dHDCclfaM/2mizJ3ounR3Zf2oC
         Ef3R5t+yK5fcXqW63c0MjY7PY89Eh67pXfQTLQfatiMF3PfxBvvyZFLXAbEkPjmOEVWQ
         VCAPQf0MkdVFnekLYHe/5SXZNJDpO+zX3RygJkK1YUPuAfKtPtHwfRVVqzqRzehLG4Ow
         w/ZXuAkEA+Y2Jl/+jnghK9J48KuzG6vVqZACC3L+fZYxAcw8/m5uaMFmaY8o0f02rM3R
         Uscg==
X-Forwarded-Encrypted: i=1; AFNElJ97pVRftIOTDKZyvTXFzdQWk50DzmmJcR0pw5P3UPgZ6gDzQwCta7DKT6Lmp59ZEX1N4zQT/CIWlqxayF+eVMIE+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNV6pP+/c2+Vwd13cN7Rt9vAKpuC9pHbgp6k2p8SZF2kI26FN
	BuqoDtmKPvr9hqUods0XC2okS/DGIaT3VWBI5RQojSuqvhZYW79bl/xau053SGfniUA=
X-Gm-Gg: AeBDieucFEmMpQwbxPijBU4uHZMxiB7eGsXFdnCibasgTs7q7NinB619LuKi2P0EdIc
	dLX4PH/7eoq51DilXdPzjFmVnOLgoIamRYofxd3eLe1wAWwEgic6kxSLl06n4RYDLie6FrqwYNW
	Y6cu2gyPLvys6EE5QaTWjkA54s6lLpNRA+7M1lTNuvHr0Oa5Fu9iStwaU67Yulcw+w+T1VOiZTL
	qo6FICAKVLuDcNUTLGUZ+ZRKIPsGpkIhupgsdmz7matExkwFtd1lAynucSKQQjRyFh41vK7QTeR
	a2PvG8tcuhAVN5tHyS7l6B09WhsOG6dxzcqz1hAEv/sl0lyTRSbFih8ahWP61qzWZdb/vOIFWQB
	JqFHGUOUXPigN+2sxmYEJV9O/rt0B0EarWaUXnVUr0aMgWkqUEqdivxK6Ulr+lwEujIiyfcGsrU
	2SB50nVeJtpg6CSCbysMfzCpdg626WJ9oMJGzPg/e3toKMJFR17rp3a7TDPTxDmpLahsXb7S46C
	VwGAk7DvCe5/Nmt7j/+9N7v6ok=
X-Received: by 2002:a05:600c:1e0f:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48a83d0222emr16301435e9.0.1777514215291;
        Wed, 29 Apr 2026 18:56:55 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:56:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:51 +0100
Subject: [PATCH v3 1/6] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-1-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
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

