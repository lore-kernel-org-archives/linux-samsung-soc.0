Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEE912D772
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Mar 2024 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709819586; cv=none; b=fHtdQgQUfzIDocBN3v+JmA3cWdRRsACKiH8mYEmeEGRWYkCJtg0U4sHxrQAcyAvRR4jZkfdKENHMhMpWhzqXgDEUuQcV2OpZa7HJMqBfwfzoUheqKKWF+JD50ZzbGQxvT8br+HZCU0vIggEClcdb3jyzUZxEjv4EQgE8aY8p0Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709819586; c=relaxed/simple;
	bh=iS/ZnjaK6TRmcPu9aNMP+C8wqkwmDYhlm+2dQy+Pr3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g41uVXfVbjRaIPvz+HJdG932V4delzq+70CNx/Om4nPjvhXiG89o7Ug3mC4RBlIGc1uRHsn8+bfAvAJev+CZgxN5RZS9ZNC4/PThkTEaagSNc+KP6SpsMCYKz/ELz+b1nWB/g1iwlhVvGhvL3tLbHnzt0bYHmBe3JyAbBQOKELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ib5cTV4W; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ib5cTV4W"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412f62ee005so7463065e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Mar 2024 05:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709819581; x=1710424381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFRg8xB5AgYKtJRkOv35muuJJ49OzwPBSX7Kgc4LZhI=;
        b=Ib5cTV4W/J578+YD7JHYv5shZo+gtyE2wHZyMkZDShl1l9YINlBY/kzWgUHTNR1a1h
         OrZ7tDS3PsWct1gaWTDbPLmY2Hgv3gxaNb+FON3gyPj5dIBfUZUY+9UOH/YTw8vxHjMt
         leyFHypkkw11gE8T0fJ+aev65nWg/nn03Yk73r3jEUsVjYXq4UuAleIgLylnZ16M0EeU
         nTTrOXQn4VA/orTFVXLYHfqLjGvQH7roL/RvoXxRdbKcuDb/di62zOfqq64YW9lwokIs
         VK5hyZJ32cdUDE7A6fmfPJAUNpILn5uEon+ny8lT4NoGWYFUADFeTpN1OT1e6X+fEKdb
         2F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709819581; x=1710424381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFRg8xB5AgYKtJRkOv35muuJJ49OzwPBSX7Kgc4LZhI=;
        b=o0b2o7x5ArsXZbO+1jQbqqrlKi/FBo/3lXidGU0lRqmerF8oQXdjWx/6+SqXygfWVw
         Y+QKXpK09AsSmzrZaiMphcq30Cp5nEEVvAx+kdn7tgYCwwg0YAx5nQFfMjRecwbjSKG9
         Oqxa8vLTlL4cjqVw2kNQu54C6j8ovYgTpJtllw4Ga1wiEVsaSXlPtwI93i/PbVINOIcK
         O8QjGvTm1x9kQBLz0aRj2kTqKWyCFCd+8mOK0fHrpivyui2ka2V17oC9mJeZk61lSK+c
         /ChzyHHayVDgR/cDjWvtLseFNANZtrsDr0JOijBtlrZFeahGMlMUsyZDBHXLUOOU2SZl
         +W0w==
X-Forwarded-Encrypted: i=1; AJvYcCVTndu1K1tX+ZaFsu+iO6j+tCS5C3OstYYP73ZJVCikwpERx0PxlXnw7naTXqdDu22Fd6y1wM5Pw/Dj3LCcDa1zvtNfUyu9b9Gz+G5e8op1zjg=
X-Gm-Message-State: AOJu0Yxb1TC7QliNcYA6Z+perEhlPDBuoKDaJc8P3/jXWjXnWKWcqLc7
	NY58Lp/hGTzL4WQHgTsMIHHCWxv502nxUSPdrUVG2zBZ7CS55NJFFsYWYLtJAmo=
X-Google-Smtp-Source: AGHT+IF61AYutPgwA+UreNymAxWtde+Fu4g6cP5ZGMQQlNDE95ba8fYYdanfVRTO7jXImAkq32LYRA==
X-Received: by 2002:a05:600c:3596:b0:411:a94a:1ee with SMTP id p22-20020a05600c359600b00411a94a01eemr15040054wmq.21.1709819581260;
        Thu, 07 Mar 2024 05:53:01 -0800 (PST)
Received: from ta2.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c4f0800b0041312cf472fsm1112390wmq.25.2024.03.07.05.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:53:00 -0800 (PST)
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
Subject: [PATCH] arm64: dts: exynos: gs101: move serial_0 pinctrl-0/names to dtsi
Date: Thu,  7 Mar 2024 13:52:48 +0000
Message-ID: <20240307135248.162752-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinctrl nodes are coming from the shared gs101-pinctrl.dtsi,
thus the pinctrl-0/names shall stay in dtsi. Move them.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 2 --
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 6ccade2c8cb4..9dc0f47ef646 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -103,8 +103,6 @@ key_power: key-power-pins {
 };
 
 &serial_0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_bus>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 55e6bcb3689e..ee65ed9d2cfc 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -421,6 +421,8 @@ serial_0: serial@10a00000 {
 				reg = <0x10a00000 0xc0>;
 				interrupts = <GIC_SPI 634
 					      IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&uart0_bus>;
 				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0>,
 					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
-- 
2.44.0.278.ge034bb2e1d-goog

