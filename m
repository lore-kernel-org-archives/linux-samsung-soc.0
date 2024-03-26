Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70294689
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711449388; cv=none; b=JAO7P9w/ZsCIbGbzNq15ThBklwuLwRxe85q6WkAMUDoepkZCFRG025ctpR1rcsmAYEOd6piadTa6pJoTGDCpxSrEIK3vFhGqpOauVIoIs+Ulm5SqSS6nuEPaMWl2YXunKympflzLn90AvSX9lKEUY3duhqc++82qTA2MCsU5n9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711449388; c=relaxed/simple;
	bh=K1dHLIjeQuDsfctL9G83BCFPan/zerzWZRa2q5Ruy0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YbkHibeJ/hizNtdcmOzXKTdfjhtEb2NNJ2JTRjzaEfB1ViG1Kb9dF1XJvIsqWGU5xn4JReuPMFCPeOlXWEhYAJhH5zdl7opxdDAw55+rsQrl5sO2VPK3hJPUI6Q+S47OT3YlK8DHPd5E8HaTUnoLMivepea50mTsrCBu+fy0/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BBn8lEKg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BBn8lEKg"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33fd12a06fdso3810411f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711449385; x=1712054185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4Q82fSRsVQOlu/IQRcC6oYtp3fXj585MuX1vgQZ3Lk=;
        b=BBn8lEKgx1bb2FH5is39bTFm1GJ5kdPmwohmIlnFp25eoUeHL3Zh59EOpXdIMg8gw5
         BzsK1v/qieq+/2Tm0O7NhIPT3vCJVbdjpJeIRr040LyWQHsZLPhfCPTyz+dc2ypFd8Y/
         XK60p84nAExe2GY4TGAqdbgELMj9I8BIRhTbuyJXOicnjx84JzzMVeuBJO9/zFoyyUrc
         s/57cYFu9SApgrGUWFLFsgXjDkvCEzAVikjuKtvk3pPn23yV+L13gceNnENOLJsYNGHR
         0hlZLsnuBDWtAs4LmdJACEJVZnVhVXJp0jXnGghLWn7fxwhC8piT5UgQo2MQTYB1pELJ
         JEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711449385; x=1712054185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4Q82fSRsVQOlu/IQRcC6oYtp3fXj585MuX1vgQZ3Lk=;
        b=KePKmA30QbCVJsjFd5XiHt2O/5HFF2ZiGuqXHJYJbo+JlPrvRxRj4njKJ/NwkfACel
         RQ2rqnVeCDmoeiq/rPJ+kPFRyQXZYMl4ZN+ti1Kkzv322Ri3gWEd3TMpHAAJyW8WP/wH
         D1uGO+lpvx2RLtabaQ3iQG2ykN+DYSfhLO1T82zlZgPWOQrVdUbmOyslCyuE+KarJZTC
         GLorOMZIQkECQIRwLT/8w/kgGYzlQ9WRGbI7BwZDarY+183b2YmB28Yt2k5aKp9H6uyG
         ISvCVRXDBEOp3GWL6sRkhrCS4SHGz0yQ/2qNvi/WUlYqsFQkNIiwTqbGdY1cIwRucjh+
         Rbzg==
X-Forwarded-Encrypted: i=1; AJvYcCXRT2Zg8Rpzqr4DKeXNoT5lzCmSbpp++J8lPo5vY0gHLXm72Swm3mUNMFCcSy2zVeN+CaqVd0KqNgqOk/AXQdGLzZ6FixQfnBMNvwDZA97Ke6g=
X-Gm-Message-State: AOJu0Yx3swFhcDd9ZissxCGPkDpeC3GJy5jkmttlhxVg644sSRDINrqM
	kZdc8z0g9993f3jQKH70jmaDzTkv1wIQNMxBmAO+iSj0422t3hS1nFnb7+9EDUg=
X-Google-Smtp-Source: AGHT+IFD2ifL+95rFB9C02OhtxGR9z2oO1bnIRjboBWXuHf/Up3Z5Of1Yt1fHAfWFCQbQdjiBGOPmw==
X-Received: by 2002:a05:6000:c8a:b0:33e:7333:d459 with SMTP id dp10-20020a0560000c8a00b0033e7333d459mr6498970wrb.49.1711449385280;
        Tue, 26 Mar 2024 03:36:25 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id bn22-20020a056000061600b00341d2604a35sm3337954wrb.98.2024.03.26.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 03:36:23 -0700 (PDT)
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
Subject: [PATCH v2 1/4] arm64: dts: exynos: gs101: move serial_0 pinctrl-0/names to dtsi
Date: Tue, 26 Mar 2024 10:36:17 +0000
Message-ID: <20240326103620.298298-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240326103620.298298-1-tudor.ambarus@linaro.org>
References: <20240326103620.298298-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The pinctrl nodes are coming from the shared gs101-pinctrl.dtsi,
thus the pinctrl-0/names shall stay in dtsi. Move them.

While moving, reverse the pinctrl-* lines, first pinctrl-0 then
pinctrl-names.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
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
index 55e6bcb3689e..0b0db735dc8e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -424,6 +424,8 @@ serial_0: serial@10a00000 {
 				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0>,
 					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
+				pinctrl-0 = <&uart0_bus>;
+				pinctrl-names = "default";
 				samsung,uart-fifosize = <256>;
 				status = "disabled";
 			};
-- 
2.44.0.396.g6e790dbe36-goog

