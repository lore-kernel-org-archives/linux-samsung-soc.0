From: Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: linux-next: origen build failed at drivers/pinctrl/pinctrl-exynos.c
Date: Tue, 18 Jun 2013 18:58:37 +0200
Message-ID: <201306181858.37999.arnd.bergmann@linaro.org>
References: <CA+G9fYu3_-RZxFyRENuqJvzsM=YToT7PG+5fUytMzhsFu3=z7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:50675 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932879Ab3FRQ7E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 12:59:04 -0400
In-Reply-To: <CA+G9fYu3_-RZxFyRENuqJvzsM=YToT7PG+5fUytMzhsFu3=z7g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Milosz Wasilewski <milosz.wasilewski@linaro.org>

On Tuesday 18 June 2013, Naresh Kamboju wrote:
> Hi,
>=20
> linux-next branch failed to build origen build
>=20
> defconfig: exynos_defconfig
>=20
> full build log:
> ----------------
> https://ci.linaro.org/jenkins/job/linux-next/hwpack=3Dorigen,label=3D=
kernel_cloud/72/console
>=20
> build error log:
> --------------------
> 05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kerne=
l_cloud/drivers/pinctrl/pinctrl-exynos.c:
> In function =91exynos_wkup_irq_mask=92:
> 05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kerne=
l_cloud/drivers/pinctrl/pinctrl-exynos.c:299:3:
> error: implicit declaration of function =91exynos_wkup_irq_ack=92
> [-Werror=3Dimplicit-function-declaration]
> 05:02:12    exynos_wkup_irq_ack(irqd);
> 05:02:12    ^
> 05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kerne=
l_cloud/drivers/pinctrl/pinctrl-exynos.c:
> At top level:
> 05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kerne=
l_cloud/drivers/pinctrl/pinctrl-exynos.c:310:13:
> warning: conflicting types for =91exynos_wkup_irq_ack=92 [enabled by
> default]
> 05:02:12  static void exynos_wkup_irq_ack(struct irq_data *irqd)
> 05:02:12              ^
> 05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kerne=
l_cloud/drivers/pinctrl/pinctrl-exynos.c:310:13:
> error: static declaration of =91exynos_wkup_irq_ack=92 follows non-st=
atic
> declaration
> 05:02:12 /mnt/ci_build/workspace/linux-next/hwpack/origen/label/kerne=
l_cloud/drivers/pinctrl/pinctrl-exynos.c:299:3:
> note: previous implicit declaration of =91exynos_wkup_irq_ack=92 was =
here
> 05:02:12    exynos_wkup_irq_ack(irqd);
> 05:02:12    ^
> 05:02:12 cc1: some warnings being treated as errors
> 05:02:12 make[3]: *** [drivers/pinctrl/pinctrl-exynos.o] Error 1
> 05:02:12 make[2]: *** [drivers/pinctrl] Error 2
>=20
> Best regards
> Naresh kamboju
>=20

I got the same thing and used this patch to fix it up.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

---

Linus, could you fold that into Doug's patch?

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl=
-exynos.c
index ef75321..00cd89a 100644
--- a/drivers/pinctrl/pinctrl-exynos.c
+++ b/drivers/pinctrl/pinctrl-exynos.c
@@ -279,6 +279,15 @@ err_domains:
 	return ret;
 }
=20
+static void exynos_wkup_irq_ack(struct irq_data *irqd)
+{
+	struct samsung_pin_bank *b =3D irq_data_get_irq_chip_data(irqd);
+	struct samsung_pinctrl_drv_data *d =3D b->drvdata;
+	unsigned long pend =3D d->ctrl->weint_pend + b->eint_offset;
+
+	writel(1 << irqd->hwirq, d->virt_base + pend);
+}
+
 static void exynos_wkup_irq_mask(struct irq_data *irqd)
 {
 	struct samsung_pin_bank *b =3D irq_data_get_irq_chip_data(irqd);
@@ -296,15 +305,6 @@ static void exynos_wkup_irq_mask(struct irq_data *=
irqd)
 	spin_unlock_irqrestore(&b->slock, flags);
 }
=20
-static void exynos_wkup_irq_ack(struct irq_data *irqd)
-{
-	struct samsung_pin_bank *b =3D irq_data_get_irq_chip_data(irqd);
-	struct samsung_pinctrl_drv_data *d =3D b->drvdata;
-	unsigned long pend =3D d->ctrl->weint_pend + b->eint_offset;
-
-	writel(1 << irqd->hwirq, d->virt_base + pend);
-}
-
 static void exynos_wkup_irq_unmask(struct irq_data *irqd)
 {
 	struct samsung_pin_bank *b =3D irq_data_get_irq_chip_data(irqd);
