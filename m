Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFE6479885
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714178; cv=none; b=IAJ9eNbpTw8oS28ftVUW0LLFmAIJUa4QKoBZHr5LQpvOYqWWP4ZeUQPTYu2GQnVoMR1evaa99cSoKZ+w2S7c9Ncuf99AFV+hMbZa5iOOLmmmNXWTAjVkQVgtiomlio2ZqWF3ovmeNT2neJAwc+yKzXMXx8FpTO72fpMFRIqeab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714178; c=relaxed/simple;
	bh=Q881r0Bnn2xtZj7kXY4jMzmdVJCSlmZ1bP/u+L60wrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YK7d/LuaooJnDbennntbrOFoWWDnTZIT9CThokp0xtojBxH3CNk+i/s4cQeuHm5XXqNfQRcnkdwBGgfYdSUVF0e6+dzAaf3+T9WFOm+QVIyZyZ0bihuJc5HRkbCQ5Y7oYzgW7xCdGAxSdvZyslARz1vqN+nlSyznkYBscGDOaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VmOVCBmE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VmOVCBmE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956242332dso25128205e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2026 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714172; x=1785318972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mo+Sh5lDDFp4L3hqiDjNcE4edfG5GlDw1dYVF+e+O2U=;
        b=VmOVCBmEsomE943YUJncRXzpphYzhmlkSU48NbPExHgqoAxLRpC7ScImHyMaXTGJs9
         dSzdJpxXDyAbMdeW8fMwSXRSQSRQxbFWsrXMUAMjmu7xQ2QHktq5UrI40A3xa98R0Bpz
         IR+StWFWdGTVYqx2PY0yNffuvis9/93F46dq9BzVpkYrXb8Uh1Xn0v++yw9WoPl+kHke
         rnkAgepzmuNgLaNNpb0VNKMAiAmvZcCEsrP+jYdPbWKJYqjp6PJV+PLJ7NbSLVdArbD7
         6MB48hl9ay8Bs/Oult2YL077BDW8DTUTlWLuIm1DDhsdrvCCkQqF1yMr2okrxD26KU1c
         z2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714172; x=1785318972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mo+Sh5lDDFp4L3hqiDjNcE4edfG5GlDw1dYVF+e+O2U=;
        b=AreBSo7uzy+pAZehiI99zPk4oyWg9xYy1t8V5tljIGExmU2NRZWS0M4cWAGq/UnEqv
         O8E+12liDNaQz9Jre/RXaIybMvaeXnLtvXoWOz6F9sRbv5MR1XOKnB0ylDTz0sZseWCT
         hGJcqtV22wE3YQqoR54jrMgncXyiSUCIuM6mGfdlhBN/v4gdCQpu7DqLEV/zC0+BZRjo
         y4VPypPdu5BGfw5mxGKQY+u38rvN3l6DiY4mZmpVrLr8qN7oI/EjIt5b7E2EHfhXKvKN
         4O+ZLwlN5Fm5YTvcpCHQdi346y532jDyUMGjUw1ZyCTilElSEHaSVdEzw+TmZGJt+A99
         DKfA==
X-Forwarded-Encrypted: i=1; AHgh+Rok2ZgV4WypoudJ0q+VHjgr1RVNAvToNqyNrTPhJaUG2JmWYQ9Q8EGf3XrRO3GO2LLJ8Oem2JDzH5pkASVBb2yaRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTP+KoUZkOSeoFDRwlIUb/h0Gn4ybzRxa6IS23VGTbKvkvyTY
	bkT7jstl8GbUtAHqdUjsE0FJp0tAMhnjGV3xRBfxDP2trw0HGsJjUYyVZUaaIACcJAaa+c7yi1M
	+9Z3G
X-Gm-Gg: AR+sD123SAMAZaJ482Nvaa+ChEcJY4aeRPUxoxN443ohsyeOsC+S4l8GQz0JzV6/I2Q
	gyIJPeRid2qjvo/ysw8SnJXn0+oZwXKMEBYtX+ACV7GQT6z6TkVCFAa1wuu+bMJNvyHoAyHZm/3
	xtxuWuZP9G0tCzBtIYnFE0jN+WZYnqTHyDv9SnLxGvKEQZIfZ8bXVfHaB1ez9CtPZosUrD2LCZ3
	T73Kzb5vAVrxVc158qbuE2uQy1lUqittIpXOZpZV8SxGnz7COVhz+vc18WTzSJTAvRFkr1N5KMV
	daF/KjRnLEICGduh3MFgZCH70+1pvdkX0eLkvjMZ3qgU/j3a0GCO+WcV45sM1hSaVmlD9QEkJBT
	4oRk0LjKFdtmWaC5YPkCucMiZa/PLYgjp65gqK8cpw0K9J7GP38xeedFCsJ2OJSobMaBGaNL669
	EMQFD7a1e2obGucElWYNWNhTSiWeoVPzt71FV7Gld5BU+h
