Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E6313A26B;
	Fri, 16 Aug 2024 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794685; cv=none; b=t2MarT+r0Nqi6RSECY9i++4KsqBLMgRsgFD2BwNuRSmRHsgZmm/RzUVf8rwx2LjBwbIxviPx0FFyk/4DEnVrprgc8C5ZxQwlBdvBfiJah/YbqFrmrfswZAqlrIcG041z5bmGnJF/z6VJAkW5izx3MVLOB1OgLW6AZmXVpjNGHwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794685; c=relaxed/simple;
	bh=8Gwq4xkMrX/EEDfhj3DuiQn/fL2hhjypD7XNTLT/JkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7LWNpsNG8I6HAJaG3cfDLxa+k/Mx6kvbIqSSHsB7YchQAhvH97Hdj50iuZ069uYpGX5jcyTQ/Xc+A55Z5Kcu5OHQUVeJyviDOq90won2aQKOuUWQkdfL8fJZxrF31IVoJz+RkFAI/NjGVoSc2PIZFTOkYHsIZl8RS24INaWYFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRJ9sB5W; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRJ9sB5W"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so13104975e9.1;
        Fri, 16 Aug 2024 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723794682; x=1724399482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60xK5Hc6/1+V6wZvBlbkRog8IQheNoyVjo2ziuG+8Yk=;
        b=BRJ9sB5W6+dTseeuQyjmZNFfDNvP3VvqvVaoiYQqEYz90lRHAthHzUryMNVcWxpuWj
         0u0kZaI0HYCIPjle0XdPFE8hxygQQksVQBeU9TsegGb1Eed3Rjm2wrRRiUFa5fDOrpou
         rOOzLVcJI/mNErJN2wKchjRVF5IcHKDXmeTZ+menUcUw9VLjXH9loldyuVAtyuVdO92/
         e/6rniHwm870L9er0dQ7l4nbcXbwPLyvzppNOQ2Tpjigkr3l00oezKqF+7gJ+IS9e/6Y
         o0NlXWi7W0/ZaX0I+/W5aL9+5fYiDvn/MEyZASct8bQ9B1Jg2vTtj0oVxbwx+b3W0b7+
         k5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794682; x=1724399482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60xK5Hc6/1+V6wZvBlbkRog8IQheNoyVjo2ziuG+8Yk=;
        b=msisJMxKB+UnjFbZEIL+5sQtG+SHImBqyMquakfs6SWW9xNbLnrs+/5FRSSyLb1+yT
         u3HF2TjShb1D+/Tt0sUSRB00yrOW6fGRchP06gJdw+HbAvxC8rQuYXD8ZavKhSHTx6BQ
         dB76oZExxMxJ91uLvegrQjLlStsPh/9rQo0aaOONfN0RlrfSFe3vc2f7aIx79LIWizhO
         jKa75YV12I6nYuBcrT4ESsd/4Tg7JQ9JoZOav7jZg8DCLG5K6Ubn7sK+P97pGgZMCfP7
         OmFoLY1B5Sp6//R472F7vnadln0AatCC3jB85pSutqv8w+o3QBNqKf6SzJ/vypOVEw3R
         ftjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLmaNnKykKI2dtupa4YlPK9b+ab9ZAbhh9xjR08u70KLIOAgscky2nYeD4mpCIpmlOeEx6NzsC+QUt+df/yOWvBed6WzVn+jJ4xDIZNw+Ue4pm3NGib9xevlP4+z70wpz38iHrcpUCD2/VYNF32NIEgeWFCDNu1Fl9Txn0PSiSsXCTgr3ElelFuZQjhg==
X-Gm-Message-State: AOJu0YyKwGLrabHqPF7VAfFLcZgRwKeVE0qV8eVl09jAasuNz5OmkqPi
	gzmAgcgLZXnV39bSL4WlI9gnmO73Q2MDDmmPa6RpBRen8oD8igm2
X-Google-Smtp-Source: AGHT+IE5or+p8N3pv0ta/7lWZxGlQK4fBtEzl6g6QTBj5XXkc6qikzCLHFw0ocw/UwtRfnEg1OtnSw==
X-Received: by 2002:adf:ed01:0:b0:368:68d3:32b3 with SMTP id ffacd0b85a97d-37194649a85mr1291305f8f.26.1723794681900;
        Fri, 16 Aug 2024 00:51:21 -0700 (PDT)
Received: from tablet.my.domain ([37.30.8.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a6c4sm3026201f8f.52.2024.08.16.00.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:51:21 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 16 Aug 2024 09:51:01 +0200
Subject: [PATCH RESEND v2 4/6] ARM: dts: samsung: exynos4212-tab3: Add
 MCLK2 clock to WM1811 codec config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-midas-audio-tab3-v2-4-48ee7f2293b3@gmail.com>
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
In-Reply-To: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=8Gwq4xkMrX/EEDfhj3DuiQn/fL2hhjypD7XNTLT/JkA=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmvwTnahzSs8X6AK2fEG8dRiS3h4Lutmxj7DmOl
 KArkb65MI6JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZr8E5wAKCRCzu/ihE6BR
 aLlxD/0Q+hDUWhUZIsxgW67vCiSedZkUVg76OZnorZN+/MnaIwqE9v1OcjD6+Hl4drdGGeyFjra
 YKO8lnZMYF520dJmfvS2Zwj18coMllOY6hlP5qwBA+YFt21ybJfJ/xH/xrWuzUMp4zTE719AVag
 cR/HykwL+4b9AFDE0Y4lmIm06391QTAsuUQ8pNZNVNvjOnGih05NbP5b0XELX9hmbtqzZE2hMxb
 ygIxwyZV3JdzoIJHvgEmd3G6yssDmYoAzJyqYeg/bBQmYeZbyoqzqedLw8J3bG6OXXifoVvBmye
 J5jX+HV3y75JgYLzg6c1xOpgvYl8m0vU7bkOlt/7VNz/cgiceVaySXPMhTUh8rLjbT4tQQTgXxf
 710sC0XrZ3zQmq0uLalEvuvMpLgPbaoUqSD52JFXN5nHRNVU34+VPzLXcQswxTDfPFWi4XuVDId
 zfYXmycB8JKu0sqU/rSxlXebvw9JuM+VHE+aq+XR222AmXT4Jlpf7nXHdSUbFpcHSNib2wM8YF+
 T9L7XeJYS1NLTcY41Qrn++vENu1y0qKHcSMloPbfq4eEIaUqMw9TSzU53MZXZLqP0GLdzV5cF26
 myIZwROHOZCz5ZbSS3WGV/Zm6DB5su4BZbT8aXLzUZVkWGdHLx3VEjwCJ/WhtdKdcf2rB1gTPcF
 o/r99NcGBUIEl1A==
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
2.46.0

