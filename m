Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED49E13B7AA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2024 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268274; cv=none; b=h9cGRokl3VKho3MfWOi+FR8DZ1Bqun4NSySOa7fRy429uw5MJdV8gL5yilzXtufCPVcUQ4/im6l2voWR9IFuN3TKg8FBIXGrOqbMYnUddqV298VswVhLAHi1nYf3LEZPm0O/LMExBEdMhbd2j+4izRO27rppHADpkDsY0ClUezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268274; c=relaxed/simple;
	bh=GGfohuvUdCR1mIme2gaPlbrTnQyrLD6PmEDa+LPTZEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tqvBwW+NuvEBk/eWzFb2qWRD7kTwjt+QFiWBViW1XFhDNBDncLTMV10swsCaYaD/dJ3ZRqnVH3ZixqEyJG5URTjazDYqxBPhU8RdEfhup82jQWoAXXir8e46i4Ah6hVKQa+S/VbQdtM4D1ifb3WR37EviKsWuezErMXU8kp89CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EBvabJbO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBvabJbO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513a6416058so3484123e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2024 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710268270; x=1710873070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkPzWlNIYGy9ZZ9Z9dAov2lpIc23rvtotSMeeMgpt0o=;
        b=EBvabJbOvVJLU+eePjTudKSZwUhB/eEEA1O9xhLQYCgFs1idELPT6xflHyFO548VbA
         oiCxf/sDcvAmu/kiUE3TC+ZEsv38jsOJ5M1RNunRR9/48nfyvw1Fl24i/Ym3HJfhaI0Y
         69Wf9dbXmX/O11/q0Y7N8Tnu8Mzwisq7vil2beD5VgVixwV7WtarUF+CjeDPMEFs9GN7
         P3fYOkpYlpDlJX1i+BRTxExvR7o3sG81hu/FjyYHuvADg45xOkvEg6x4zxaQxS/WcBOo
         aVaV+61JhfzCGyga4bVJRk5T5+9a3DoubNRb8/IZeGdJvZp4MmO6MyRVtT+/+gwoivwv
         KSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710268270; x=1710873070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkPzWlNIYGy9ZZ9Z9dAov2lpIc23rvtotSMeeMgpt0o=;
        b=uVOcE/4e/EMYoOtuAYg3uUVQwN2XePinZ6c4+lbur7zYH11XassUXr00pc2XOQPjt5
         myFsE9NoLWz6MN7NeazFfxdf1FE3Iv2o5f1XOvyR6BiDT6/6B0ki0nX2BSXVEpPaS2hx
         uWWGjiotAumVj484K5B2ZQkbDNLwjDnU1HLupr/T+m00NKmJ5dZ8+9NZCWLYJaRNfALu
         9kCq8u3ZBa2P7c+7axAA54VovNdM2QF2fjNgiivAkRW9sKCbFeiZbb4QDTQD3Yahc4Mf
         QKJ1Hefh5hW+qS2AajFldITJPnMC+Cwz7JhCbSiBKDz702PPtEUCXb303MQxOGidmPFb
         z3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWVejfGf7Mf2tglGVPlxrI7h1YulJmzcKzJyTYzJX2PWboo1r8OJKmppyzi824hWu8z9BlOXrqUiyCMtX9eduAq6it7VjhIRoiI/WgWhvpIUM=
X-Gm-Message-State: AOJu0Yx7aLoKQs7MHYtxicgK4WRtgIqUGBb1j3l41HKoHWwtUjcMjivk
	y4+sYTa2N3G2PeIkncJpY+ETDqiCeMK5YIFKLsQ3t7ZtE/6XI9wGhgl7QEQst2M=
X-Google-Smtp-Source: AGHT+IESZy9/6wwGJzCCuXlWCFt+8swHC3N0HCtMssrwELRNtrUB6XEi2FAAOG+h5wyUNtIPAzDErQ==
X-Received: by 2002:a19:2d0b:0:b0:513:b2bc:793e with SMTP id k11-20020a192d0b000000b00513b2bc793emr3219193lfj.41.1710268270059;
        Tue, 12 Mar 2024 11:31:10 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512060400b0051329001f53sm1661012lfe.54.2024.03.12.11.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 11:31:09 -0700 (PDT)
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
Subject: [PATCH 1/4] ARM: dts: samsung: smdkv310: fix keypad no-autorepeat
Date: Tue, 12 Mar 2024 19:31:02 +0100
Message-Id: <20240312183105.715735-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

  exynos4210-smdkv310.dtb: keypad@100a0000: 'linux,keypad-no-autorepeat' does not match any of the regexes: '^key-[0-9a-z]+$', 'pinctrl-[0-9]+'

Cc: <stable@vger.kernel.org>
Fixes: 0561ceabd0f1 ("ARM: dts: Add intial dts file for EXYNOS4210 SoC, SMDKV310 and ORIGEN")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
index b566f878ed84..18f4f494093b 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-smdkv310.dts
@@ -88,7 +88,7 @@ eeprom@52 {
 &keypad {
 	samsung,keypad-num-rows = <2>;
 	samsung,keypad-num-columns = <8>;
-	linux,keypad-no-autorepeat;
+	linux,input-no-autorepeat;
 	wakeup-source;
 	pinctrl-names = "default";
 	pinctrl-0 = <&keypad_rows &keypad_cols>;
-- 
2.34.1

