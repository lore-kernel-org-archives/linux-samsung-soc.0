Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C54526FD9D
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760111792; cv=none; b=hhEBlqiUJjPW3pa+XsAQjMzfACx252lMBbRtFlH2t48Z2gf480E9/RhtJG/R25BRRZh0fa/xdJ5ilJeYJn6o0sRtkEM69NOduIRRdvRsn5cTdccUi5IcRSyuhyBsdflWza9DlqmKGufPuWMZi7JLfFCG3r4x/u8jpSBdOaOmMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760111792; c=relaxed/simple;
	bh=qy58+hYfxQW2mQ5sz6S6JQNjtjzjW3pl/fdczNT6W+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NFN8WlQ9pgcF+jHSG3oTqMWSaoQCz+/rTspn3YSAo5StUyNqWDFYckfQ/flK/iq97JvB020EF6FpJHjROCtL5L3+IA8GnY+zCyRgVRUG+siZoVS1H0iIV10us6Yr4flHQVg2N+BDDVED+YZ1Snba/TGfmiRHukjyWNnKiorND5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OUZh9YSE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUZh9YSE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3ee18913c0so352616666b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760111789; x=1760716589; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZoRFa4EgNbo9YHpT/rgkVAy6RF2nhrPvBGmNOSTvII=;
        b=OUZh9YSEqwPb6zNfLojcw+4urecEii+dnSI4Hm1nUOo2OU/9VY3GUy2hEDase9DnoJ
         ryGFcI4Yom2LUHLmcEQGhNPyh/GU7tOkJ47UT5VM6AkY6fLNwJYwtDoRtk5urFVsBM7B
         41fdr0+xYkp+AqWU4RDR3MZGDAxjyv7JVbGBZiamhNWZl59fgprXnuo2aEYe3Nlok7SR
         LVYBcoUuZ+Pat/boIaedK+tfDRkkMOa6CMI95BFZJeEvJlGUnY2cxnb0LSr5U229Yaqt
         yTGTRoAFRxMF7gLSY3w+qvNI3rJf0DKWHoOhvOkA2ndLNNuOke9qs/aYRNibuHACp4Lo
         zJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760111789; x=1760716589;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZoRFa4EgNbo9YHpT/rgkVAy6RF2nhrPvBGmNOSTvII=;
        b=KKgcV02Odgk1RGpjwO+/QCvM3RclDo6yVjs9nD/Ie0Hjx91i4U9JT223LLg9stsgt4
         VQ+3x+ZqjgTlaD5xI5lwNsSkxS6Xh9rkoBooWQS82yp6Qt6TeFSzPi0OgtckLHdelUPk
         O+520TqiDz2CCvr0S09WEXHIYW1k8co1hgGGp/dXhAJQyiWBmwiPXfvw+NT11bGC4cAp
         jgSx7E1U9Yomws6YREM37ldINdYushF177ee59rVlaSoiNkz4mAOIwdtbcB2ZWXwCjS6
         IsbAhdAuVocYkcrGQ7uDkESrG61WfefQ91MeN9LBlc0G9dvO703SjJMAn9C3AbU9Ld6e
         HlAA==
X-Forwarded-Encrypted: i=1; AJvYcCUodkOx5F/Uvla4CJOZgsAypDp0Y14uXKxCdpytVxRsE7z+mmlpWPYNcKD1YI/8Jh6kgBv3bO5yD8wxz/+noiu16Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2TanuLCcpOvQ5kYjG3fzZ9pHQ/yPm23qUUt78VWfgHnymEhXn
	GVbfXdQW3Ykt/U+kPoydHIGT+2Rn984dV3HH2oJUXAuuqVEdRoicjD6HIrs/UaFNeDE=
X-Gm-Gg: ASbGncvxvkV8ToAipFhAW9jSlDMVsbRzG25awyb04V6zb8uX5B+MhF3F6Ch4GRiIZ4R
	5ee41Bou7HVWcFPDjj+Z0CrXrCkgTAUCZJtDqua1IzQxjXnaVklrdhbCTfMai9ca7awIVti0RH5
	60n1FgHZVYva3Zhx6gVqMjpk2sdL23DlB95X6zaRlWDhdjIPDd2UJ84GWH7HhqU19zgtrfPSQ9A
	4qRcJt7+ms55VAYlgJvEJfapqGD6PRVJ9GotlkTnf4y2R+dFFfIAV6dIG5imFf6zwzucYgqtRYA
	nzZSQRqtFa3e3xunuTcddWSdz5OwwGq6J7C8VZ/O76mR1WQuEiLZQafu99Hqi/zQdwIAlUWkWrn
	Mwh1O76v1EP+ZQ2aDzZMcda6fAlg7EfZWhy9VvjyFtf/ECn8ilWRGVNeo77+9gvxAiChCqHMD3+
	l0G4NJkOABmlrZFE5PvOEJL1WCeMP8F0VwHus=
X-Google-Smtp-Source: AGHT+IFPrLD0cpURVx9vlEq9MIRSEh4Uvrp2QcOigo0VAcKE9vYjUK34xwAVj5/gi01gKaUb5M2abg==
X-Received: by 2002:a17:906:4789:b0:b41:c892:2c67 with SMTP id a640c23a62f3a-b50abfc861amr1291709266b.45.1760111788585;
        Fri, 10 Oct 2025 08:56:28 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacba7sm261285866b.5.2025.10.10.08.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:56:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 10 Oct 2025 16:56:26 +0100
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add node for
 s2mpg10 / clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251010-s2mpg10-clk-v1-1-dafb5d179395@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKks6WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0MD3WKj3IJ0IJ2ck62bnJRkkZxkYGaQbGimBNRRUJSallkBNi06trY
 WAJcH5UZdAAAA
X-Change-ID: 20251010-s2mpg10-clk-cbb8cb060c16
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

On Pixel 6 (and Pro), a Samsung S2MPG10 is used as main PMIC, which
contains the following functional blocks:
    * common / speedy interface
    * regulators
    * 3 clock outputs
    * RTC
    * power meters

This change adds a node for the clock outputs which are used as inputs
as follows:
* RTC clock for AP
* GNSS receiver, WLAN, Bluetooth
* vibrator, modem

The names have been chosen to match the schematic.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note: This depends on the samsung,s2mpg10-clk binding which was
only recently merged into Linus' tree via the clock tree.
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 84ff3e047d3b31b5f96d4d6c78ec933bb05f3e6b..93892adaa679439bd87b0630cf9416b05c9d4536 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -109,6 +109,13 @@ pmic {
 		system-power-controller;
 		wakeup-source;
 
+		clocks {
+			compatible = "samsung,s2mpg10-clk";
+			#clock-cells = <1>;
+			clock-output-names = "rtc32k_ap", "peri32k1",
+					     "peri32k2";
+		};
+
 		regulators {
 		};
 	};

---
base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
change-id: 20251010-s2mpg10-clk-cbb8cb060c16

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

