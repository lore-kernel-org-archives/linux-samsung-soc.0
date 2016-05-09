From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH 3/6] drm/exynos/hdmi: expose HDMI-PHY clock as pipeline clock
Date: Mon, 9 May 2016 22:25:50 +0900
Message-ID: <CAAQKjZP9KXz0bNaPnPTHq-CtetrmbmasD9-SEg82FcwZFEZ_1Q@mail.gmail.com>
References: <1458739562-32327-1-git-send-email-a.hajda@samsung.com>
 <1458739562-32327-4-git-send-email-a.hajda@samsung.com> <5729C64A.3020708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:34972 "EHLO
	mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751282AbcEIN0b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 May 2016 09:26:31 -0400
Received: by mail-yw0-f193.google.com with SMTP id v81so23489760ywa.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 May 2016 06:26:31 -0700 (PDT)
In-Reply-To: <5729C64A.3020708@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Andrzej,



2016-05-04 18:52 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
> Hi Inki,
>
> It looks like this patch felt through the cracks.
> It is a part of "drm/exynos: add pipeline clock support" patchset.

Ah, sorry.

> Other patches from the patchset were taken already.
> Could you queue it to next pull request?
>

Got it.

Thanks,
Inki Dae

> Regards
> Andrzej
>
> On 03/23/2016 02:25 PM, Andrzej Hajda wrote:
>> HDMI-PHY clock should be accessible from other components in the pipeline.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 67 ++++++++++++++++++++++++++----------
>>  1 file changed, 48 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> index 49a5902..0d1c2f0 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -146,6 +146,7 @@ struct hdmi_context {
>>       struct clk                      **clk_muxes;
>>       struct regulator_bulk_data      regul_bulk[ARRAY_SIZE(supply)];
>>       struct regulator                *reg_hdmi_en;
>> +     struct exynos_drm_clk           phy_clk;
>>  };
>>
>>  static inline struct hdmi_context *encoder_to_hdmi(struct drm_encoder *e)
>> @@ -1448,7 +1449,6 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
>>
>>  static void hdmi_conf_apply(struct hdmi_context *hdata)
>>  {
>> -     hdmiphy_conf_apply(hdata);
>>       hdmi_start(hdata, false);
>>       hdmi_conf_init(hdata);
>>       hdmi_audio_init(hdata);
>> @@ -1481,10 +1481,8 @@ static void hdmi_set_refclk(struct hdmi_context *hdata, bool on)
>>                          SYSREG_HDMI_REFCLK_INT_CLK, on ? ~0 : 0);
>>  }
>>
>> -static void hdmi_enable(struct drm_encoder *encoder)
>> +static void hdmiphy_enable(struct hdmi_context *hdata)
>>  {
>> -     struct hdmi_context *hdata = encoder_to_hdmi(encoder);
>> -
>>       if (hdata->powered)
>>               return;
>>
>> @@ -1500,11 +1498,40 @@ static void hdmi_enable(struct drm_encoder *encoder)
>>
>>       hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0, HDMI_PHY_POWER_OFF_EN);
>>
>> -     hdmi_conf_apply(hdata);
>> +     hdmiphy_conf_apply(hdata);
>>
>>       hdata->powered = true;
>>  }
>>
>> +static void hdmiphy_disable(struct hdmi_context *hdata)
>> +{
>> +     if (!hdata->powered)
>> +             return;
>> +
>> +     hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
>> +
>> +     hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0, HDMI_PHY_POWER_OFF_EN);
>> +
>> +     hdmi_set_refclk(hdata, false);
>> +
>> +     regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
>> +                     PMU_HDMI_PHY_ENABLE_BIT, 0);
>> +
>> +     regulator_bulk_disable(ARRAY_SIZE(supply), hdata->regul_bulk);
>> +
>> +     pm_runtime_put_sync(hdata->dev);
>> +
>> +     hdata->powered = false;
>> +}
>> +
>> +static void hdmi_enable(struct drm_encoder *encoder)
>> +{
>> +     struct hdmi_context *hdata = encoder_to_hdmi(encoder);
>> +
>> +     hdmiphy_enable(hdata);
>> +     hdmi_conf_apply(hdata);
>> +}
>> +
>>  static void hdmi_disable(struct drm_encoder *encoder)
>>  {
>>       struct hdmi_context *hdata = encoder_to_hdmi(encoder);
>> @@ -1528,22 +1555,9 @@ static void hdmi_disable(struct drm_encoder *encoder)
>>       if (funcs && funcs->disable)
>>               (*funcs->disable)(crtc);
>>
>> -     hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
>> -
>>       cancel_delayed_work(&hdata->hotplug_work);
>>
>> -     hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0, HDMI_PHY_POWER_OFF_EN);
>> -
>> -     hdmi_set_refclk(hdata, false);
>> -
>> -     regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
>> -                     PMU_HDMI_PHY_ENABLE_BIT, 0);
>> -
>> -     regulator_bulk_disable(ARRAY_SIZE(supply), hdata->regul_bulk);
>> -
>> -     pm_runtime_put_sync(hdata->dev);
>> -
>> -     hdata->powered = false;
>> +     hdmiphy_disable(hdata);
>>  }
>>
>>  static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
>> @@ -1627,6 +1641,17 @@ static int hdmi_clk_init(struct hdmi_context *hdata)
>>       return hdmi_clks_get(hdata, &drv_data->clk_muxes, hdata->clk_muxes);
>>  }
>>
>> +static void hdmiphy_clk_enable(struct exynos_drm_clk *clk, bool enable)
>> +{
>> +     struct hdmi_context *hdata = container_of(clk, struct hdmi_context,
>> +                                               phy_clk);
>> +
>> +     if (enable)
>> +             hdmiphy_enable(hdata);
>> +     else
>> +             hdmiphy_disable(hdata);
>> +}
>> +
>>  static int hdmi_resources_init(struct hdmi_context *hdata)
>>  {
>>       struct device *dev = hdata->dev;
>> @@ -1710,6 +1735,10 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
>>       if (pipe < 0)
>>               return pipe;
>>
>> +     hdata->phy_clk.enable = hdmiphy_clk_enable;
>> +
>> +     exynos_drm_crtc_from_pipe(drm_dev, pipe)->pipe_clk = &hdata->phy_clk;
>> +
>>       encoder->possible_crtcs = 1 << pipe;
>>
>>       DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
