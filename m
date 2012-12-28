From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH] video: drm: exynos: mie bypass enable for fimd
Date: Fri, 28 Dec 2012 09:39:48 +0530
Message-ID: <CAL1wa8d+cwkL5uWyYv9Kx_Cdhm_MTrL2hc7z4QX+vgDTtzMpKw@mail.gmail.com>
References: <1356503854-28100-1-git-send-email-l.krishna@samsung.com> <CAAQKjZOPQtCPE6BHnyJ7mqfi04VWbg3VWeVf9fcjxZC3jjUYdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:53013 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753169Ab2L1EKJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 23:10:09 -0500
Received: by mail-pa0-f54.google.com with SMTP id bi5so5859135pad.41
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Dec 2012 20:10:08 -0800 (PST)
In-Reply-To: <CAAQKjZOPQtCPE6BHnyJ7mqfi04VWbg3VWeVf9fcjxZC3jjUYdQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hello Inki Dae,

On Thu, Dec 27, 2012 at 11:47 AM, Inki Dae <inki.dae@samsung.com> wrote:
>
> Hi,
>
> DISP1BLK_CFG register is related to GScaler, HDCP and MIXER as well. So
> it's not good that this register is controlled in fimd module. And I think
> the function to control the register should be placed in SoC common file .
> In other words, other drivers should be able to control the register through
> common thing also.
>

Thanks for reviewing the patch.
You mean to say that this functionality should be implemented at arch side
and called by drivers using call back functions ?

If so, then if we moved the driver to full DT version, all the call
backs will be removed.
Then how to make a call to this function?

So I thought other drivers (apart from Fimd) also parses the
appropriate nodes and
program the register as per the need.

Please correct me if my understanding is wrong.

Best Wishes,
Leela Krishna Amudala.


> Thanks,
> Inki Dae
>
> 2012/12/26 Leela Krishna Amudala <l.krishna@samsung.com>
>>
>> Bypasses the mie for fimd by parsing the register and bit offset values
>> from "mie-bypass" node, if "mie-bypass" node is present in the dts file.
>>
>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 55
>> ++++++++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index bf0d9ba..f8ad259 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -118,6 +118,12 @@ static const struct of_device_id
>> fimd_driver_dt_match[] = {
>>  MODULE_DEVICE_TABLE(of, fimd_driver_dt_match);
>>  #endif
>>
>> +struct mie_bypass {
>> +       u32                             enable_bypass;
>> +       void __iomem                    *bypass_reg;
>> +       u32                             bypass_bit_offset;
>> +};
>> +
>>  static inline struct fimd_driver_data *drm_fimd_get_driver_data(
>>         struct platform_device *pdev)
>>  {
>> @@ -133,6 +139,41 @@ static inline struct fimd_driver_data
>> *drm_fimd_get_driver_data(
>>                 platform_get_device_id(pdev)->driver_data;
>>  }
>>
>> +static struct mie_bypass *parse_mie_bypass_for_fimd(struct device *dev,
>> +                                       struct device_node
>> *mie_bypass_node)
>> +{
>> +       struct mie_bypass *bypass_data;
>> +       u32 phy_address;
>> +
>> +       bypass_data = devm_kzalloc(dev, sizeof(*bypass_data),
>> GFP_KERNEL);
>> +       if (!bypass_data) {
>> +               dev_err(dev, "memory allocation for bypass data
>> failed\n");
>> +               return ERR_PTR(-ENOMEM);
>> +       }
>> +       of_property_read_u32(mie_bypass_node,
>> "samsung,mie-bypass-enable",
>> +                       &bypass_data->enable_bypass);
>> +       of_property_read_u32(mie_bypass_node, "samsung,disp1blk-cfg-reg",
>> +                       &phy_address);
>> +       of_property_read_u32(mie_bypass_node,
>> "samsung,bypass-bit-offset",
>> +                       &bypass_data->bypass_bit_offset);
>> +
>> +       bypass_data->bypass_reg = ioremap(phy_address, SZ_4);
>>
>> +       if (!bypass_data->bypass_reg) {
>> +               dev_err(dev, "failed to ioremap phy_address\n");
>> +               return ERR_PTR(-ENOMEM);
>> +       }
>> +       return bypass_data;
>> +}
>>
>> +
>> +static void mie_bypass_for_fimd(struct mie_bypass *bypass_data)
>> +{
>> +       u32 reg;
>> +
>> +       reg = __raw_readl(bypass_data->bypass_reg);
>> +       reg |= (1 << bypass_data->bypass_bit_offset);
>> +       __raw_writel(reg, bypass_data->bypass_reg);
>> +}
>> +
>>  static bool fimd_display_is_connected(struct device *dev)
>>  {
>>         DRM_DEBUG_KMS("%s\n", __FILE__);
>> @@ -906,12 +947,26 @@ static int __devinit fimd_probe(struct
>> platform_device *pdev)
>>         struct exynos_drm_fimd_pdata *pdata;
>>         struct exynos_drm_panel_info *panel;
>>         struct resource *res;
>> +       struct device_node *mie_bypass_node;
>> +       struct mie_bypass *bypass_data = NULL;
>>         int win;
>>         int ret = -EINVAL;
>>
>>         DRM_DEBUG_KMS("%s\n", __FILE__);
>>
>>         pdata = pdev->dev.platform_data;
>> +       if (pdev->dev.of_node) {
>> +               mie_bypass_node = of_find_node_by_name(pdev->dev.of_node,
>> +                                                       "mie-bypass");
>> +               if (mie_bypass_node) {
>> +                       bypass_data =
>> parse_mie_bypass_for_fimd(&pdev->dev,
>> +                                                       mie_bypass_node);
>>
>> +                       if (IS_ERR(bypass_data))
>> +                               return PTR_ERR(bypass_data);
>> +                       if (bypass_data->enable_bypass)
>> +                               mie_bypass_for_fimd(bypass_data);
>> +               }
>> +       }
>>         if (!pdata) {
>>                 dev_err(dev, "no platform data specified\n");
>>                 return -EINVAL;
>> --
>> 1.8.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
