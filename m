From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 2/2] ARM: Exynos: Hook up power domains to generic
 power domain infrastructure
Date: Mon, 9 Jan 2012 18:53:05 +0530
Message-ID: <CAJuYYwSOcAtiV3fGOyzOD0eZiuf-T8wai13HpqNNDk3TXuP5Bw@mail.gmail.com>
References: <1325931055-14486-1-git-send-email-thomas.abraham@linaro.org>
	<1325931055-14486-3-git-send-email-thomas.abraham@linaro.org>
	<CAH9JG2WWLrEkEMQp5m0itk7Sw3HRJ8CpDBrj3trjGPCv6qYHkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:36166 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753671Ab2AINXG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jan 2012 08:23:06 -0500
In-Reply-To: <CAH9JG2WWLrEkEMQp5m0itk7Sw3HRJ8CpDBrj3trjGPCv6qYHkw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, s.nawrocki@samsung.com, patches@linaro.org, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>

Dear Mr. Park.

On 9 January 2012 05:57, Kyungmin Park <kyungmin.park@samsung.com> wrot=
e:
[...]

>> + * Exynos4 specific wrapper around the generic power domain
>> + */
>> +struct exynos4_pm_domain {
>> + =A0 =A0 void __iomem *base;
>> + =A0 =A0 char const *name;
>> + =A0 =A0 bool is_off;
>> + =A0 =A0 struct generic_pm_domain pd;
>> +};
> Even though you tested it at exynos4, we already know exynos5 will be=
 used soon.
> so start to use the exynos prefix if possible.

Ok. I will change exynos4 to exynos.

[...]

>> +
>> +static __init int exynos4_pm_init_power_domain(void)
>> +{
>> + =A0 =A0 int idx;
>> + =A0 =A0 struct device_node *np;
> The np is only used at CONFIG_ON.

Ok. I will rework this.

>> +
>> +#ifdef CONFIG_OF
>> + =A0 =A0 if (!of_have_populated_dt())
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto no_dt;
>> +
>> + =A0 =A0 for_each_compatible_node(np, NULL, "samsung,exynos4210-pd"=
) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 struct exynos4_pm_domain *pd;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 pd =3D kzalloc(sizeof(*pd), GFP_KERNEL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!pd) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("exynos4_pm_init_po=
wer_domain: failed to "
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "allocate memory for domain\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (of_get_property(np, "samsung,exynos421=
0-pd-off", NULL))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pd->is_off =3D true;
>> + =A0 =A0 =A0 =A0 =A0 =A0 pd->name =3D np->name;
>> + =A0 =A0 =A0 =A0 =A0 =A0 pd->base =3D of_iomap(np, 0);
>> + =A0 =A0 =A0 =A0 =A0 =A0 pd->pd.power_off =3D exynos4_pd_power_off;
>> + =A0 =A0 =A0 =A0 =A0 =A0 pd->pd.power_on =3D exynos4_pd_power_on;
>> + =A0 =A0 =A0 =A0 =A0 =A0 pd->pd.of_node =3D np;
>> + =A0 =A0 =A0 =A0 =A0 =A0 pm_genpd_init(&pd->pd, NULL, false);
>> + =A0 =A0 }
>> + =A0 =A0 return 0;
>> +#endif /* CONFIG_OF */
>> +
>> + no_dt:
> You should add the "#endif /* CONFIG_OF */ since no_dt is used at
> CONFIG_OF case.

Ok.

>> + =A0 =A0 for (idx =3D 0; idx < ARRAY_SIZE(exynos4_pm_domains); idx+=
+)
>> + =A0 =A0 =A0 =A0 =A0 =A0 pm_genpd_init(&exynos4_pm_domains[idx]->pd=
, NULL,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4_pm=
_domains[idx]->is_off);
>> +

[...]

>> +#ifdef CONFIG_S5P_DEV_CSIS0
>> + =A0 =A0 if (pm_genpd_add_device(&exynos4_pd_cam.pd, &s5p_device_mi=
pi_csis0.dev))
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_info("error in adding csis0 to cam powe=
r domain\n");
>> +#endif
> Also need to add CSIS1 as Sylwester mentioned.

Ok. I will add CSIS1.

Thanks for your review.

Regards,
Thomas.
