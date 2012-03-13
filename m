From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v3 1/2] mfd: add irq domain support for max8997 interrupts
Date: Tue, 13 Mar 2012 11:35:53 +0530
Message-ID: <CAJuYYwTKMWgits6xd0UUvRPwr40NwJfO2HncUOW9J=EZbFs8=Q@mail.gmail.com>
References: <1330000688-11226-1-git-send-email-thomas.abraham@linaro.org>
	<1330000688-11226-2-git-send-email-thomas.abraham@linaro.org>
	<20120313032832.655983E07E4@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:62204 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755692Ab2CMGFy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 02:05:54 -0400
Received: by vcqp1 with SMTP id p1so229351vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 23:05:54 -0700 (PDT)
In-Reply-To: <20120313032832.655983E07E4@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 13 March 2012 08:58, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Thu, 23 Feb 2012 18:08:07 +0530, Thomas Abraham <thomas.abraham@li=
naro.org> wrote:
>> Add irq domain support for max8997 interrupts. The reverse mapping m=
ethod
>> used is linear mapping since the sub-drivers of max8997 such as regu=
lator
>> and charger drivers can use the max8997 irq_domain to get the linux =
irq
>> number for max8997 interrupts. All uses of irq_base in platform data=
 and
>> max8997 driver private data are removed.
>>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos/mach-nuri.c =A0 =A0| =A0 =A04 --
>> =A0arch/arm/mach-exynos/mach-origen.c =A0| =A0 =A01 -
>> =A0drivers/mfd/max8997-irq.c =A0 =A0 =A0 =A0 =A0 | =A0 60 ++++++++++=
++++++++++--------------
>> =A0drivers/mfd/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -
>> =A0include/linux/mfd/max8997-private.h | =A0 =A04 ++-
>> =A0include/linux/mfd/max8997.h =A0 =A0 =A0 =A0 | =A0 =A01 -
>> =A06 files changed, 38 insertions(+), 33 deletions(-)
>
> Nice patch. =A0Nice diffstat too. =A0Some comments below, but I'm hap=
py with where
> this is at.
>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>

Thank you Grant for reviewing this patch.

>
>>
>> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos=
/mach-nuri.c
>> index a6b9162..1e9ba12 100644
>> --- a/arch/arm/mach-exynos/mach-nuri.c
>> +++ b/arch/arm/mach-exynos/mach-nuri.c
>> @@ -1078,12 +1078,8 @@ static struct platform_device nuri_max8903_de=
vice =3D {
>> =A0static void __init nuri_power_init(void)
>> =A0{
>> =A0 =A0 =A0 int gpio;
>> - =A0 =A0 int irq_base =3D IRQ_GPIO_END + 1;
>> =A0 =A0 =A0 int ta_en =3D 0;
>>
>> - =A0 =A0 nuri_max8997_pdata.irq_base =3D irq_base;
>> - =A0 =A0 irq_base +=3D MAX8997_IRQ_NR;
>> -
>> =A0 =A0 =A0 gpio =3D EXYNOS4_GPX0(7);
>> =A0 =A0 =A0 gpio_request(gpio, "AP_PMIC_IRQ");
>> =A0 =A0 =A0 s3c_gpio_cfgpin(gpio, S3C_GPIO_SFN(0xf));
>> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exyn=
os/mach-origen.c
>> index 02c242e..328dadb 100644
>> --- a/arch/arm/mach-exynos/mach-origen.c
>> +++ b/arch/arm/mach-exynos/mach-origen.c
>> @@ -424,7 +424,6 @@ static struct max8997_platform_data __initdata o=
rigen_max8997_pdata =3D {
>> =A0 =A0 =A0 .buck1_gpiodvs =A0=3D false,
>> =A0 =A0 =A0 .buck2_gpiodvs =A0=3D false,
>> =A0 =A0 =A0 .buck5_gpiodvs =A0=3D false,
>> - =A0 =A0 .irq_base =A0 =A0 =A0 =3D IRQ_GPIO_END + 1,
>>
>> =A0 =A0 =A0 .ignore_gpiodvs_side_effect =3D true,
>> =A0 =A0 =A0 .buck125_default_idx =3D 0x0,
>> diff --git a/drivers/mfd/max8997-irq.c b/drivers/mfd/max8997-irq.c
>> index 09274cf..3d8c9d1 100644
>> --- a/drivers/mfd/max8997-irq.c
>> +++ b/drivers/mfd/max8997-irq.c
>> @@ -142,7 +142,8 @@ static void max8997_irq_sync_unlock(struct irq_d=
ata *data)
>> =A0static const inline struct max8997_irq_data *
>> =A0irq_to_max8997_irq(struct max8997_dev *max8997, int irq)
>> =A0{
>> - =A0 =A0 return &max8997_irqs[irq - max8997->irq_base];
>> + =A0 =A0 struct irq_data *data =3D irq_get_irq_data(irq);
>> + =A0 =A0 return &max8997_irqs[data->hwirq];
>
> Hahaha. =A0The max8997_irqs table is kind of overdone when the group =
and mask values
> can be arithmetically derived from the hwirq number..

Yes, I agree. Each group could have maximum of 8 interrupts. Then,
data->hwirq % 8 will be the group number and data->hwirq & 7 would be
the mask. The enum max8997_irq can then be adjusted to accommodate
unused irq numbers.

>
> This change is fine, but the driver could use some refactoring. =A0:-=
)

Ok.

>
>> =A0}
>>
>> =A0static void max8997_irq_mask(struct irq_data *data)
>> @@ -182,7 +183,7 @@ static irqreturn_t max8997_irq_thread(int irq, v=
oid *data)
>> =A0 =A0 =A0 u8 irq_reg[MAX8997_IRQ_GROUP_NR] =3D {};
>> =A0 =A0 =A0 u8 irq_src;
>> =A0 =A0 =A0 int ret;
>> - =A0 =A0 int i;
>> + =A0 =A0 int i, cur_irq;
>>
>> =A0 =A0 =A0 ret =3D max8997_read_reg(max8997->i2c, MAX8997_REG_INTSR=
C, &irq_src);
>> =A0 =A0 =A0 if (ret < 0) {
>> @@ -269,8 +270,10 @@ static irqreturn_t max8997_irq_thread(int irq, =
void *data)
>>
>> =A0 =A0 =A0 /* Report */
>> =A0 =A0 =A0 for (i =3D 0; i < MAX8997_IRQ_NR; i++) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (irq_reg[max8997_irqs[i].group] & max89=
97_irqs[i].mask)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 handle_nested_irq(max8997-=
>irq_base + i);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (irq_reg[max8997_irqs[i].group] & max89=
97_irqs[i].mask) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cur_irq =3D irq_find_mappi=
ng(max8997->irq_domain, i);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 handle_nested_irq(cur_irq)=
;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>
> Well, if you're using the linear mapping, then only actually allocate=
d irqs will
> have a mapping set up. =A0So the driver could simply do:
>
> =A0 =A0 =A0 =A0for (i =3D 0; i < MAX8997_IRQ_NR; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cur_irq =3D irq_find_mapping(max8997->=
irq_domain, i);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (cur_irq)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handle_nested_irq(cur_=
irq);
> =A0 =A0 =A0 =A0}

Thanks for the suggestion. I will include this change and repost this p=
atch.

Regards,
Thomas.

[...]
