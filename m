Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5F19F487
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jan 2025 17:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737133802; cv=none; b=PqB7mGMMrOGjUoFB7hXScAgPWcuUqySaYOyXGEZznlMzkiLvdeDwU96Isg7LB4xOfD5bhquYjEOK2veNDNcG76Y2/sLncKXYlSCLbh2GM1UDrf4p/yU98lXUI5M+0rBJ5XwgWDHKPg6ls4hmaB81SjBeI7AJpIxgtrI89DFFJ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737133802; c=relaxed/simple;
	bh=rQoO8RKg4WTsMiIUSVBxqtIekUiWXYwM6p1WeORMqYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCVimsGaR+/4wj+XfzCiSI68RwaWbC+ij1TXbrTYavz/d7zUWDVuoq8eZQbS+1OGH3ePmnc4CMhQjdZf+DLTB5MXm3yaiXAMC33aqnt+jdymFXt5FduKl/Qlf9sR6otRTdF1X6PwGnVjB7+UBaMMPh+y/NYL9r3s0wZXLYtd4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ky2a9uqi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ky2a9uqi"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso452817166b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Jan 2025 09:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737133798; x=1737738598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=;
        b=Ky2a9uqie95Lxjvf4lZPIKCb7edIylkZ4z+Y/l5FYi2rc2vU3nIZXo6aIZOGBQztSo
         /leLaAZ79/FYMjd1+o7ETZhsJe1SLbT++CTirVT9uB8Rky4LAsSfFo60umLj4OtWbrrm
         Rhnonmtn/fYca0EcMpWVqdMOfSBLZWn5bweaxosfROB+97LO4DyY3JKUgb3RmGqsPSLo
         c7e8Wg/vYvcMx1malEtRc/f1/XYE6CosYRv5dou2WpJJmzEm6xd4PdCIMtPUhppBMfNE
         1m/n08J1NSmnBLlt7k4ez7n5oxzMqHoz4aSWjhA7rB1FLWpc41qwLt+srilGA8ClDBQr
         LnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133798; x=1737738598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mvgaOsWInJVnUwy76tgQ13g6HWxVD9Bi2miL5uycY0=;
        b=oNcliSzuSha9GcD462EkkPjrTissFBhhBfrjyxfzsix5YzDwtR7CeQ/PnycQItdg5h
         Bs1RwdVYpfG4E+y3t7n931pPmMcVY7VeL/ePnLWsKy+7QpkgmLUZ1Chca1SWJKx/E+Co
         rBY4eHvFZxKJO4jQwt3jObvJ3ubC+dcGAh/O8WSyTdBUT631CQVUiiqxXKwwKnpbIWiJ
         xWHLkrrixOJsRX2wRWZwM7SxcYApZOmH5hSCXXewC5SdM/0Wr4iKGE4Z3OWkh160+Szv
         WRBB18IXZg5QYHq4Xp/eveWJA43pqWjBpgIdO39ES1QUWdmncysq42m9sej0paUs4EpD
         OAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuDqiqgVJMvuMuvnJAGcRTqFwNGy00QUCP9bk/wGr2+OjQqyO/k81D7g09lwzJJQ96djUQtLJ1TeptS0CjFUB4kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOzewiDWqoFMBnUejbfCc54w/qIKqF2TNgeOBVp/bmgaNc86Fy
	HZwFfLICzalGy4hW2fwkFFsT1dP1e6mHB32ZXK3jVxMEsDRlGrnV2wsnyXeSJRw=
X-Gm-Gg: ASbGncvf+xJAJeYySs4/KxHXrSMkk7C1LU8kyfE18cT8CEef8cN1eYTqtFK+Iu1SGYy
	ni+a1uRgYH2rpjC+oDCCsS7d+/54thB4gbkY+KkCbmwzY1sQtZpaDqbks+a4dID795tXUX46QEa
	w/7bJg3SQAesxsh/hXgp1IXieRklDsWjPW0onQoMpiIKo+kWGgI016tCOx7qFp8o+3bqwpd1SG2
	E6J5EoGwJMrlaP+zHS2GLo+QNmtltLtc2VOsgJc3QAeNzVZVKUq5FIAbq1Vr8j5LDQJCCIjoYqy
	ksOVdYRNn8RoGhiwwb/hOIX+3lP1fmZ1f+PpM3rU
X-Google-Smtp-Source: AGHT+IHFyQYdgqGM488OpiNHw7vcW4pRUxUqyprfrU9ASQpRrjBWSc8OuKo4zMQb49X3a2Y83Biqaw==
X-Received: by 2002:a17:907:7296:b0:ab3:4c32:aa6c with SMTP id a640c23a62f3a-ab38b10cfa4mr328196666b.20.1737133798469;
        Fri, 17 Jan 2025 09:09:58 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87065sm199197966b.133.2025.01.17.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:09:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 17 Jan 2025 17:09:55 +0000
Subject: [PATCH v4 2/4] arm64: dts: exynos: gs101-oriole: configure
 simple-framebuffer
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-gs101-simplefb-v4-2-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
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

