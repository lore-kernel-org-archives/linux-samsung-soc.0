Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8931F12CD9A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233606; cv=none; b=j54PFiY1L6rVYXlbtVURe9lxJe5TS6ciP1C9zpqWXFHd04KCSw7hS5/DjygFfYrFjWRMTJWxxMGKsrOD9NUIUg4sswwoaDOLwEMdtGWQYv+umnNmw2ZH+k49ugYaYoizEVAnbOLNwmYIe15Sr/dv1Q7gxERX/KdBpEH5R/5tvZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233606; c=relaxed/simple;
	bh=2iMqsB7DjaDv1tdJXp6qd7zyM2tt1u3QD0+LtNhzesM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZoEi+lFMA/C7efrfkaRBSce2GI8gZtDDRM2pcCQJLzbIIq8hZ1H9uLNvs9gtTN5Op4RNDUOc0P/mB3dV1Q0gHjSDOqOKUjYCzOvQNWFT8r1z5OzRZBI/YAlOZskIXxp0MI+ACuj3YE7Sysr68gkmN7NUI+YdMlTWCjOtBRF1zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GpD0U80T; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GpD0U80T"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-343cfa6faf0so144214f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233603; x=1712838403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds/JjfQ2TlKCtemWTNTPAMOOadxWRRjHRCXTNztqFqc=;
        b=GpD0U80Thdn+K86O7VaQ+vay5qFHr6oDMSq5rpVutDjzkSFrf0MuPLOBbI9SLNLssO
         mSIVHC4Ue/C81pVaNrMqDJHQu6U50mf/XQYFGLmQfAhKFrQ70qfjYM8VMRCzXAxcs+SK
         Uq5PH8B3MjwGyw67dL7vpjKjbPAYiUWg4Rp3lGwCdGX0xFsBnM7kXFRP+/Ur288bJdws
         0ZcoxRWEbPI/ot7X46RF4YfIXrH98lsXyiZoBrs2MZFhY5wH7TVYFYA3yXUkwkAOP47n
         D9LKoxHRnbAzJhesmVHfyt9Da8QXfkzrVFJxB44elRjtC3sxaNBDTsBJM3k/dzgcRyFX
         T41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233603; x=1712838403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ds/JjfQ2TlKCtemWTNTPAMOOadxWRRjHRCXTNztqFqc=;
        b=AQ28nwLYk1yqr6fhRkO/5P+fwJEdVF5WNBlymYeIK1lrWbToU6aAf3J0+tTcwitW10
         NF1GEH22u/rRgRsPAiRyu3SC86xj6qqSNzK5oc3pZs6juch5be1W4I9L6jzSwPneqXDn
         GR34YW4LYuV1ScfxFu2dG8+RLDlFt2fzpbsSJlaXV8QIqOvX2RT3q4GUi1e1xaENMRDJ
         qqjLiQXY7JDi6fioGYjIB7QMT/z3i29vctkgIHtmYasmtenoTyAxrbJ3R8e+xes4bx+C
         abwOxaUYibuxccqUQ8XU5Z8flECgH39fevCyQ487sQt0tif57AiJuB0fEc89ITNXXvJJ
         NZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuUZovLjkGsW6uRJlhiQAjH3y9dxZsBLAXlV7EdEEfL3o5VRLDy/WL3bShxACJInxeqduDkCQQFQNxunN73fh0Q8PwkyEReK8eFldO34/6fCA=
X-Gm-Message-State: AOJu0YwyAuiRWbeXgyvextq7wQI/GRtNYUl1raKwoOjPBFmQNPVUfJFu
	UqQpxR8WTUDNtP9il6D3w6enWBNR9wtoeL81HWPub+piM1Yd3eUNcw8tFqQFzmw=
X-Google-Smtp-Source: AGHT+IE1KcSWtq0AtIR6tJqtMgKw1sNq7p9OsCBJVxmziFYXd9baY73voLcHuEo5/99B79vRXGQPWg==
X-Received: by 2002:a5d:4589:0:b0:33e:c528:c900 with SMTP id p9-20020a5d4589000000b0033ec528c900mr2144866wrq.55.1712233603079;
        Thu, 04 Apr 2024 05:26:43 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:41 -0700 (PDT)
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
Subject: [PATCH 05/17] arm64: dts: exynos: gs101: enable cmu-hsi2 clock controller
Date: Thu,  4 Apr 2024 13:25:47 +0100
Message-ID: <20240404122559.898930-6-peter.griffin@linaro.org>
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

Enable the cmu_hsi2 clock management unit. It feeds some of
the high speed interfaces such as PCIe and UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index eddb6b326fde..38ac4fb1397e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1253,6 +1253,18 @@ pinctrl_hsi1: pinctrl@11840000 {
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
2.44.0.478.gd926399ef9-goog

