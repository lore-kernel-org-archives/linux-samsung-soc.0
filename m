Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618B6244695
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131042; cv=none; b=mM8f53FsNZQxLAiN4Y5Ra0e67Vox3oW6dmPNyCUcak/yW1PgXxR6XCM2UbOfp8JuFH+N/ZmXPulCuAstZmB3kpYwWRhnC3k6gtV1bStPZRRTlm0BrNb20Vs96NrMXATHePFkJ13TtcEFVmhoqmmRQT8BZ5n7fYxupNG5viddlYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131042; c=relaxed/simple;
	bh=FV6lUS1VQZkp1LlugzR82qxxAdBsO/kVg1ZGJpHO5Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppHK/99BRcXpm9zVbTMMvPryCrMKWV/PodqzPh3tRkRqoh5Ddd7C1iSJ53sSXiiEPsGPUYNo/IR/hVB5bUNUckhknKwhCC8wk0/VH01e+5LM22uGadku5/nCYfkJxRooQXJveMVKhf4XSe6S9yKEPgLWu7I8aKG3oiBjZk1nTIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVHJ+9Iq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVHJ+9Iq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441c0d8eb3bso5270555e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131039; x=1747735839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=;
        b=lVHJ+9IqE1UqdV5sYOS/u9ix0EOWdLcEgf7L+xU1him4/zvhLqpLm49vaFkNZK45qy
         cOUjlwdk4um6qf8I2LyBfrHDN09rO+rRfa4mk46314txWSAdszUxFU6gIJ1HyDKW+g3v
         aHECCBe/lgLJqdCvM9+YP33vrzQ96ZcqDvn/Y7wUF+M7H8Q7ZUkcuXO4mru5zVC6ftYI
         4yZKpZvzQpjG8M+m27MGk1cnWVLg6vZfVE7S3ohQ0wzTpe4DJrVOWd+FqdpYRUxW5PM0
         u2VzMscg5Gqnu/LMTHPQWy+QFQz66otP8/iMfGdY0UKttVWCRE8F0akwQkMpsApgu4HP
         MbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131039; x=1747735839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=;
        b=DhIh/BwvsIzzJm//jR6W8Yv/ELbQCczKw1fce6RJYl44bA3rOPsOpGcS1LLgtcS9Xp
         q379nzgPLnNtpQhtUhnHL42JejSykUDuc1O+hRpLtopLQ62ZilxMoW+42IZ6o6eke8as
         cZECnr9AJjSkorB+BtajaOd3BiSZLM+htazv6GkP4cPdIdLkPxcxoaj38WuIt/XjnAAj
         7ThfwDtzD/gvTZElxlRlS2SUYT7goXyvgvC+6qefUGhe8GAn1bE1fBGUIxEc5g8+Du7C
         3cxGqa65LiO0oJH5iesUuvXKUDjHz3iFlBZhPrCExscYOCNJ3StgY26G7iIf1PYjo3Lf
         z1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtEpTZi0X0SUEXlx8PJSm2XDp2MtxtXsCelpG2O76HA8qKpSQTB1FYCi2Mnphslx0/JqU6HDD9gtmqZ6BriCHv0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5TBzg1OP3d/FH1cFTWY5c4IDE5gZi8CN54eA113imilM64ABb
	oMTmmi1Mm3RbwoEGj1akRgW+dU2zUh4kjy6NHeIX6H8II81CPrfm2HZK5TIvIPY=
X-Gm-Gg: ASbGncs3pfndu6j/ThAKdF0zfYvTBErbyr17Dxj4RpXX34RoaJpWrIp0g8nbPbnDN2y
	XYv5Q5pui7c5hHJXnYBcvyBnnIfeuulFJw5r5lMJuE/9qzWr7Udl5FZMuX0bGsMXGTtZTsbmPkd
	xG2qZryAtqs86t0IYEDjmSZBsp3Sbw3+m4lYiKXQ4iMJgsvckSL8JiXFG/fObg4HmLEeMLpywDc
	Z0+w1hj8MYP5hh/ZXjpU4Kz5r1vzqMBfvYgL9NcE0A7E0DL4L/f92/LsaFmODvorS3ORdKgvw+M
	u6NQvegu/m+KqanlNFuMDq4+OyJ/fwqssubGR33xBs+DmSjBAP14YbFQ62Pdlk/XgBPt9Vk7tZ/
	7I/w2POeud3mSL2DEbWqDCnnR3skGV5+jPmvhw/0=
X-Google-Smtp-Source: AGHT+IHby+uH+9SrUe0Mcr5B37Co4treeOqApvNmT3ZzjxOsvuWSMZ2/x9YLsSi2DmbWlz1SlUQrbw==
X-Received: by 2002:a05:600c:1c90:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-442d6de97f0mr50703025e9.9.1747131038625;
        Tue, 13 May 2025 03:10:38 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH PULL 3/4] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
Date: Tue, 13 May 2025 12:10:24 +0200
Message-ID: <20250513101023.21552-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FV6lUS1VQZkp1LlugzR82qxxAdBsO/kVg1ZGJpHO5Ss=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqREOlMZHUTEeB8rGJ1Gc38+QkgIxsOYpihB
 PhNb4GFzH+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakQAKCRDBN2bmhouD
 133pEACOMqgFZZYU1knd0BczssaCxOXwa3oD5FfktfyjygqFRCU+/WCNPLPHgURFsa0Hdph5dcP
 JdqF7642k+Zs7eid+yD15R7KnkgoSnoLxyVoTnvaqp+feC5HXpyqn16hFkXQgUdwgYOMDY68eFa
 hYaeGheo32dCD0XdeHBBG4gruHd2lhofAaiBwAAM32+I8dcF1ps1TURLduOC6uD0YHrykUjeg6+
 0ttqgCx1Eem6RPzY+H/Ih9FWGYsgOira9T2NrTxIGzNHEyTQRaaSjvz5ytncrkcv/kWsXL/PWYI
 dxJRaUUjFUZM4POvZXp9LVXijH+Nh+jZEK4rAsR+B4EdyVZxCZ/O6uv4Uxqrts2BEYFpTPaS3Kv
 4X7DniL1Mcs2cpw/N2wRa9kjaiuo0c9CrQXe6l+NwQ1mJ5CpHVj61IPvK+gP1hT/dbUeIFLuYNL
 zrRtKPzqDY7MFOtgspDImw2QLvnavEPi3LeaTWpLmSP84u6uHGaAwjZrgXa9Dcw4x9TsOCUGSSP
 kKNtoKqxj/ocKIaU9mBlGBiAgFWQoYIHqjLWQWdPgdM898/9xsIdJ9Esz5qD7HOEXyOLzkRbBtz
 ZElPdomkvmpOSvlz8CGDOOfzixnJ8vHLi/fr3zSK9sJY4dcChhWTjDc0YNetEUCcAldWlRdwR1/ 4ub3HTmQFrpqPuw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Recently DT bindings expect 'wifi' as node name:

  s5pv210-fascinate4g.dtb: wlan@1: $nodename:0: 'wlan@1' does not match '^wifi(@.*)?$'

Link: https://lore.kernel.org/r/20250424084655.105011-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index f628d3660493..153514e80c9a 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -855,7 +855,7 @@ &sdhci1 {
 	assigned-clock-rates = <0>, <50000000>;
 	assigned-clock-parents = <&clocks MOUT_MPLL>;
 
-	wlan@1 {
+	wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&gph2>;
-- 
2.45.2

