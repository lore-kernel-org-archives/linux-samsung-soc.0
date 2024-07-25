Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21DE1993A3;
	Thu, 25 Jul 2024 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904054; cv=none; b=DKaPEPyJsKLbUnDXNXG2BuCSvLLzEJwYhNTmQaHFPwGHC8+rBTyho0x4c2VmE45y7xLNNf72hsnQcZV4oUPbpI4X+cU3ocCPLoj8uqQLLEINO1GqdxBbvukruSAYZlDQwcfkhRQWoHWtYO7YFTmbBxj88loE5ali7rsKwMhalOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904054; c=relaxed/simple;
	bh=KWNNuFqNb/S25IX+uh0qv+bi86RJdKP7RJ0/PuyXSXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/qvZt++mLYUtyR5qOU8MhlnZkkFPoAt8JW4CDDqsLGMyFT6TIvGuJ84nV1I7flIpsYfFg9ZcMOzGjrblmPZ8aiSrk7cBYUst8Saqk/nXN+6wPXzbCKZjUYuH29T07m/sb5nDX/1ibmtRbuUEDNVQNLMApKOCrbmJkoYZQ0aheo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iex0OlHN; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iex0OlHN"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so43731166b.1;
        Thu, 25 Jul 2024 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721904051; x=1722508851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nf6VPiGgpzV4Bh7OdZ3UQlM8J+Hh+6fmABD4788z7Ds=;
        b=iex0OlHNXQ8RXvOIevwO5HZ94lCMKHyJGsEg82tlKecLYQUpEzuq7B9ZIZCGiQMnWo
         u4C9bLgZNt4A9dLm8BHzmHCpOI7MGoCUPTnzai16SYL8m22c2VWDxYm+pNSZwWeDax1W
         dJCu04Fuwf0hnhDLYJavqolpZ0c96qkF/dHNI4uDwLeqcgupZ0dG18pWK6Jjn2WNRPlt
         S1Gx8RinG3l52qOFcMdv2AqD/SLXvFBuaAqh+0MrGQcWrQAA6biIHtwg+ubFqK5WxmDK
         CcZXX3NOq3PHHAz6ffSZsnRG0vo0a4FUUuTjGZN9uyoSvwTZgd6wYrKf2W/Ryy9hVvZW
         1hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721904051; x=1722508851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf6VPiGgpzV4Bh7OdZ3UQlM8J+Hh+6fmABD4788z7Ds=;
        b=fEorfXwy+jlB2Y6YlybebygUPpvG2EIwgwsc2q7dlpNA0z+YahsDpho6Ow+kfgdwtj
         MOxQ2vF+XFMaytba857PR27WpL+vhGnFdTH0HefGdf7fUSUiMvdNyg7MuWo0FPrWViGj
         lmtWfuqxV9rL+jh9NsqeOE5T+pGjMkZXvLYXnKu5feGIB4ypXYXOeN2yyV2qgFomihhE
         3ssHpbJOO2dnzvfk166Img6FZKiFRV/gwTFBNb+BsVxIUJcHShhjW8clM7+lbLdIeV91
         gJG+KDaL2PoPRG66hITQystjsBWOvXuPr+6mPAPVR6MYr3x8aDqEPKasN/dEAOc/8jdj
         RzdA==
X-Forwarded-Encrypted: i=1; AJvYcCW1yQSHihT5MRJS3neYSbuSwgAuRKiZIzdxVlNfjdONrWGMG7ZxdR7i38FrRT+kc0IiHCu109XHQ9I4B9RgmLDQrRj+p6jOkIhbaC/zAFOKpfcE91ra7jm573kY0dKWkZYEuCBdeBEJ7etkyqNOkCE7zLwHFSQhqpZ4WKHeUhFVCdHgV1G0SMDGFJ1upg==
X-Gm-Message-State: AOJu0Yzjksd5z2kAKXbIKtbbzadUFnVQiIcm3zh9BjdF7eODZJtkNr//
	TsSoHoDnImPArluLyIArbL3MGtBkV+maaSxSOwfUyWIC+FS4EepK
