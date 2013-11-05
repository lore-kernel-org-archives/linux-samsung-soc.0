From: Tarek Dakhran <t.dakhran-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] clk: exynos5410: register clocks using common clock
 framework
Date: Tue, 05 Nov 2013 13:15:43 +0400
Message-ID: <5278B73F.1090508@samsung.com>
References: <1381763305-7085-1-git-send-email-v.tyrtov@samsung.com>
 <1381763305-7085-3-git-send-email-v.tyrtov@samsung.com>
 <1421095.b3lQaz2kV9@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1421095.b3lQaz2kV9@flatron>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vyacheslav Tyrtov <v.tyrtov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Naour Romain <romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 01.11.2013 20:58, Tomasz Figa wrote:
> Hi,
>
> On Monday 14 of October 2013 19:08:23 Vyacheslav Tyrtov wrote:
>> From: Tarek Dakhran <t.dakhran-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> The EXYNOS5410 clocks are statically listed and registered
>> using the Samsung specific common clock helper functions.
>>
>> Signed-off-by: Tarek Dakhran <t.dakhran-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Vyacheslav Tyrtov <v.tyrtov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   .../devicetree/bindings/clock/exynos5410-clock.txt |  37 +++
>>   drivers/clk/samsung/Makefile                       |   1 +
>>   drivers/clk/samsung/clk-exynos5410.c               | 251
>> +++++++++++++++++++++ include/dt-bindings/clock/exynos5410.h
>>   | 175 ++++++++++++++ 4 files changed, 464 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/clock/exynos5410-clock.txt create
>> mode 100644 drivers/clk/samsung/clk-exynos5410.c
>>   create mode 100644 include/dt-bindings/clock/exynos5410.h
> The driver looks pretty good now, thanks for addressing my comments to
> previous version. There are still few issues remaining, though. Please see
> my comments inline.
>
> [snip]
>> diff --git a/drivers/clk/samsung/clk-exynos5410.c
>> b/drivers/clk/samsung/clk-exynos5410.c new file mode 100644
>> index 0000000..c5eba08
>> --- /dev/null
>> +++ b/drivers/clk/samsung/clk-exynos5410.c
> [snip]
>> +static struct of_device_id ext_clk_match[] __initdata = {
>> +	{ .compatible = "samsung,clock-oscclk", .data = (void *)0, },
>> +	{ },
>> +};
> I don't see anything in binding documentation mentioning this compatible
> value. Anyway, since there is already a generic binding for fixed rate
> clocks, this shouldn't be needed at all.
>
>> +
>> +/* register exynos5410 clocks */
>> +static void __init exynos5410_clk_init(struct device_node *np)
>> +{
>> +	void __iomem *reg_base;
>> +
>> +	reg_base = of_iomap(np, 0);
>> +	if (!reg_base)
>> +		panic("%s: failed to map registers\n", __func__);
>> +
>> +	samsung_clk_init(np, reg_base, CLK_NR_CLKS,
>> +			exynos5410_clk_regs,
> ARRAY_SIZE(exynos5410_clk_regs),
>> +			NULL, 0);
>> +	samsung_clk_of_register_fixed_ext(exynos5410_frt_ext_clks,
>> +			ARRAY_SIZE(exynos5410_frt_ext_clks),
>> +			ext_clk_match);
> This call could be dropped after moving to generic fixed rate clock
> bindings.
>
> Best regards,
> Tomasz

Already done. Will be added in patch v3.


Thank you for comments, Tomasz.

Best regards,
     Tarek Dakhran
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
