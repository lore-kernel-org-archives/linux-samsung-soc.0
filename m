Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25D129E8A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714470594; cv=none; b=kRX+NgP6xfWHjnvoP1cVFRDd64KiZ+is/AROLYkJHZljbgb+W054LNePXKvFeCtE3FIQDqYnhvHKczKNZiHrA4lJuLPoBUDdbLCwzK2Z9t1NTywTSDfUz6lrHOSfGqt7Z0HNBlKIOxSAjVkhlheqZWApRlY0cpweDbBfAU4jD6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714470594; c=relaxed/simple;
	bh=6EPfWTqm/lFaZs1kyJ73zKT+bkJLAEfvahvw8Cv8KkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MxT4arybY8K9BvUY1a0K1KwxfibZizNwdBxvqlQyoz9i1aKk/rRbTVH4jzIKRsFnPo9R2bi+junPgz9J2j5gJLGUSuhqnK9HIaO1HbTbvRPMG1dAToYBP6RoeOsVKvNspRMtZBeEnGNhZQs/aTtmFk/v+ZqBS84WdXNi4CSYpMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YEzPlRbK; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YEzPlRbK"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57230faeb81so3254844a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714470591; x=1715075391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8gW4wGr4HSLlzWyo25Ekg/cBo+LkQV9cqhppDRnOws=;
        b=YEzPlRbKJDyg47YeWH4dSrB3ivagEfs3rn5dCq5Ly3qgb+q0LrZiErlbbhehtZIhtF
         sMA3nMV/561SdY7rz1zatcqNo4SMmO/iQmznK4zOr8CoY64Hh3l1xQ5nH3wpSvo0jIXv
         mDByOjJemlt1UJlc17OXYbiDYcjqjJigueQX0KylqWsiFwWe4oI3ZRD+jt68U9R+nPKk
         Eb5pkdm9m/rVKXuIu/LLJBWQl9/WcmoGe3fyJTIAsPwUPSeLjhDuHj4mvK05y+9eTRqg
         6wGDVbCw1VUuD516GiIuSKM6YnttQ3Jecz14ROJXhIBx/f0WlzufelWy7iToWOI6KyQp
         Gjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714470591; x=1715075391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8gW4wGr4HSLlzWyo25Ekg/cBo+LkQV9cqhppDRnOws=;
        b=arLSARBpkilRuTy1Ys/Qjzw6Kn2fvCGa8mJCPb+eHmWoODKkb1AN+MgdaeUVIYGwBd
         QRYSK29TlM3kTMOLYRslodZW4HnoXJkj/S5ttJqk53bjLiGfRkHfSyTRiIPUvfeFQueF
         fLbhi22ODnf0qwFyQCvjG8Qfxci3t3XfnN3p6APwrk1tGo3Xn4S+f7NWfMR9X4MOu7ra
         +dv7gOUGtIRpyHussXm5bzUhyZSmknBF5BTBwLNDBcI9jOLwtY5CKq38Z6hRUg6V19S0
         Igekd0BX7YPXRVo1aTuiiS36fQpzffRSXc9cfTHQLXS+ghvlnmfNGH5MH2c+O6P9L25x
         j0+g==
X-Forwarded-Encrypted: i=1; AJvYcCUT2A6H5ir5FyXfySoe5BofrCyhpHKs8qWg70orAktpGnL0CejFlBaIR/Tu7O7tiI9k56jJLXWQkSNsHgDmEknGIPgPpMQT+BwGgqaCzcQc3xQ=
X-Gm-Message-State: AOJu0YygGc9suNbwoqQ675ilOUnTZJ7OO5JeM/kIVdR8OmXX+U1SxN2h
	WgGpIollAfV2ebnQQ2dpWf6AchlbXKhLZKCcv+m4YKLblxGtQ3aXFObG+Sokl9qZi4ShFKbAI41
	Swas=
X-Google-Smtp-Source: AGHT+IFEPu0i5ueU8PBJF1LFQN690pXMf0YIKw4rNgvmabF16RNW5n71cyetXv/nDePGBSZtm2u4qg==
X-Received: by 2002:a05:6402:50c9:b0:572:6aaf:e0d0 with SMTP id h9-20020a05640250c900b005726aafe0d0mr7836085edb.40.1714470588818;
        Tue, 30 Apr 2024 02:49:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id dk21-20020a170907941500b00a55aee4bf74sm10981024ejc.79.2024.04.30.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:49:48 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 30 Apr 2024 10:49:48 +0100
Subject: [PATCH v2 3/4] arm64: dts: exynos: gs101: specify bus clock for
 pinctrl_hsi2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240430-samsung-pinctrl-busclock-dts-v2-3-14fc988139dd@linaro.org>
References: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
In-Reply-To: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
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
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 8d4216cbab2e..f8fcbbb06e7b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1327,6 +1327,8 @@ cmu_hsi2: clock-controller@14400000 {
 		pinctrl_hsi2: pinctrl@14440000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x14440000 0x00001000>;
+			clocks = <&cmu_hsi2 CLK_GOUT_HSI2_GPIO_HSI2_PCLK>;
+			clock-names = "pclk";
 			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 

-- 
2.44.0.769.g3c40516874-goog

