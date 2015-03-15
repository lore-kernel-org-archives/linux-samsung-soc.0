From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 3/5] pinctrl: exynos: add exynos5410 SoC specific data
Date: Sun, 15 Mar 2015 23:00:32 +0100
Message-ID: <1426456834-6308-4-git-send-email-afaerber@suse.de>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53532 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751636AbbCOWAq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Mar 2015 18:00:46 -0400
In-Reply-To: <1426456834-6308-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?q?=EA=B9=80=ED=95=99=EC=A3=BC?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>

=46rom: Hakjoo Kim <ruppi.kim@hardkernel.com>

Add Samsung EXYNOS5410 SoC specific data to enable pinctrl
support for all platforms based on EXYNOS5410.

Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
[AF: Rebased onto Exynos5260, irq_chip consolidation, const'ification]
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2 -> v3:
 * Rebased (.svc, .{g,w}eint_{con,mask,pend} fields dropped)
=20
 v1 -> v2:
 * Filled in Sob from Hakjoo Kim
=20
 .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos.c           | 103 +++++++++++++=
++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 4 files changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.=
txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 9d2a995293e6..6db16b90873a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -17,6 +17,7 @@ Required Properties:
   - "samsung,exynos4x12-pinctrl": for Exynos4x12 compatible pin-contro=
ller.
   - "samsung,exynos5250-pinctrl": for Exynos5250 compatible pin-contro=
ller.
   - "samsung,exynos5260-pinctrl": for Exynos5260 compatible pin-contro=
ller.
+  - "samsung,exynos5410-pinctrl": for Exynos5410 compatible pin-contro=
ller.
   - "samsung,exynos5420-pinctrl": for Exynos5420 compatible pin-contro=
ller.
   - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
=20
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
index c8f83f96546c..fa50fdd74d45 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -1150,6 +1150,109 @@ const struct samsung_pin_ctrl exynos5260_pin_ct=
rl[] __initconst =3D {
 	},
 };
