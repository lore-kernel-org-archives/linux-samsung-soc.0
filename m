Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DF61A3BA0;
	Tue, 16 Jul 2024 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158582; cv=none; b=WRRXOzNUGj7Uw62VRlfqnzKZpXmdm7V1vUCN68cNbZrkGKUzQiz9Uif8YIm/Gb1ha1QnbsPZ26nXqgtCoSU11LyHpcS5bjmYYOP8IXhyrHxRMICaf84Fs9aLOwmeEmlRZOyVclhZKgY8FAAjQ1HXS26/g5FVg8XxxTtFIxr6CqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158582; c=relaxed/simple;
	bh=ARfPMWOv0SHpy06dIP7WT5PvXZ721GbF2s37aIb18PQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQJtiyUvjSnby6kZL4bn6biuZ8eA3cjl/cplpxBZNEx8AWe3DJCGbUpSMmrLceU21DYcaJKjcjg7J3IK72iL3UjVeyuieHbme42w85JCIvfu3Oxv/eybfHfg6XdzP04qRb6EHeSa1YpRYmWS/Yq2g6bLJwn/2c9/lpfAAXDgUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgI1qDWF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgI1qDWF"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e9fe05354so8247926e87.1;
        Tue, 16 Jul 2024 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721158579; x=1721763379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ao2+yhO25BW94L0DTHDolzXtIQQDTYjkbFtt5d8f1Y=;
        b=KgI1qDWFeP87JY+cix4PZGu9TZJ6I07fOSEkodhMidbGZ1Z9+/dJhE93i4TaT5dAeb
         h4WAJdQNtRpJd6a7QTJMa/VIAXEZVqzPHLlVNAdX6aPVkkRqad6jm5R1L2o+lVu33KOX
         kXPCvkBLu7O6NtBbVC48A/ZXwat/fgRRZtcgmSIC0F/8EZwgEnZdKqtUd+FIeH+9DKfJ
         rh5I8AgKClP3rwJGkKfOlYzU/KEsNdi+vTiQddmNxz0TZR1Kl3+ZAmDp0LvhnXyXVu44
         c38mucv96pXf+i50ZT651UnpcboHSTEDISszqqkC5LyfQF4diHdNDDV9xK+4NApaGs/Q
         NVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721158579; x=1721763379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ao2+yhO25BW94L0DTHDolzXtIQQDTYjkbFtt5d8f1Y=;
        b=vRfD/Fz/z1/jWCab81EeId3T19pufenJ0GYlkap3QQPKMocca3zp29uZ8XZRC/Pmlt
         M7DbyfDYgfqmvyXBQAh4fYw6IuT8r6XJni97ArVbzVzp1EABh+c/ZWrzlrnNvXlwtwHe
         hQxN6iUTzCJUcnd8q8qwx587wbJY6hncGxmSozOCNOapPzlRlFNrnSMU3uwAFfdX+LU0
         VmFFVE4/qsQEzPAp10iwKxemnFRoII+vpKqpTlJnvlkEU6GJVHZqlHo61A82LZklH5LJ
         i38gpo5cLHgxIwbFz74hqc7Nrd7jb91ZgJjVlq3CNmh4pN2ncr3AEDgnP3oyJg9RWlRu
         zAFg==
X-Forwarded-Encrypted: i=1; AJvYcCUjopP5hmv/vHDuk4WyYC5Zp2RTNp+S5fszwIcToT0TRO/y9ztNaZdn0nODG9kFadKPgdiimlNybl5uOTpgCJ8E8AJuwKDy7R7bEx35us+tb0NBMGIB4+XM3lbu5qoU8mOFCK4jmsAWnGQ8zykddRVv8smL83c8gQJLMpxJqUX4TY6tbgAnymi7krAtBg==
X-Gm-Message-State: AOJu0YzyulXsUpp4LmF+mrFWN+UiZ3N0LcXUyX8/kUrifnghNKERPe10
	549ACdox0KO0k45cYtbm2UFji0JojxXtYsYVPP95bRr6M5Fr+FPd
X-Google-Smtp-Source: AGHT+IFkRmQe5TImVkHM6E7h56pQbLBV1vW69bTzrfWCQRoN5lpzKl9uVosaSFSsHQArFyqN4QNI7g==
X-Received: by 2002:a05:6512:1095:b0:52c:df4e:3343 with SMTP id 2adb3069b0e04-52edef1e238mr2252485e87.16.1721158578766;
        Tue, 16 Jul 2024 12:36:18 -0700 (PDT)
Received: from tablet.my.domain (ip-37-248-155-75.multi.internet.cyfrowypolsat.pl. [37.248.155.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff888sm351179866b.159.2024.07.16.12.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 12:36:18 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 16 Jul 2024 21:36:09 +0200
Subject: [PATCH 5/6] ARM: dts: samsung: exynos4212-tab3: Drop interrupt
 from WM1811 codec
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-midas-audio-tab3-v1-5-a53ea075af5a@gmail.com>
References: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
In-Reply-To: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=ARfPMWOv0SHpy06dIP7WT5PvXZ721GbF2s37aIb18PQ=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmlsun+S8d7apjV+2i66/BusXgB+Lto8fFrZeHB
 qCztdKgpQSJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZpbLpwAKCRCzu/ihE6BR
 aI+UD/46s2uHxY+r4mRPl9cETVr1ho/j3Bye7t9T6q892CXKsEj9j3mcoJn/jc5L5M3u/vfmhXr
 qOwcMG7kxtLFWgXfB3pGXelLWi+2LAqFiWTEQ22PMrqV40aG433UZDql/yAofoG2L0UYrBRVk7v
 hPxLoBOU0kvTNgPaXFPVLnkmoH/rrAW/1HeYwtrpO/ArU626mjRFsVlCA8UVWIVZJDtuGlcpoyX
 C+ncH3PoVNvUsbnQZmrgAZwsOg/+3WNiIChR1WNU9vReCjyRO/5+HFC57oOWhRJmfF+bTTL3Exe
 Qr4N/mWtRuIleXnzuMNXfbFsn50R1GsefHB7xt1rOwFjkv8OoviPAZwi2DSoAgC7CI4pP186Oiz
 h+x2V6gG3Wy2BxCiiEB8k+2syoh3fWBkK5Q5DOgM0jV+d1C6JYJTE32YMw2VNJcuONg7XJvN4Ie
 aujLXrkfszeAjd6eUUqcPKgGLpt+QD1EkrCnqjJZRMELguPdoHmZQB82xRNnuLc9QJWfUkF4Nle
 i/+wecu4v5Kk3d0oKdiTniIX7fbX6naoN3h0/5+DYkfzqUPLbAF3P44TAib0Lo8UImDVGDa8Kvg
 t2gQxhOsQfJjP5rwpVQpP0nClgC3XXKlR6D45wzlveg73Hg9FG9KEYQGhSi8e0SDVz4tv8t0hS4
 zKKBpr2VLNjN7yQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

This was initially copied from the Midas DTSI, but there is no
proof that the same interrupt is also used on the Tab 3. The pin
listed as the interrupt here is GPIO_HDMI_CEC on the Midas,
but for the Tab 3 it is the headset button GPIO - GPIO_EAR_SEND_END.

Drop the interrupt, since there is no proof that it is used.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 46bdd0681afe..2f39f3c0661e 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -540,8 +540,6 @@ wm1811: audio-codec@1a {
 		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		interrupt-parent = <&gpx3>;
-		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
 
 		gpio-controller;
 		#gpio-cells = <2>;

-- 
2.45.2

