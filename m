From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 05/10] drm/rockchip: analogix_dp: add rk3399 eDP
 support
Date: Wed, 29 Jun 2016 14:58:13 +0800
Message-ID: <57737185.4000505@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
 <1465904780-935-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vbJmtC_rFO3Tuh16X_C4ejM=BGB9-QqoE5-Nv4mOD4crbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:53167 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752583AbcF2G6Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 02:58:25 -0400
In-Reply-To: <CAOw6vbJmtC_rFO3Tuh16X_C4ejM=BGB9-QqoE5-Nv4mOD4crbA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@chromium.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

Sean,

On 06/23/2016 09:48 PM, Sean Paul wrote:
> On Tue, Jun 14, 2016 at 7:46 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> RK3399 and RK3288 shared the same eDP IP controller, only some light
>> difference with VOP configure and GRF configure.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> Acked-by: Mark Yao <mark.yao@rock-chips.com>
>> ---
>> Changes in v3:
>> - Give the "rk3399-edp" a separate line for clarity in document (Tomasz, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/346314/10/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt@5]
>> - Move 'output_type' setting before the return statement (Tomasz, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/346314/10/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@154]
>> - Add the acked flag from Mark.
>>
>> Changes in v2:
>> - rebase with drm-next, fix some conflicts
>>
>>   .../bindings/display/bridge/analogix_dp.txt        |  1 +
>>   .../display/rockchip/analogix_dp-rockchip.txt      |  3 +-
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 33 +++++++++++++++++++++-
>>   include/drm/bridge/analogix_dp.h                   |  1 +
>>   4 files changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>> index 4f2ba8c..4a0f4f7 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>> +++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>> @@ -5,6 +5,7 @@ Required properties for dp-controller:
>>                  platform specific such as:
>>                   * "samsung,exynos5-dp"
>>                   * "rockchip,rk3288-dp"
>> +                * "rockchip,rk3399-edp"
>>          -reg:
>>                  physical base address of the controller and length
>>                  of memory mapped region.
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
>> index e832ff9..726c945 100644
>> --- a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
>> +++ b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
>> @@ -2,7 +2,8 @@ Rockchip RK3288 specific extensions to the Analogix Display Port
>>   ================================
>>
>>   Required properties:
>> -- compatible: "rockchip,rk3288-edp";
>> +- compatible: "rockchip,rk3288-edp",
>> +             "rockchip,rk3399-edp";
>>
>>   - reg: physical base address of the controller and length
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index 315ebba..bcd9ecc 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -153,6 +153,8 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
>>                                        struct drm_connector_state *conn_state)
>>   {
>>          struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
>> +       struct rockchip_dp_device *dp = to_dp(encoder);
>> +       int ret;
>>
>>          /*
>>           * FIXME(Yakir): driver should configure the CRTC output video
>> @@ -167,7 +169,28 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
>>           * But if I configure CTRC to RGBaaa, and eDP driver still keep
>>           * RGB666 input video mode, then screen would works prefect.
>>           */
>> -       s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
>> +
>> +       ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
>> +       if (ret < 0)
>> +               return 0;
> What is s->output_mode set to in the failure case? How about s->output_type?

I plan to return '-ENODEV' when 'drm_of_encoder_active_endpoint_id' 
failed to found, but now i found there is a bug.

When the first time '.atomic_check' was called, encoder have binded to 
any crtc, so the 'drm_of_encoder_active_endpoint_id' would be failed.
-  If we return failure in this case, then '.atomic_check' would be 
called again, then failed again, dead loop.
-  If we return zero in this case and set a default 
output_mode/output_type, then '.atomic_check' would be successes, then 
'crtc->enable' function would use that default setting.
    When framework called the 'atomic_check' again, then 
'drm_of_encoder_active_endpoint_id' would return the right value, and 
'crtc_state would be set rightly. *But* 'vop->enable' wouldn't take care 
of those setting, caused it would return directly after detect vop have 
been enabled.

    This bug need patches both in connector and crtc driver, need more 
discuss about this. ;)

Thanks,
- Yakir

>> +
>> +       switch (dp->data->chip_type) {
>> +       case RK3399_EDP:
>> +               /*
>> +                * For RK3399, VOP Lit must code the out mode to RGB888,
>> +                * VOP Big must code the out mode to RGB10.
>> +                */
>> +               if (ret)
>> +                       s->output_mode = ROCKCHIP_OUT_MODE_P888;
>> +               else
>> +                       s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
>> +               break;
>> +
>> +       default:
>> +               s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
>> +               break;
>> +       }
>> +
> This chunk seems overly complicated. I'd suggest:
>
> s->output_type = DRM_MODE_CONNECTOR_eDP;
> s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
> if (dp->data->chip_type == RK3399_EDP) {
>          ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
>          if (ret > 0)
>                 s->output_mode = ROCKCHIP_OUT_MODE_P888;
> }

Ah, much clean, done.

Thanks,
- Yakir

>
>>          s->output_type = DRM_MODE_CONNECTOR_eDP;
>>
>>          return 0;
>> @@ -382,6 +405,13 @@ static const struct dev_pm_ops rockchip_dp_pm_ops = {
>>          SET_SYSTEM_SLEEP_PM_OPS(rockchip_dp_suspend, rockchip_dp_resume)
>>   };
>>
>> +static const struct rockchip_dp_chip_data rk3399_edp = {
>> +       .lcdsel_grf_reg = 0x6250,
>> +       .lcdsel_big = 0 | BIT(21),
>> +       .lcdsel_lit = BIT(5) | BIT(21),
>> +       .chip_type = RK3399_EDP,
>> +};
>> +
>>   static const struct rockchip_dp_chip_data rk3288_dp = {
>>          .lcdsel_grf_reg = 0x025c,
>>          .lcdsel_big = 0 | BIT(21),
>> @@ -391,6 +421,7 @@ static const struct rockchip_dp_chip_data rk3288_dp = {
>>
>>   static const struct of_device_id rockchip_dp_dt_ids[] = {
>>          {.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
>> +       {.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
>>          {}
>>   };
>>   MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index 06c0250..82b8135 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -20,6 +20,7 @@ enum analogix_dp_devtype {
>>
>>   enum analogix_dp_sub_devtype {
>>          RK3288_DP,
>> +       RK3399_EDP,
>>   };
>>
>>   struct analogix_dp_plat_data {
>> --
>> 1.9.1
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