=20
+/* pin banks of exynos5410 pin-controller 0 */
+static const struct samsung_pin_bank_data exynos5410_pin_banks0[] __in=
itconst =3D {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpa0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(6, 0x020, "gpa1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpa2", 0x08),
+	EXYNOS_PIN_BANK_EINTG(5, 0x060, "gpb0", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(5, 0x080, "gpb1", 0x10),
+	EXYNOS_PIN_BANK_EINTG(4, 0x0A0, "gpb2", 0x14),
+	EXYNOS_PIN_BANK_EINTG(4, 0x0C0, "gpb3", 0x18),
+	EXYNOS_PIN_BANK_EINTG(7, 0x0E0, "gpc0", 0x1c),
+	EXYNOS_PIN_BANK_EINTG(4, 0x100, "gpc3", 0x20),
+	EXYNOS_PIN_BANK_EINTG(7, 0x120, "gpc1", 0x24),
+	EXYNOS_PIN_BANK_EINTG(7, 0x140, "gpc2", 0x28),
+	EXYNOS_PIN_BANK_EINTN(2, 0x160, "gpm5"),
+	EXYNOS_PIN_BANK_EINTG(8, 0x180, "gpd1", 0x2c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x1A0, "gpe0", 0x30),
+	EXYNOS_PIN_BANK_EINTG(2, 0x1C0, "gpe1", 0x34),
+	EXYNOS_PIN_BANK_EINTG(6, 0x1E0, "gpf0", 0x38),
+	EXYNOS_PIN_BANK_EINTG(8, 0x200, "gpf1", 0x3c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x220, "gpg0", 0x40),
+	EXYNOS_PIN_BANK_EINTG(8, 0x240, "gpg1", 0x44),
+	EXYNOS_PIN_BANK_EINTG(2, 0x260, "gpg2", 0x48),
+	EXYNOS_PIN_BANK_EINTG(4, 0x280, "gph0", 0x4c),
+	EXYNOS_PIN_BANK_EINTG(8, 0x2A0, "gph1", 0x50),
+	EXYNOS_PIN_BANK_EINTN(8, 0x2C0, "gpm7"),
+	EXYNOS_PIN_BANK_EINTN(6, 0x2E0, "gpy0"),
+	EXYNOS_PIN_BANK_EINTN(4, 0x300, "gpy1"),
+	EXYNOS_PIN_BANK_EINTN(6, 0x320, "gpy2"),
+	EXYNOS_PIN_BANK_EINTN(8, 0x340, "gpy3"),
+	EXYNOS_PIN_BANK_EINTN(8, 0x360, "gpy4"),
+	EXYNOS_PIN_BANK_EINTN(8, 0x380, "gpy5"),
+	EXYNOS_PIN_BANK_EINTN(8, 0x3A0, "gpy6"),
+	EXYNOS_PIN_BANK_EINTN(8, 0x3C0, "gpy7"),
+	EXYNOS_PIN_BANK_EINTW(8, 0xC00, "gpx0", 0x00),
+	EXYNOS_PIN_BANK_EINTW(8, 0xC20, "gpx1", 0x04),
+	EXYNOS_PIN_BANK_EINTW(8, 0xC40, "gpx2", 0x08),
+	EXYNOS_PIN_BANK_EINTW(8, 0xC60, "gpx3", 0x0c),
+};
+
+/* pin banks of exynos5410 pin-controller 1 */
+static const struct samsung_pin_bank_data exynos5410_pin_banks1[] __in=
itconst =3D {
+	EXYNOS_PIN_BANK_EINTG(5, 0x000, "gpj0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpj1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(8, 0x040, "gpj2", 0x08),
+	EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpj3", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(2, 0x080, "gpj4", 0x10),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0A0, "gpk0", 0x14),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0C0, "gpk1", 0x18),
+	EXYNOS_PIN_BANK_EINTG(8, 0x0E0, "gpk2", 0x1c),
+	EXYNOS_PIN_BANK_EINTG(7, 0x100, "gpk3", 0x20),
+};
+
+/* pin banks of exynos5410 pin-controller 2 */
+static const struct samsung_pin_bank_data exynos5410_pin_banks2[] __in=
itconst =3D {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpv0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpv1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpv2", 0x08),
+	EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpv3", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(2, 0x0C0, "gpv4", 0x10),
+};
+
+/* pin banks of exynos5410 pin-controller 3 */
+static const struct samsung_pin_bank_data exynos5410_pin_banks3[] __in=
itconst =3D {
+	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpz", 0x00),
+};
+
+/*
+ * Samsung pinctrl driver data for Exynos5410 SoC. Exynos5410 SoC incl=
udes
+ * four gpio/pin-mux/pinconfig controllers.
+ */
+const struct samsung_pin_ctrl exynos5410_pin_ctrl[] __initconst =3D {
+	{
+		/* pin-controller instance 0 data */
+		.pin_banks	=3D exynos5410_pin_banks0,
+		.nr_banks	=3D ARRAY_SIZE(exynos5410_pin_banks0),
+		.eint_gpio_init =3D exynos_eint_gpio_init,
+		.eint_wkup_init =3D exynos_eint_wkup_init,
+		.suspend	=3D exynos_pinctrl_suspend,
+		.resume		=3D exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 1 data */
+		.pin_banks	=3D exynos5410_pin_banks1,
+		.nr_banks	=3D ARRAY_SIZE(exynos5410_pin_banks1),
+		.eint_gpio_init =3D exynos_eint_gpio_init,
+		.suspend	=3D exynos_pinctrl_suspend,
+		.resume		=3D exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 2 data */
+		.pin_banks	=3D exynos5410_pin_banks2,
+		.nr_banks	=3D ARRAY_SIZE(exynos5410_pin_banks2),
+		.eint_gpio_init =3D exynos_eint_gpio_init,
+		.suspend	=3D exynos_pinctrl_suspend,
+		.resume		=3D exynos_pinctrl_resume,
+	}, {
+		/* pin-controller instance 3 data */
+		.pin_banks	=3D exynos5410_pin_banks3,
+		.nr_banks	=3D ARRAY_SIZE(exynos5410_pin_banks3),
+		.eint_gpio_init =3D exynos_eint_gpio_init,
+		.suspend	=3D exynos_pinctrl_suspend,
+		.resume		=3D exynos_pinctrl_resume,
+	},
+};
+
 /* pin banks of exynos5420 pin-controller 0 */
 static const struct samsung_pin_bank_data exynos5420_pin_banks0[] __in=
itconst =3D {
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpy7", 0x00),
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
index ec580af35856..1f45636b011d 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1237,6 +1237,8 @@ static const struct of_device_id samsung_pinctrl_=
dt_match[] =3D {
 		.data =3D (void *)exynos5250_pin_ctrl },
 	{ .compatible =3D "samsung,exynos5260-pinctrl",
 		.data =3D (void *)exynos5260_pin_ctrl },
+	{ .compatible =3D "samsung,exynos5410-pinctrl",
+		.data =3D (void *)exynos5410_pin_ctrl },
 	{ .compatible =3D "samsung,exynos5420-pinctrl",
 		.data =3D (void *)exynos5420_pin_ctrl },
 	{ .compatible =3D "samsung,s5pv210-pinctrl",
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctr=
l/samsung/pinctrl-samsung.h
index 1b8c0139d604..b87e2f58ded7 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -270,6 +270,7 @@ extern const struct samsung_pin_ctrl exynos4x12_pin=
_ctrl[];
 extern const struct samsung_pin_ctrl exynos4415_pin_ctrl[];
 extern const struct samsung_pin_ctrl exynos5250_pin_ctrl[];
 extern const struct samsung_pin_ctrl exynos5260_pin_ctrl[];
+extern const struct samsung_pin_ctrl exynos5410_pin_ctrl[];
 extern const struct samsung_pin_ctrl exynos5420_pin_ctrl[];
 extern const struct samsung_pin_ctrl exynos7_pin_ctrl[];
 extern const struct samsung_pin_ctrl s3c64xx_pin_ctrl[];
--=20
2.3.1