X-Received: by 2002:a05:600c:2156:b0:493:f822:ac5e with SMTP id 5b1f17b1804b1-4954a411570mr205769225e9.23.1784714172235;
        Wed, 22 Jul 2026 02:56:12 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:11 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:54 +0100
Subject: [PATCH v2 3/5] arm64: dts: google: Add dts directory for
 Google-designed silicon
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-3-3abae9717feb@linaro.org>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-serial@vger.kernel.org, soc@lists.linux.dev, 
 Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2691;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=SHnnOHycO1M3KzDLgoFhcyeeohmukEIp6feU5iRFhhM=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO2NOwczhyNRIb4wdxPQ/5deipkuZ22m7G6C
 3osSGVwLVSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtgAKCRDO6LjWAjRy
 uoP6D/9xSTEuwM0zy6yW60c2SdWiUsBjFzss9dmvogtPOMldBMfPCutZSeoZh/UMm7wb8dfBGu8
 wSUn1z9D0BA9VaE2oOtE6wgKfjEhJ+liXJbqwGG5rTwcGOBAyKItpqBNuKEH1JoAbMuQ3JY/m23
 61bcf2dT3PPPM8C/MVaIeII1H2NO56X4HTEq/LQEULXAphVi6UX1pSTS8MYoBzhTpNjTAG4Nfwu
 LFxEnqs12faS/yylh9vn+m2W0jPUpThWUCsmysRf1lVnV70iTP9Cvfli+tJm8Evonit5/zmCPgF
 uAWoJTAv9vBY8tHVneok2tVV3W0a5W5ky6fWntstAZSLTTLjb5OGx9OGaMVUovYhvFUb/KsDWIS
 ItlfYpSSzbfV49aBqxJ4LG7B+NlR0JesXlCbvDVOks0b3/CRMBuGmcgUDXZAZkGu02RNsfFlt6B
 ynDfop26Vyu4+1I/vg+53vcqwCaY2vVOLgrwJ1DyxnP40V42AgPjpGWgkrfO5F0xBS5gG74eA8a
 mIvMoqRXD4tY/DciX6hWq6jNso6V3v12ijydSKmHs5OMfLB2tZdjw/BW79Bj26SmiLb+Ut8cyd4
 ncBUPXYTfujc1RQIC5N41vL/IdnT/KHI2FME21v9mCxdd1yKjQj9Wa8b0B8U+xgvuota8afu2/r
 0a/92dGFDVfSitQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

From: Douglas Anderson <dianders@chromium.org>

The first four Google Tensor SoCs were offshoots of Samsung Exynos
SoCs and their device trees were organized under the "exynos/google"
directory. Starting with the Google Tensor G5 SoC in Pixel 10 phones,
Google Tensor SoCs are now of Google's own design. Add a location in
the tree to store these device tree files.

Changes by Peter Griffin
 * update config symbol help with at least 4 lines to avoid checkpatch
   warning

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS                         | 1 +
 arch/arm64/Kconfig.platforms        | 8 ++++++++
 arch/arm64/boot/dts/Makefile        | 1 +
 arch/arm64/boot/dts/google/Makefile | 1 +
 4 files changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c61ef65d71ef..010d4de81a1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11012,6 +11012,7 @@ F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
+F:	arch/arm64/boot/dts/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	drivers/phy/phy-google-usb.c
 F:	drivers/soc/samsung/gs101-pmu.c
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 72c812e76b0b..f83eb4ea878c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -147,6 +147,14 @@ config ARCH_EXYNOS
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
+config ARCH_GOOGLE
+	bool "Google-Designed SoC family"
+	help
+	  This enables support for Google Tensor SoCs starting at the
+	  Google Tensor G5 (Laguna) found in Pixel 10 and later phones.
+	  Tensor G1 to G4 are offshoots of the Exynos family and are
+	  enabled via ARCH_EXYNOS.
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select SOC_TI
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 98ec8f1b76e4..566f0c863d55 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -18,6 +18,7 @@ subdir-y += cavium
 subdir-y += cix
 subdir-y += exynos
 subdir-y += freescale
+subdir-y += google
 subdir-y += hisilicon
 subdir-y += intel
 subdir-y += lg
diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
new file mode 100644
index 000000000000..a6b187e2d631
--- /dev/null
+++ b/arch/arm64/boot/dts/google/Makefile
@@ -0,0 +1 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)

-- 
2.55.0.229.g6434b31f56-goog

