Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE9481B3
	for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Dec 2024 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731302; cv=none; b=Cw/XIt1ui9oQ37BCE+wlGWxpvP9Ds+WHYN+3sRJ1SwNODbnkncQ2QBYZ8HnSHTnUQvrlnFdl0t7dN0b5P7CZK1l78F0l9zh2sjneuwZ4qU8JjaieQJ0F01WCnfdW/XLOpoYx0P5p2AF1bzDB2ARlgqb9amPe9l7aPB5FZVMLde8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731302; c=relaxed/simple;
	bh=hWauk9qmL/orEsyw3cDMnhAaQarIwWnL+OGo5MfiM58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ptP+BSnZr/4o2/0PF/qvfjHCBnzgmCYJIA3fiCxZ/afZmv8hYtwrxDURBhBkRRHqNfLPf9hluAekKuklwQQeZnkrO4ZD+lQKpQP0+GcJ99ATLvmkWxVSKs+DnUVyMeIkC1lgRxMULxV3nmt9RxdN9BiponQ4vOIhbnPnnjQ8wLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ocZHMFtP; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ocZHMFtP"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=ocZHMFtPGn7aP1iRwhCIw7cP4p8boY/4CWQpO6+swdFEUZ+NjmEoj5oE4eJ8sgdHTlzcgDLAM09fcoki+oiv23xrdSze1MY/7yyKmZHYrRqhcxUoQqWp4Dip+ZzLUfRtu7/cOcod5qFXWPlHmCvNQDCtv2xF/tWMDT0PW8gUKTZxPPCbEqQC2vD5T1d9Vx4R6iTF3/1fgndQZ41f/hnunw0bl2cfBZb/aTUREmcDFFnZIO2+liBZmZO0i0QqQyzjOaB3foSyhsTq5FH6mbpTTYZQpWni0SW9REl8piHA0Ljw1muEjqb8qtgiBOHnsetp3nafPvteluANk7vngeM7qA==; s=purelymail2; d=purelymail.com; v=1; bh=hWauk9qmL/orEsyw3cDMnhAaQarIwWnL+OGo5MfiM58=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1477585645;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 09 Dec 2024 08:01:14 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v7 2/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (x1s-common)
Date: Mon,  9 Dec 2024 08:00:57 +0000
Message-ID: <20241209080059.11891-3-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
References: <20241209080059.11891-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Add initial support for the Samsung Galaxy S20 Series (x1s-common) phones.
They were launched in 2020, and are based on the Exynos 990 SoC.
The devices have multiple RAM configurations,
starting from 8GB going all the way up to 16GB for the S20 Ultra devices.

This device tree adds support for the following:

- SimpleFB
- 8GB RAM (Any more will be mapped in device trees)
- Buttons

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../boot/dts/exynos/exynos990-x1s-common.dtsi | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi

diff --git a/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi b/arch/ar=
m64/boot/dts/exynos/exynos990-x1s-common.dtsi
new file mode 100644
index 000000000..55fa8e9e0
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos990-x1s-common.dtsi
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Samsung Galaxy S20 Series device tree source
+ *
+ * Copyright (c) 2024, Umer Uddin <umer.uddin@mentallysanemainliners.org>
+ */
+
+/dts-v1/;
+#include "exynos990.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+=09chosen {
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <2>;
+=09=09ranges;
+
+=09=09framebuffer0: framebuffer@f1000000 {
+=09=09=09compatible =3D "simple-framebuffer";
+=09=09=09reg =3D <0 0xf1000000 0 (1440 * 3200 * 4)>;
+=09=09=09width =3D <1440>;
+=09=09=09height =3D <3200>;
+=09=09=09stride =3D <(1440 * 4)>;
+=09=09=09format =3D "a8r8g8b8";
+=09=09};
+=09};
+
+=09reserved-memory {
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <2>;
+=09=09ranges;
+
+=09=09cont_splash_mem: framebuffer@f1000000 {
+=09=09=09reg =3D <0 0xf1000000 0 0x1194000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09abox_reserved: audio@f7fb0000 {
+=09=09=09reg =3D <0 0xf7fb0000 0 0x2a50000>;
+=09=09=09no-map;
+=09=09};
+=09};
+
+=09gpio-keys {
+=09=09compatible =3D "gpio-keys";
+
+=09=09pinctrl-0 =3D <&key_power &key_voldown &key_volup>;
+=09=09pinctrl-names =3D "default";
+
+=09=09power-key {
+=09=09=09label =3D "Power";
+=09=09=09linux,code =3D <KEY_POWER>;
+=09=09=09gpios =3D <&gpa2 4 GPIO_ACTIVE_LOW>;
+=09=09=09wakeup-source;
+=09=09};
+
+=09=09voldown-key {
+=09=09=09label =3D "Volume Down";
+=09=09=09linux,code =3D <KEY_VOLUMEDOWN>;
+=09=09=09gpios =3D <&gpa0 4 GPIO_ACTIVE_LOW>;
+=09=09};
+
+=09=09volup-key {
+=09=09=09label =3D "Volume Up";
+=09=09=09linux,code =3D <KEY_VOLUMEUP>;
+=09=09=09gpios =3D <&gpa0 3 GPIO_ACTIVE_LOW>;
+=09=09};
+=09};
+};
+
+&oscclk {
+=09clock-frequency =3D <26000000>;
+};
+
+&pinctrl_alive {
+=09key_power: key-power-pins {
+=09=09samsung,pins =3D "gpa2-4";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_EINT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09key_voldown: key-voldown-pins {
+=09=09samsung,pins =3D "gpa0-4";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_EINT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09key_volup: key-volup-pins {
+=09=09samsung,pins =3D "gpa0-3";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_EINT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+};
--=20
2.43.0

