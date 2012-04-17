From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v4 1/2] mfd: add irq domain support for max8997 interrupts
Date: Tue, 17 Apr 2012 23:41:51 +0530
Message-ID: <CAJuYYwRa-_0HWeSuOgAT20dCCDdg=NBruQ9_m28TFZkXMRJhaw@mail.gmail.com>
References: <1332582590-16382-1-git-send-email-thomas.abraham@linaro.org>
	<1332582590-16382-2-git-send-email-thomas.abraham@linaro.org>
	<20120330220619.334AC3E054E@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:35969 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752661Ab2DQSLw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 14:11:52 -0400
Received: by vbbff1 with SMTP id ff1so4371582vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Apr 2012 11:11:51 -0700 (PDT)
In-Reply-To: <20120330220619.334AC3E054E@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 31 March 2012 03:36, Grant Likely <grant.likely@secretlab.ca> wrote:
> On Sat, 24 Mar 2012 15:19:49 +0530, Thomas Abraham <thomas.abraham@li=
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
>> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> Acked-by: Grant Likely <grant.likely@secretlab.ca>
>> ---
>> =A0arch/arm/mach-exynos/mach-nuri.c =A0 =A0| =A0 =A04 --
>> =A0arch/arm/mach-exynos/mach-origen.c =A0| =A0 =A01 -
>> =A0drivers/mfd/max8997-irq.c =A0 =A0 =A0 =A0 =A0 | =A0 61 ++++++++++=
++++++++++--------------
>> =A0drivers/mfd/max8997.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -
>> =A0include/linux/mfd/max8997-private.h | =A0 =A04 ++-
>> =A0include/linux/mfd/max8997.h =A0 =A0 =A0 =A0 | =A0 =A01 -
>> =A06 files changed, 39 insertions(+), 33 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos=
/mach-nuri.c
>> index 7ac81ce..b21d85d 100644
>> --- a/arch/arm/mach-exynos/mach-nuri.c
>> +++ b/arch/arm/mach-exynos/mach-nuri.c
>> @@ -1077,12 +1077,8 @@ static struct platform_device nuri_max8903_de=
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
>> index 827cb99..d3b2e9d 100644
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
>> index 09274cf..00390a1 100644
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
>> =A0}
>
> Haha, this is kind of bogus now. =A0There are only two users of this
> function, and *both* of them already have the irq_data pointer.
> Instead of this, delete this function entirely and make each caller
> derefernce max8997_irqs directly:
>
> =A0 =A0 =A0 =A0const struct max8997_irq_data *irq_data =3D &max8997_i=
rqs[data->hwirq];
>
> Otherwise, looks good. =A0After fixing you can add my:
>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>

Hi Grant,

Thanks for the suggestion. I have modified the code accordingly and
included your ack.

Regards,
Thomas.
