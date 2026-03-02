Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AC036D9E5
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Mar 2026 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454926; cv=none; b=qfjZawCD7OtUxQNnxqjGHfqorYA+VPEJl0pYC+5bnWPCXOSim4BBnMdodASrexzjmw5Ttq4OhoxmvEAjpylh6/nDwg4juLHPV5sCwtgdDfThJh2tXgL2lfsb4C9SFjo3fQgqvsD7nFZIn2/3xHhyhPai2EkDMC8LEUQPpqLIR2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454926; c=relaxed/simple;
	bh=W9fZ2b52wwosErryye9t8dYBv8NiSHFLIJOzm0GsXs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D64uCq8J8ciDFp9XXwiy58Sok9agu0gqyEXOA1EK0K6RFKydajwQi1xAsnQj2U1KPgsIqIh89KsfNlhg9OvECKs/rITshn5+ynCls71xKHnIILTXwa7wcE8yNz9/k+pChKbmftPnc+1/fuGaYqLuqGj6vRzwdwgVCsJvhLj7Zfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oaYK+QnP; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oaYK+QnP"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65bf2f59d64so5508718a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Mar 2026 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772454923; x=1773059723; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2rDUb9e+S6LVzbXGDafH6Ju6lYi+mwgweBRhLhcVRjo=;
        b=oaYK+QnPX/p1Pq9pH+beU6fC+HyE9Y6EKuXeXq8feTK4SOPdO20UQhTrxNYXKVirsU
         sf8Ydq7/M5Sxa8+ELk9Gug9In9HhlYseX9t2RNVTwVmN75pgqGl3tf6goBj+PiWMJC3f
         8g7tbVOzuX9f4ARsafZRuFfFhts9t4mISaGrFhutlCNbRJhdz2YM2oUwCc99TKnncb43
         I3i1ZvXa4lLVzwdoYEFT+CfTWgivpp5cw/ZXSwyStmWmIwsk5MEyqsSiXX4T/7GUHqQb
         uxfD6OY7GN1KdUfA42xgfzptJNV/ISXT36VQhHi/nRzbwoL2gof2f8vowGD7/+UQ33xX
         9yiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454923; x=1773059723;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rDUb9e+S6LVzbXGDafH6Ju6lYi+mwgweBRhLhcVRjo=;
        b=SP2KdeC4Jf8PmyccsllBwSi723okKXcG9JdDmMgkrc1p86V93xQSjQHvIvoFKFT0gr
         NlCdSEFBacokmJS2OPW3y6gBshCBrWEGbRilCSI84d/ZohUwkPQvBzfaql6Ecu9eHBhV
         FdDavABhw2OP5aZwGQPZvijpdBdgzjpkDTDonkwte3ODGbJ4kv2fnQwmYOUvqccdrUCV
         26vEHTU90yPhbkcpNvhrTybSpT1lxz228KJ1mhqsZU7PoEWDzL0pX0eO9ZojoricomD4
         3J+z3X6zQazvIo9hEQpfJ+AYKzMnrek/Qv64t2ZliT0QpXW3BblFYrIHr3vP0a571c52
         3UwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfG2zF/Agd3hJx/K7jo++GmiYGIL7fZr05jhiPeTBRmmOCjEPW00qgXZZvP+4qRJhQXUA1htB7hVFoVapYDig2gA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh5QL42aaROLyF4/h2RUqqUo7gMIXEqpGFmQnoRolzA4/y8cb6
	QuHmaesIQg9eX62r2rGKK7HID7y02xDJKaZYik0fGDiZE3kgdVFSWCGiV9u5YrBpiB0=
