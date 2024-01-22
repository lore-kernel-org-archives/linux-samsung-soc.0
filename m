Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2B84A991
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 22:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964261; cv=none; b=O1p8GNyECehH3GOaYefrqB3tqbRq+TMaUHGk/IlC6ScSOjXaExSfNO0vcEkLeb7RmC7h4aliPMdaZ6UpIgWU4UqN6UV9WlgkSqwzZQ2KXarqr1Lc4jnKgINKw+ajt4msKNut1BCVNTpGsExF9qsImxq74zHvJzAJA9p1oJrJCF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964261; c=relaxed/simple;
	bh=VbkBWnzy+0UFddPvAXBKeoRNgIhOC3IP1F6/lPbA/gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GGtMNv0umq98cGzL2WRt/djTcv5MqGh1/DI+wuwIeyvWzXilBfdsGRv4lrSLygR8e1IQgWeGkbyENHslCMv5EC9ueXzMwDBFl8mjH8J1PPSpRoLv8r6+hydbp1s/4bn+5xeHngZbhDc43HTliAOBJGJMMiGSo/giRV2K+TXawd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WOnk8lb+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WOnk8lb+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-339289fead2so2923177f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 14:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705964257; x=1706569057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6ViflgtGKoar4JoRupvo6UR3+8nq9fr7o9SkHHwUZY=;
        b=WOnk8lb+B85aeoOIuthPlyiCSOwnxdQ5+kTfxa72PIquEmDgDtBSC9UpqWBTxPSTQh
         08j66f9IS8VxIEUXV9Sid87pId/9t2bYJ+kcLZ4uCPJP0vrQYba4wfO9WEgumANLmCUh
         4nB6LqYI0A+WAULwntiyoOmSn9IqRmyQGBk1yjR9hMBKoTUqijiU0CDR5JGMbfxPYHng
         HQSPU+sj+1XfBabLG4FudjAo6xcfSSH2Mxg97OagYwB2bTbdP7ynL6FoYVnVidxFg1R3
         b+P1bH1/82DFIbarP82nDHxXWH5Tp5pUO56fR7rURJt9DW9vLmOktHDYqQTD9jf2T+vL
         0zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705964257; x=1706569057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6ViflgtGKoar4JoRupvo6UR3+8nq9fr7o9SkHHwUZY=;
        b=CONjr0ltkhuza3bRdqxoJxDfcgA8fNEO/rNOjirXZph3vzKF6M6ZuehD73A9NuFgQP
         kD+tVBaknF6nWJXf03SJFre7xI6G8x87M7TYmLXNC4GftKi78XyDAO3QJaqPb/ZYvsz+
         4PZkOBTxSrJvI/4sFU7xsPzcqUJbFPqNErIFddYrMCK+5vtylL75ly3Gc3uafXDXz161
         gXtcnC9JftSkYxwKN9CGnBGhq6qjH1sOYR7+AQ/7fIECn/g1ts60ETETZK5Km+C5MWM9
         v2RIOh54aDmR9qF+VsFjdo3ldIjiSuPYsusQTtIlRCiuSSPe3QHct1dCjQFzBt3tXBcA
         Nd6w==
X-Gm-Message-State: AOJu0Yw9/tR6kkRd63hoJq36BTqyDZCPCt7M4W7MJw/g0+gaAoPNlWNj
	W/RXgnrgVNPLAtC1LFk2IhQLyHKUIwxVEG4ArzaZHFAbCyoU3oayd6fwJlKiEks=
X-Google-Smtp-Source: AGHT+IHwPlPcC1gFMy2RUxu4+dzTot/pZ/X/gGnPYFqMXOZZ3nFzZdmylLHz87taKykx7APs0vxeGw==
X-Received: by 2002:a05:600c:358a:b0:40e:93b4:25ef with SMTP id p10-20020a05600c358a00b0040e93b425efmr2798923wmq.26.1705964256708;
        Mon, 22 Jan 2024 14:57:36 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-76-30.as13285.net. [92.18.76.30])
        by smtp.gmail.com with ESMTPSA id fa26-20020a05600c519a00b0040e89ff10f5sm19776847wmb.1.2024.01.22.14.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:57:35 -0800 (PST)
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
Subject: [PATCH 7/9] arm64: dts: exynos7: remove deprecated samsung,syscon-phandle
Date: Mon, 22 Jan 2024 22:57:08 +0000
Message-ID: <20240122225710.1952066-8-peter.griffin@linaro.org>
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
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 9cb6bd61262e..347c346e3cfb 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -555,7 +555,6 @@ watchdog: watchdog@101d0000 {
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock_peris PCLK_WDT>;
 			clock-names = "watchdog";
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			status = "disabled";
 		};
 
-- 
2.43.0.429.g432eaa2c6b-goog

