Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612913C9FC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2024 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268279; cv=none; b=jBAGQrq9hFjzZk/PurBVgjh9faseSGL5unt/rxl4k+A0dR5iGfmoSolDDvCZENxHS11yl+sMvXE3ecT8sROduFno0RIYQqe/hb95P2hBoEtQaGHRC5FKLppLwfxwdScDK4w9EuFUv/NBJNz35zWpYpdJZWktLreo+055iNGQ4I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268279; c=relaxed/simple;
	bh=IG1/QuuCyZab6uaf343Xx63BOPiPFaEpFINhDj+OsmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S2YOAGPTCeH+mZWHBJYB2xA1GQtNJiuamVw50PnAj39ckggVf1F/RQDHNcHszlnagW+EhzrEqZIgyHh2EBzDwRGU6tAFCXgQBgyncOvkspxB8ZxjCVS/zztDSJKHZLAz1dQO5gb6RFE9U7rClDQsXrMclSJOnKYFXfBpervGgaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gSkoGLxp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gSkoGLxp"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5131316693cso263106e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2024 11:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710268275; x=1710873075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qw2xDPlNe7SKmtRrwGLhAFX/roF84DFnyDd6BhT5KcM=;
        b=gSkoGLxpAEGz3fGmbuFi1gVehTVsdjtoD9QGICelXFUkn8urodH1qeT9LtOSih0z1X
         bJfA60wTOFMDKydmJbUCLtui2Y/vtCFh1qLRnXaJo4uNcOfv9prqFiYIAacIwUu6yZ7B
         R080hBkwvRFxCgU7m7rA5kKoWkpVMmCRX8cS5tXUQWy3B5l9VmBVV+LjXGvavZx+aAqL
         y5svQmhhXWGY4csJ6v0OdOcmKKMz5xDq3QavR/ll7PZMxXPWI+JRPMzOT4WBx2MjtdA4
         3cXTWDpZy9Hx/0BgOp146t2D3WhYT2juTe4VttldA0v1GKB3c0SRw8iYl8+uKVWNrw3t
         vDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710268275; x=1710873075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qw2xDPlNe7SKmtRrwGLhAFX/roF84DFnyDd6BhT5KcM=;
        b=uPpQnn/V1LmtgMAjgQRGB52qTlJCB8wu4QmBXm2RoUpGluZKCUzCgkPU57b1F6oxXr
         kP3b/NNrBJ1pUo/H/lDb4AzO425oFqvt/bzQnhE+4JvvJ7yGfzixTWzCRHFL3NB/6Xjs
         j83nW820Y37+sh+yKACKXlKUG1cHTg9NLgHox3Nrel2O5LFLBBYocaB2q9S18UbHFt+I
         vZ7RAQxN4+uZGxXDeC94yxykTUZXoOivmIVuFoc/3Ggd2BITlEai42KA775L3ENNW4nx
         BgVSjTdd6XLbIF+vt4HHTMcsal6nkDCrPlG0HzV8XbpQ4fsQ1WxtxfTEfDkd9lUA3/lm
         WoTA==
X-Forwarded-Encrypted: i=1; AJvYcCW0s3q7WvIugaWKSkosbb22x3+sjESPDlB1/JLs9s2rryyRFdBfhDDvIL9fPJeYi/pLF9kDpDUjvpcALMtUQj9AA275oMh+UIhburyMw58sMNQ=
X-Gm-Message-State: AOJu0YypOFJF5ScauRkipLifHwp1pyhSzOmqzJiRdDE2vkZ/If78Ct2a
	a5FFBCyOgDq+TJaS1xYrguzPJLO+QM3nAp1WXzxSbqMVLE9/DCt0PynvvRFfJ1A=
X-Google-Smtp-Source: AGHT+IFZ0YIuOzhmA2zL+kySltHSERfmg5xOrosGsca8rbD/pqygXA44AhOEldxt0FddF7G/aQDwew==
X-Received: by 2002:a05:6512:46e:b0:513:c5b7:9ee3 with SMTP id x14-20020a056512046e00b00513c5b79ee3mr747592lfd.6.1710268275053;
        Tue, 12 Mar 2024 11:31:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512060400b0051329001f53sm1661012lfe.54.2024.03.12.11.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 11:31:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Abraham <thomas.abraham@linaro.org>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Grant Likely <grant.likely@secretlab.ca>,
	Sachin Kamat <sachin.kamat@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: samsung: smdk4412: fix keypad no-autorepeat
Date: Tue, 12 Mar 2024 19:31:04 +0100
Message-Id: <20240312183105.715735-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312183105.715735-1-krzysztof.kozlowski@linaro.org>
References: <20240312183105.715735-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although the Samsung SoC keypad binding defined
linux,keypad-no-autorepeat property, Linux driver never implemented it
and always used linux,input-no-autorepeat.  Correct the DTS to use
property actually implemented.

This also fixes dtbs_check errors like:

  exynos4412-smdk4412.dtb: keypad@100a0000: 'key-A', 'key-B', 'key-C', 'key-D', 'key-E', 'linux,keypad-no-autorepeat' do not match any of the regexes: '^key-[0-9a-z]+$', 'pinctrl-[0-9]+'

Cc: <stable@vger.kernel.org>
Fixes: c9b92dd70107 ("ARM: dts: Add keypad entries to SMDK4412")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts b/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts
index 715dfcba1417..e16df9e75fcb 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts
@@ -69,7 +69,7 @@ cooling_map1: map1 {
 &keypad {
 	samsung,keypad-num-rows = <3>;
 	samsung,keypad-num-columns = <8>;
-	linux,keypad-no-autorepeat;
+	linux,input-no-autorepeat;
 	wakeup-source;
 	pinctrl-0 = <&keypad_rows &keypad_cols>;
 	pinctrl-names = "default";
-- 
2.34.1

