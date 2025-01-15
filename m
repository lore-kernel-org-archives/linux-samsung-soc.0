Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4941AAE17
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736957476; cv=none; b=ac5jRRK/2BLfnUiH5yhBGX2NHBQqR1k+TNkWj8fo5sZ2AUde4tuUPIO1Jy2qJdfc7XFj0CC9+vAjVPRCzt9hzeCPat0pYpcR2skqe82q+ycYrJsP4Ok3/9aWdfttV396vjF/+3XDlSN0MW+WrKj8maxW7urVPLiNm2YdKb1Xu8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736957476; c=relaxed/simple;
	bh=rQoO8RKg4WTsMiIUSVBxqtIekUiWXYwM6p1WeORMqYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhqrDtplhAYC9ULZQsyfKwCk6zfwzALbEOcU4ws96E/ga+vp9k3eZi0X6URlos96sCBhiwKqdFtDwhbEXynZCRjOnefQyQHlvk7ns2BuA0HNUsId3MDh6PhMCgomN5q/wvIFHfotLWA9vAP2Ydb+HOXFNiexW3BvvBEFeGyk7IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=No61yaQe; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="No61yaQe"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso12174751a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 08:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736957472; x=1737562272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=;
        b=No61yaQeiA/rkAoz/lkyU2ARY/ZOBtawzRBawrmj50NlyhGynY3a/5pVCGpFvxTc0S
         4aDJ25bMv4JCI6hMbZniRGZsTyjkjcN3OaB1ztIhJ6aCxBMlmI20og09gGFVrGUCZddu
         QfzeCQHdDT/ZiwfHNLZV7ua3xvqqA2v6s1h9uyFF7C/zaZpmHTwCyl7esmiSURFgT1Zx
         vFXCRkPyiMCMffs3XhLrtpIWEdNxqyIvaJ7/53DQ7I8K8AiNopXgWVi3pcoZpu5GDDyl
         WkRhvr20bhxJ9Sr/vMhekqUlPKmtkd3vajqA1ixvmoV/Auvtc0gV8nkdoeYJP28j3BDJ
         pEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736957472; x=1737562272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=;
        b=aZFM/vEjMMxORxv6M7Z33QuvgP5voetIA/nWF2IdFjcZEThOM6BfoiMC9Q24ZXuQvW
         fXhZg5UZYxfvb4pKZh/RiOvVOrqOgPbha8dzlqtUAPswjF9PrEGX5omAxxIXpDYaDmk2
         tbjZvYEkpZ+k5VgcZgnofTBxZGDJg1dXy8j8ahK0VLh/3zNDOLnIYL/eqoZrRFZRnc2z
         q3+4PQB4lssK40E0wkkelRZgPIwNsAuU1fwJ3Hf/XDIFVD3+qWSb9h5EIBSjkmVirC72
         7gtE1LdG5v9ussuixL1uC3FVm6vbaD8zVWrHnKRg3fF9rWrR7+drlkcedmnt3vpAVtsM
         EJdg==
X-Forwarded-Encrypted: i=1; AJvYcCWKH6OidtZiet2ihAscbPykwx3Dda3ukgHe0RuHhHDSUuwfT9jVtDNDM3IpkwSW5Ab/8J68b+3YfeJnmjhPrwNZVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KiS/xId0cGeaW6dVH6AtNcoqGSUtqOiG9lS03qfxQZRrQSsM
	rAeNmiHo5Smcqrjcf//Gf8jopyTCzvmWpRe0/be9sJ2NBPsgN2qbycXvHiPPNpA=
X-Gm-Gg: ASbGnctCBXHgPp9nER6bEIfr89d9hYBRtV/Nah31fH/WTssJPSrKt88HoO2t9Nw+Ibg
	PULa3LSOtjjZGEoYxU8RQ1u9V8zEXEs+X8I9tnjTPg3FLQYXahvdgchW3PGzxUDMxI3lYkpLk05
	lkkG8VF7O/M3+BwsPFPu97ajd+8wTs2xLQFiwH2kAP4HGdYqIaRxnPk8osDLt5lq37HWyCno9Ux
	A53ud65Fsb8yLHj9AsRCG1/ONzOKPNWasU2XekVJzYuYxvDk+t/Bn4ta0LsnGRHHYNZpue4VD09
	fxPYizMtbzDbacjNpUY+wMV2bgPdLKlPwEaRjtTB
X-Google-Smtp-Source: AGHT+IHgfs3nHvUsKFbEdimSg9mYcz0DubOQSD9PHYFogk2sgQni7lRdfrILTgiNEdYBT68xnxgvQQ==
X-Received: by 2002:a05:6402:84f:b0:5d0:d330:c965 with SMTP id 4fb4d7f45d1cf-5d972d28da9mr27957675a12.0.1736957471733;
        Wed, 15 Jan 2025 08:11:11 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a55f9sm7416232a12.81.2025.01.15.08.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 08:11:11 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 15 Jan 2025 16:11:10 +0000
Subject: [PATCH v3 2/4] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-gs101-simplefb-v3-2-52eca3a582b7@linaro.org>
References: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
In-Reply-To: <20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org>
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
v3:
- replace property 'reg' with 'memory-region' and related properties to
  reduce churn in preparation for Pixel 6Pro support
- drop tags due to that
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index e58881c61d53..d3dd411c9bd0 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -26,6 +26,16 @@ chosen {
 		/* Bootloader expects bootargs specified otherwise it crashes */
 		bootargs = "";
 		stdout-path = &serial_0;
+
+		/* Use display framebuffer as setup by bootloader */
+		framebuffer0: framebuffer-0 {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
 	};
 
 	gpio-keys {
@@ -69,6 +79,13 @@ ufs_0_fixed_vcc_reg: regulator-1 {
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
2.48.0.rc2.279.g1de40edade-goog

