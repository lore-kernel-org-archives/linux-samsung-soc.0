From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 1/2] drm/exynos: hdmi: Add support for Exynos7 HDMI
Date: Mon, 2 Mar 2015 14:10:29 +0530
Message-ID: <CAEC9eQMc002Nd-CF0tjwzipUZVcN3vTxWsq9OrfTnHsXQdp0tQ@mail.gmail.com>
References: <1424964285-27480-1-git-send-email-ajaykumar.rs@samsung.com>
	<54F04B80.7050606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:35339 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750764AbbCBIka (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Mar 2015 03:40:30 -0500
Received: by igqa13 with SMTP id a13so15349821igq.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Mar 2015 00:40:30 -0800 (PST)
In-Reply-To: <54F04B80.7050606@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene.kim@gmail.com>, InKi Dae <inki.dae@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Andrej,

On Fri, Feb 27, 2015 at 4:18 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> Hi Ajay,
>
> Thanks for the patch.
Thanks for reviewing the patch.

> On 02/26/2015 04:24 PM, Ajay Kumar wrote:
>> Modify the exynos HDMI driver to support Exynos7 HDMI 1.4.
>> * Add phy configs for Exynos7.
>> * Exynos7 has a different clock structure for HDMI,
>>   so introduce the new clocks.
>> * Add sysreg support to enable HDMI SYSREG on Exynos7.
>> * Exynos7 based boards need a DCDC_EN and LS_EN pins
>>   for powering up HDMI. Add support for that too.
>>
>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>> ---
>>  .../devicetree/bindings/video/exynos_hdmi.txt      |   21 +-
>>  drivers/gpu/drm/exynos/exynos_hdmi.c               |  252 ++++++++++++++++----
>>  drivers/gpu/drm/exynos/regs-hdmi.h                 |    4 +
>>  3 files changed, 231 insertions(+), 46 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>> index 1fd8cf9..bb22a60 100644
>> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>> @@ -6,6 +6,7 @@ Required properties:
>>       2) "samsung,exynos4210-hdmi"
>>       3) "samsung,exynos4212-hdmi"
>>       4) "samsung,exynos5420-hdmi"
>> +     5) "samsung,exynos7-hdmi"
>
> Why not "samsung,exynos7420-hdmi" ?
> What compatible will you use for Exynos7430 or higher chip number?
I will leave this decision to Inki Dae or Kukjin.

>>  - reg: physical base address of the hdmi and length of memory mapped
>>       region.
>>  - interrupts: interrupt number to the cpu.
>> @@ -15,21 +16,33 @@ Required properties:
>>       c) optional flags and pull up/down.
>>  - clocks: list of clock IDs from SoC clock driver.
>>       a) hdmi: Gate of HDMI IP bus clock.
>> -     b) sclk_hdmi: Gate of HDMI special clock.
>> -     c) sclk_pixel: Pixel special clock, one of the two possible inputs of
>> +     HDMI clocks necessary for non exynos7:
>> +      b) sclk_hdmi: Gate of HDMI special clock.
>> +      c) sclk_pixel: Pixel special clock, one of the two possible inputs of
>>               HDMI clock mux.
>> -     d) sclk_hdmiphy: HDMI PHY clock output, one of two possible inputs of
>> +      d) sclk_hdmiphy: HDMI PHY clock output, one of two possible inputs of
>>               HDMI clock mux.
>> -     e) mout_hdmi: It is required by the driver to switch between the 2
>> +      e) mout_hdmi: It is required by the driver to switch between the 2
>>               parents i.e. sclk_pixel and sclk_hdmiphy. If hdmiphy is stable
>>               after configuration, parent is set to sclk_hdmiphy else
>>               sclk_pixel.
>> +     HDMI clocks necessary for Exynos7:
>> +      b) pclk_hdmiphy: Gate to HDMIPHY clock.
>
> According to specs there is also pclk_hdmi, why do you specify only this
> one?
Right, I have reused "hdmi" gating clock for pclk_hdmi. That is why I have
left "hdmi" clock as common for exynos7 and non-exynos7.

>> +      c) hdmi_pixel: Gate clock of MUX output for I_PIXEL_CLK.
>> +      d) hdmi_tmds: Gate clock of MUX output for I_TMDS_CLK.
>
> According to specs these clocks should be named i_pixel_clk and
> i_tmds_clk, shouldn't they?
I actually took these changes from an "internal" code(non-DRM).
The original author used these names, and I just carried the same names. :)

