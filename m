Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4452A45027
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2024 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710354617; cv=none; b=hsIUvMtgBUugtVtx5ryhj151OxSvVTe3jYPdt13/krDmg+p5tBLSjaAaM/spbLIWW4nENDKfFEYvYJBSwvUCXdWVfkSSnueLwm0jAfZJWI4bw6cfGMv/F5UFNs1QmIUdQQA1E8y+tMI5xhlNIaQ3WkA4il/5bgeeHa0u3GXf7/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710354617; c=relaxed/simple;
	bh=adezsuJQ0tiXIsQhUQ0BUSOjyhcWthQ99+43KQlZ59k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=khFnvPU49c5y3JefewyVvxC0SJJUO3iU0i/3AG2Yeo9SJKIY8KZUdqspDKkNIWrMoHpG0gqaatxIa1wb6St4rQ62U7Hv3ci5pl65X135Xc/VxyAVFm1VMdO1Hz4dUW3BiFmDGc0Dd565u8E22NtdLz+QP5xJkdDEnYyE7zPrfzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tW3sGCtL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tW3sGCtL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33e93514a6aso51430f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2024 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710354613; x=1710959413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+YQyG2zsvENkMDftJEvk2k0MZixWY69KUiTMLKqt8Q=;
        b=tW3sGCtL/cKYpwLU7KlOzrkoTriBtdUPvE0SHb8s1rf2q5X21vM11w6VYyB7NX4ADC
         +R4+EXFg3sQ8zqWAFgNAYR2lX1hDFyYh/H0U5QGXt87qrt4Iy8siUtOMujQ+JmKUM17W
         06pif/i+6ghtErH8rF6B36vk8Cjl2K0fRWTa4lOe+DRd8708AVdWLDgOg2PLHBN2Hl9w
         tVeOuJQrwQ+kGAZ1PVSuPohi8efoVOwy7tCJ6+JgzCeGMVA5YOyIdLp+1bZLqmd6ILJV
         w/WKHdyQrwK8EI6yNsiHj8iQvCi+nJMGFpfepqhv6yNDSscwqO33GoDpkiafsutcND2N
         QoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710354614; x=1710959414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+YQyG2zsvENkMDftJEvk2k0MZixWY69KUiTMLKqt8Q=;
        b=ZB27ACxEeYm9SILzqjI5wKhy6h8HNAu5JblnY7g0uFTtHh0cQ6TqDHXv9NimgW0n3J
         4rdFXNpatS/YDYm0ASEUBtUbuZV2CaolGV/tlKKBO8lbtKgNyefCQAoGZfpmHEmdOdc0
         3P3fjBDT9hhaO7LuSADTbzcRaACgO4CgvVQ07RLCPpub3tyhxs7iBAn2IGxDcwKPASA5
         26Ud3G/JUqKOBK4oYYWvzUnzUCDVdRXXTqEIIaXYC7mRV11VwN00wcZdZ+kTkxyxfF9r
         Y98mSNrVrBR2H5AH0TvgEBYOOjRAPOqBLt5j9gwnzgLtC5cXq+IRo5CVNrfRDH2BN34u
         rLfw==
X-Forwarded-Encrypted: i=1; AJvYcCVgXlpd69IqzclKi53rdmG1MQxhUcg94+Qade01/2GD+yq2RZ3G4/UxlB+SNkojkkyVASXKB0pa9WmkHs6A2ZKaSINXIUFxAvDloZP05De9LNU=
X-Gm-Message-State: AOJu0Yx34x/ktSnBDX/jUtH2WsA7g8q69NGjamH7s70HweFmVytk/uMq
	uQtJz0OIlJd0WPXUvwvI+y4Kk1HocPXPU74dU1Az/x+6Tb7yy3SBEv/ZBOjCzTk=
X-Google-Smtp-Source: AGHT+IG3NI5xqTndsapPiz9fpR7KcgYAfZjx9c+jyeD5aTMqTN/5WCuui4maeigx7MwH2EF6Y7BnZQ==
X-Received: by 2002:adf:f14d:0:b0:33e:737c:792a with SMTP id y13-20020adff14d000000b0033e737c792amr1944983wro.68.1710354613662;
        Wed, 13 Mar 2024 11:30:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d6a8d000000b0033d202abf01sm12174034wru.28.2024.03.13.11.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 11:30:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: samsung: exynos5800-peach-pi: switch to undeprecated DP HPD GPIOs
Date: Wed, 13 Mar 2024 19:30:11 +0100
Message-Id: <20240313183011.14253-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'samsung,hpd-gpio' property is deprecated and uses also deprecated
'gpio' suffix which is not matched by dtbs_check:

  exynos5800-peach-pi.dtb: dp-controller@145b0000: 'samsung,hpd-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'

Switch to hpd-gpios property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
index 9bbbdce9103a..bb019868b996 100644
--- a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
@@ -185,7 +185,7 @@ &dp {
 	samsung,color-depth = <1>;
 	samsung,link-rate = <0x0a>;
 	samsung,lane-count = <2>;
-	samsung,hpd-gpio = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+	hpd-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
 
 	ports {
 		port {
-- 
2.34.1

