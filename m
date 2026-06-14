Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ED82EB10;
	Sun, 14 Jun 2026 20:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468243; cv=none; b=q23a/FRah2CYbjp1MTzOecH63ywHnwdy7hNABMBAgLhzNtlVik/gqUpjAQqJxOS8Ju4IFxzOMz42diFLfPORWO/7NrN5bzld596MjtmKnT/JPKOGLZVspQ0LhBJWNnMvdgq8caMJCjudhdyVVBJTOREl1bADr5mSmVqgYKOp+Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468243; c=relaxed/simple;
	bh=WV3R7xTTCvUJHdqdkg51Cc2JY7KtaGMqY4kgRMIF7zE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VaWV8VPNsw+U7G19d6GvS74T5bFPGSUMfeoFh8mvmvmgoduNKMNlFAfbuZ5NtfFC9YxDfuysCtW+WVILt+sFx9YVaT32TDyA6yK8bb0KQcZQd1rd0XweusD2bSC4T0asZjvfknUR1EDPazRTWeGEy2r8zMAslJ8c1XA3NLZAxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gdl0Q3Z5sz9tTM;
	Sun, 14 Jun 2026 22:17:10 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Sun, 14 Jun 2026 22:16:35 +0200
Subject: [PATCH v2] ARM: dts: exynos: Add bluetooth support to manta
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-manta-bluetooth-v2-1-52de06cabf9d@timmermann.space>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNyw6CMBQFf4V0bU0fUCor/8OwaPEq10hL2kI0h
 H+3YFy5nGTOnIVECAiRNMVCAswY0bsM4lCQrjfuDhSvmYlgQrGSlXQwLhlqnxMk71NPtVRcSia
 0tYrk1Rjghq+9eGm/HCf7gC5tmc3oMSYf3vvlzDfvV9d/9ZlTTm2tKg21ltXJnBMOA4TsuWMcT
 QekXdf1A8Rov4DHAAAA
X-Change-ID: 20260404-manta-bluetooth-836133028bb6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Marquet <tb@a-marquet.fr>, 
 Lukas Timmermann <linux@timmermann.space>
X-Rspamd-Queue-Id: 4gdl0Q3Z5sz9tTM

Enable the bcm4330-bt device for manta boards on serial0.
Also adds the necessary pin definitions and interrupt handling for
wakeup.

Co-developed-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Co-developed-by: Lukas Timmermann <linux@timmermann.space>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
Changes in v2:
- Sorted DCO chain (@krzk)
- Link to v1: https://patch.msgid.link/20260408-manta-bluetooth-v1-1-b7658e78359a@timmermann.space

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/samsung/exynos5250-manta.dts | 41 +++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-manta.dts b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
index 24a27b342227..76d3657eb22f 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-manta.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-manta.dts
@@ -461,6 +461,13 @@ acc_int: acc-int-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 	};
 
+	bt_host_wakeup: bt-host-wakeup-pins {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
 	max77686_irq: max77686-irq-pins {
 		samsung,pins = "gpx0-2";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
@@ -488,6 +495,20 @@ bh1721fvc_reset: bh1721fvc-reset-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
 
+	bt_reg_on: bt-reg-on-pins {
+		samsung,pins = "gph0-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_wake: bt-wake-pins {
+		samsung,pins = "gph1-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+	};
+
 	msense_reset: msense-reset-pins {
 		samsung,pins = "gpg2-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
@@ -536,7 +557,25 @@ &sd1_cmd {
 
 /* Bluetooth */
 &serial_0 {
-	status = "disabled";
+	pinctrl-0 = <&uart0_data &uart0_fctl>;
+	pinctrl-names = "default";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+
+		pinctrl-0 = <&bt_reg_on &bt_wake &bt_host_wakeup>;
+		pinctrl-names = "default";
+
+		shutdown-gpios = <&gph0 0 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gph1 3 GPIO_ACTIVE_HIGH>;
+
+		interrupt-parent = <&gpx2>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "host-wakeup";
+
+		clocks = <&max77686 MAX77686_CLK_PMIC>;
+		clock-names = "lpo";
+	};
 };
 
 /* GPS */

---
base-commit: e5f7e05a699f41275d6380c497293446034bc8af
change-id: 20260404-manta-bluetooth-836133028bb6

Best regards,
--  
Lukas Timmermann <linux@timmermann.space>

