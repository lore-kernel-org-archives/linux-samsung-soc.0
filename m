Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0552FB633
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 12:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864874; cv=none; b=Rawg/9TqAC5wSLTwz5TM7Jq4kamq5N/14QVwxoHabpn2Kp1cpUviaESFncxNHk7nE3QrFAjYFs8+te+fIHgaP3TYfBJzfv5sdWJcl7zhMG4TFgrtXkHIVo2PPxgEx9rzUSSDBA6mnt3/Gyo0wv69gxyZXH0K6QiC0NBPSNWUMmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864874; c=relaxed/simple;
	bh=5IK7visueTFPJvwe8aBx75t2Dc2ShuOFkE1pHPlyTJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bZnPNs0LX/Rx1a2G6i2sSoUdfQjUSx3UVeHXz2gfuI0EsMUtG3BU1QVDVtLNQU0dWmyKMJVwhoE1hV8U10wQLya7f98cowItKGhNahn7cNx6aPxWDHRdtE3W2g71w3Yvy7Ilgj84g2r9ubXGWjLLMMs1TOR1Neq9ZVNWbBpof98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zf7BKyPz; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zf7BKyPz"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61c2874224cso27454a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864871; x=1756469671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DkBAAsfyV6LHd7/MmlCwhNuJJcA3WELhZpHBrkWxRP0=;
        b=Zf7BKyPz89RXdVHjILYb+pOlS/J8wENaSzkiPxrRkADJfVOau2LRPpHPrphJfUG+hu
         YUwXtVqzpeOFSVhDr4ZHRDnc6Z07WpeGHLJkGy198l128gx5NuBjK8fq4hrRG3R/+XW+
         zPGPJFVKWi9xUgnL+vYLHPwhHDUf8XpEXvzIFyEQcRtMwONGEOPaB5CEQEAABXQP0C34
         r+mU1n9LQh727zJLipoT8ybUDUHHnDH7L4g3Lof6ko7d3FvawSCBGiebIzJaa3xWBMVC
         7MvHg0OZk89zBcfCwVdIhPKTqZIh/ZyNdhN2B4hV5K514MDVejKZzZmnFqVfLrJs9fCz
         Pcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864871; x=1756469671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkBAAsfyV6LHd7/MmlCwhNuJJcA3WELhZpHBrkWxRP0=;
        b=LZUpEUXIRRtr+Eqg5lUeU5AYki7P4Sp1tQ0lFOMknHavRC1zXF2n4jwvoDQ1s3tM29
         em0XuyiM6hhnfrgO49nxJkkwARkeRl+2CIsNbgPPOgtNF/On0VXMBZW/pGRMUnWFzOPm
         cDvI+EDOwi/TqgWNHSLvkT0kEDzGhpjH19dcM04SCC7cyL9YsUFCnW9oLKEZH3Nopnt5
         UMvvOCFNAp9oqfRTfsodTEg20cKUxpdKRGrsUyw3XCLwSqAWUKbAFgRqSq36upy65IZU
         wdJn8eiHcbHUPeuGAH/+fF2h/C69OUG+askcNzOEWCAC1FfkZD/6t+uYthQw3PrOLtTr
         KJMw==
X-Forwarded-Encrypted: i=1; AJvYcCWdShIl3eg6ipkH8ki60bresPu1LzfaGAB5ArI5fhJtq9XJmCwdKg9QDSiaNSxZPjqnVmsB1IqWDgO2L4QHP7i17Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXosYk50jpqy9Jb6Ih8zEf8djPzZ9g9uCutE/tAtQoB2++F5tE
	pc+QOSKHnwasJl+5qNyjDmOvJOM18591FnIXezs8ogxnWtyhIeIxqFPNJ9vGVEhHl6M=