X-Google-Smtp-Source: AGHT+IHFHN1eSuVeoNBYHF2aEjmsl6zUvRBRtaleADXs7+Y8AS7m0pQ7TJ12ZESC7WgwBTmMXOPAkw==
X-Received: by 2002:a17:906:7d7:b0:a77:e55a:9e87 with SMTP id a640c23a62f3a-a7ac503afd5mr124692966b.48.1721904051139;
        Thu, 25 Jul 2024 03:40:51 -0700 (PDT)
Received: from tablet.my.domain (83.25.114.69.ipv4.supernova.orange.pl. [83.25.114.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab23d56sm58342066b.38.2024.07.25.03.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:40:50 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 25 Jul 2024 12:40:40 +0200
Subject: [PATCH v2 6/6] ARM: dts: samsung: exynos4212-tab3: Drop dummy mic
 bias regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-midas-audio-tab3-v2-6-dbc055c27879@gmail.com>
References: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
In-Reply-To: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=KWNNuFqNb/S25IX+uh0qv+bi86RJdKP7RJ0/PuyXSXs=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmoiuo73T/jCYrP6aHYU23aYR987wIqfIeBMOOC
 hJQMnOR0w+JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZqIrqAAKCRCzu/ihE6BR
 aK5rD/9YmUzevnGSNsQKWo7b6UYIap/vF5Ks+XvjbkRyABXZjCQqmDJNf4tZ1hk8z5HG2CJlAsp
 4wqetvaNMjlckh1dvtY/5ow7vQ4t0l/FhPQomwabSjSQJ2zoHldeMcI5bpIr+B4yQUkpeh0QgeR
 f1R+ZvcV3OFkBcFz4UQQ7h18yvW7LATZfxfi2LhNQVx9tl9M3fV1smoaJs1mOijiuMxu5X4TVYs
 ulA3Hnuc4bNPzpKk/Kt0FrgG8+Cd8qL+Vb3mPK0E5I+zkMdTzj8YsknziktUnXA57w/pvfLEELY
 sxTIQj6o2SptMltnODm54rcL3pGE/vhFmczWypdGORSSd6wMFBULknd15yqWC1jsf6Mj10czEfk
 WTjGLe0F2cR4JRIsv9461y6ELZf4D++V8Gii7zggeGdYjp2Av2Mu95QZjwlyhDFoRylmR5HofuF
 sTGBN24AiXzxR711sm3AeBXaA3gQwmsMBMIUXXtN4u0FtBbiaupV7Cljsm6Iq+Br/duy5fzG02s
 2gHszWlqzdzqV3rF5+hHLIr6kgNVS8TIu2OyKQ93sS4pzotT32zA8aQ8BTocD4QvbknTnjDYsUr
 V+1DVS5TxV7Yr44a4XW+ZU12UBnVWefTyhzc24V9SvPuGo+/zWmIMJEWwo+a7IhDwovRyHhAi6R
 0Kn8Id6ffUiAvPw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Add the samsung,tab3-audio compatible that makes mic bias regulators
non-required, and drop the dummy main/sub mic bias regulators that
don't exist in hardware.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Rename earmic bias reg node to voltage-regulator-4
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 70e3091062f9..553ddc3d42da 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -286,21 +286,7 @@ display_3v3_supply: voltage-regulator-3 {
 		enable-active-high;
 	};
 
-	mic_bias_reg: voltage-regulator-4 {
-		compatible = "regulator-fixed";
-		regulator-name = "MICBIAS_LDO_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-	};
-
-	submic_bias_reg: voltage-regulator-5 {
-		compatible = "regulator-fixed";
-		regulator-name = "SUB_MICBIAS_LDO_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-	};
-
-	earmic_bias_reg: voltage-regulator-6 {
+	earmic_bias_reg: voltage-regulator-4 {
 		compatible = "regulator-fixed";
 		regulator-name = "EAR_MICBIAS_LDO_2.8V";
 		regulator-min-microvolt = <2800000>;
@@ -310,10 +296,8 @@ earmic_bias_reg: voltage-regulator-6 {
 	};
 
 	sound: sound {
-		compatible = "samsung,midas-audio";
+		compatible = "samsung,tab3-audio", "samsung,midas-audio";
 		model = "TAB3";
-		mic-bias-supply = <&mic_bias_reg>;
-		submic-bias-supply = <&submic_bias_reg>;
 
 		lineout-sel-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
 

-- 
2.45.2

