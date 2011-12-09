From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 1/2] mfd: add irq domain support for max8997 interrupts
Date: Fri, 9 Dec 2011 13:00:35 +0900
Message-ID: <CAJ0PZbSYQrUQK_oYVGP7RwNFqPRB-FpXRtLm8+5++5By7H8tGw@mail.gmail.com>
References: <1323361659-11835-1-git-send-email-thomas.abraham@linaro.org>
	<1323361659-11835-2-git-send-email-thomas.abraham@linaro.org>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:62895 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836Ab1LIEAg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Dec 2011 23:00:36 -0500
In-Reply-To: <1323361659-11835-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, rpurdie@rpsys.net, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Fri, Dec 9, 2011 at 1:27 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> Add irq domain support for max8997 interrupts. All uses of irq_base i=
n platform
> data and max8997 driver private data are removed.
>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Looks good to me.

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>

> ---
> =A0arch/arm/mach-exynos/mach-nuri.c =A0 =A0| =A0 =A04 ----
> =A0arch/arm/mach-exynos/mach-origen.c =A0| =A0 =A01 -
> =A0drivers/mfd/max8997-irq.c =A0 =A0 =A0 =A0 =A0 | =A0 33 +++++++++++=
++++++++--------------
> =A0drivers/mfd/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -
> =A0include/linux/mfd/max8997-private.h | =A0 =A04 +++-
> =A0include/linux/mfd/max8997.h =A0 =A0 =A0 =A0 | =A0 =A01 -
> =A06 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/=
mach-nuri.c
> index 236bbe1..ae333e5 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -1077,12 +1077,8 @@ static struct platform_device nuri_max8903_dev=
ice =3D {
> =A0static void __init nuri_power_init(void)
> =A0{
> =A0 =A0 =A0 =A0int gpio;
> - =A0 =A0 =A0 int irq_base =3D IRQ_GPIO_END + 1;
> =A0 =A0 =A0 =A0int ta_en =3D 0;
>
> - =A0 =A0 =A0 nuri_max8997_pdata.irq_base =3D irq_base;
> - =A0 =A0 =A0 irq_base +=3D MAX8997_IRQ_NR;
> -
> =A0 =A0 =A0 =A0gpio =3D EXYNOS4_GPX0(7);
> =A0 =A0 =A0 =A0gpio_request(gpio, "AP_PMIC_IRQ");
> =A0 =A0 =A0 =A0s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(0xf));
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exyno=
s/mach-origen.c
> index f56d027..588b0a8 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -421,7 +421,6 @@ struct max8997_platform_data __initdata origen_ma=
x8997_pdata =3D {
> =A0 =A0 =A0 =A0.buck1_gpiodvs =A0=3D false,
> =A0 =A0 =A0 =A0.buck2_gpiodvs =A0=3D false,
> =A0 =A0 =A0 =A0.buck5_gpiodvs =A0=3D false,
> - =A0 =A0 =A0 .irq_base =A0 =A0 =A0 =3D IRQ_GPIO_END + 1,
>
> =A0 =A0 =A0 =A0.ignore_gpiodvs_side_effect =3D true,
> =A0 =A0 =A0 =A0.buck125_default_idx =3D 0x0,
> diff --git a/drivers/mfd/max8997-irq.c b/drivers/mfd/max8997-irq.c
> index 09274cf..eb9cad5 100644
> --- a/drivers/mfd/max8997-irq.c
> +++ b/drivers/mfd/max8997-irq.c
> @@ -142,7 +142,8 @@ static void max8997_irq_sync_unlock(struct irq_da=
ta *data)
> =A0static const inline struct max8997_irq_data *
> =A0irq_to_max8997_irq(struct max8997_dev *max8997, int irq)
> =A0{
> - =A0 =A0 =A0 return &max8997_irqs[irq - max8997->irq_base];
> + =A0 =A0 =A0 struct irq_data *data =3D irq_get_irq_data(irq);
> + =A0 =A0 =A0 return &max8997_irqs[data->hwirq];
> =A0}
>
> =A0static void max8997_irq_mask(struct irq_data *data)
> @@ -179,10 +180,11 @@ static struct irq_chip max8997_irq_chip =3D {
> =A0static irqreturn_t max8997_irq_thread(int irq, void *data)
> =A0{
> =A0 =A0 =A0 =A0struct max8997_dev *max8997 =3D data;
> + =A0 =A0 =A0 struct irq_domain *domain =3D &max8997->irq_domain;
> =A0 =A0 =A0 =A0u8 irq_reg[MAX8997_IRQ_GROUP_NR] =3D {};
> =A0 =A0 =A0 =A0u8 irq_src;
> =A0 =A0 =A0 =A0int ret;
> - =A0 =A0 =A0 int i;
> + =A0 =A0 =A0 int i, cur_irq;
>
> =A0 =A0 =A0 =A0ret =3D max8997_read_reg(max8997->i2c, MAX8997_REG_INT=
SRC, &irq_src);
> =A0 =A0 =A0 =A0if (ret < 0) {
> @@ -268,9 +270,9 @@ static irqreturn_t max8997_irq_thread(int irq, vo=
id *data)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_reg[i] &=3D ~max8997->irq_masks_cu=
r[i];
>
> =A0 =A0 =A0 =A0/* Report */
> - =A0 =A0 =A0 for (i =3D 0; i < MAX8997_IRQ_NR; i++) {
> + =A0 =A0 =A0 irq_domain_for_each_irq(domain, i, cur_irq) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (irq_reg[max8997_irqs[i].group] & m=
ax8997_irqs[i].mask)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 handle_nested_irq(max89=
97->irq_base + i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 handle_nested_irq(cur_i=
rq);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return IRQ_HANDLED;
> @@ -278,13 +280,14 @@ static irqreturn_t max8997_irq_thread(int irq, =
void *data)
>
> =A0int max8997_irq_resume(struct max8997_dev *max8997)
> =A0{
> - =A0 =A0 =A0 if (max8997->irq && max8997->irq_base)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997_irq_thread(max8997->irq_base, m=
ax8997);
> + =A0 =A0 =A0 if (max8997->irq && max8997->irq_domain.irq_base)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997_irq_thread(max8997->irq_domain.=
irq_base, max8997);
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> =A0int max8997_irq_init(struct max8997_dev *max8997)
> =A0{
> + =A0 =A0 =A0 struct irq_domain *domain =3D &max8997->irq_domain;
> =A0 =A0 =A0 =A0int i;
> =A0 =A0 =A0 =A0int cur_irq;
> =A0 =A0 =A0 =A0int ret;
> @@ -292,12 +295,6 @@ int max8997_irq_init(struct max8997_dev *max8997=
)
>
> =A0 =A0 =A0 =A0if (!max8997->irq) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_warn(max8997->dev, "No interrupt s=
pecified.\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 max8997->irq_base =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 if (!max8997->irq_base) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max8997->dev, "No interrupt bas=
e specified.\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> =A0 =A0 =A0 =A0}
>
> @@ -327,9 +324,17 @@ int max8997_irq_init(struct max8997_dev *max8997=
)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0true : false;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 domain->irq_base =3D irq_alloc_descs(-1, 0, MAX8997_IRQ=
_NR, 0);
> + =A0 =A0 =A0 if (domain->irq_base < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(max8997->dev, "failed to alloc =
irq descs\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 domain->nr_irq =3D MAX8997_IRQ_NR;
> + =A0 =A0 =A0 domain->ops =3D &irq_domain_simple_ops;
> + =A0 =A0 =A0 irq_domain_add(domain);
> +
> =A0 =A0 =A0 =A0/* Register with genirq */
> - =A0 =A0 =A0 for (i =3D 0; i < MAX8997_IRQ_NR; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 cur_irq =3D i + max8997->irq_base;
> + =A0 =A0 =A0 irq_domain_for_each_irq(domain, i, cur_irq) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_set_chip_data(cur_irq, max8997);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_set_chip_and_handler(cur_irq, &max=
8997_irq_chip,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handle=
_edge_irq);
> diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
> index 5be53ae..b996c6e 100644
> --- a/drivers/mfd/max8997.c
> +++ b/drivers/mfd/max8997.c
> @@ -142,7 +142,6 @@ static int max8997_i2c_probe(struct i2c_client *i=
2c,
> =A0 =A0 =A0 =A0if (!pdata)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err;
>
> - =A0 =A0 =A0 max8997->irq_base =3D pdata->irq_base;
> =A0 =A0 =A0 =A0max8997->ono =3D pdata->ono;
>
> =A0 =A0 =A0 =A0mutex_init(&max8997->iolock);
> diff --git a/include/linux/mfd/max8997-private.h b/include/linux/mfd/=
max8997-private.h
> index 3f4deb6..04c5779 100644
> --- a/include/linux/mfd/max8997-private.h
> +++ b/include/linux/mfd/max8997-private.h
> @@ -23,6 +23,8 @@
> =A0#define __LINUX_MFD_MAX8997_PRIV_H
>
> =A0#include <linux/i2c.h>
> +#include <linux/export.h>
> +#include <linux/irqdomain.h>
>
> =A0#define MAX8997_REG_INVALID =A0 =A0(0xff)
>
> @@ -325,7 +327,7 @@ struct max8997_dev {
>
> =A0 =A0 =A0 =A0int irq;
> =A0 =A0 =A0 =A0int ono;
> - =A0 =A0 =A0 int irq_base;
> + =A0 =A0 =A0 struct irq_domain irq_domain;
> =A0 =A0 =A0 =A0struct mutex irqlock;
> =A0 =A0 =A0 =A0int irq_masks_cur[MAX8997_IRQ_GROUP_NR];
> =A0 =A0 =A0 =A0int irq_masks_cache[MAX8997_IRQ_GROUP_NR];
> diff --git a/include/linux/mfd/max8997.h b/include/linux/mfd/max8997.=
h
> index 0bbd13d..1e0b9cc 100644
> --- a/include/linux/mfd/max8997.h
> +++ b/include/linux/mfd/max8997.h
> @@ -79,7 +79,6 @@ struct max8997_regulator_data {
>
> =A0struct max8997_platform_data {
> =A0 =A0 =A0 =A0/* IRQ */
> - =A0 =A0 =A0 int irq_base;
> =A0 =A0 =A0 =A0int ono;
> =A0 =A0 =A0 =A0int wakeup;
>
> --
> 1.6.6.rc2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
