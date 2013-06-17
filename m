From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] pinctrl: exynos: Fix build breakage
Date: Mon, 17 Jun 2013 15:06:36 +0530
Message-ID: <1371461796-5061-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:48370 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932350Ab3FQJvV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 05:51:21 -0400
Received: by mail-pd0-f172.google.com with SMTP id z10so2614188pdj.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 02:51:21 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linus.walleij@linaro.org, sachin.kamat@linaro.org, patches@linaro.org, Doug Anderson <dianders@chromium.org>

'exynos_wkup_irq_mask' should be defined ahead of its call.

=46ixes the following error:
drivers/pinctrl/pinctrl-exynos.c: In function =E2=80=98exynos_wkup_irq_=
mask=E2=80=99:
drivers/pinctrl/pinctrl-exynos.c:299:3: error: implicit declaration of
function =E2=80=98exynos_wkup_irq_ack=E2=80=99 [-Werror=3Dimplicit-func=
tion-declaration]
   exynos_wkup_irq_ack(irqd);

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>
---
 drivers/pinctrl/pinctrl-exynos.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-exynos.c b/drivers/pinctrl/pinctrl=
-exynos.c
index 8cd5bf5..f9277bc 100644
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
@@ -307,15 +316,6 @@ static void exynos_wkup_irq_mask(struct irq_data *=
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
--=20
1.7.9.5
