From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V3 1/7] drm/exynos: Support DP CLKCON register in FIMD driver
Date: Fri, 27 Jun 2014 17:18:48 +0530
Message-ID: <CAEC9eQMXEEq_VBiZY+BHUuVWvbi7q4MkbbQ-XkcigtZBdgwO9w@mail.gmail.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
	<1403863946-15492-2-git-send-email-ajaykumar.rs@samsung.com>
	<53AD53E4.2020706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:48516 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752826AbaF0Lst (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 07:48:49 -0400
In-Reply-To: <53AD53E4.2020706@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>

Hi Andrej,

On Fri, Jun 27, 2014 at 4:52 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> Hi Ajay,
>
> +CC DT
>
> On 06/27/2014 12:12 PM, Ajay Kumar wrote:
>> Add the missing setting for DP CLKCON register.
>>
>> This register is present on Exynos5 based FIMD controllers,
>> and needs to be set if we are using DP.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   23 ++++++++++++++++++++
>>  include/video/samsung_fimd.h                       |    4 ++++
>>  3 files changed, 28 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> index 2dad41b..12f3d7a 100644
>> --- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
>> @@ -41,6 +41,7 @@ Optional Properties:
>>  - samsung,power-domain: a phandle to FIMD power domain node.
>>  - samsung,invert-vden: video enable signal is inverted
>>  - samsung,invert-vclk: video clock signal is inverted
>> +- samsung,output-type: Type of display output interface(DPI=0, DSI=1, DP=2)
>
> There is no point in introducing this property. Exynos DRM have already
> logic which creates pipeline: fimd --> DPI|DSI|DP, this logic can be
> reused to determine display type. It can be done even without any
> additional callbacks, just by checking if there is connector of
> DRM_MODE_CONNECTOR_eDP type connected to fimd.
The mapping between crtc(struct exynos_drm_manager) and encoder(struct
exynos_drm_display)
in exynos drm happens by matching the exynos_drm_output_type variable in each
structure.
exynos_drm_output_type supports 3 types: LCD, HDMI and VIDI.
FIMD statically chooses EXYNOS_DISPLAY_TYPE_LCD as the output type,
and both DP and MIPI statically choose the same enum EXYNOS_DISPLAY_TYPE_LCD,
as output type.
So, we cannot use that logic to differentiate between DP/MIPI DSI.

Also, checking based on connector type doesn't hold good.
The connector type will be DRM_MODE_CONNECTOR_LVDS in case of
DP->LVDS or MIPI->LVDS panels!

Thanks and regards,
Ajay Kumar

>
> Regards
> Andrzej
>
>>  - display-timings: timing settings for FIMD, as described in document [1].
>>               Can be used in case timings cannot be provided otherwise
>>               or to override timings provided by the panel.
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index 33161ad..aa74e90 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -72,6 +72,7 @@ struct fimd_driver_data {
>>       unsigned int has_shadowcon:1;
>>       unsigned int has_clksel:1;
>>       unsigned int has_limited_fmt:1;
>> +     unsigned int has_dp_clkcon:1;
>>  };
>>
>>  static struct fimd_driver_data s3c64xx_fimd_driver_data = {
>> @@ -88,6 +89,13 @@ static struct fimd_driver_data exynos4_fimd_driver_data = {
>>  static struct fimd_driver_data exynos5_fimd_driver_data = {
>>       .timing_base = 0x20000,
>>       .has_shadowcon = 1,
>> +     .has_dp_clkcon = 1,
>> +};
>> +
>> +enum exynos_fimd_output_type {
>> +     EXYNOS_FIMD_OUTPUT_DPI,
>> +     EXYNOS_FIMD_OUTPUT_DSI,
>> +     EXYNOS_FIMD_OUTPUT_DP,
>>  };
>>
>>  struct fimd_win_data {
>> @@ -125,6 +133,8 @@ struct fimd_context {
>>       struct exynos_drm_panel_info panel;
>>       struct fimd_driver_data *driver_data;
>>       struct exynos_drm_display *display;
>> +
>> +     enum exynos_fimd_output_type exynos_fimd_output_type;
>>  };
>>
>>  static const struct of_device_id fimd_driver_dt_match[] = {
>> @@ -331,6 +341,10 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>>       if (clkdiv > 1)
>>               val |= VIDCON0_CLKVAL_F(clkdiv - 1) | VIDCON0_CLKDIR;
>>
>> +     if (ctx->driver_data->has_dp_clkcon &&
>> +             ctx->exynos_fimd_output_type == EXYNOS_FIMD_OUTPUT_DP)
>> +             writel(DP_CLK_ENABLE, ctx->regs + DP_CLKCON);
>> +
>>       writel(val, ctx->regs + VIDCON0);
>>  }
>>
>> @@ -924,6 +938,7 @@ static int fimd_probe(struct platform_device *pdev)
>>       struct device *dev = &pdev->dev;
>>       struct fimd_context *ctx;
>>       struct resource *res;
>> +     u32 fimd_output_type;
>>       int ret = -EINVAL;
>>
>>       ret = exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC,
>> @@ -949,6 +964,14 @@ static int fimd_probe(struct platform_device *pdev)
>>               ctx->vidcon1 |= VIDCON1_INV_VDEN;
>>       if (of_property_read_bool(dev->of_node, "samsung,invert-vclk"))
>>               ctx->vidcon1 |= VIDCON1_INV_VCLK;
>> +     if (!of_property_read_u32(dev->of_node, "samsung,output-type",
>> +                             &fimd_output_type)) {
>> +             if ((fimd_output_type < EXYNOS_FIMD_OUTPUT_DPI) ||
>> +                 (fimd_output_type > EXYNOS_FIMD_OUTPUT_DP))
>> +                     dev_err(dev, "invalid output type for FIMD\n");
>> +             else
>> +                     ctx->exynos_fimd_output_type = fimd_output_type;
>> +     }
>>
>>       ctx->bus_clk = devm_clk_get(dev, "fimd");
>>       if (IS_ERR(ctx->bus_clk)) {
>> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
>> index b039320..d8f4b0b 100644
>> --- a/include/video/samsung_fimd.h
>> +++ b/include/video/samsung_fimd.h
>> @@ -435,6 +435,10 @@
>>  #define BLENDCON_NEW_8BIT_ALPHA_VALUE                (1 << 0)
>>  #define BLENDCON_NEW_4BIT_ALPHA_VALUE                (0 << 0)
>>
>> +/* Video clock enable for DP */
>> +#define DP_CLKCON                            0x27C
>> +#define DP_CLK_ENABLE                                0x2
>> +
>>  /* Notes on per-window bpp settings
>>   *
>>   * Value     Win0     Win1     Win2     Win3     Win 4
>>
>
