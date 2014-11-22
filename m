From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 3/5] pinctrl: exynos: add exynos5410 SoC specific data
Date: Sat, 22 Nov 2014 21:26:22 +0100
Message-ID: <1416687984-3546-4-git-send-email-afaerber@suse.de>
References: <1416687984-3546-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416687984-3546-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?q?=EA=B9=80=ED=95=99=EC=A3=BC?= <ruppi.kim@hardkernel.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:PIN CONTROL SUBSY..." <linux-gpio@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

=46rom: Hakjoo Kim <ruppi.kim@hardkernel.com>

Add Samsung EXYNOS5410 SoC specific data to enable pinctrl
support for all platforms based on EXYNOS5410.

Signed-off-by: Hakjoo Kim <ruppi.kim@hardkernel.com>
[AF: Rebased onto Exynos5260]
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
v1 -> v2:
* Filled in Sob from Hakjoo Kim
* Rebased (.svc, .{g,w}eint_{con,mask,pend} fields dropped)

 .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos.c           | 126 +++++++++++++=
++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 4 files changed, 130 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.=
txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index e82aaf492517..b87a176e730e 100644
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
=20
 - reg: Base address of the pin controller hardware module and length o=
f
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
index d7154ed0b0eb..ef0e2a0d26eb 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -1084,6 +1084,132 @@ struct samsung_pin_ctrl exynos5260_pin_ctrl[] =3D=
 {
 	},
 };
=20
+/* pin banks of exynos5410 pin-controller 0 */
+static struct samsung_pin_bank exynos5410_pin_banks0[] =3D {
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
+static struct samsung_pin_bank exynos5410_pin_banks1[] =3D {
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
+static struct samsung_pin_bank exynos5410_pin_banks2[] =3D {
+	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpv0", 0x00),
+	EXYNOS_PIN_BANK_EINTG(8, 0x020, "gpv1", 0x04),
+	EXYNOS_PIN_BANK_EINTG(8, 0x060, "gpv2", 0x08),
+	EXYNOS_PIN_BANK_EINTG(8, 0x080, "gpv3", 0x0c),
+	EXYNOS_PIN_BANK_EINTG(2, 0x0C0, "gpv4", 0x10),
+};
+
+/* pin banks of exynos5410 pin-controller 3 */
+static struct samsung_pin_bank exynos5410_pin_banks3[] =3D {
+	EXYNOS_PIN_BANK_EINTG(7, 0x000, "gpz", 0x00),
+};
+
+/*
+ * Samsung pinctrl driver data for Exynos5410 SoC. Exynos5410 SoC incl=
udes
+ * four gpio/pin-mux/pinconfig controllers.
+ */
+struct samsung_pin_ctrl exynos5410_pin_ctrl[] =3D {
+	{
+		/* pin-controller instance 0 data */
+		.pin_banks	=3D exynos5410_pin_banks0,
+		.nr_banks	=3D ARRAY_SIZE(exynos5410_pin_banks0),
+		.geint_con	=3D EXYNOS_GPIO_ECON_OFFSET,
+		.geint_mask	=3D EXYNOS_GPIO_EMASK_OFFSET,
+		.geint_pend	=3D EXYNOS_GPIO_EPEND_OFFSET,
+		.weint_con	=3D EXYNOS_WKUP_ECON_OFFSET,
+		.weint_mask	=3D EXYNOS_WKUP_EMASK_OFFSET,
+		.weint_pend	=3D EXYNOS_WKUP_EPEND_OFFSET,
+		.svc		=3D EXYNOS_SVC_OFFSET,
+		.eint_gpio_init =3D exynos_eint_gpio_init,
+		.eint_wkup_init =3D exynos_eint_wkup_init,
+		.suspend	=3D exynos_pinctrl_suspend,
+		.resume		=3D exynos_pinctrl_resume,
+		.label		=3D "exynos5410-gpio-ctrl0",
+	}, {
+		/* pin-controller instance 1 data */
+		.pin_banks	=3D exynos5410_pin_banks1,
+		.nr_banks	=3D ARRAY_SIZE(exynos5410_pin_banks1),
+		.geint_con	=3D EXYNOS_GPIO_ECON_OFFSET,
+		.geint_mask	=3D EXYNOS_GPIO_EMASK_OFFSET,
+		.geint_pend	=3D EXYNOS_GPIO_EPEND_OFFSET,
+		.svc		=3D EXYNOS_SVC_OFFSET,
+		.eint_gpio_init =3D exynos_eint_gpio_init,
+		.suspend	=3D exynos_pinctrl_suspend,
+		.resume		=3D exynos_pinctrl_resume,
+		.label		=3D "exynos5410-gpio-ctrl1",
+	}, {
+		/* pin-controller instance 2 data */
+		.pin_banks	=3D exynos5410_pin_banks2,
+		.nr_banks	=3D ARRAY_SIZE(exynos5410_pin_banks2),
+		.geint_con	=3D EXYNOS_GPIO_ECON_OFFSET,
+		.geint_mask	=3D EXYNOS_GPIO_EMASK_OFFSET,
+		.geint_pend	=3D EXYNOS_GPIO_EPEND_OFFSET,
+		.svc		=3D EXYNOS_SVC_OFFSET,
+		.eint_gpio_init =3D exynos_eint_gpio_init,
+		.suspend	=3D exynos_pinctrl_suspend,
+		.resume		=3D exynos_pinctrl_resume,
+		.label		=3D "exynos5410-gpio-ctrl2",
+	}, {
+		/* pin-controller instance 3 data */
+		.pin_banks	=3D exynos5410_pin_banks3,
+		.nr_banks	=3D ARRAY_SIZE(exynos5410_pin_banks3),
+		.geint_con	=3D EXYNOS_GPIO_ECON_OFFSET,
+		.geint_mask	=3D EXYNOS_GPIO_EMASK_OFFSET,
+		.geint_pend	=3D EXYNOS_GPIO_EPEND_OFFSET,
+		.svc		=3D EXYNOS_SVC_OFFSET,
+		.eint_gpio_init =3D exynos_eint_gpio_init,
+		.suspend	=3D exynos_pinctrl_suspend,
+		.resume		=3D exynos_pinctrl_resume,
+		.label		=3D "exynos5410-gpio-ctrl3",
+	},
+};
+
 /* pin banks of exynos5420 pin-controller 0 */
 static struct samsung_pin_bank exynos5420_pin_banks0[] =3D {
 	EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpy7", 0x00),
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
index 2d37c8f49f3c..42de732c542f 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1222,6 +1222,8 @@ static const struct of_device_id samsung_pinctrl_=
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
index 5cedc9d26390..d19bbf4c7f24 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -241,6 +241,7 @@ extern struct samsung_pin_ctrl exynos4210_pin_ctrl[=
];
 extern struct samsung_pin_ctrl exynos4x12_pin_ctrl[];
 extern struct samsung_pin_ctrl exynos5250_pin_ctrl[];
 extern struct samsung_pin_ctrl exynos5260_pin_ctrl[];
+extern struct samsung_pin_ctrl exynos5410_pin_ctrl[];
 extern struct samsung_pin_ctrl exynos5420_pin_ctrl[];
 extern struct samsung_pin_ctrl s3c64xx_pin_ctrl[];
 extern struct samsung_pin_ctrl s3c2412_pin_ctrl[];
--=20
2.1.2
