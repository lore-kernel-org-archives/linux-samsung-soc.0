From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 2/5] drm/exynos: use regmap interface to set hdmiphy
 control bit in pmu
Date: Fri, 4 Apr 2014 07:51:35 +0530
Message-ID: <CAPdUM4NsH-Mc3+ejdvLfgtYym3j3mUBYnKZWXiTFNb2am8gUQA@mail.gmail.com>
References: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
	<1396458826-3051-3-git-send-email-rahul.sharma@samsung.com>
	<CAAQKjZN8fCGsOXZ6xf1KMH8oezi8f1C29HcDKO0cWq-2kyg5rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f178.google.com ([209.85.128.178]:45177 "EHLO
	mail-ve0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751797AbaDDCVg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Apr 2014 22:21:36 -0400
Received: by mail-ve0-f178.google.com with SMTP id jw12so971906veb.37
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2014 19:21:35 -0700 (PDT)
In-Reply-To: <CAAQKjZN8fCGsOXZ6xf1KMH8oezi8f1C29HcDKO0cWq-2kyg5rQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>

Thanks Inki,

On 3 April 2014 21:23, Inki Dae <inki.dae@samsung.com> wrote:
> Hi Rahul,
>
> Thanks for contributions.
>
> 2014-04-03 2:13 GMT+09:00 Rahul Sharma <rahul.sharma@samsung.com>:
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Hdmiphy control bit needs to be set before setting the resolution
>> to hdmi hardware. This was handled using dummy hdmiphy clock which
>> is removed now.
>>
>> PMU is already defined as system controller for exynos SoC. Registers
>> of PMU are accessed using regmap interfaces.
>>
>> Devicetree binding document for hdmi is also updated.
>>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> ---
>>  .../devicetree/bindings/video/exynos_hdmi.txt      |    2 ++
>>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   17 +++++++++++++++++
>>  drivers/gpu/drm/exynos/regs-hdmi.h                 |    4 ++++
>>  3 files changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>> index f9187a2..243a499 100644
>> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>> @@ -27,6 +27,7 @@ Required properties:
>>         "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
>>  - ddc: phandle to the hdmi ddc node
>>  - phy: phandle to the hdmi phy node
>> +- samsung,syscon-phandle: phandle for system controller node for PMU.
>>
>>  Example:
>>
>> @@ -37,4 +38,5 @@ Example:
>>                 hpd-gpio = <&gpx3 7 1>;
>>                 ddc = <&hdmi_ddc_node>;
>>                 phy = <&hdmi_phy_node>;
>> +               samsung,syscon-phandle = <&pmu_system_controller>;
>
> System regiters could be controlled by phy framework, drivers/phy/*
> with 'phys' property so I think we would need to consider the phy
> framework. Especially, this patch adds a new property,
> samsung,syscon-phandle so I'm careful in merging - I'm not sure that
> we really need this property, and we couldn't really use existing phys
> property. So let's have more times for reviews.
>

I will do that. But still "syscon-phandle" property needs to be added
to hdmi phy bindings. Very similar to USB phys in
Documentation/devicetree/bindings/phy/samsung-phy.txt. I hope
that should be fine.

Please review my other patches also.

Regards,
Rahul Sharma

> Thanks,
> Inki Dae
>
>>         };
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> index 23abfa0..47b8c06 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -36,6 +36,8 @@
>>  #include <linux/i2c.h>
>>  #include <linux/of_gpio.h>
>>  #include <linux/hdmi.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/regmap.h>
>>
>>  #include <drm/exynos_drm.h>
>>
>> @@ -194,6 +196,7 @@ struct hdmi_context {
>>         struct hdmi_resources           res;
>>
>>         int                             hpd_gpio;
>> +       struct regmap                   *pmureg;
>>
>>         enum hdmi_type                  type;
>>  };
>> @@ -1853,6 +1856,9 @@ static void hdmi_poweron(struct exynos_drm_display *display)
>>         if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
>>                 DRM_DEBUG_KMS("failed to enable regulator bulk\n");
>>
>> +       /* set pmu hdmiphy control bit to enable hdmiphy */
>> +       regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
>> +                       PMU_HDMI_PHY_ENABLE_BIT, 1);
>>         clk_prepare_enable(res->hdmi);
>>         clk_prepare_enable(res->sclk_hdmi);
>>
>> @@ -1879,6 +1885,10 @@ static void hdmi_poweroff(struct exynos_drm_display *display)
>>
>>         clk_disable_unprepare(res->sclk_hdmi);
>>         clk_disable_unprepare(res->hdmi);
>> +       /* reset pmu hdmiphy control bit to disable hdmiphy */
>> +       regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
>> +                       PMU_HDMI_PHY_ENABLE_BIT, 0);
>> +
>>         regulator_bulk_disable(res->regul_count, res->regul_bulk);
>>
>>         pm_runtime_put_sync(hdata->dev);
>> @@ -2128,6 +2138,13 @@ static int hdmi_probe(struct platform_device *pdev)
>>                 goto err_hdmiphy;
>>         }
>>
>> +       hdata->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
>> +                       "samsung,syscon-phandle");
>> +       if (IS_ERR_OR_NULL(hdata->pmureg)) {
>> +               DRM_ERROR("syscon regmap lookup failed.\n");
>> +               goto err_hdmiphy;
>> +       }
>> +
>>         pm_runtime_enable(dev);
>>
>>         hdmi_display.ctx = hdata;
>> diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
>> index ef1b3eb..9811d6f 100644
>> --- a/drivers/gpu/drm/exynos/regs-hdmi.h
>> +++ b/drivers/gpu/drm/exynos/regs-hdmi.h
>> @@ -578,4 +578,8 @@
>>  #define HDMI_TG_VACT_ST4_H             HDMI_TG_BASE(0x0074)
>>  #define HDMI_TG_3D                     HDMI_TG_BASE(0x00F0)
>>
>> +/* PMU Registers for PHY */
>> +#define PMU_HDMI_PHY_CONTROL           0x700
>> +#define PMU_HDMI_PHY_ENABLE_BIT        (1<<0)
>> +
>>  #endif /* SAMSUNG_REGS_HDMI_H */
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
