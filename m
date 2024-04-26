Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24163143889
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125794; cv=none; b=EQUY7GUH2UUEqPyRoYHLx5KH8dfDEDjfG3KOfr3P06RX635kymUANkQN6OspYjse4HZpF7e5mjf0HS4rZA7yngQxdNdBV3WR/V23jceWj2LI3f3gRimhtT97Ab5KJDcwQ0cyxheotQgPdH/hsCIUJU4VE8zBa1fHZx6LJqPCZHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125794; c=relaxed/simple;
	bh=c4GAR/VHXiSuWKUBHE7VoIKB62u9XWyDx4j4aLii5Og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SszI/wIGrB1NsJ753GvlVGlLXXW1pC8pyGXRP7KOx/wEkbchEI2sH2dfuJKc1e5T4Dd+rAypC9hBivgQqoBgg//TAG/Tpn4ohdyt+m1hXekRrYYtPr3ZcGVEFBvUIbHFibfYJdBm/AlKu3LyxBCZncRq6eSivx/O6hBTTdX4/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ppy8FGCy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ppy8FGCy"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a559b919303so255543066b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714125788; x=1714730588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DZKoeYKhsS0t9QVM1EShX7SrXXkb1dkzX7KrV4eN3Y=;
        b=ppy8FGCy2CRtcwTwqpxscK70U91NVI9WG6HsTGjN31sDPiEAsyoudReEw/zOL3bBEt
         ZpLpAg5P+qRUWHRFNbC7rIKEoY6JnZeTbYHkSvmckt7mLU2mcOP91Blc3UJkL42bYGEQ
         V9aUwJU07vyjyVwaAgpa7gB6ntHgOILOdjPrw7031l5jFVp6L/VRxh5L4md0f6YXPOEa
         0WR9G6gkD2+6GuBmugjEbT5CTMKaI1Z1N1dxphrjEEK2J6N4N7OuXHS+rQCQ9/D7/aWh
         XtQvsPvy7I0eQS67KPtaxjuNN+cE0ken9An7Nh07fkC5NKZzequFHFkV2HqZOsAP8y+k
         KcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714125788; x=1714730588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DZKoeYKhsS0t9QVM1EShX7SrXXkb1dkzX7KrV4eN3Y=;
        b=QyaJ2ez5CLatkkpsMH4WQHYws1rdjCZZmeE8TPEoaGxKhbIEIhHFQV+QB2rEQQOrwP
         zQIszCRuShsISh0UkHI2scNbcxvnHbePwTVMdlsa1RXVtgZRR6iwWjY4q1IbWAPc0xsw
         t4OUmzAnE68quAkQlIlFpRv0pglp+37Se+uRBqvAo8Rh1Hp8KDX8xJMB/uu7xGwYijSd
         8DwcSEHzKmpfMTiB32EEZhVJXjhG3sMdQlH4x94Fg5yvzMk6McTXG0q7ow7hNRyox2H3
         UKc/XbToEtn07q5/wWJfF17xcEjjyCqNbJBYBCLp8kp6U/rEZ9BFFFekdYck1y+FOixm
         hr8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6J8qssBHjgTGw833qsbiCiDd8KdaWlL4hCcuYbgUtDi5mDY9TolKKtnJMXsdpiC+Mqza4igDeGbCmF83InmmDX/2tJRd5MeigYLC6wveVFAs=
X-Gm-Message-State: AOJu0YyxBRYxiDZIOZI4h1mEESP5ZlaIu5/QW0jx+c2nXCkdoAGz7zgA
	+AQWqo8dvd6Vv6RF31cR5kFsbuCmgWYFBhMfitzuo3EghmmaFMCWgsN4yBKqttM=
X-Google-Smtp-Source: AGHT+IF8yC+P3Xjtk6lhWRIE+HMMTo1r+6sopk+vF5M8rRyByCwt/vcu3QmI793r4Uhlx7cGlfzr6w==
X-Received: by 2002:a17:906:c451:b0:a58:c54f:83fc with SMTP id ck17-20020a170906c45100b00a58c54f83fcmr1674104ejb.9.1714125788406;
        Fri, 26 Apr 2024 03:03:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b00a555ef55ab5sm10417289ejj.218.2024.04.26.03.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:03:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 26 Apr 2024 11:03:06 +0100
Subject: [PATCH v2 3/5] arm64: dts: exynos: gs101: enable cmu-hsi2 clock
 controller
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240426-hsi0-gs101-v2-3-2157da8b63e3@linaro.org>
References: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
In-Reply-To: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

From: Peter Griffin <peter.griffin@linaro.org>

Enable the cmu_hsi2 clock management unit. It feeds some of
the high speed interfaces such as PCIe and UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9755a0bb70a1..52be951ef4fe 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1267,6 +1267,18 @@ pinctrl_hsi1: pinctrl@11840000 {
 			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		cmu_hsi2: clock-controller@14400000 {
+			compatible = "google,gs101-cmu-hsi2";
+			reg = <0x14400000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_PCIE>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
+			clock-names = "oscclk", "bus", "pcie", "ufs_embd", "mmc_card";
+		};
+
 		pinctrl_hsi2: pinctrl@14440000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x14440000 0x00001000>;

-- 
2.44.0.769.g3c40516874-goog

