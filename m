Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D2258EDB;
	Wed,  8 Apr 2026 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649428; cv=none; b=okFOWCdSXrzONLlj+OwWh59rHX18dtpLkDVFwAOBJKbHcdrsX4VID00CQX0Y2SV60B2uHTJCCL9WbaW3Lhujz58w6WQaIWAPJD18shq3D3ib1nqGdoz9sHXuMCAYbmCio/4DdOrIx8+W/n4/W4VqODWOS3kRaScbIB/rgGrJ/sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649428; c=relaxed/simple;
	bh=BWxLy15PwKoMyn/UbvmqZgMYO3ItoVlgI/FBGs/t5yY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jXBWSjcbzpAGDzyEZi7XPWIOSxTLU3jv9NS9/J6TFyQmkg1LKy6TCvcExYXRDrsi4YQQQ1ZeYCg1DPClMOI0WaHSKuJvlfB6MvQeCwoU28gpynHK8OLgQPT7ma4fwGBfECt4mB9nccvWJgNRQVs13TLxTFpZPXIvBQAMT5KYsPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4frM4D4Yy4z9tB8;
	Wed,  8 Apr 2026 13:57:00 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Wed, 08 Apr 2026 13:56:21 +0200
Subject: [PATCH] ARM: dts: exynos: Add bluetooth support to manta
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-manta-bluetooth-v1-1-b7658e78359a@timmermann.space>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBBA0avErBNMQ6KrRAutqSZKQy2C6O5ZL
 d/i/wsCesIAdXaBx4MCOZtQ5Bl0k7YjMuqTQXCheMlLtmobNTPLjtG5OLFKqkJKLipjFKRq8zj
 Q+R2b9nfYzYxdfDdw3w9zgKmscwAAAA==
X-Change-ID: 20260404-manta-bluetooth-836133028bb6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4frM4D4Yy4z9tB8

Enable the bcm4330-bt device for manta boards on serial0.
Also adds the necessary pin definitions and interrupt handling for
wakeup.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
Co-developed-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
---
This patch depends on previous patches which are
currently only found in linux-next.
See: https://lore.kernel.org/all/177214038655.341086.4114348823043257597.b4-ty@kernel.org/
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

