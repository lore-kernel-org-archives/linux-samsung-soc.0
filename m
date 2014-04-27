From: YoungJun Cho <yj44.cho@samsung.com>
Subject: Re: [RFC v2 PATCH 08/14] drm/exynos: dsi: add driver data to support
 Exynos5420
Date: Sun, 27 Apr 2014 10:53:09 +0900
Message-ID: <535C6305.1030004@samsung.com>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1398083321-8668-9-git-send-email-yj44.cho@samsung.com>
 <535779D9.6010804@samsung.com> <5358678E.3020903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28462 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752659AbaD0BxO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Apr 2014 21:53:14 -0400
In-reply-to: <5358678E.3020903@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sachin.kamat@linaro.org, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com

Hi Andrzej,

On 04/24/2014 10:23 AM, YoungJun Cho wrote:
> Hi Andrzej,
>
> Thank you for comments.
>
> On 04/23/2014 05:29 PM, Andrzej Hajda wrote:
>> On 04/21/2014 02:28 PM, YoungJun Cho wrote:
>>> The offset of register DSIM_PLLTMR_REG in Exynos5420 is different
>>> from the one in Exynos4 SoC.
>>>
>>> In case of Exynos5420 SoC, there is no frequency band bit in
>>> DSIM_PLLCTRL_REG,
>>> and it uses DSIM_PHYCTRL_REG and DSIM_PHYTIMING*_REG instead.
>>> So this patch adds driver data to distinguish it.
>>>
>>> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
>>> Acked-by: Inki Dae <inki.dae@samsung.com>
>>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c |  101
>>> ++++++++++++++++++++++++-------
>>>   1 file changed, 80 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> index 179f2fa..fcd577f 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>> @@ -17,6 +17,7 @@
>>>
>>>   #include <linux/clk.h>
>>>   #include <linux/irq.h>
>>> +#include <linux/of_device.h>
>>>   #include <linux/phy/phy.h>
>>>   #include <linux/regulator/consumer.h>
>>>
>>> @@ -54,9 +55,12 @@
>>>
>>>   /* FIFO memory AC characteristic register */
>>>   #define DSIM_PLLCTRL_REG    0x4c    /* PLL control register */
>>> -#define DSIM_PLLTMR_REG        0x50    /* PLL timer register */
>>>   #define DSIM_PHYACCHR_REG    0x54    /* D-PHY AC characteristic
>>> register */
>>>   #define DSIM_PHYACCHR1_REG    0x58    /* D-PHY AC characteristic
>>> register1 */
>>> +#define DSIM_PHYCTRL_REG    0x5c
>>> +#define DSIM_PHYTIMING_REG    0x64
>>> +#define DSIM_PHYTIMING1_REG    0x68
>>> +#define DSIM_PHYTIMING2_REG    0x6c
>>>
>>>   /* DSIM_STATUS */
>>>   #define DSIM_STOP_STATE_DAT(x)        (((x) & 0xf) << 0)
>>> @@ -233,6 +237,12 @@ struct exynos_dsi_transfer {
>>>   #define DSIM_STATE_INITIALIZED        BIT(1)
>>>   #define DSIM_STATE_CMD_LPM        BIT(2)
>>>
>>> +struct exynos_dsi_driver_data {
>>> +    unsigned int plltmr_reg;
>>> +
>>> +    unsigned int has_freqband:1;
>>> +};
>>> +
>>>   struct exynos_dsi {
>>>       struct mipi_dsi_host dsi_host;
>>>       struct drm_connector connector;
>>> @@ -262,11 +272,39 @@ struct exynos_dsi {
>>>
>>>       spinlock_t transfer_lock; /* protects transfer_list */
>>>       struct list_head transfer_list;
>>> +
>>> +    struct exynos_dsi_driver_data *driver_data;
>>>   };
>>>
>>>   #define host_to_dsi(host) container_of(host, struct exynos_dsi,
>>> dsi_host)
>>>   #define connector_to_dsi(c) container_of(c, struct exynos_dsi,
>>> connector)
>>>
>>> +static struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
>>> +    .plltmr_reg = 0x50,
>>> +    .has_freqband = 1,
>>> +};
>>> +
>>> +static struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
>>> +    .plltmr_reg = 0x58,
>>> +};
>>> +
>>> +static struct of_device_id exynos_dsi_of_match[] = {
>>> +    { .compatible = "samsung,exynos4210-mipi-dsi",
>>> +      .data = &exynos4_dsi_driver_data },
>>> +    { .compatible = "samsung,exynos5420-mipi-dsi",
>>> +      .data = &exynos5_dsi_driver_data },
>>> +    { }
>>> +};
>>
>> I wonder if it wouldn't be better to use "samsung,exynos5410-mipi-dsi"
>> compatible and distinguish 5410 and 5420 by DSIM_VERSION register.
>>
>
> That's because I have only Exynos5420 SoC based target,
> so made DT for that and tested it only.
>
> But it seems to be no problem to use exynos5410 compatible at least
> for the dsi device :).
>
> I'll try.

I posted RFC v3 without this try.

Because there is no exynos5410 relevant DTS yet,
and making exynos5410 DTS is out of scope for this RFC.

Thank you.

Best regards YJ

