From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 2/2] ARM: Exynos: Hook up power domains to generic
 power domain infrastructure
Date: Mon, 9 Jan 2012 18:49:12 +0530
Message-ID: <CAJuYYwQaGvAYnLY9uH91uEkVb82X5usQywpYGG36EyjHdQquoQ@mail.gmail.com>
References: <1325931055-14486-1-git-send-email-thomas.abraham@linaro.org>
	<1325931055-14486-3-git-send-email-thomas.abraham@linaro.org>
	<4F085A4E.3010200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:49742 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752996Ab2AINTN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jan 2012 08:19:13 -0500
In-Reply-To: <4F085A4E.3010200@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, rob.herring@calxeda.com, rjw@sisk.pl, kyungmin.park@samsung.com, s.nawrocki@samsung.com, linux-arm-kernel@lists.infradead.org

Hi Sylwester.

On 7 January 2012 20:14, Sylwester Nawrocki <snjw23@gmail.com> wrote:
[...]

>> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exyno=
s/pm_domains.c
>> new file mode 100644
>> index 0000000..95a7c55
>> --- /dev/null
>> +++ b/arch/arm/mach-exynos/pm_domains.c
>> @@ -0,0 +1,183 @@
>> +/*
>> + * Exynos4 Generic power domain support.
>> + *
>> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
>
> 2012 ?

Ok. I will change this.

>
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com

[...]

>> +static int exynos4_pd_power(struct generic_pm_domain *domain, bool =
power_on)
>> +{
>> + =A0 =A0 struct exynos4_pm_domain *pd;
>> + =A0 =A0 void __iomem *base;
>> + =A0 =A0 u32 timeout, pwr;
>> + =A0 =A0 char *op;
>> +
>> + =A0 =A0 pd =3D container_of(domain, struct exynos4_pm_domain, pd);
>> + =A0 =A0 base =3D pd->base;
>> +
>> + =A0 =A0 pwr =3D (power_on) ? S5P_INT_LOCAL_PWR_EN : 0;
>
> Is there any value in parentheses around 'power_on' ?

No. I will remove the parentheses around 'power_on'.

>
>> + =A0 =A0 __raw_writel(pwr, base);
>> +
>> + =A0 =A0 /* Wait max 1ms */
>> + =A0 =A0 timeout =3D 10;
>> +
>> + =A0 =A0 while ((__raw_readl(base + 0x4)& =A0S5P_INT_LOCAL_PWR_EN) =
!=3D pwr) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!timeout) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 op =3D (power_on) ? "enabl=
e" : "disable";
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Power domain %s %s=
 failed\n", op, domain->name);
>
> How about just:
> =A0 =A0 =A0 pr_err("%s power domain state change (%d) failed\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0domain->name, power_on);
> ?

=46rom the message it will not be clear which state change failed. The
state (enable/disable) would be helpful.



>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ETIMEDOUT;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 timeout--;
>> + =A0 =A0 =A0 =A0 =A0 =A0 cpu_relax();
>
> Does cpu_relax() make any difference here ?

I need to check on this.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 usleep_range(80, 100);
>> + =A0 =A0 }
>> + =A0 =A0 return 0;
>> +}
>> +

[...]

>> + =A0 =A0 =A0 =A0 =A0 =A0 pd =3D kzalloc(sizeof(*pd), GFP_KERNEL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!pd) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("exynos4_pm_init_po=
wer_domain: failed to "
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "allocate memory for domain\n");
>
> nit: what about:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_err("%s: failed to =
allocate memory for domain\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__func=
__);
> ?

Yes. This is better. I will change this.

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +

[...]

>> +#ifdef CONFIG_S5P_DEV_CSIS0
>> + =A0 =A0 if (pm_genpd_add_device(&exynos4_pd_cam.pd,&s5p_device_mip=
i_csis0.dev))
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_info("error in adding csis0 to cam powe=
r domain\n");
>> +#endif
>
> Could you add CSIS1 as well ? Some boards will be using both MIPI-CSI=
 receivers.

Ok. I will add CSIS1 here.

Thanks for your review.

Regards,
Thomas.

[...]
