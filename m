From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 02/10] drm/rockchip: analogix_dp: split the lcdc select
 setting into device data[Involving remittance information, please pay
 attention to the safety of property]
Date: Wed, 29 Jun 2016 15:09:38 +0800
Message-ID: <57737432.6040501@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
 <1465904768-805-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbLovzM_9W1wkBgXD4aDWGJF2YdGTn6TXEhU6UYokUgG9g@mail.gmail.com>
 <3037785.TlDqtLoRAD@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:45653 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbcF2HJx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 03:09:53 -0400
In-Reply-To: <3037785.TlDqtLoRAD@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@chromium.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

Heiko & Sean

On 06/24/2016 12:16 AM, Heiko Stuebner wrote:
> Am Donnerstag, 23. Juni 2016, 10:32:53 schrieb Sean Paul:
>> On Tue, Jun 14, 2016 at 7:46 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>>> eDP controller need to declare which vop provide the video source,
>>> and it's defined in GRF registers.
>>>
>>> But different chips have different GRF register address, so we need to
>>> create a device data to declare the GRF messages for each chips.
>>>
>>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>>> Acked-by: Mark Yao <mark.yao@rock-chips.com>
>>> ---
>>> Changes in v3:
>>> - Write a kerneldoc-style comment explaining the chips data fields
>>> (Tomasz, reviewed at Google Gerrit)>
>>>      [https://chromium-review.googlesource.com/#/c/346313/10/drivers/gpu/
>>>      drm/rockchip/analogix_dp-rockchip.c@39]>
>>> - Drop the '.lcdcsel_mask' number in chips data field (Tomasz, reviewed
>>> at Google Gerrit)>
>>>      [https://chromium-review.googlesource.com/#/c/346313/10/drivers/gpu/
>>>      drm/rockchip/analogix_dp-rockchip.c@382]>
>>> - Add acked flag from Mark.
>>>
>>> Changes in v2: None
>>>
>>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 39
>>>   +++++++++++++++++++------ 1 file changed, 30 insertions(+), 9
>>>   deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c index
>>> 2bc8a7e..3855f46 100644
>>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>>> @@ -14,6 +14,7 @@
>>>
>>>   #include <linux/component.h>
>>>   #include <linux/mfd/syscon.h>
>>>
>>> +#include <linux/of_device.h>
>>>
>>>   #include <linux/of_graph.h>
>>>   #include <linux/regmap.h>
>>>   #include <linux/reset.h>
>>>
>>> @@ -35,11 +36,17 @@
>>>
>>>   #define to_dp(nm)      container_of(nm, struct rockchip_dp_device, nm)
>>>
>>> -/* dp grf register offset */
>>> -#define GRF_SOC_CON6                            0x025c
>>> -#define GRF_EDP_LCD_SEL_MASK                    BIT(5)
>>> -#define GRF_EDP_SEL_VOP_LIT                     BIT(5)
>>> -#define GRF_EDP_SEL_VOP_BIG                     0
>>> +/**
>>> + * struct rockchip_dp_chip_data - splite the grf setting of kind of
>>> chips + * @lcdsel_grf_reg: grf register offset of lcdc select
>>> + * @lcdsel_big: reg value of selecting vop big for eDP
>>> + * @lcdsel_lit: reg value of selecting vop little for eDP
>>> + */
>>> +struct rockchip_dp_chip_data {
>>> +       u32     lcdsel_grf_reg;
>>> +       u32     lcdsel_big;
>>> +       u32     lcdsel_lit;
>>> +};
>>>
>>>   struct rockchip_dp_device {
>>>   
>>>          struct drm_device        *drm_dev;
>>>
>>> @@ -51,6 +58,8 @@ struct rockchip_dp_device {
>>>
>>>          struct regmap            *grf;
>>>          struct reset_control     *rst;
>>>
>>> +       const struct rockchip_dp_chip_data *data;
>>> +
>>>
>>>          struct analogix_dp_plat_data plat_data;
>>>   
>>>   };
>>>
>>> @@ -119,13 +128,13 @@ static void rockchip_dp_drm_encoder_enable(struct
>>> drm_encoder *encoder)>
>>>                  return;
>>>          
>>>          if (ret)
>>>
>>> -               val = GRF_EDP_SEL_VOP_LIT | (GRF_EDP_LCD_SEL_MASK <<
>>> 16);
>>> +               val = dp->data->lcdsel_lit;
>>>
>>>          else
>>>
>>> -               val = GRF_EDP_SEL_VOP_BIG | (GRF_EDP_LCD_SEL_MASK <<
>>> 16);
>>> +               val = dp->data->lcdsel_big;
>>>
>>>          dev_dbg(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" :
>>>          "BIG");
>>>
>>> -       ret = regmap_write(dp->grf, GRF_SOC_CON6, val);
>>> +       ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
>>>
>>>          if (ret != 0) {
>>>          
>>>                  dev_err(dp->dev, "Could not write to GRF: %d\n", ret);
>>>                  return;
>>>
>>> @@ -246,6 +255,7 @@ static int rockchip_dp_bind(struct device *dev,
>>> struct device *master,>
>>>                              void *data)
>>>   
>>>   {
>>>   
>>>          struct rockchip_dp_device *dp = dev_get_drvdata(dev);
>>>
>>> +       const struct rockchip_dp_chip_data *dp_data;
>>>
>>>          struct drm_device *drm_dev = data;
>>>          int ret;
>>>
>>> @@ -256,10 +266,15 @@ static int rockchip_dp_bind(struct device *dev,
>>> struct device *master,>
>>>           */
>>>          
>>>          dev_set_drvdata(dev, NULL);
>>>
>>> +       dp_data = of_device_get_match_data(dev);
>>> +       if (!dp_data)
>>> +               return -ENODEV;
>>> +
>>>
>>>          ret = rockchip_dp_init(dp);
>>>          if (ret < 0)
>>>          
>>>                  return ret;
>>>
>>> +       dp->data = dp_data;
>>>
>>>          dp->drm_dev = drm_dev;
>>>          
>>>          ret = rockchip_dp_drm_create_encoder(dp);
>>>
>>> @@ -365,8 +380,14 @@ static const struct dev_pm_ops rockchip_dp_pm_ops =
>>> {>
>>>          SET_SYSTEM_SLEEP_PM_OPS(rockchip_dp_suspend, rockchip_dp_resume)
>>>   
>>>   };
>>>
>>> +static const struct rockchip_dp_chip_data rk3288_dp = {
>>> +       .lcdsel_grf_reg = 0x025c,
>>> +       .lcdsel_big = 0 | BIT(21),
>>> +       .lcdsel_lit = BIT(5) | BIT(21),
>> I'm not sure what convention is in other drivers, but this seems less
>> readable to me.
>>
>> I'd prefer that the magic numbers were assigned to a #define that
>> corresponds to a TRM name in some header. Then you have names in the
>> assignment instead of meaningless numbers.
> I guess what irks me personally more is that it hides the write-mask as well
>
> So I guess something like the following would also define it somewhat future-
> proof
>
> #define RK3288_GRF_SOC_CON6	0x25c
> #define RK3288_EDP_LCDC_SEL		BIT(5)
>
> #define HIWORD_UPDATE(val, mask) \
> 		(val | (mask) << 16)
>
> static const struct rockchip_dp_chip_data rk3288_dp = {
> 	.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
> 	.lcdsel_big = HIWORD_UPDATE(0, RK3288_EDP_LCDC_SEL),
> 	.lcdsel_lit = HIWORD_UPDATE(RK3288_EDP_LCDC_SEL, RK3288_EDP_LCDC_SEL),
>

Ah, great, thanks for your code, this should be more readable now.

Thanks,
- Yakir

>
>
