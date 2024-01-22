Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0231347A4B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 22:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964256; cv=none; b=slmWS0VHd9s1TO339qTvZ4l+cHaQE47dYqXitJp9vNFu1LaAJDBr6+1uLFU+5YDOhpk0hQuMW82JOnYsS9VsLMmrcaP1WElUqU0fnqPCrsXEp4opi96GMJMOjiRonWP9iFbPM5RxxQ8vJmbqpcLeMWutUCEP31dKtz+VWf5JH3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964256; c=relaxed/simple;
	bh=NU25j/nRSRJjYdR9Xkbm95iBy1+9quhbyDaHdu07SNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVmLOWb19eLCderdUdjcxwvpaXfPvtSwXHPmeFfJq+Y1bDncws1SWJ9Ka8FSYuJeC+4rUODDwN+NBDphSrBqpjUxl51/x9mViDaeDlY4EJHO7sGcuZ4mEY1b+2Bjw0CVALLzHtogIuKFRZYkwVB+ddEZpdqIXkaitOV0ksLztXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQYLpdmd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQYLpdmd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3392291b21bso3156625f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 14:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705964253; x=1706569053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJbJnRKpWToFu2q+V6O7FlsxtcgPK6P8cGRt1rv+n50=;
        b=uQYLpdmdMVOzzWipAtTQ459d+DbOM3ZuixH/tzo2gFJ4sj15tsIs6nlNHNcL5A7//7
         yaxdYwtGdqQzmYqFqDZk9/h8y35ZiYcqFeeW0g8sQ2Aa3tYNaZBxOUYIAu4kpVZg9rga
         r33t3Cd7Yd1QoYs8tagh1vrX20KOYBzTs5kvW8X0RYV4jE2M+KPrSzIBLRy0/d3mHZeR
         GQ7ifuTLDJEWD8JW1/tTBdkriGHkBCpQ6qjbRrociOQjnYqB6t2cLiJpeH8v+BeW9OwD
         JRQPBBHa6pg2vcMa9IFaSyq25bbHpU1DgLlE5ikapiIA2htHyNi6lYf/CAmqCA/CdY5d
         R8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705964253; x=1706569053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJbJnRKpWToFu2q+V6O7FlsxtcgPK6P8cGRt1rv+n50=;
        b=hbDvJSZdozVfRrV6/DqLpQQw2xv5bsJnItH9pfa3b8wCcIz0k0I9Sc+9snbAxDrGdS
         0qTGYIoH0BcLIMhDzswjoibGMgu3uI+ZUeXMH8Aprsq65OfbwyAvyxHAlb7kZXwFtTKq
         HcJkViKHWJXX5sZvqgDlpcnT6JO4CAD0OdLDOGfBfd3Zvz4d9OHWH1jXyuZjqcfGAk6I
         bnybM6BK/nKg636HdCPJl3fgtlxX2ogCn4VhwR/P4dCXWKGCQNUdlO8B0S2APaB5aguy
         +8pGOvnEKNigk7Mwyn9EbpCwGVa0zrFj3cVEWlExgUJxVNJGkycz3p4XNU56jtzlEMPu
         gCow==
X-Gm-Message-State: AOJu0YyY7h1YrqfbDqkr/K0fmaGlxA+Q53A8dM/Bm8SIS2+BHucojBoT
	xdFT0jf7XAAn/SwmsZSZDmds9zejCH7YY+8aKe+C9XjKBqRobhh0Obe0x9ZhIFc=
X-Google-Smtp-Source: AGHT+IG/jFOxju1LtglICeFEljCYH82Da8abwgt9uhjEC3EDk+nmoQu4sACeu8Vd9SIMCqy6XTt4bg==
X-Received: by 2002:a05:600c:ace:b0:40e:46b2:24da with SMTP id c14-20020a05600c0ace00b0040e46b224damr2627569wmr.71.1705964253325;
        Mon, 22 Jan 2024 14:57:33 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-76-30.as13285.net. [92.18.76.30])
        by smtp.gmail.com with ESMTPSA id fa26-20020a05600c519a00b0040e89ff10f5sm19776847wmb.1.2024.01.22.14.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:57:32 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	chanho61.park@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: exynosautov9: remove deprecated samsung,syscon-phandle
Date: Mon, 22 Jan 2024 22:57:06 +0000
Message-ID: <20240122225710.1952066-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240122225710.1952066-1-peter.griffin@linaro.org>
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

samsung,syscon-phandle is no longer used by the Samsung watchdog driver
to access PMU registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index c871a2f49fda..94c8d68fe92c 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -1551,7 +1551,6 @@ watchdog_cl0: watchdog@10050000 {
 			interrupts = <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_GOUT_WDT_CLUSTER0>, <&xtcxo>;
 			clock-names = "watchdog", "watchdog_src";
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,cluster-index = <0>;
 		};
 
@@ -1561,7 +1560,6 @@ watchdog_cl1: watchdog@10060000 {
 			interrupts = <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cmu_peris CLK_GOUT_WDT_CLUSTER1>, <&xtcxo>;
 			clock-names = "watchdog", "watchdog_src";
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,cluster-index = <1>;
 		};
 
-- 
2.43.0.429.g432eaa2c6b-goog

