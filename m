From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 08/10] drm/rockchip: analogix_dp: correct the connector
 display color format and bpc
Date: Wed, 29 Jun 2016 14:41:41 +0800
Message-ID: <57736DA5.5020005@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
 <1465904793-1071-1-git-send-email-ykk@rock-chips.com>
 <CAOw6vb+bPGSkNMF+4VWOu3FtTws2EH0fQcRQwyv29rRh4VjQjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:53029 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328AbcF2Gly (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 02:41:54 -0400
In-Reply-To: <CAOw6vb+bPGSkNMF+4VWOu3FtTws2EH0fQcRQwyv29rRh4VjQjg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Emil Velikov <emil.l.velikov@gmail.com>, Douglas Anderson <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tomasz Figa <tomasz.figa@chromium.com>, =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>

Sean,

On 06/23/2016 10:19 PM, Sean Paul wrote:
> On Tue, Jun 14, 2016 at 7:46 AM, Yakir Yang <ykk@rock-chips.com> wrote:
>> Rockchip VOP couldn't output YUV video format for eDP controller, so
>> when driver detect connector support YUV video format, we need to hack
>> it down to RGB888.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> Acked-by: Mark Yao <mark.yao@rock-chips.com>
>> ---
>> Changes in v3:
>> - Hook the connector's color_formats in .get_modes directly. (Tomasz, reviewed at Google Gerrit)
>>      [https://chromium-review.googlesource.com/#/c/346317/15]
>> - Add the acked flag from Mark.
>>
>> Changes in v2: None
>>
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index da2e844..95a6f60 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -102,6 +102,22 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>>          return 0;
>>   }
>>
>> +static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
>> +                                struct drm_connector *connector)
>> +{
>> +       struct drm_display_info *di = &connector->display_info;
>> +
>> +       if (di->color_formats & DRM_COLOR_FORMAT_YCRCB444 ||
>> +           di->color_formats & DRM_COLOR_FORMAT_YCRCB422) {
>> +               di->color_formats &= ~(DRM_COLOR_FORMAT_YCRCB422 |
>> +                                      DRM_COLOR_FORMAT_YCRCB444);
>> +               di->color_formats |= DRM_COLOR_FORMAT_RGB444;
>> +               di->bpc = 8;
> Probably a stupid question, but are you guaranteed that the panel will
> support this color format?

Hmm... I'm not sure, but it works on my several panels. I guess RGB is 
more common then YUV, so if panel support YUV format, it should support 
RGB888 too.

>> +       }
>> +
> I think this can be simplified as follows:
>
> /* A comment here about why we're doing this */
> u32 mask = DRM_COLOR_FORMAT_YCRCB444 | DRM_COLOR_FORMAT_YCRCB422;
> if ((di->color_formats & mask)) {
>      DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
>      di->color_formats &= ~mask;
>      di->color_formats |= DRM_COLOR_FORMAT_RGB444;
>      di->bpc = 8;
> }

Done, good idea.

Thanks,
- Yakir

>> +       return 0;
>> +}
>> +
>>   static bool
>>   rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
>>                                     const struct drm_display_mode *mode,
>> @@ -313,6 +329,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
>>          dp->plat_data.subdev_type = dp_data->chip_type;
>>          dp->plat_data.power_on = rockchip_dp_poweron;
>>          dp->plat_data.power_off = rockchip_dp_powerdown;
>> +       dp->plat_data.get_modes = rockchip_dp_get_modes;
>>
>>          return analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
>>   }
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
