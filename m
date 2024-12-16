Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A311B2054F7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734354391; cv=none; b=U/1zLH6EzYhWIjS4Hs9TRZVjphRFBWsYPcKsh3hMKn/2BSaXQiQ08Op+Y7yJfwqlk2fzeIjb8jK4tL5l27Pals/onD6cY/ivxh15V9fm+oQBJ2x/cz1vdpYFegFpBqG9Lu1ISc/3e8HM6VG7SmoeijpyiWWkc8RwVtQiZTntPDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734354391; c=relaxed/simple;
	bh=sP9kaHRW7Lr1yZBGouXV8BgWfQ6bbZJSUKtXme/Z71U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V2Q5kGu/Kh7srhgPIB3A3jhHZjbeZnWDu/0RudagLXOn3Od7jXTd1RjAmmAH6BVIV1vRNSVRUBIhdA/Fv4Nt5Xzhm3k/ck3hNWft7F1tNQx3/OWlk0xNiiK95O1iL+EMuTsRuhFjiJgBENkpa/u5DEDi2QxBVIK96pgLz1HQdrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iU24nqoe; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iU24nqoe"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa69077b93fso600556466b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 05:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734354388; x=1734959188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iXYAffnZPGtECXS58BWfoA0BdRGwpVmbASDvyhm7ws=;
        b=iU24nqoeuwIlQ1vAbTYD21Z6wuPWa6EdRzNKTtpAxkF454x7g/lKX/pdywKUYQvzq3
         NKcGxKglqVchc6lbxWG1gOc2N9vTC1N8kiIoGJfdDtLZYjbBViCYsW9guyn2n8Kp8Cc4
         3EpoC45YgKMYwyRWHp1MCgUK+J/JRG7vvXLxZcoCoVstnGreWFmw+dYuV4SGGfX3pvGK
         Pr/XhH9ovuEd+WsdeOUafb7+ILdEZQHGYCe6cdSSa0YSi9q9s+Q9HIjCRMWS582C24Hl
         V02FvxRq03Fb1p+d3l4968VZEfWK9h11U9qlObiWJG8zuakCv6H8fZ4/huhm0a+5cKFp
         ipBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734354388; x=1734959188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iXYAffnZPGtECXS58BWfoA0BdRGwpVmbASDvyhm7ws=;
        b=JO/Gh+djAizObqfgGBUjvsswYx/TwFMo56huH+5XRFiiJG2CcHtBuvzuGgaSEMH0an
         6XVPq5Wfj2Syn0kamKU5NpsV3JmqG0GWTESc0MtAWN+NH+lJt3fYcul8HFoHuhfLNpdD
         PAQQlIQBNyLGZJ0lhccY5UQTF9IeBkMcuANyHSxWQuX27osUBLBeKOlPLW+wnWXpE4iH
         ctgl3oYJWJgC1+ggFvmA6+BCm9Vo0GDJGC99imKYwKb75fFdwNDhoyI6Zv+HQh8oRlE3
         VkdY/81pwc7tOUy8Wr9jgHGF/1uI1DkCoyC5nbFRsgM7r9V+NmV7cqJkFaLsMnAJF9dS
         pmCw==
X-Forwarded-Encrypted: i=1; AJvYcCXmO3pkYw4CvC8x5f9rbsXHap3UXbGjCp/Px8zHhFSPiCCSQZDYMhH9+Yzr52H+dEc3fuszjsisDgqlF8Vbw7kddQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ExB+JAOdDvp2uYdRL8QLXw/3zWhLne66hPxM/aiE54hl4Nam
	qaxOVNrSdvq5HMiGQly6boazALPW7iHFWt8LSVqhTlPoPAx15gzjSyPdzlsOydM=
X-Gm-Gg: ASbGnct2QjHTk5nPTHzYeT+K0+z+xGaocv6oWHKVmFgPhbF5TD0tv1qoFRyC/NVnHMk
	vFc3+ICOn/efaGnD1ONV+tNoO9Ey2tTEON3aN8L2QUGvOdAQ7mKtaQdfF3TIMnb3C5NiWAMBw8k
	A+q6mSo06IXUlQAhLJzJuLrqWFCPbUbFQlDBGT2fL2e2gPjiYoO2wDGgMLSh+YBwDJfzhoMFH9o
	L3XlPYza6S2/AiF8jT3XwJ8fq9XsOZMa76ubTkny9lBaEhwa/3w2aYbATSgQSVGf57jf25VzdyR
	h9Wl6a9ONmpLfa8wzFcGtVjpZ/IMBz/GH0ceOgoO
X-Google-Smtp-Source: AGHT+IHmRvbKYFM2gzJ/maU3pCLS3k+De0vwQVUzRJ/k1xRFMah4EErhor43z4R/cOK2YTYFrzuA+g==
X-Received: by 2002:a17:907:86a4:b0:aa6:2bba:a1f9 with SMTP id a640c23a62f3a-aab77eda8fdmr1112929566b.59.1734354387511;
        Mon, 16 Dec 2024 05:06:27 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab960681dbsm326648666b.52.2024.12.16.05.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 05:06:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 16 Dec 2024 13:06:27 +0000
Subject: [PATCH 2/4] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-gs101-simplefb-v1-2-8ccad1830281@linaro.org>
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The bootloader configures the display hardware for a framebuffer at the
given address, let's add a simple-framebuffer node here until we get a
proper DRM driver.

This has several benefits since it's an OLED display:
* energy consumption goes down significantly, as it changes from white
  (as left by bootloader) to black (linux console), and we generally
  don't run out of battery anymore when plugged into a USB port
* less of a burn-in effect I assume
* phone stays cooler due to reduced energy consumption by display

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index e58881c61d53..4e1625e3fbb4 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -23,9 +23,23 @@ aliases {
 	};
 
 	chosen {
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges;
+
 		/* Bootloader expects bootargs specified otherwise it crashes */
 		bootargs = "";
 		stdout-path = &serial_0;
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer@fac00000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
 	};
 
 	gpio-keys {
@@ -69,6 +83,13 @@ ufs_0_fixed_vcc_reg: regulator-1 {
 		regulator-boot-on;
 		enable-active-high;
 	};
+
+	reserved-memory {
+		cont_splash_mem: splash@fac00000 {
+			reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+			no-map;
+		};
+	};
 };
 
 &ext_24_5m {

-- 
2.47.1.613.gc27f4b7a9f-goog

