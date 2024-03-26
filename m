Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D023D13C819
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711465990; cv=none; b=jbcqOHsDIW5XI4WVFdke0fQWAnO0ZZULvps/lbfPFX7NSU+WeCK9xHltKbjj1NhwzZAEE9HX7uZOffBCacGb9oGYU7SJPYXRBs5vYXzYIScl9CmEg0+4yb1noDIU3/36KDR5RpNeMatT4LZ9lWu0xk001dgqTxb341r32UqDIGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711465990; c=relaxed/simple;
	bh=FeLxIq9atoz4TPPt/7OWo23kfV4aQ2q8J2PJbLuSt0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IePIspjgk1V43tn9E8ey9Vf0HCd6zLS7/rVL0dEvfCz2BfXhQf32RGcfKmH6NUZ68pB/kEtrPsIaArWIEyHyESEY0KPpQe08C1PbOK6pG8REFZOkrwu88QZyI/1wdzKKr+g2MYI9ak1ny+wUlJPuwALKZjz2aMu0ZbZB43KsRU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7r38BeB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7r38BeB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3416df43cabso3935460f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711465986; x=1712070786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlz6Sy54uP+548eyUIyn9J//AASUpkQcLH7vl4aBa9g=;
        b=T7r38BeBBT/mVNNY51rJuK5P+5q57Gaw1rJWD56W7SzMRvW6zen2psnixWbXdb4gXZ
         oLl98OCZjkB7wIoRed5y5NHyJHkUI/ywD/kZ/UhQ34I7tJHrsetKyUubu3BvNDBsd3Vy
         RRZ7mkwKa89kj/Ra8HR+cSQwQQQVTI7C1A90gub9H8Q6oD/9jldzhq61tvQeeRGQd4UX
         9H4bRANgZQxznKRyLOMEOkNmuFCLWiujSjP1O5asJLaV1PRAKP/OaG2WJKO7ATXmlrw4
         aQig8BlYhdFqRDBs3aD93g9P4JysCtRUhcUi40nE7Dr+p0eDsm19D9AjId8ozf2eQ6HI
         KYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465986; x=1712070786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlz6Sy54uP+548eyUIyn9J//AASUpkQcLH7vl4aBa9g=;
        b=ufOn2VkIfMqx4WqdoeINCn3VEd8ADm61PcQTqtMqFAj34y8sVi472oXczZxcaLShhU
         +tZAsSBsQFWzh9VkGRDOt9E/F/vUVZ80bGtWCtiL2dGTs6WkJWV+Hou/8os9Y4bL7+or
         lEl7r4XRu9vvEcGtoLHYPQ6vG+FnnNrRjka6Yh/Id2s9pifFDUxzRwj+vLp10Uf29c9B
         sssEeMkn56adxSv60yU9yWNR1MTI8jxAgRs2zyFK2veNquvV6dvg/wQhE+y7bZNDT9Y2
         Sdq5blI79SKQ1W9lnrCVrpQrDNBZ6Pl+oPts+4IyRA9ThPVe5Cf8h9WWRzqC5DWUzm+y
         UYpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/f+aElfwnBTANtC2AZMDrVR/CpvOSwKGwVo0hjwtKeE1vHNZjlvZkM7BrBmuwxOOFJcZfA5EDImhse7K2ZGQvxC+G442LD8Ug6/xrOf+7gaE=
X-Gm-Message-State: AOJu0YxTd6kCqc2Znqg8bPm2iNUiJyJMD+5H+PyPsxmM5w6YZn3349XU
	iMbIrrh5W8Z18/Ynqulj/VOzr6VIQqgnJCjV3UGvVBhR1XfKmQg03E2xFUH0ZzdcqBcUZZakRWc
	/54g=
X-Google-Smtp-Source: AGHT+IE2q39yRZ0lVDRKXL88UfaNYlGtE1ohcmxKv1HapUorPMZCa98GMyKI3xk9IVqNsvr3qlmwcg==
X-Received: by 2002:adf:efcb:0:b0:33e:c594:f154 with SMTP id i11-20020adfefcb000000b0033ec594f154mr1283887wrp.62.1711465986199;
        Tue, 26 Mar 2024 08:13:06 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d40c1000000b0033e7a204dc7sm12325692wrq.32.2024.03.26.08.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:13:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 3/5] arm64: dts: exynos: gs101: move pinctrl-* properties after clocks
Date: Tue, 26 Mar 2024 15:12:59 +0000
Message-ID: <20240326151301.348932-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240326151301.348932-1-tudor.ambarus@linaro.org>
References: <20240326151301.348932-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the pinctrl-* properties after clocks so that we keep alphabetic
order and align with the other similar definitions.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index a1aff219208a..cfb3ddc7f885 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -393,11 +393,11 @@ hsi2c_8: i2c@10970000 {
 				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				pinctrl-0 = <&hsi2c8_bus>;
-				pinctrl-names = "default";
 				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
 					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7>;
 				clock-names = "hsi2c", "hsi2c_pclk";
+				pinctrl-0 = <&hsi2c8_bus>;
+				pinctrl-names = "default";
 				status = "disabled";
 			};
 		};
@@ -473,11 +473,11 @@ hsi2c_12: i2c@10d50000 {
 				interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-				pinctrl-0 = <&hsi2c12_bus>;
-				pinctrl-names = "default";
 				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5>,
 					 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5>;
 				clock-names = "hsi2c", "hsi2c_pclk";
+				pinctrl-0 = <&hsi2c12_bus>;
+				pinctrl-names = "default";
 				status = "disabled";
 			};
 		};
-- 
2.44.0.396.g6e790dbe36-goog