X-Gm-Gg: ASbGnctSmmwfCzaVectp4daW5b0HHbob7uYMot8rNtgUCzWrAwjGAWYELwKz/Mxyyjo
	vzJ3q50UnbIyDzmVkJeIvtx7vXsyUPNHxryvZ1KwomnQTVWowJ4NXbmbRR+yE0SuRjYo+dV3rL8
	nfy+hQK+jHMF/jO2ipoWG84iuxLlOeI15fXpi+Qybn5zhjbcOXuGgDsaDdXiLjeFOOo1hl9bAii
	rjNEl2SIrTAuB6Vote8Qyd7RSHskqZS0q0cF88NpuK9ILbT21yisgrXKOX+QGGOYCz+LY1c9CAd
	5h0uQroKdF+fbgu38oFrAFF9ZPYQuKZDGONmAuLt9UsOCKnV1IhA3FWAv1dS8XOeLF7oQkpJB+J
	2ojiLCCvz99WGzolNh03ZCMtdjV2yY3hH6g==
X-Google-Smtp-Source: AGHT+IFs4WBH1bJhJTxlQHx++FWWCdHXe96mTCh87JmHiQTRMMJIfTGjozNDivKIUBJBc92gTGlIvg==
X-Received: by 2002:a05:6402:5251:b0:615:c741:ec18 with SMTP id 4fb4d7f45d1cf-61c1b45ca84mr1190009a12.2.1755864870953;
        Fri, 22 Aug 2025 05:14:30 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778c5dsm6842065a12.31.2025.08.22.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:14:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: dts: exynos5433: Add default GIC address cells
Date: Fri, 22 Aug 2025 14:14:24 +0200
Message-ID: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=5IK7visueTFPJvwe8aBx75t2Dc2ShuOFkE1pHPlyTJ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqF8fG4TdtYM0cmBodGvFcfp4CgidVvnzzwGRR
 hF5QnIYt1GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhfHwAKCRDBN2bmhouD
 1xCJD/wOs1s2c6cZkJlscMJv54fg1CFIqLecvrsXnlikIuOSInwpa8sCW4lL/PckSmRAX/wJGIf
 /RFOn0k/+skDBPFigKH3lwK1HCTnSQTTNtsYThsHBcZHKlXDVnFFycRsNK3U4rfldltdnl+ItXG
 zhi50Yh2vnjg61l/51jX1LqvIcpPyyJ+1AW8TADnOKG4SVZIL94sGd+iP6BSRQHVpos6jxYCY7S
 NiZ9szmd1Nf92KtIOIadb48c3W6lWpLNrHwY5zfeGdzzmv+pzqXSRKRWYVT2N+kSfCCM8Y4AIWz
 44rMBbe3uV8TrnQ+NxtOCuY7MQIMazBWtGZ2EiOt+CKBugQ2i1n4lxEAl+i/EIZC6SadTVwXN2g
 JhgFGG3Ifzuq/Q3lSpER35OX87hA0PnlOR82yzRrSMqLvW2biSmWy8+nrg2dMMUErBYrGF6/IDi
 NtPn/B4MfrPYu7c1u7eJmdjzyiOyFtsCLw4Ug4DuAZcwi+i5oQbq/4PKYDHebaNwBwKMKX4VV6F
 tKbHslXeDzJcvbZuE7Eh5Lnp586PhTQWynD2R70Wco6g4tvewvMhGJ8PVWd3p2oOpkH+7nas0+n
 LkFxeMQdnVtsqKTVXVhfRcKKOTRpd2L/TAZnM02eQBrk2F+3zhz0h18KYzmGEsYYd1pi4M5Pw16 ZKH/3SJXFYLGrYg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  exynos5433-tm2-common.dtsi:1000.2-41: Warning (interrupt_map): /soc@0/pcie@15700000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@11001000, using 0 as fallbac

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 0b9053b9b2b5..fa2029e280a5 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -937,6 +937,7 @@ reboot: syscon-reboot {
 
 		gic: interrupt-controller@11001000 {
 			compatible = "arm,gic-400";
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x11001000 0x1000>,
-- 
2.48.1

