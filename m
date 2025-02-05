Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9692A214A90;
	Wed,  5 Feb 2025 22:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794323; cv=none; b=YguBiNlkzStVfPj+G/8qb8LfBcLriDVM+iquxGSgTLe8XNyAFy8uCvRsjOS0UTcbRD4Xx51MEs0wR88nEGKNwyaTSryESBMnxiavtSmx0jN98wSQqZDaz1yn8XyVkACFg9bFmPYMg+VSvt0/JzlpPNatp/P1s5Eh3qwVTs1YEbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794323; c=relaxed/simple;
	bh=431rXLg/ur+/6lVZcKp3TZ0VL+PF9RTqkqPkp1Vq3xU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CJp9H4+X109qFiLyYADUa+wva3/XUZ+iIAaPTbCaB5L1BAW+Ok23Rb2vDZLLIvwyA/j9acTy9+m1U3w8MX6I44DRgZ62e6AUgRPpHZWBu4m3GqYSHdQ8zr3vGMkb/860LMa0YtWyjanw0yAgh4p/oKCfXO6ypqQRFXfw988OUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvBCWW0k; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvBCWW0k"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51f2127a438so50583e0c.2;
        Wed, 05 Feb 2025 14:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794320; x=1739399120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJTKfLilyHPLx3eObPNpy3DS6ZtIlktsSD9MZI8c8bs=;
        b=VvBCWW0kbYzfyExHTatAOMaHio07l2LAnn3/dEbbbbR0F1C2VL69/pzkrIZ4L3eNNm
         Ft6xUOJktM3XgQEXHAutvbrfURl/1OL5C6azc2CXbkI0UKM2b8IdO/CTFm4JJ9mV0tZx
         /okx7cIZZMQGfHEpHLjEBdLixQeorZG9xFtN7hnurPBcGC2FHpmvMvVglig0HVf0/0vh
         CLnM1yhCFoArDlBCDkvcimJYx7C0fkt3tWFlHQCYA9vPloZ7mFdagkIbNLhnrCaP/qkw
         hU/2RGlPZm4MW/wMLcD38MA1kvAv2wBF2eSoHyL3Eqt22ccbJxAIhcRWuvEpPsrwTjHS
         zmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794320; x=1739399120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJTKfLilyHPLx3eObPNpy3DS6ZtIlktsSD9MZI8c8bs=;
        b=Cr2kmRG5B5Fr1zZcVFbnKJquf2r20Z/6niuvBaFZXeFQUPb1iRNBoaQuwbRC6+Jgaw
         oxk8AjosKTQJj+S44OLQIglgyD14uZts3949tTDztjmliQLi9hRdd+O95GLVxYcKsdtC
         QGpqDSDnHWwEpGbBEXTT8lRpCrq278b7+Gvd/6TmIYI7391MWv8/QdQGH3oesoJkQ26q
         Clx/mtRtYU1kJ7mlh3nabIcNkrAy+0aNm1+c96adW9nzzSY8VDoMqJGL8RYZZDTSnY+8
         ajOrKJBx0D5d3sHTV85xJ30mMKbpdcaPmAzWf7SU/iAjRapWf6UNF3LZUyThd6K8liPN
         +R0A==
X-Forwarded-Encrypted: i=1; AJvYcCW+S78YzXRX76mLo8OsCLdjfwDjKBRyQNBhdrv3ip3pNXAZWKYje3qYl2DRZEl01sWKqUl66hQAq6Ah3bavkUJKzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhJsxRHW9++MIiQoV+t/3FWGOVVhWd53N5IN2zcl/N4mgHRcm
	rk6JvVLxNfMG41+6+7SiDChR1W3gEqyq8VOEAeuqmeJ6ScRRRhtz
X-Gm-Gg: ASbGncuoXW4bwIyhL1kQhsmIhyjJX/rNN/TKAD6lwtOfkwPPHr+Bwkt6/y5V8QGGK89
	9lnWpb6f9OcbTFCXd9H4yDxrPZR6j49qR3PfS09tNEAxt/l8AZ6QO2XdEoyY7fdmDUotzuZQ4HT
	9hQ+HZ06cJiy8Nhe4uptbNZ3YigbaqpFHCzsIyPAe/ccPxvH5aNQuCP4Rj9dhMF6VSDYBUFh+fI
	rsDzDbLMUshq0iX+PWE78YTrwzI97xpil4dN/WKPbHn5E9Bv5QI7YguCbg2s1g6IckJHmqVwmCq
	M1JCiCa+TqpTZSHNJJlE7pLSDbTajQTWimRogvpmRSbkBIgXINHC3OdveIT77pgLwq9OMOx6N0c
	9Cw==