>>  - clock-names: aliases as per driver requirements for above clock IDs:
>>       "hdmi", "sclk_hdmi", "sclk_pixel", "sclk_hdmiphy" and "mout_hdmi".
>>  - ddc: phandle to the hdmi ddc node
>>  - phy: phandle to the hdmi phy node
>>  - samsung,syscon-phandle: phandle for system controller node for PMU.
>>
>> +Only for Exynos7(when compatible = "samsung,exynos7-hdmi"):
>> +- samsung,sysreg-phandle: phandle for system controller node for SYSREG block.
>> +
>> +Optional properties:
>> +- dcdc-gpios: OF device-tree gpio specification for HDMI_DCDC_EN pin.
>> +- lsen-gpios: OF device-tree gpio specification for HDMI_LS_EN pin.
>
> What is purpose of these gpios?
These 2 GPIOs need to be enabled to powerup HDMI on exynos7-espresso board.
Other boards need not provide the GPIO.

>> +
>>  Example:
>>
>>       hdmi {
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> index 229b361..1b579ea 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -67,6 +67,7 @@
>>  enum hdmi_type {
>>       HDMI_TYPE13,
>>       HDMI_TYPE14,
>> +     HDMI_TYPE14_7,
>>  };
>>
>>  struct hdmi_driver_data {
>> @@ -82,6 +83,9 @@ struct hdmi_resources {
>>       struct clk                      *sclk_pixel;
>>       struct clk                      *sclk_hdmiphy;
>>       struct clk                      *mout_hdmi;
>> +     struct clk                      *hdmi_pixel;
>> +     struct clk                      *pclk_hdmiphy;
>> +     struct clk                      *hdmi_tmds;
>>       struct regulator_bulk_data      *regul_bulk;
>>       struct regulator                *reg_hdmi_en;
>>       int                             regul_count;
>> @@ -210,6 +214,7 @@ struct hdmi_context {
>>       unsigned int                    phy_conf_count;
>>
>>       struct regmap                   *pmureg;
>> +     struct regmap                   *sysreg;
>>       enum hdmi_type                  type;
>>  };
>>
>> @@ -584,6 +589,61 @@ static const struct hdmiphy_config hdmiphy_5420_configs[] = {
>>       },
>>  };
>>
>> +static const struct hdmiphy_config hdmiphy_7_configs[] = {
>> +     {
>> +             .pixel_clock = 27000000,
>> +             .conf = {
>> +                     0x01, 0xD2, 0x87, 0xB0, 0x01, 0x00, 0x88, 0x02,
>> +                     0x4F, 0x30, 0x33, 0x65, 0x00, 0xE4, 0x24, 0x80,
>> +                     0x6C, 0xF2, 0x67, 0x00, 0x10, 0x0B, 0x00, 0x10,
>> +                     0x60, 0x0F, 0x00, 0x00, 0x08, 0x00, 0x3E, 0x00,
>> +             },
>> +     },
>> +     {
>> +             .pixel_clock = 27027000,
>> +             .conf = {
>> +                     0x01, 0xD1, 0x5A, 0xFA, 0xE4, 0x12, 0x88, 0x43,
>> +                     0x4F, 0x30, 0x33, 0x65, 0x00, 0xE4, 0x24, 0x80,
>> +                     0x6C, 0xF2, 0x67, 0x00, 0x10, 0x0F, 0x00, 0x10,
>> +                     0x60, 0x0F, 0x00, 0x00, 0x08, 0x00, 0x3E, 0x00,
>> +             },
>> +     },
>> +     {
>> +             .pixel_clock = 74176000,
>> +             .conf = {
>> +                     0x01, 0xD1, 0x3E, 0x35, 0xDB, 0xA2, 0x88, 0x42,
>> +                     0x4F, 0x30, 0x33, 0x65, 0x10, 0xA6, 0x24, 0x80,
>> +                     0x6C, 0xF2, 0x67, 0x00, 0x10, 0x03, 0x00, 0x10,
>> +                     0x60, 0x0F, 0x00, 0x00, 0x08, 0x00, 0x3E, 0x00,
>> +             },
>> +     },
>> +     {
>> +             .pixel_clock = 74250000,
>> +             .conf = {
>> +                     0x01, 0xD1, 0x3E, 0x35, 0xC0, 0x90, 0x88, 0x42,
>> +                     0x4F, 0x30, 0x33, 0x65, 0x10, 0xA6, 0x24, 0x80,
>> +                     0x6C, 0xF2, 0x67, 0x00, 0x10, 0x03, 0x00, 0x10,
>> +                     0x60, 0x0F, 0x00, 0x00, 0x08, 0x00, 0x3E, 0x00,
>> +             },
>> +     },
>> +     {
>> +             .pixel_clock = 148500000,
>> +             .conf = {
>> +                     0x01, 0xD1, 0x3E, 0x15, 0xC0, 0x90, 0x88, 0x42,
>> +                     0x4F, 0x30, 0x33, 0x65, 0x20, 0xA6, 0x24, 0x80,
>> +                     0x6C, 0xF2, 0x67, 0x00, 0x10, 0x01, 0x00, 0x10,
>> +                     0x60, 0x0F, 0x00, 0x00, 0x08, 0x00, 0x3E, 0x00,
>> +             },
>> +     },
>> +};
>> +
>> +static struct hdmi_driver_data exynos7_hdmi_driver_data = {
>> +     .type           = HDMI_TYPE14_7,
>> +     .phy_confs      = hdmiphy_7_configs,
>> +     .phy_conf_count = ARRAY_SIZE(hdmiphy_7_configs),
>> +     .is_apb_phy     = 1,
>> +};
>> +
>>  static struct hdmi_driver_data exynos5420_hdmi_driver_data = {
>>       .type           = HDMI_TYPE14,
>>       .phy_confs      = hdmiphy_5420_configs,
>> @@ -1355,6 +1415,9 @@ static void hdmi_start(struct hdmi_context *hdata, bool start)
>>               val |= HDMI_FIELD_EN;
>>
>>       hdmi_reg_writemask(hdata, HDMI_CON_0, val, HDMI_EN);
>> +     if (hdata->type == HDMI_TYPE14_7)
>> +             hdmi_reg_writemask(hdata, HDMI_CON_0, HDMI_ENCODING_RETAIN,
>> +                                                     HDMI_ENCODING_RETAIN);
>>       hdmi_reg_writemask(hdata, HDMI_TG_CMD, val, HDMI_TG_EN | HDMI_FIELD_EN);
>>  }
>>
>> @@ -1489,9 +1552,11 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
>>               hdmi_regs_dump(hdata, "timing apply");
>>       }
>>
>> -     clk_disable_unprepare(hdata->res.sclk_hdmi);
>> -     clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
>> -     clk_prepare_enable(hdata->res.sclk_hdmi);
>> +     if (hdata->type != HDMI_TYPE14_7) {
>> +             clk_disable_unprepare(hdata->res.sclk_hdmi);
>> +             clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
>> +             clk_prepare_enable(hdata->res.sclk_hdmi);
>> +     }
>
> If is not neccessary, hdmi_v13_mode_apply is called only for HDMI_TYPE13.
Ahh, That's a nice catch. I will remove it.

>>
>>       /* enable HDMI and timing generator */
>>       hdmi_start(hdata, true);
>> @@ -1651,9 +1716,11 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
>>               hdmi_regs_dump(hdata, "timing apply");
>>       }
>>
>> -     clk_disable_unprepare(hdata->res.sclk_hdmi);
>> -     clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
>> -     clk_prepare_enable(hdata->res.sclk_hdmi);
>> +     if (hdata->type != HDMI_TYPE14_7) {
>> +             clk_disable_unprepare(hdata->res.sclk_hdmi);
>> +             clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
>> +             clk_prepare_enable(hdata->res.sclk_hdmi);
>> +     }
>>
>>       /* enable HDMI and timing generator */
>>       hdmi_start(hdata, true);
>> @@ -1671,9 +1738,11 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
>>  {
>>       u32 reg;
>>
>> -     clk_disable_unprepare(hdata->res.sclk_hdmi);
>> -     clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
>> -     clk_prepare_enable(hdata->res.sclk_hdmi);
>> +     if (hdata->type != HDMI_TYPE14_7) {
>> +             clk_disable_unprepare(hdata->res.sclk_hdmi);
>> +             clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
>> +             clk_prepare_enable(hdata->res.sclk_hdmi);
>> +     }
>>
>>       /* operation mode */
>>       hdmiphy_reg_writeb(hdata, HDMIPHY_MODE_SET_DONE,
>> @@ -1693,7 +1762,7 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
>>
>>  static void hdmiphy_poweron(struct hdmi_context *hdata)
>>  {
>> -     if (hdata->type != HDMI_TYPE14)
>> +     if ((hdata->type != HDMI_TYPE14) || (hdata->type != HDMI_TYPE14_7))
>>               return;
>>
>>       DRM_DEBUG_KMS("\n");
>> @@ -1713,7 +1782,7 @@ static void hdmiphy_poweron(struct hdmi_context *hdata)
>>
>>  static void hdmiphy_poweroff(struct hdmi_context *hdata)
>>  {
>> -     if (hdata->type != HDMI_TYPE14)
>> +     if ((hdata->type != HDMI_TYPE14) || (hdata->type != HDMI_TYPE14_7))
>
> It could be replaced with if (hdata->type == HDMI_TYPE13)
Ok, I will change it.

>>               return;
>>
>>       DRM_DEBUG_KMS("\n");
>> @@ -2042,6 +2111,10 @@ static void hdmi_poweron(struct hdmi_context *hdata)
>>               return;
>>       }
>>
>> +     if (hdata->type == HDMI_TYPE14_7)
>> +             regmap_update_bits(hdata->sysreg, SYSREG_DISP_HDMI_PHY,
>> +                                     SYSREG_HDMI_REFCLK_SEL, 1);
>> +
>>       hdata->powered = true;
>>
>>       mutex_unlock(&hdata->hdmi_mutex);
>> @@ -2056,7 +2129,19 @@ static void hdmi_poweron(struct hdmi_context *hdata)
>>                       PMU_HDMI_PHY_ENABLE_BIT, 1);
>>
>>       clk_prepare_enable(res->hdmi);
>> -     clk_prepare_enable(res->sclk_hdmi);
>> +     if (hdata->type != HDMI_TYPE14_7)
>> +             clk_prepare_enable(res->sclk_hdmi);
>> +     else
>> +             clk_prepare_enable(res->pclk_hdmiphy);
>> +
>> +     if (hdata->type == HDMI_TYPE14_7)
>> +             hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, 0,
>> +                                     HDMI_PHY_POWER_OFF_EN);
>> +
>> +     if (hdata->type == HDMI_TYPE14_7) {
>> +             clk_prepare_enable(res->hdmi_pixel);
>> +             clk_prepare_enable(res->hdmi_tmds);
>> +     }
>
>
> All ifs can be squashed.
Right, this big chunk can easily go inside a single if.

>>
>>       hdmiphy_poweron(hdata);
>>       hdmi_commit(&hdata->display);
>> @@ -2074,13 +2159,29 @@ static void hdmi_poweroff(struct hdmi_context *hdata)
>>       /* HDMI System Disable */
>>       hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
>>
>> +     if (hdata->type == HDMI_TYPE14_7) {
>> +             clk_disable_unprepare(res->hdmi_pixel);
>> +             clk_disable_unprepare(res->hdmi_tmds);
>> +     }
>> +
>> +     if (hdata->type == HDMI_TYPE14_7)
>> +             hdmi_reg_writemask(hdata, HDMI_PHY_CON_0, ~0,
>> +                                     HDMI_PHY_POWER_OFF_EN);
>
> Ditto
Ok, one if can be removed.

>> +
>>       hdmiphy_poweroff(hdata);
>>
>>       cancel_delayed_work(&hdata->hotplug_work);
>>
>> -     clk_disable_unprepare(res->sclk_hdmi);
>> +     if (hdata->type != HDMI_TYPE14_7)
>> +             clk_disable_unprepare(res->sclk_hdmi);
>> +     else
>> +             clk_disable_unprepare(res->pclk_hdmiphy);
>>       clk_disable_unprepare(res->hdmi);
>>
>> +     if (hdata->type == HDMI_TYPE14_7)
>> +             regmap_update_bits(hdata->sysreg, SYSREG_DISP_HDMI_PHY,
>> +                                     SYSREG_HDMI_REFCLK_SEL, 0);
>> +
>>       /* reset pmu hdmiphy control bit to disable hdmiphy */
>>       regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
>>                       PMU_HDMI_PHY_ENABLE_BIT, 0);
>> @@ -2121,10 +2222,12 @@ static void hdmi_dpms(struct exynos_drm_display *display, int mode)
>>                * Below codes will try to disable Mixer and VP(if used)
>>                * prior to disabling HDMI.
>>                */
>> -             if (crtc)
>> -                     funcs = crtc->helper_private;
>> -             if (funcs && funcs->dpms)
>> -                     (*funcs->dpms)(crtc, mode);
>> +             if (hdata->type != HDMI_TYPE14_7) {
>> +                     if (crtc)
>> +                             funcs = crtc->helper_private;
>> +                     if (funcs && funcs->dpms)
>> +                             (*funcs->dpms)(crtc, mode);
>> +             }
>>
>>               hdmi_poweroff(hdata);
>>               break;
>> @@ -2166,6 +2269,31 @@ static irqreturn_t hdmi_irq_thread(int irq, void *arg)
>>       return IRQ_HANDLED;
>>  }
>>
>> +static int hdmi_configure_gpios(struct hdmi_context *hdata)
>> +{
>> +     struct gpio_desc *dcdc_gpio, *lsen_gpio;
>> +     int err;
>> +
>> +     dcdc_gpio = devm_gpiod_get_optional(hdata->dev, "dcdc", GPIOD_OUT_LOW);
>> +     if (IS_ERR(dcdc_gpio)) {
>> +             err = PTR_ERR(dcdc_gpio);
>> +             dev_err(hdata->dev, "failed to request GPIO: %d\n", err);
>> +             return err;
>> +     }
>> +
>> +     lsen_gpio = devm_gpiod_get_optional(hdata->dev, "lsen", GPIOD_OUT_LOW);
>> +     if (IS_ERR(lsen_gpio)) {
>> +             err = PTR_ERR(lsen_gpio);
>> +             dev_err(hdata->dev, "failed to request GPIO: %d\n", err);
>> +             return err;
>> +     }
>> +
>> +     gpiod_set_value(dcdc_gpio, 1);
>> +     gpiod_set_value(lsen_gpio, 1);
>> +
>> +     return 0;
>> +}
>> +
>>  static int hdmi_resources_init(struct hdmi_context *hdata)
>>  {
>>       struct device *dev = hdata->dev;
>> @@ -2179,6 +2307,10 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
>>
>>       DRM_DEBUG_KMS("HDMI resource init\n");
>>
>> +     ret = hdmi_configure_gpios(hdata);
>> +     if (ret)
>> +             goto fail;
>> +
>>       /* get clocks, power */
>>       res->hdmi = devm_clk_get(dev, "hdmi");
>>       if (IS_ERR(res->hdmi)) {
>> @@ -2186,32 +2318,55 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
>>               ret = PTR_ERR(res->hdmi);
>>               goto fail;
>>       }
>> -     res->sclk_hdmi = devm_clk_get(dev, "sclk_hdmi");
>> -     if (IS_ERR(res->sclk_hdmi)) {
>> -             DRM_ERROR("failed to get clock 'sclk_hdmi'\n");
>> -             ret = PTR_ERR(res->sclk_hdmi);
>> -             goto fail;
>> -     }
>> -     res->sclk_pixel = devm_clk_get(dev, "sclk_pixel");
>> -     if (IS_ERR(res->sclk_pixel)) {
>> -             DRM_ERROR("failed to get clock 'sclk_pixel'\n");
>> -             ret = PTR_ERR(res->sclk_pixel);
>> -             goto fail;
>> -     }
>> -     res->sclk_hdmiphy = devm_clk_get(dev, "sclk_hdmiphy");
>> -     if (IS_ERR(res->sclk_hdmiphy)) {
>> -             DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
>> -             ret = PTR_ERR(res->sclk_hdmiphy);
>> -             goto fail;
>> -     }
>> -     res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
>> -     if (IS_ERR(res->mout_hdmi)) {
>> -             DRM_ERROR("failed to get clock 'mout_hdmi'\n");
>> -             ret = PTR_ERR(res->mout_hdmi);
>> -             goto fail;
>> -     }
>>
>> -     clk_set_parent(res->mout_hdmi, res->sclk_pixel);
>> +     if (hdata->type != HDMI_TYPE14_7) {
>> +             res->sclk_hdmi = devm_clk_get(dev, "sclk_hdmi");
>> +             if (IS_ERR(res->sclk_hdmi)) {
>> +                     DRM_ERROR("failed to get clock 'sclk_hdmi'\n");
>> +                     ret = PTR_ERR(res->sclk_hdmi);
>> +                     goto fail;
>> +             }
>> +             res->sclk_pixel = devm_clk_get(dev, "sclk_pixel");
>> +             if (IS_ERR(res->sclk_pixel)) {
>> +                     DRM_ERROR("failed to get clock 'sclk_pixel'\n");
>> +                     ret = PTR_ERR(res->sclk_pixel);
>> +                     goto fail;
>> +             }
>> +             res->sclk_hdmiphy = devm_clk_get(dev, "sclk_hdmiphy");
>> +             if (IS_ERR(res->sclk_hdmiphy)) {
>> +                     DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
>> +                     ret = PTR_ERR(res->sclk_hdmiphy);
>> +                     goto fail;
>> +             }
>> +             res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
>> +             if (IS_ERR(res->mout_hdmi)) {
>> +                     DRM_ERROR("failed to get clock 'mout_hdmi'\n");
>> +                     ret = PTR_ERR(res->mout_hdmi);
>> +                     goto fail;
>> +             }
>> +
>> +             clk_set_parent(res->mout_hdmi, res->sclk_pixel);
>> +     } else {
>> +
>> +             res->pclk_hdmiphy = clk_get(dev, "pclk_hdmiphy");
>> +             if (IS_ERR_OR_NULL(res->pclk_hdmiphy)) {
>
> NULL clock is valid so IS_ERR_OR_NULL should be replaced with IS_ERR.
Ok, I will change it.

> By the way, it would be nice to replace this redundant clock get code
> with some helpers.
like?
>
>> +                     DRM_ERROR("failed to get clock 'pclk_hdmiphy'\n");
>> +                     ret = PTR_ERR(res->pclk_hdmiphy);
>> +                     goto fail;
>> +             }
>> +             res->hdmi_pixel = clk_get(dev, "hdmi_pixel");
>> +             if (IS_ERR_OR_NULL(res->hdmi_pixel)) {
>
> ditto
>
>> +                     DRM_ERROR("failed to get clock 'hdmi_pixel'\n");
>> +                     ret = PTR_ERR(res->hdmi_pixel);
>> +                     goto fail;
>> +             }
>> +             res->hdmi_tmds = clk_get(dev, "hdmi_tmds");
>> +             if (IS_ERR_OR_NULL(res->hdmi_tmds)) {
>
> ditto
>
>> +                     DRM_ERROR("failed to get clock 'hdmi_tmds'\n");
>> +                     ret = PTR_ERR(res->hdmi_tmds);
>> +                     goto fail;
>> +             }
>> +     }
>>
>>       res->regul_bulk = devm_kzalloc(dev, ARRAY_SIZE(supply) *
>>               sizeof(res->regul_bulk[0]), GFP_KERNEL);
>> @@ -2288,6 +2443,9 @@ static struct of_device_id hdmi_match_types[] = {
>>               .compatible = "samsung,exynos5420-hdmi",
>>               .data = &exynos5420_hdmi_driver_data,
>>       }, {
>> +             .compatible = "samsung,exynos7-hdmi",
>> +             .data = &exynos7_hdmi_driver_data,
>> +     }, {
>>               /* end node */
>>       }
>>  };
>> @@ -2474,6 +2632,16 @@ out_get_phy_port:
>>               goto err_hdmiphy;
>>       }
>>
>> +     if (hdata->type == HDMI_TYPE14_7) {
>> +             hdata->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
>> +                     "samsung,sysreg-phandle");
>> +             if (IS_ERR(hdata->sysreg)) {
>> +                     DRM_ERROR("sysreg regmap lookup failed.\n");
>> +                     ret = -EPROBE_DEFER;
>> +                     goto err_hdmiphy;
>> +             }
>> +     }
>> +
>>       pm_runtime_enable(dev);
>>
>>       ret = component_add(&pdev->dev, &hdmi_component_ops);
>> diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
>> index 3f35ac6..d6c84e0 100644
>> --- a/drivers/gpu/drm/exynos/regs-hdmi.h
>> +++ b/drivers/gpu/drm/exynos/regs-hdmi.h
>> @@ -133,6 +133,7 @@
>>
>>  /* HDMI_CON_0 */
>>  #define HDMI_BLUE_SCR_EN             (1 << 5)
>> +#define HDMI_ENCODING_RETAIN         (1 << 4)
>>  #define HDMI_ASP_EN                  (1 << 2)
>>  #define HDMI_ASP_DIS                 (0 << 2)
>>  #define HDMI_ASP_MASK                        (1 << 2)
>> @@ -594,4 +595,7 @@
>>  #define PMU_HDMI_PHY_CONTROL         0x700
>>  #define PMU_HDMI_PHY_ENABLE_BIT              BIT(0)
>>
>> +#define SYSREG_DISP_HDMI_PHY         0x838
>> +#define SYSREG_HDMI_REFCLK_SEL               BIT(0)
>> +
>>  #endif /* SAMSUNG_REGS_HDMI_H */
>>
>
Ajay
