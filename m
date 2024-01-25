Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8926604CE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706191306; cv=none; b=Sfpj33bV1vXgpZaLsqfvEm3vMGPO+LcR/K6YfD0hK7JCSP4kCQUodw44UEDHE7bWyPL+KocyYA1aAU0WpzdAscUbC8+WQxxndmZdWqw7L8tkcmBPqyrxJ0IOY4+ZtvqqRkWEhVNTCyYTHgnTsO2lxyzEERdtVkCDcnejCHS8ddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706191306; c=relaxed/simple;
	bh=JQ0+STV9AqGXR93rvqvT/Fhpuw2Ch/BDzNv9b9Rs614=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lh6+mn5dCWR/+Fl95O6FZO1c+0x1NSWEyeFsq+QYTK5AV2b7Qb7HAkNLflKJKdua7P80/dX8Vwa+x5oZLfGRRY9AN5euFeLhd133GoFtTv/8xj54ADAAY4IHUYB14Q5O/Mjgl3DmZsQvD5qloWjwLSHv1hHqW5MCMwXNn5SiESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TyuDFN7b; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TyuDFN7b"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3107d2bfbaso190291166b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706191303; x=1706796103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwJ9LZ2cw3a5KQSrNOlRxJLZjD3460dcBT/9JVrzxHs=;
        b=TyuDFN7bQHbl3S2Ur+gM9RXByOLlqprLwAaC0LZ2qytxgcT1hSjvOESBwqAskMTQnp
         hr+D1iajyd+56jGP23le/FXT4jR6BZcxCE96eZm5C4YhjcvvRLD3YGgRlr7ofbrYUpgK
         65WECjF1+dCTXXCYfmlFi013QfC/FLUUtvUBGk0D9d7eAyMd4m2wKOT8WVQjTrKbxmsB
         I0P6sJ3U6WAVChpdaXQ3JRYFsZLi/iOG478Q01VyD20l+ahd2Bqv0XrJLynY8iWhfQ4K
         tdVh5HNTHKqNpJTE8795p4B3iIvy1MyUjMIElUHfnZO0esj0Q/U6R8guwNsoC+f5/aoE
         wHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706191303; x=1706796103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwJ9LZ2cw3a5KQSrNOlRxJLZjD3460dcBT/9JVrzxHs=;
        b=CzJG+1hT7TgbMAy2TqSOOqrKAFf6PD/ac+Cqrz9UbEJmCDWYLfEuRqsHGVeJx40dvC
         jwHkPmBWhrr6iA0OXvAR6ER0MCY/wBOXywCPWdZPjrvhwdBZMwo0lU6vvUSbuIGdr+am
         xx96ntPMnhLECUy13QLb716vkznedSnm1+JbsFQvwyazL7EDWJBjnnroqfsjA8MEmDuy
         Wi/p66i5LyXiDDzcx7afzqZhwPp14I2SM3d89MT195I1MRZcxDaC9mqXBAkqQBF/OCm1
         +vRIYpzK3VR/aDc185oO2/zA2hGL65EZ5DgOfyH3YIybepnEb30ERt0nc7UomIGj33WG
         4GgQ==
X-Gm-Message-State: AOJu0YxJvaG3tYLJs8j7e3TTGuBzuicbJR4K7r8lqj1wMVj3N69H2Mzz
	+IBkfK+k8nYpqvWjW83bisn2CdYD5FjHjy0CgV6VbR84tx9EkPFO2FyVilCqJ0c=
X-Google-Smtp-Source: AGHT+IH1Ly+Ije5EF60Sv9Ag9cguIboXYkkLHRFsIOuKq7QuJ/2bZMfnSdOXsrWMbaqAC7Cd6YvmmA==
X-Received: by 2002:a17:906:e2ce:b0:a30:b156:50e4 with SMTP id gr14-20020a170906e2ce00b00a30b15650e4mr586764ejb.42.1706191302914;
        Thu, 25 Jan 2024 06:01:42 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id r17-20020a1709067fd100b00a2c7d34157asm1048170ejs.180.2024.01.25.06.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:01:42 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	peter.griffin@linaro.org
Cc: kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: exynos: gs101: sysreg_peric1 needs a clock
Date: Thu, 25 Jan 2024 14:01:39 +0000
Message-ID: <20240125140139.3616119-2-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125140139.3616119-1-andre.draszik@linaro.org>
References: <20240125140139.3616119-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without the clock running, we can not access its registers, and now
that we have it, we should add it here so that it gets enabled as
and when needed.

Update the DTSI accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 412d2866dca7..aaac04df5e65 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -364,6 +364,7 @@ cmu_peric0: clock-controller@10800000 {
 		sysreg_peric0: syscon@10820000 {
 			compatible = "google,gs101-peric0-sysreg", "syscon";
 			reg = <0x10820000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK>;
 		};
 
 		pinctrl_peric0: pinctrl@10840000 {
-- 
2.43.0.429.g432eaa2c6b-goog