X-Google-Smtp-Source: AGHT+IETBHJFgsxv08BokD07Ze3sD9qMnzxrSwYE0FIosYhyygsNEboJYxXQI1epDJdsv5iLBBxyfA==
X-Received: by 2002:a05:6102:5e89:b0:4b6:d108:cac0 with SMTP id ada2fe7eead31-4ba478b11d3mr3790967137.3.1738794320247;
        Wed, 05 Feb 2025 14:25:20 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:19 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 1/9] dt-bindings: clock: samsung,exynos990-clock: add PERIC0/1 clock management unit
Date: Wed,  5 Feb 2025 22:22:15 +0000
Message-Id: <20250205222223.613-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-schema documentation for
the Connectivity Peripheral 0 / 1 (PERIC0/1) clock management unit.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../clock/samsung,exynos990-clock.yaml        |  24 +++
 include/dt-bindings/clock/samsung,exynos990.h | 178 +++++++++++++++++-
 2 files changed, 201 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
index 9e7944b5f..6b053d1bc 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -30,6 +30,8 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos990-cmu-peric1
+      - samsung,exynos990-cmu-peric0
       - samsung,exynos990-cmu-hsi0
       - samsung,exynos990-cmu-top
 
@@ -55,6 +57,28 @@ required:
   - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos990-cmu-peric1
+              - samsung,exynos990-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: Connectivity Peripheral 0/1 bus clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0/1 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ip
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 307215a3f..97cb5e8d2 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -233,4 +233,180 @@
 #define CLK_GOUT_HSI0_CMU_HSI0_PCLK			21
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
 
