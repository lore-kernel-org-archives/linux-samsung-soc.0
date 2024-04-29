Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FC6140389
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 20:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421085; cv=none; b=jFpjv65WP18Z2EWvkYJ/R4msT2EzZoAQMzgMd1+bzTqUPbZAcUe8GYFcG2iSi7w/xU7B3CYdIX6MDHnyLa4kUTqdPJNIU4RbjlSgfVxkc4AAI8pE/Vst7DBFc9jHQ+GIj/D6ZyJFWoHq2VwOMwbAtRU3qqnWaC0FSOGnkIi+/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421085; c=relaxed/simple;
	bh=13Fr4UEwIC36RkZaWaqe5teByY2xo8qLUQtGfXoOolQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLtmxXKuAGR3vwO27XTmnsMzdF712f8ch+qGfMMp2hJkqu5FJwhwzBXdjegCSy7Bp4+1QtuUWcHBVBzhLuiVYNRP/85UacgiUif/7NaZzqzSXLvUhbyM6d89WliNmt7YtMRboEhLFlP6/H1ba482Ex2qJGOqWpBKF0A1TVmMhUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVRWTzwk; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVRWTzwk"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a58d0aea14cso434678666b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714421082; x=1715025882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW2Cb8PzWQGoPtLIM4Yb+ZUUwep8epdxp3AM6wmQKqM=;
        b=tVRWTzwkPhHfvA6ewS4smjKPvB5zj1FuvMR/zH8zi+QVUYOHAYuehtWKMRQEftIq/f
         m57MbMAdE6qjwukAXdudX/yiKyOED1uGhYcpu8qgqcIVJFf0VvK+Pw2g5aC1moAtyrpD
         fkdgxvcxb3GqqlcW3elPEH23cGF3FQ5IUZxNOJ92ftECeBarVjMs9AAxVNGV+pxU3jaV
         JKv0lp/IBe2AkfOex/Zdt2p/f0FdZzzmr1f7eBtJhUor892dVikjhXg6se2ZLyfAT95P
         goQJxgr1+UrYZk0cLSwf8DKcE88vBhOzDvFDyIGSofDhh6oG7/Ps6EblLI3nGhXonsz6
         9ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714421082; x=1715025882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW2Cb8PzWQGoPtLIM4Yb+ZUUwep8epdxp3AM6wmQKqM=;
        b=UbNpWmbqJ/aBdX08uisokjqjaBUYKRFODFESoyNJSgZAQgVpgphFJTqbitFCujWqRE
         r9RVmS00Z76/lpNKZmzwsjSN2hE26nXi53YJ1xjVkT8jCefu/x81ToZ5VgZVnpRTBPwb
         MStQzVlYDo1ZtqmNVcmPvY+/R3lP0/SYQY+rlFmh3z9rNuuIK9N8iP5lVn25C/DbFPgK
         ulbLBw4pkwB1MvJP1nE5K9liQb/SrNHeMhrhr6eacA5kHWQRtg9StRuq6xPMWe6RqR5t
         pZnWbON5AXDXflvpQjABv03uEYns1Fyy2teWcmUze07ChStbflT32zmt88nTJ3+8m+2+
         nzEA==
X-Forwarded-Encrypted: i=1; AJvYcCVY93r4euKDXmtX81tyjb7fUm5R2BOYy6z03SnSRsglusRorZbRbjKewP81tNEgkNLe2UNHNz8wC5CCVxPG4ipEYMt6AeHRow9xZ0R+CaCAYl0=
X-Gm-Message-State: AOJu0YzXA7hQrsT0IQyF9OYREOCq0yPNjFl3itz6OHaYKpVvz85XIsgB
	Dg4SmVsJu0WjeoDadh5d9XxxuSbydvd01XFeyH+8wz5lq3uVnMpa6jo9PYuKlB8=
X-Google-Smtp-Source: AGHT+IE14D8OoNzwAbKSNbb5L61qf1k+kwXM1y+Y2LualqXyLuCm1k7MomGB+iu8DonSoJQnLykbpQ==
X-Received: by 2002:a17:906:1283:b0:a58:e4d9:618b with SMTP id k3-20020a170906128300b00a58e4d9618bmr414644ejb.19.1714421082255;
        Mon, 29 Apr 2024 13:04:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id ld4-20020a170906f94400b00a5906d14c31sm1140887ejb.64.2024.04.29.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:04:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 29 Apr 2024 21:04:39 +0100
Subject: [PATCH 2/4] arm64: dts: exynos: gs101: specify bus clock for
 pinctrl_peric[01]
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240429-samsung-pinctrl-busclock-dts-v1-2-5e935179f3ca@linaro.org>
References: <20240429-samsung-pinctrl-busclock-dts-v1-0-5e935179f3ca@linaro.org>
In-Reply-To: <20240429-samsung-pinctrl-busclock-dts-v1-0-5e935179f3ca@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This bus clock is needed for pinctrl register access to work. Add it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index f2c7c2a4ce1c..8d4216cbab2e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -370,6 +370,8 @@ sysreg_peric0: syscon@10820000 {
 		pinctrl_peric0: pinctrl@10840000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x10840000 0x00001000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK>;
+			clock-names = "pclk";
 			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
@@ -914,6 +916,8 @@ sysreg_peric1: syscon@10c20000 {
 		pinctrl_peric1: pinctrl@10c40000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x10c40000 0x00001000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_GPIO_PERIC1_PCLK>;
+			clock-names = "pclk";
 			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 

-- 
2.44.0.769.g3c40516874-goog

