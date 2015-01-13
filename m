From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 1/6] ARM: Exynos: add support for sub-power domains
Date: Tue, 13 Jan 2015 11:53:59 +0100
Message-ID: <54B4F947.1000704@samsung.com>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
 <1421141991-15155-2-git-send-email-m.szyprowski@samsung.com>
 <CAPDyKFpVuoKN0EgZG2qso3GbYZFqEMet2Ca06J7u8YEO=-JfCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26111 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856AbbAMKyE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jan 2015 05:54:04 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NI400FW83STOZ90@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Jan 2015 10:58:05 +0000 (GMT)
In-reply-to: <CAPDyKFpVuoKN0EgZG2qso3GbYZFqEMet2Ca06J7u8YEO=-JfCg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>

Hello,

On 2015-01-13 11:44, Ulf Hansson wrote:
> On 13 January 2015 at 10:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> This patch adds support for making one power domain a sub-domain of
>> other domain. This is useful for modeling power dependences for devices
>> like TV Mixer or Camera ISP, which needs to have more than one power
>> domain enabled to be operational.
>>
>> Based on previous work by Amit Daniel Kachhap <amit.daniel@samsung.com>.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   .../bindings/arm/exynos/power_domain.txt           |  2 ++
>>   arch/arm/mach-exynos/pm_domains.c                  | 28 ++++++++++++++++++++++
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
>> index f4445e5..28918a9 100644
>> --- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
>> +++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
>> @@ -22,6 +22,8 @@ Optional Properties:
>>          - pclkN, clkN: Pairs of parent of input clock and input clock to the
>>                  devices in this power domain. Maximum of 4 pairs (N = 0 to 3)
>>                  are supported currently.
>> +- power-domains: generic power domain binding pointing to a master power domain
>> +                that the given domain is a part of
> I would prefer this to be documented as a generic way to configure
> power domain parents, in
> Documentation/devicetree/bindings/power/power_domain.txt.

Well, right now it is a specific feature of exynos power domains, 
however if you
want I can add a note in 
Documentation/devicetree/bindings/power/power_domain.txt
on defining child-parent relation. However it will be still up to the 
power domain
providers to implement support for it.

>>   Node of a device using power domains must have a power-domains property
>>   defined with a phandle to respective power domain.
>> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
>> index 20f2671..37266a8 100644
>> --- a/arch/arm/mach-exynos/pm_domains.c
>> +++ b/arch/arm/mach-exynos/pm_domains.c
>> @@ -161,6 +161,34 @@ no_clk:
>>                  of_genpd_add_provider_simple(np, &pd->pd);
>>          }
>>
>> +       /* Assign the child power domains to their parents */
>> +       for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
>> +               struct generic_pm_domain *child_domain, *parent_domain;
>> +               struct of_phandle_args args;
>> +
>> +               args.np = np;
>> +               args.args_count = 0;
>> +               child_domain = of_genpd_get_from_provider(&args);
>> +               if (!child_domain)
>> +                       continue;
>> +
>> +               if (of_parse_phandle_with_args(np, "power-domains",
>> +                                        "#power-domain-cells", 0, &args) != 0)
>> +                       continue;
>> +
>> +               parent_domain = of_genpd_get_from_provider(&args);
>> +               if (!parent_domain)
>> +                       continue;
>> +
>> +               if (pm_genpd_add_subdomain(parent_domain, child_domain))
>> +                       pr_warn("%s failed to add subdomain: %s\n",
>> +                               parent_domain->name, child_domain->name);
>> +               else
>> +                       pr_info("%s has as child subdomain: %s.\n",
>> +                               parent_domain->name, child_domain->name);
>> +               of_node_put(np);
>> +       }
> How do you maintain the order of how domains are being initialized?
> For example, don't you need to initialize all "parents" prior their
> children?

All power domains, which have been added to the system were already 
initialized in
the previous loop (executed before the added code). Once all 
'exynos4210-pd' gets
initialized, they are scanned for child-parent relation.

>
>> +
>>          return 0;
>>   }
>>   arch_initcall(exynos4_pm_init_power_domain);
>> --
>> 1.9.2
>>
> I noticed this patch wasn't sent to linux-arm, I guess it should?

Yes, I forgot about that. I will add it in the next version.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