-#endif
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_BUS_USER			1
+#define CLK_MOUT_PERIC0_USI00_USI_USER			2
+#define CLK_MOUT_PERIC0_USI01_USI_USER			3
+#define CLK_MOUT_PERIC0_USI02_USI_USER			4
+#define CLK_MOUT_PERIC0_USI03_USI_USER			5
+#define CLK_MOUT_PERIC0_USI04_USI_USER			6
+#define CLK_MOUT_PERIC0_USI05_USI_USER			7
+#define CLK_MOUT_PERIC0_USI_I2C_USER			8
+#define CLK_MOUT_PERIC0_UART_DBG			9
+#define CLK_MOUT_PERIC0_USI13_USI_USER			10
+#define CLK_MOUT_PERIC0_USI14_USI_USER			11
+#define CLK_MOUT_PERIC0_USI15_USI_USER			12
+#define CLK_DOUT_PERIC0_USI00_USI			13
+#define CLK_DOUT_PERIC0_USI01_USI			14
+#define CLK_DOUT_PERIC0_USI02_USI			15
+#define CLK_DOUT_PERIC0_USI03_USI			16
+#define CLK_DOUT_PERIC0_USI04_USI			17
+#define CLK_DOUT_PERIC0_USI05_USI			18
+#define CLK_DOUT_PERIC0_USI_I2C				19
+#define CLK_DOUT_PERIC0_UART_DBG			20
+#define CLK_DOUT_PERIC0_USI13_USI			21
+#define CLK_DOUT_PERIC0_USI14_USI			22
+#define CLK_DOUT_PERIC0_USI15_USI			23
+#define CLK_GOUT_PERIC0_GPIO_PCLK			24
+#define CLK_GOUT_PERIC0_SYSREG_PCLK			25
+#define CLK_GOUT_PERIC0_CMU_PCLK			26
+#define CLK_GOUT_PERIC0_BUSP_CLK			27
+#define CLK_GOUT_PERIC0_OSCCLK_CLK			28
+#define CLK_GOUT_PERIC0_USI00_USI_CLK			29
+#define CLK_GOUT_PERIC0_USI_I2C_CLK			30
+#define CLK_GOUT_PERIC0_USI01_USI_CLK			31
+#define CLK_GOUT_PERIC0_USI02_USI_CLK			32
+#define CLK_GOUT_PERIC0_USI03_USI_CLK			33
+#define CLK_GOUT_PERIC0_USI04_USI_CLK			34
+#define CLK_GOUT_PERIC0_USI05_USI_CLK			35
+#define CLK_GOUT_PERIC0_UART_DBG_CLK			36
+#define CLK_GOUT_PERIC0_LHM_AXI_P_CLK			37
+#define CLK_GOUT_PERIC0_USI13_USI_CLK			38
+#define CLK_GOUT_PERIC0_USI14_USI_CLK			39
+#define CLK_GOUT_PERIC0_D_TZPC_PCLK			40
+#define CLK_GOUT_PERIC0_USI15_USI_CLK			41
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_4			42
+#define CLK_GOUT_PERIC0_TOP0_PCLK_4			43
+#define CLK_GOUT_PERIC0_TOP0_PCLK_5			44
+#define CLK_GOUT_PERIC0_TOP0_PCLK_6			45
+#define CLK_GOUT_PERIC0_TOP0_PCLK_7			46
+#define CLK_GOUT_PERIC0_TOP0_PCLK_8			47
+#define CLK_GOUT_PERIC0_TOP0_PCLK_9			48
+#define CLK_GOUT_PERIC0_TOP0_PCLK_10			49
+#define CLK_GOUT_PERIC0_TOP0_PCLK_11			50
+#define CLK_GOUT_PERIC0_TOP0_PCLK_12			51
+#define CLK_GOUT_PERIC0_TOP0_PCLK_13			52
+#define CLK_GOUT_PERIC0_TOP0_PCLK_14			53
+#define CLK_GOUT_PERIC0_TOP0_PCLK_15			54
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_5			55
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_6			56
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_7			57
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_8			58
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_9			59
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_10			60
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_11			61
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_12			62
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_13			63
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_14			64
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_15			65
+#define CLK_GOUT_PERIC0_TOP1_PCLK_0			66
+#define CLK_GOUT_PERIC0_TOP1_PCLK_3			67
+#define CLK_GOUT_PERIC0_TOP1_PCLK_4			68
+#define CLK_GOUT_PERIC0_TOP1_PCLK_5			69
+#define CLK_GOUT_PERIC0_TOP1_PCLK_6			70
+#define CLK_GOUT_PERIC0_TOP1_PCLK_7			71
+#define CLK_GOUT_PERIC0_TOP1_PCLK_8			72
+#define CLK_GOUT_PERIC0_TOP1_PCLK_15			73
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_0			74
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_3			75
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_4			76
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_5			77
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_6			78
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_7			79
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_8			80
+
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_BUS_USER			1
+#define CLK_MOUT_PERIC1_UART_BT_USER			2
+#define CLK_MOUT_PERIC1_USI_I2C_USER			3
+#define CLK_MOUT_PERIC1_USI06_USI_USER			4
+#define CLK_MOUT_PERIC1_USI07_USI_USER			5
+#define CLK_MOUT_PERIC1_USI08_USI_USER			6
+#define CLK_MOUT_PERIC1_USI09_USI_USER			7
+#define CLK_MOUT_PERIC1_USI10_USI_USER			8
+#define CLK_MOUT_PERIC1_USI11_USI_USER			9
+#define CLK_MOUT_PERIC1_USI12_USI_USER			10
+#define CLK_MOUT_PERIC1_USI18_USI_USER			11
+#define CLK_MOUT_PERIC1_USI16_USI_USER			12
+#define CLK_MOUT_PERIC1_USI17_USI_USER			13
+#define CLK_DOUT_PERIC1_UART_BT				14
+#define CLK_DOUT_PERIC1_USI_I2C				15
+#define CLK_DOUT_PERIC1_USI06_USI			16
+#define CLK_DOUT_PERIC1_USI07_USI			17
+#define CLK_DOUT_PERIC1_USI08_USI			18
+#define CLK_DOUT_PERIC1_USI18_USI			19
+#define CLK_DOUT_PERIC1_USI12_USI			20
+#define CLK_DOUT_PERIC1_USI09_USI			21
+#define CLK_DOUT_PERIC1_USI10_USI			22
+#define CLK_DOUT_PERIC1_USI11_USI			23
+#define CLK_DOUT_PERIC1_USI16_USI			24
+#define CLK_DOUT_PERIC1_USI17_USI			25
+#define CLK_GOUT_PERIC1_GPIO_PCLK			26
+#define CLK_GOUT_PERIC1_SYSREG_PCLK			27
+#define CLK_GOUT_PERIC1_CMU_PCLK			28
+#define CLK_GOUT_PERIC1_BUSP_CLK			29
+#define CLK_GOUT_PERIC1_USI06_USI_CLK			30
+#define CLK_GOUT_PERIC1_USI07_USI_CLK			31
+#define CLK_GOUT_PERIC1_USI08_USI_CLK			32
+#define CLK_GOUT_PERIC1_USI09_USI_CLK			33
+#define CLK_GOUT_PERIC1_USI10_USI_CLK			34
+#define CLK_GOUT_PERIC1_USI_I2C_CLK			35
+#define CLK_GOUT_PERIC1_UART_BT_CLK			36
+#define CLK_GOUT_PERIC1_USI12_USI_CLK			37
+#define CLK_GOUT_PERIC1_USI18_USI_CLK			38
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CLK			39
+#define CLK_GOUT_PERIC1_USI11_USI_CLK			40
+#define CLK_GOUT_PERIC1_D_TZPC_PCLK			41
+#define CLK_GOUT_PERIC1_USI16_USI_CLK			42
+#define CLK_GOUT_PERIC1_USI17_USI_CLK			43
+#define CLK_GOUT_PERIC1_TOP0_PCLK_4			44
+#define CLK_GOUT_PERIC1_TOP0_PCLK_10			45
+#define CLK_GOUT_PERIC1_TOP0_PCLK_11			46
+#define CLK_GOUT_PERIC1_TOP0_PCLK_12			47
+#define CLK_GOUT_PERIC1_TOP0_PCLK_13			48
+#define CLK_GOUT_PERIC1_TOP0_PCLK_14			49
+#define CLK_GOUT_PERIC1_TOP0_PCLK_15			50
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_4			51
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_10			52
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_11			53
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_12			54
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_13			55
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_14			56
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_15			57
+#define CLK_GOUT_PERIC1_TOP1_PCLK_1			58
+#define CLK_GOUT_PERIC1_TOP1_PCLK_0			59
+#define CLK_GOUT_PERIC1_TOP1_PCLK_2			60
+#define CLK_GOUT_PERIC1_TOP1_PCLK_3			61
+#define CLK_GOUT_PERIC1_TOP1_PCLK_4			62
+#define CLK_GOUT_PERIC1_TOP1_PCLK_5			63
+#define CLK_GOUT_PERIC1_TOP1_PCLK_6			64
+#define CLK_GOUT_PERIC1_TOP1_PCLK_7			65
+#define CLK_GOUT_PERIC1_TOP1_PCLK_9			66
+#define CLK_GOUT_PERIC1_TOP1_PCLK_10			67
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_0			68
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_1			69
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_2			70
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_3			71
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_4			72
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_5			73
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_6			74
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_7			75
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_9			76
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_10			77
+#define CLK_GOUT_PERIC1_OSCCLK_CLK			78
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CSIS_CLK		79
+#define CLK_GOUT_PERIC1_XIU_P_ACLK			80
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_12			81
+#define CLK_GOUT_PERIC1_TOP1_PCLK_12			82
+#define CLK_GOUT_PERIC1_TOP1_PCLK_13			83
+#define CLK_GOUT_PERIC1_TOP1_PCLK_14			84
+#define CLK_GOUT_PERIC1_TOP1_PCLK_15			85
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_13			86
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_14			87
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_15			88
+#define CLK_GOUT_PERIC1_USI16_I3C_PCLK			89
+#define CLK_GOUT_PERIC1_USI16_I3C_SCLK			90
+#define CLK_GOUT_PERIC1_USI17_I3C_SCLK			91
+#define CLK_GOUT_PERIC1_USI17_I3C_PCLK			92
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS990_H */
-- 
2.47.1

