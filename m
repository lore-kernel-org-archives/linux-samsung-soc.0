Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED0E18E054
	for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734879184; cv=none; b=ss1a7sNruBnt8B0PwCwtmaQtf9PRF45stBlQWjeSJWXNKkSAkv+oG4c1yAqCbV8H1Ho2alJgT56uiGkeeiVv/1jBfdoVAzxqkF/4XOW3nRUvDerdew5S0hn9s/P6YBBQHeQR9j3CK/Eh9qn8WUKFJeVf67Bkyi5hTP2wIK2/P6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734879184; c=relaxed/simple;
	bh=+d33dOGNSMQlOHHkjlGTTjjfImS0dtwZ7ZPSkBlaEWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNBjaVSVEXBhb1fPkiNNnDdXAGT8UheqF7DCI+w/ONhYL8oI62zfrZvBU0FJBQ+GLNJxYa+iwKOJOusOn/OAFMEwB1E/394EHwsbETxO2P3mZ+BI8Ohgv8tv0CsQyfCnRiACT8UdAc+E3SjX7kEZC7pmeHXGT5Dr4Udkaqy/mjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aZxUOHgc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZxUOHgc"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa67bc91f87so57220966b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734879180; x=1735483980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMZe3KIsDQb+Ch5185jS18YCIZb5/VxUA7wsA3ESW1g=;
        b=aZxUOHgcb3W5XVci2yenEwkalKnozqq29CZatva+hFnLPfDAMGJM0XpoB7aL5wIR/J
         2PBwvAshhc96JXuivO9MRPwKOf1VZnmydM+sSPQrS1mfib0glMiP+iTt67HnnLnlwLGj
         32y+cNWTuOetp7jpxWbi06S7hgQD+tgfC6OYTL0fGnW2heCzkJxRhNGBc0IitmyCJp/k
         qe/653JSd74BVinH+E7g4/V5eVdNBaDje/cK+ZCVHJJJ0z259Kmt6cWBB1WkaCNcBKIQ
         iXV8LzX4lC8g795Re7+gC4rl93OiOJMrhMASDEEDx0qzFU5ERKxuwgzxL3R7CXXDB0os
         5IMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734879180; x=1735483980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMZe3KIsDQb+Ch5185jS18YCIZb5/VxUA7wsA3ESW1g=;
        b=IQdvk5CUdBYNJLliq0ghVdFV5GsGrktV7J3nWx/fsOx73zgb6+WK8FYM5NbWMt0ssv
         0thJ0xQHLrhAZkw00QgxIMEwgtsk1UXPp5uSI6P7NPUOYchRdxrgOx6xnqaMX1CFX/hc
         Jhp9CR9GysXpK+DL95DFlhw5cg6Anuts6p+Rlb4RU6Sp6JbU/GMfdtp3w2J4qCyOO6vZ
         sQI4vNtNJhj2KdbKzNjokLz18FCep7hZ4mSRukK8gf7UhZAUtsNSXR085mqbywBzfBPy
         VJsB+R8O5nRCqlzbFkX9RhiPTMjlSJtPKkrIDjqOz0NQHGqmDcNrMzcgjPN64Tbx6ZWB
         79MA==
X-Forwarded-Encrypted: i=1; AJvYcCW5LtvD/4WPiRfdzvAaSCnWD9JVATc1m3bbapJ8DWQiH6HwAOOVHatp6yZ3qmAmMAtcFVQK+E+8+niGAh+xE0UAYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6bk0fgbozKplXvLcgPCJXPoME0F/qhg4qh7gQrpFgGx776YdB
	Z9QKlIbcdKnMHIdpSGzy89vxMacQAanvK9koYFWe4hpbMfiu+20l8ApiwYeh/hk=
X-Gm-Gg: ASbGncvJtctsBjMEyAz+XnFy8OtVOzAPA+2AdPT0H7WSdx4JO3BGmsXA6kkSN0Z6QIt
	7YVqdSZC9Znb+a4n7mdTsA5Mtl/dpHOnlCgwzjdl/jEhqd3KA3LZuLWVIF4w6lLgVCuw1DfMMTe
	kmgkEJMAR6AyCX9MFqX347IXcIZU7lmYBVAnXpo37nK+tLCa9U/pRFDRmVk8CSqtOWwRnyCQySw
	b9y+4WPoTx5Wsi+7IrtiAckPD7Z4/+k7uavzSs3Xlj5PGZHY4UAGCrc/DNEDsDQr3dqUXZo8gD8
	006y+XlCjiiV//0WFE9sD8A+Gd8xGQ==
X-Google-Smtp-Source: AGHT+IHjZBO20DhCS6VWRIkYCvaJqzjKDPYq8fCPXpEgvr/Ih/lPcG98CqFloHsurYEW0cVqBYl2ww==
X-Received: by 2002:a17:906:dc95:b0:aa6:75db:c34e with SMTP id a640c23a62f3a-aac3444a235mr315630266b.14.1734879179038;
        Sun, 22 Dec 2024 06:52:59 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe46f6sm395237866b.111.2024.12.22.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:52:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: exynos8895: Rename PMU nodes to fixup sorting
Date: Sun, 22 Dec 2024 15:52:57 +0100
Message-ID: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nodes should be sorted by name but it is also nice to have same class of
devices together, so rename both PMU nodes (A53 and M2) to use "pmu"
prefix, instead of suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I know we have everywhere else in pure-ARM designs nodes "arm-xxx-pmu",
but this is too trivial and unimportant to change.  I however want to
avoid copying unsorted-style code to new patches.
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 48 +++++++++++-----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 90b318b2f08a..d31d74cc4580 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -26,30 +26,6 @@ aliases {
 		pinctrl7 = &pinctrl_peric1;
 	};
 
-	arm-a53-pmu {
-		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu0>,
-				     <&cpu1>,
-				     <&cpu2>,
-				     <&cpu3>;
-	};
-
-	mongoose-m2-pmu {
-		compatible = "samsung,mongoose-pmu";
-		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu4>,
-				     <&cpu5>,
-				     <&cpu6>,
-				     <&cpu7>;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -149,6 +125,30 @@ oscclk: osc-clock {
 		clock-output-names = "oscclk";
 	};
 
+	pmu-a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	pmu-mongoose-m2 {
+		compatible = "samsung,mongoose-pmu";
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>,
+				     <&cpu6>,
+				     <&cpu7>;
+	};
+
 	psci {
 		compatible = "arm,psci";
 		method = "smc";
-- 
2.43.0