>
>>
>>> +
>>> +static inline struct exynos_dsi_driver_data
>>> *exynos_dsi_get_driver_data(
>>> +                        struct platform_device *pdev)
>>> +{
>>> +    const struct of_device_id *of_id =
>>> +            of_match_device(exynos_dsi_of_match, &pdev->dev);
>>> +
>>> +    return (struct exynos_dsi_driver_data *)of_id->data;
>>> +}
>>> +
>>>   static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
>>>   {
>>>       if (wait_for_completion_timeout(&dsi->completed,
>>> msecs_to_jiffies(300)))
>>> @@ -340,14 +378,9 @@ static unsigned long
>>> exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
>>>   static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
>>>                       unsigned long freq)
>>>   {
>>> -    static const unsigned long freq_bands[] = {
>>> -        100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
>>> -        270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
>>> -        510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
>>> -        770 * MHZ, 870 * MHZ, 950 * MHZ,
>>> -    };
>>> +    struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
>>>       unsigned long fin, fout;
>>> -    int timeout, band;
>>> +    int timeout;
>>>       u8 p, s;
>>>       u16 m;
>>>       u32 reg;
>>> @@ -368,18 +401,30 @@ static unsigned long exynos_dsi_set_pll(struct
>>> exynos_dsi *dsi,
>>>               "failed to find PLL PMS for requested frequency\n");
>>>           return -EFAULT;
>>>       }
>>> +    dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d)\n", fout, p,
>>> m, s);
>>>
>>> -    for (band = 0; band < ARRAY_SIZE(freq_bands); ++band)
>>> -        if (fout < freq_bands[band])
>>> -            break;
>>> +    writel(500, dsi->reg_base + driver_data->plltmr_reg);
>>> +
>>> +    reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
>>> +
>>> +    if (driver_data->has_freqband) {
>>> +        static const unsigned long freq_bands[] = {
>>> +            100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
>>> +            270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
>>> +            510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
>>> +            770 * MHZ, 870 * MHZ, 950 * MHZ,
>>> +        };
>>> +        int band;
>>>
>>> -    dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d), band %d\n",
>>> fout,
>>> -        p, m, s, band);
>>> +        for (band = 0; band < ARRAY_SIZE(freq_bands); ++band)
>>> +            if (fout < freq_bands[band])
>>> +                break;
>>>
>>> -    writel(500, dsi->reg_base + DSIM_PLLTMR_REG);
>>> +        dev_dbg(dsi->dev, "band %d\n", band);
>>> +
>>> +        reg |= DSIM_FREQ_BAND(band);
>>> +    }
>>>
>>> -    reg = DSIM_FREQ_BAND(band) | DSIM_PLL_EN
>>> -            | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
>>>       writel(reg, dsi->reg_base + DSIM_PLLCTRL_REG);
>>>
>>>       timeout = 1000;
>>> @@ -391,6 +436,24 @@ static unsigned long exynos_dsi_set_pll(struct
>>> exynos_dsi *dsi,
>>>           reg = readl(dsi->reg_base + DSIM_STATUS_REG);
>>>       } while ((reg & DSIM_PLL_STABLE) == 0);
>>>
>>> +    if (!driver_data->has_freqband) {
>>
>> Could you explain why lack of freqband determines necessity of setting
>> PHY
>> registers, is this a kind of hardware setting dependency?
>
> Yes, there is H/W dependency.
> In Exynos4 SoCs, from 24th to 26th bits of DSIM_PLLCTRL register are
> for frequency band.
> But in Exynos5410 / 5420 SoCs, those bits are used for DpDnSwap relevant
> things.
> So PHY ctrl and timing registers are required instead for it.
>
>>
>>> +        /* b dphy ctrl */
>>> +        reg = 0x0af & 0x1ff;
>>> +        writel(reg, dsi->reg_base + DSIM_PHYCTRL_REG);
>>> +
>>> +        /* phy timing */
>>> +        reg = 0x06 << 8 | 0x0b;
>>> +        writel(reg, dsi->reg_base + DSIM_PHYTIMING_REG);
>>> +
>>> +        /* phy timing 1 */
>>> +        reg = 0x07 << 24 | 0x27 << 16 | 0x0d << 8 | 0x08;
>>> +        writel(reg, dsi->reg_base + DSIM_PHYTIMING1_REG);
>>> +
>>> +        /* phy timing 2 */
>>> +        reg = 0x09 << 16 | 0x0d << 8 | 0x0b;
>>> +        writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
>>> +    }
>>> +
>>
>> Please use macros if possible instead of magic numbers.
>
> Right, I'll fix.
>
>>
>> As I wrote in comment for earlier patch it would be better to separate
>> setting PHY registers
>> from clock registers.
>>
>
> Ok, I'll implement new function
> and call it just after exynos_dsi_wait_for_reset().
>
> Thank you.
> Best regards YJ
>
>>>       return fout;
>>>   }
>>>
>>> @@ -1412,6 +1475,7 @@ static int exynos_dsi_probe(struct
>>> platform_device *pdev)
>>>       dsi->dsi_host.dev = &pdev->dev;
>>>
>>>       dsi->dev = &pdev->dev;
>>> +    dsi->driver_data = exynos_dsi_get_driver_data(pdev);
>>>
>>>       ret = exynos_dsi_parse_dt(dsi);
>>>       if (ret)
>>> @@ -1516,11 +1580,6 @@ static const struct dev_pm_ops
>>> exynos_dsi_pm_ops = {
>>>       SET_SYSTEM_SLEEP_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume)
>>>   };
>>>
>>> -static struct of_device_id exynos_dsi_of_match[] = {
>>> -    { .compatible = "samsung,exynos4210-mipi-dsi" },
>>> -    { }
>>> -};
>>> -
>>>   struct platform_driver dsi_driver = {
>>>       .probe = exynos_dsi_probe,
>>>       .remove = exynos_dsi_remove,
>>
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
