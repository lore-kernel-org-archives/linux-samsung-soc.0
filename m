Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0594312E1D3
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233612; cv=none; b=kOIOVq06oBd4YIL96LxONtanxcFU567fUD48ITqXPq4ONuhVz3+oSkDFltPqymM0zsBYZNrxseR6da1Rpv+kpZSwqOUjnXwSdus1aXcPz2uplNM+iGqmFXRvFJ3uddNkzgh2eRtxlX4ABqMKgtRScAG+dgx1DQWdwU9BznXEQoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233612; c=relaxed/simple;
	bh=pLsBolex5BBzVJny3h+qANgA+FdDOJdRlIZd3QZQFO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qqvq23Ynctqro9ESdJEt/R5OAZed36Y+ukQVgRmsDYDzI1UHu+J+xkygso6jyifQ5C4gHVedN4VZQCJ9gofFsePCixL19E+1zIEHNj6lERcWc1OWOynNCi6BS5pH7d6Y1S4akVBOWa2Y26EheRuLtIPHSZGMFXjdhtwKVK05FG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RE/o0Hsv; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RE/o0Hsv"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d6a1af9c07so10496201fa.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233609; x=1712838409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKvvN74xOJwt4hMDICXFAAtS9sJu4IkWmxjimbRwKsc=;
        b=RE/o0HsvZK+ztocFaKv2RRKCT4K3G4kA8V+mIy+vTJwjiqURhj2+OXBbRH5RhP/Ozh
         pbasYQKOKpx96Y301KPGPj1FvoChGGriFx4wD/vp+U7c06O1CT5nzpj42MRgaJpMaUGd
         Cuki83EsJO5crHm9MtJ3/E73E+LXx8RJr9IwTouA/KgZeRF67CAliSrbTsQcQ2hVTszO
         iWOEbHfJQlKos5NyMxoTkY9akmKMa3ValAoS8wgfvuAT5Fwkg0T0OEuW0bHC94y1WDcF
         Jhr3KZTRejuuQ7P4HrwIAnBBBgNyESQD3sr6qfKQz6KNbaDegmLGk9sFsUt8iYSV6/g7
         cXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233609; x=1712838409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKvvN74xOJwt4hMDICXFAAtS9sJu4IkWmxjimbRwKsc=;
        b=PZTKnEK9Hes5dFbAKCta4HjXqJ22hXy72huc8Fp4fag9XiYZHUMrfpAxi2KokefMii
         DrP8kauU6iVTXVHS96hU1Kp8vgkcCW+pkgvAhn3Mf8hfah5UiImnICrxF4UxHgRoRba9
         bGP2hUnuh30th/VrFZSwYMnG8LoyzNOB0X7LGrrqxAJP8oQsvQNg1blL/ncsPVELfMrg
         ofawCL3xbkxOBIafbikQWndgU+qy8I1Uq64FBParpyaKyYP6xnyU22IDrpbVIZ/GEdT0
         /qKdmB8tlePuuzsBuPN2Q48bkU5KywTYdhBTB8xoUn4uMW5HBAM21aOvckvCA2LPRmSi
         zPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlHiTp26yVFS5ppz6//pKV81P7dRw5re6v7SXs3le897tWnWevxNxZfT8dqN5yD2YpdpztPJGvA8sPiPENjjc0bvyHEs127Q42LAHM4ncVWYw=
X-Gm-Message-State: AOJu0YzMsfVLjrGDWZdhPOHbf9G80y/W8ARzf8tv3EmOFgSdaRWsrMQs
	OewE2I1Y+SWDbnTCpVd0B6c2y2IJJwxsHk3magngBwbBbb/3eaIbajqFj6Pgxg4=
X-Google-Smtp-Source: AGHT+IGXhK8kMBWmKF1bq1+yuzbm7UyP2S0ScsyuzRrvPgM0bVlL1iwbvXwfSAAP4OVpq6OKWPN1Ew==
X-Received: by 2002:a05:651c:1a2c:b0:2d8:5726:4173 with SMTP id by44-20020a05651c1a2c00b002d857264173mr1548167ljb.43.1712233609033;
        Thu, 04 Apr 2024 05:26:49 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:48 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 06/17] arm64: dts: exynos: gs101: Add the hsi2 sysreg node
Date: Thu,  4 Apr 2024 13:25:48 +0100
Message-ID: <20240404122559.898930-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This has some configuration bits such as sharability that
are required by UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 38ac4fb1397e..608369cec47b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1265,6 +1265,12 @@ cmu_hsi2: clock-controller@14400000 {
 			clock-names = "oscclk", "bus", "pcie", "ufs_embd", "mmc_card";
 		};
 
+		sysreg_hsi2: syscon@14420000 {
+			compatible = "google,gs101-hsi2-sysreg", "syscon";
+			reg = <0x14420000 0x1000>;
+			clocks = <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
+		};
+
 		pinctrl_hsi2: pinctrl@14440000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x14440000 0x00001000>;
-- 
2.44.0.478.gd926399ef9-goog

