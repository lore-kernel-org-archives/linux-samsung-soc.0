Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8CD1957E1
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733510810; cv=none; b=L2ARdKyNG2L4vIiNt106knZhb2Z8qcEt4JA4kAMa/17XRva9Uv9GG1c3l/Qn47nRtLPl8sUejSTgTUbU7LAuM1zkCSDI1jXsRRYiJx2G/Qqnox8fpKUxsssthHwtT4zi1tbR5zSJdZYJSSKg0bzgdavjEdzgTf8o6AVqWgwWIHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733510810; c=relaxed/simple;
	bh=hZE1CybMovREXLqVnId3Uwo+vfhO0hUcTJIzGh5EGPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CDL2IPSMgUfKIJELkWzrnEDR4UrAZBe5XxTOMgTyk88ZWfiLsJ8lNX/Vy8VELNSn6Z7GZ9N4BJeY+A8IXkvP3pG6n7MbuOaKML1t7Q2sh603+Q2d41dILzltNJDMfQJhyftZIGRickZILSKZkaSImhW6anjRORMT3Lm/tUnLoys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Bk5bH17m; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Bk5bH17m"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=Bk5bH17mRciK40NrumGYdT+hFeQJO1i6s193yrojWIYn2e1fHbvKjkGf+RLf9rvd1JMf7rWrpd4J3W8Upst53b0baaYfaeI/+73bGn2hhEEuiWSCZ7o3XIRPObGDcZuM2u3/z0CAwy3XvytGWxZCb5BJktVxO1io8hx2uj5sDLMoOeergn22/8NVmy1n12nrSC2eAjaVmwkOwUa6VFjfPV3ysS/6EkIqhPHrA+iZwMYcSXA9UbF2QBzrQoBDKCDrPFtANrb9ljZ3RdF7j0uZVpqCprPlMKtVgV5AsKig40kSWNDG0GhefHOG7mcWHRqaZ0QUjq0M16Yya6St8PWMoA==; s=purelymail2; d=purelymail.com; v=1; bh=hZE1CybMovREXLqVnId3Uwo+vfhO0hUcTJIzGh5EGPY=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1358913524;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 06 Dec 2024 18:46:23 +0000 (UTC)
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
Subject: [PATCH v6 2/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (hubble)
Date: Fri,  6 Dec 2024 18:46:07 +0000
Message-ID: <20241206184609.2437-3-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206184609.2437-1-umer.uddin@mentallysanemainliners.org>
References: <20241206184609.2437-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Add initial support for the Samsung Galaxy S20 Series (hubble) phones.
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
2.47.1