X-Gm-Gg: ATEYQzwNcGBn0xMw8oUSSvN+peigr18PtLx8hXdZBQNYy0OVtHLNOWixutvqJUCQMcN
	kOXpk1jK+4KW3BsVp3srWZdL7yqT4czaLvzbLk+E6GXt3eX8cw7zVt2is7k1SEehh9mSYdrFjen
	Mo6lTwEMnNbubxdiZw5qFU0sZq4gKTEEbPSDvDMnix8YckNpMgB7JMuiZc2v1ExSLzildnXVilH
	k5EImIlUxTAKucdpw8ACsOwOOmZO5maEdDi9A7e4ytp/1VPWS78oSqQsVYcWlPkUstMwqf5gKKT
	SFL2wi+PlH+i2oXB4hTj/PEOHArClF4pVM7cm0Q9c2Avkn1I6WUUI0EvUUxsy39G4CNXUPAcU2U
	zoOk897FxcjLjliXn2rp/GPma1Yn1XLYVhK5Dte7Ok6ftMXRUtJkvrYV8KtNjAybGR3/+fGihla
	eVFxdJTeLurTCyRqDmuy4oS6SWIPBy3534kMDtrWSi3GmyNw5Q9DUMpQOPzkBbFFiJKhFO9WvDz
	RIUyC8gCEBhj90=
X-Received: by 2002:a05:6402:e8a:b0:65f:a9fa:cbab with SMTP id 4fb4d7f45d1cf-65fde0e6110mr6740003a12.32.1772454923452;
        Mon, 02 Mar 2026 04:35:23 -0800 (PST)
Received: from puffmais2.c.googlers.com (221.210.91.34.bc.googleusercontent.com. [34.91.210.221])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660057835e2sm1979643a12.18.2026.03.02.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:35:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 02 Mar 2026 12:35:22 +0000
Subject: [PATCH v2] arm64: dts: exynos: gs101-pixel-common: add Maxim
 MAX77759 fuel gauge
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-max77759-fg-dts-v2-1-12f1109a6fee@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAmEpWkC/3WNQQrDIBRErxL+uhajjWJXvUfJQpMf86GNQYOkB
 O9em32Z1RuYNwckjIQJ7s0BETMlCksFcWlgmO3ikdFYGQQXiguh2dvuWuvOsMmzcUvMtQLd2Fn
 DnYS6WiNOtJ/GZ195prSF+DkPcvtr/7tyy2rU0Gkp0dzU8HjRYmO4huihL6V8AeyWI0mvAAAA
X-Change-ID: 20260227-max77759-fg-dts-b12ebd5a90b3
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, Amit Sunil Dhamne <amitsd@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

On Pixel 6 (and Pro), a MAX77759 companion PMIC for USB Type-C
applications is used, which contains four functional blocks (at
distinct I2C addresses):
  * top (including GPIO & NVMEM)
  * charger
  * fuel gauge
  * TCPCi

This change adds the fuel gauge.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- typo Maxin -> Maxim in subject
- collect tags
- Link to v1: https://lore.kernel.org/r/20260227-max77759-fg-dts-v1-1-16c5733e946c@linaro.org
---
For DT validation purposes, this patch depends on the binding updates
from https://lore.kernel.org/r/20260226-max77759-fg-v1-0-ff0a08a70a9f@linaro.org
They have been ACKed, but not merged yet.
---
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..c01fec7c867d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -225,6 +225,17 @@ usbc0_role_sw: endpoint {
 		};
 	};
 
+	fuel-gauge@36 {
+		compatible = "maxim,max77759-fg";
+		reg = <0x36>;
+
+		pinctrl-0 = <&if_pmic_fg_int>;
+		pinctrl-names = "default";
+		interrupts-extended = <&gpa9 3 IRQ_TYPE_LEVEL_LOW>;
+
+		shunt-resistor-micro-ohms = <5000>;
+	};
+
 	pmic@66 {
 		compatible = "maxim,max77759";
 		reg = <0x66>;
@@ -317,6 +328,13 @@ pmic_int: pmic-int-pins {
 		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
 	};
 
+	if_pmic_fg_int: if-pmic-fg-int-pins {
+		samsung,pins = "gpa9-3";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa10-1";
 		samsung,pin-function = <GS101_PIN_FUNC_EINT>;

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260227-max77759-fg-dts-b12ebd5a90b3

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

