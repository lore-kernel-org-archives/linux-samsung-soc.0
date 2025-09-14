Received: from mail-10626.protonmail.ch (mail-10626.protonmail.ch [79.135.106.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430CD2E62AD;
	Sun, 14 Sep 2025 20:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757882676; cv=none; b=g07jbVoCbmVpBWd2098h9zbKlrJat+JtNZ6x9LVrUwvPNpcCVpko7GuWVkcTkZXxcOGAa0Y2AJCCAHbmL+C+Q4BmWxZvZWyTko9zBlFB+p8/p2K247u7inQB8Geo4+wnPS0dOEU/Ofcv9Amt9rM3iym9AthXjA5CWzTZGJhJ1pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757882676; c=relaxed/simple;
	bh=UW3zlFRzoDE4bP2ZmX5Oq8NR+d4N2Ghs1IMmVOCl1SI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nQJUAq3fhC5L3o05kNTbnTEJpRx8dAN2Hp0DJCBPqSVFNdGXmPmbHvYiZl6+r0IUo8fiijT0zX2SF15N0igKolLqfvOWV5radAZaBNWUZU3eB1c9oyphvf4RhdQ/lnkwnfvQlPm+W3dDQKNnvGplW+Xn7iak8FxpG1x9sTyiBlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=WlUVNkjF; arc=none smtp.client-ip=79.135.106.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="WlUVNkjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757882666; x=1758141866;
	bh=nP2pE69FGSrWi6FDXxFP7OVqh4nrIQyRZD75OWLwh80=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WlUVNkjFcPwKLTrcj+IKlFmRXBRxL94j1goy+pNBmBhHiCU52DrGa2aS14LdlaSdV
	 MWNgPqn5hoccEGFETMkRq5ehVo0rfo6T9M/taAroHcACtmn9dfaQ380l96uuSUt2w9
	 QynAGh4hQh6W0DfE/FZ2n0DEktORlXBVNXlZV6tUPQQJu5/fLnRNZ4V/rH5R3+2Gwm
	 1ZGfjDYd5V6UWca78pmHVZF1Nk0hQXolvTcL2ZDDhqrHwcg2E/vZPqxG6mYEL21LlG
	 Nw1zccgBWSzhFH3/NcWuYHEocy9mBNdF0TTXVNqgHmdcEdDeI6TVHCwdFAe92r7YGD
	 XUy8gLynLaRJg==
Date: Sun, 14 Sep 2025 20:44:21 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 3/3] arm64: dts: exynos: Add initial support for Samsung Galaxy Tab S6 Lite (gta4xl)
Message-ID: <20250914-exynos9610-devicetree-v1-3-2000fc3bbe0b@chimac.ro>
In-Reply-To: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
References: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: b37847bacc136c9ba463ea2af43e424b2ecd9b45
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add initial support for the Samsung Galaxy Tab S6 Lite (SM-P610/P615):

- Framebuffer, through SimpleFB
- RAM
- Buttons

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 arch/arm64/boot/dts/exynos/Makefile              |  1 +
 arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts | 97 ++++++++++++++++++++=
++++
 2 files changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exyn=
os/Makefile
index bdb9e9813e506de3a8ff6d1c3115382cca6ea9d9..8aacff968fa10d6b645bafe910c=
71fb65e8569f8 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
 =09exynos7885-jackpotlte.dtb=09\
 =09exynos850-e850-96.dtb=09=09\
 =09exynos8895-dreamlte.dtb=09=09\
+=09exynos9610-gta4xl.dtb=09=09\
 =09exynos9810-starlte.dtb=09=09\
 =09exynos990-c1s.dtb=09=09\
 =09exynos990-r8s.dtb               \
diff --git a/arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts b/arch/arm64/=
boot/dts/exynos/exynos9610-gta4xl.dts
new file mode 100644
index 0000000000000000000000000000000000000000..f455af22ff872c6f07b9bcfc68b=
1ae1f45d0def3
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Galaxy Tab S6 Lite device tree
+ *
+ * Copyright (c) 2025, Alexandru Chimac <alexchimac@protonmail.com>
+ */
+
+/dts-v1/;
+
+#include "exynos9610.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+=09compatible =3D "samsung,gta4xl", "samsung,exynos9610";
+=09#address-cells =3D <2>;
+=09#size-cells =3D <1>;
+
+=09chosen {
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <1>;
+=09=09ranges;
+
+=09=09framebuffer0: framebuffer@ca000000 {
+=09=09=09compatible =3D "simple-framebuffer";
+=09=09=09memory-region =3D <&cont_splash_rmem>;
+=09=09=09width =3D <1200>;
+=09=09=09height =3D <2000>;
+=09=09=09stride =3D <(1200 * 4)>;
+=09=09=09format =3D "a8r8g8b8";
+=09=09};
+=09};
+
+=09memory@80000000 {
+=09=09device_type =3D "memory";
+=09=09reg =3D <0x0 0x80000000 0x3AB00000>,
+=09=09      <0x0 0xC0000000 0x20000000>,
+=09=09      <0x0 0xE1900000 0x1E700000>,
+=09=09      <0x8 0x80000000 0x80000000>;
+=09};
+
+=09reserved-memory {
+=09=09cont_splash_rmem: framebuffer@ca000000 {
+=09=09=09reg =3D <0 0xca000000 (1200 * 2000 * 4)>;
+=09=09=09no-map;
+=09=09};
+=09};
+
+=09gpio-keys {
+=09=09compatible =3D "gpio-keys";
+
+=09=09pinctrl-0 =3D <&key_voldown &key_volup &key_power>;
+=09=09pinctrl-names =3D "default";
+
+=09=09volup-key {
+=09=09=09label =3D "Volume UP";
+=09=09=09linux,code =3D <KEY_VOLUMEUP>;
+=09=09=09gpios =3D <&gpa1 5 GPIO_ACTIVE_LOW>;
+=09=09};
+
+=09=09voldown-key {
+=09=09=09label =3D "Volume Down";
+=09=09=09linux,code =3D <KEY_VOLUMEDOWN>;
+=09=09=09gpios =3D <&gpa1 6 GPIO_ACTIVE_LOW>;
+=09=09};
+
+=09=09power-key {
+=09=09=09label =3D "Power";
+=09=09=09linux,code =3D <KEY_POWER>;
+=09=09=09gpios =3D <&gpa1 7 GPIO_ACTIVE_LOW>;
+=09=09=09wakeup-source;
+=09=09};
+=09};
+};
+
+&pinctrl_alive {
+=09key_volup: key-volup-pins {
+=09=09samsung,pins =3D "gpa1-5";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_EINT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09key_voldown: key-voldown-pins {
+=09=09samsung,pins =3D "gpa1-6";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_EINT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+
+=09key_power: key-power-pins {
+=09=09samsung,pins =3D "gpa1-7";
+=09=09samsung,pin-function =3D <EXYNOS_PIN_FUNC_EINT>;
+=09=09samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
+=09=09samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
+=09};
+};

--=20
2.47.3


