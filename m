Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E3199223;
	Thu, 25 Jul 2024 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904051; cv=none; b=AN8x6j7wWeJ29JmmuN6+Sj0up6Lkr3+G5kMbg/HzHVxVgfTXN66Gam2XlqxU1dcgmWLfjZT2c66F/o7nJlDfwqoz9K/DEp+XqWwzkJS8UI5cB3SObFNLJ6gHbjRrejdPBMzv6IwSnLsNbhSxeE/pRPKe7sZFbm/lm58R6joWNI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904051; c=relaxed/simple;
	bh=jHWT0Fa+xhOf6Fte2P6lvkJ4mgTfM/iqD1caxnjhtGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZWd+/Wyi2faX3O7uU2ihPkDvIwfEGX1w6RIfqnqNfeEWexpxcB/8OhFvYdhjyZRuObpQ0BY6na/g6bYmKaGhmLU7Hwi/HmWKHpWoRUakQwOt1niveKLvPw3zY8twrWmWaLWWAvtdfeOnNru4t9TZk5wiNg6B89zYGyFK09RTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIucNBFT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIucNBFT"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7aa4bf4d1eso44286766b.0;
        Thu, 25 Jul 2024 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721904048; x=1722508848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hbfg5uXazW+nwwPtfcNespnqKTYu9/iLCCEpTXlI5LU=;
        b=GIucNBFTuyPeloBF4M4m6jjitP689irQvO3qzw/Unp5T8joFrQ58G53Xe074mcp1hg
         6DaF/bXbH8Mt3uaT2EoCEkxwh8OBqipHk9Z+6Be/91asUbqUF2aRhvjyfkdkZFbUmhPe
         KLogKxd+Z0qxCAi8QVzOY42uylGw/sP772sLbHjFV2sqM49+DZe52vZQ4bLLcNs946ag
         mgueyzcjr3AhZ31qquBcfrcC1h+5DkzOH1dpJ2mmTNOkwfbs8LkO1zG9Bz7OZRPktZKP
         owcuTXAv5rWK4MOmNzQpyrL0GG1bAjB1EpX673qDkexFhalmqP9gULQzKkTqMvmSsXs1
         wNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721904048; x=1722508848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hbfg5uXazW+nwwPtfcNespnqKTYu9/iLCCEpTXlI5LU=;
        b=Qx/EChktTLClGmuPcYCYIB5e5LXz71xwUioblCMAH1az7RDUfWq0mqRaiSawnAn0P8
         QkAJfJC//f971C5/PHJsB2h8cNbQD4C7LSEexSNFa8v4UzCKxRIXLXyxqyQVpnKNK3kx
         Ho9rnIjYmvspqs+6C4nbTogEF6X8I/mLwWEm7gIlsSwDgydz8pqhBEiPnpp1ACmXlPz4
         5b+uaN4kxSjwW6fr35qHhVaD0taq33ggvTQK/k2hzxWdL6Lv/X36ZQqOWgRMAjRX2krF
         QbYcbxqjIZgtCoXTa6A4zhXdogABlbdxKQVXfVgdsSAqefJM2N1GnW0DHMvfE9G6AzxX
         PN0A==
X-Forwarded-Encrypted: i=1; AJvYcCXOjZbQI6NjWjf07N6v8cXUUH3wxJXKywB9PyrAHxiQS//o4ew653JCtmnXc81ogfp7H1yTeYLKwzbFBdhKulP4YfV4sMuPonPiA0XBndtsBT3NJFlCIhRsYOxqj5NjUDtJkPDa88778+rSb3s8QinFXbso3Om//CYVMrt5VrU88jKIexu+mJXwD0SkLw==
X-Gm-Message-State: AOJu0Ywo8sV2FiTKINKDWU1Ln8/ljKk0VGNsMlyE+tCdYkJ2WLOND4bi
	ZAAdwNAXUSPmUWTz7D7UElji6ukw3M89GVzepATu7JFY+KSx6VHbBNkvGw==
X-Google-Smtp-Source: AGHT+IGnP6YKcnhjuaGkkjpm8excP6NxkP2lXBsisKbDvXzA+qzUyviZNMfKXDl7Qml3TfN17X3VQg==
X-Received: by 2002:a17:907:3d9e:b0:a7a:a892:8e05 with SMTP id a640c23a62f3a-a7acb498255mr126320166b.33.1721904048162;
        Thu, 25 Jul 2024 03:40:48 -0700 (PDT)
Received: from tablet.my.domain (83.25.114.69.ipv4.supernova.orange.pl. [83.25.114.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab23d56sm58342066b.38.2024.07.25.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:40:47 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 25 Jul 2024 12:40:38 +0200
Subject: [PATCH v2 4/6] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock
 to WM1811 codec config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-midas-audio-tab3-v2-4-dbc055c27879@gmail.com>
References: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
In-Reply-To: <20240725-midas-audio-tab3-v2-0-dbc055c27879@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=jHWT0Fa+xhOf6Fte2P6lvkJ4mgTfM/iqD1caxnjhtGk=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmoiuo/j+1OWobQ2BFtLgRwLTmCNNfv8vZtkvJq
 eWwbWcRkhWJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZqIrqAAKCRCzu/ihE6BR
 aHJiEACOfWoLCfrTTHzQfVC3ppsNF4bl/G0huge1xId4KARL7Pl6fDS/9LsgEP2BZ/nRv+lCzpH
 TYb/bcPcAEsxLV0VfJBGf1Kh0Ql9Zy0k6qgOv4Ody+XdxV8JFL9EDw/cH3q/1Jo34oaFF2X4nm/
 PfDvK//aK6sGVYvLc5Fan0tt2fhRFnfzvKt+4SGHoyQC7q1Mym30YSF2kfHNQa4og7jNQOl8OaA
 3eR7To3EdzZvjOGOSJaIcUYdyOgsUXZAjOBuRHlP8SeHsnBynmpvqBTSkkBsgHxh17rgkZZaWe/
 HL+Uyzuxi8M9XfMc6DnJYB9LMtFS0Bszhkpob0z8zaqrRssEV+Zl3kherkqk3V0uHkUU7Xf/XYX
 WdJv097bim0r5mKdon/UQLYvXnsIPukB/opj9ld6JX7vTLEuugtML/Vp+t19EUgC1dycBhJU2Gs
 Qo2J4oUXWx1/9i5VAkqJ0WYjFjjiA6403criZcbK68QEmwzv1WdCP0+HfSD4kTS67mwZm3YVulX
 +oH3g6i3EXv+owUSaHCjoPK3EwOor6gia4U13ZZC8FUqGj4XlQYlLYFQ2t6rbCvKY8RyJXoMJ+3
 DjYJ/5T6umwtK9jnWtG8NidAjNDR84BKQkuC6YJ1+C1W5NiJkyY1/vhOOsV03b6fUY0SbW4AHK5
 MWTK3+xkVk4sRhg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

In the schematics, the MCLK2 pin is shown as connected to CODEC_CLK32K,
which is derived from the same 32KHZ_PMIC clock as Bluetooth/WiFi and
GPS clocks. 32KHZ_PMIC is connected to the BTCLK pin, represented in
mainline as S2MPS11_CLK_BT.

Add the MCLK2 clock to the WM1811 codec clock property to properly
describe the hardware.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index bbafd4ece5f7..5106bb752b7d 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -535,8 +535,9 @@ &i2c_4 {
 	wm1811: audio-codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
+		clocks = <&pmu_system_controller 0>,
+			 <&s5m8767_osc S2MPS11_CLK_BT>;
+		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpx3>;

-- 
2.45.2

