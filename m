From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 09/16] drm: rockchip: add bpc and color mode setting
Date: Wed, 02 Sep 2015 10:06:36 +0800
Message-ID: <55E659AC.9000402@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <1441087308-25455-1-git-send-email-ykk@rock-chips.com> <120097760.HO2inCimVA@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:37624 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751240AbbIBCHX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Sep 2015 22:07:23 -0400
In-Reply-To: <120097760.HO2inCimVA@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel

Hi Heiko,

=E5=9C=A8 09/02/2015 05:00 AM, Heiko Stuebner =E5=86=99=E9=81=93:
> Hi Yakir,
>
> Am Dienstag, 1. September 2015, 14:01:48 schrieb Yakir Yang:
>> From: Mark Yao <yzq@rock-chips.com>
>>
>> Add bpc and color mode setting in rockchip_drm_vop driver, so
>> connector could try to use the edid drm_display_info to config
>> vop output mode.
>>
>> Signed-off-by: Mark Yao <yzq@rock-chips.com>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2: None
>>
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 46
>> +++++++++++++++++++------ drivers/gpu/drm/rockchip/dw_hdmi-rockchip.=
c     |
>>   2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_drv.h     |  2 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c     | 33 +++++++++++++=
+++--
>>   4 files changed, 68 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c index cebff9e..efe=
a045
>> 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -11,11 +11,6 @@
>>    * Free Software Foundation; either version 2 of the License, or (=
at your
>>    * option) any later version.
>>    */
>> -#include <drm/drmP.h>
>> -#include <drm/drm_crtc_helper.h>
>> -#include <drm/drm_panel.h>
>> -#include <drm/drm_of.h>
>> -#include <drm/drm_dp_helper.h>
>>
>>   #include <linux/component.h>
>>   #include <linux/mfd/syscon.h>
>> @@ -27,6 +22,13 @@
>>   #include <video/of_videomode.h>
>>   #include <video/videomode.h>
>>
>> +#include <drm/drmP.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_panel.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_dp_helper.h>
>> +
>>   #include <drm/bridge/analogix_dp.h>
>>
>>   #include "rockchip_drm_drv.h"
>> @@ -125,20 +127,44 @@ static void rockchip_dp_drm_encoder_mode_set(s=
truct
>> drm_encoder *encoder, /* do nothing */
>>   }
>>
>> +static drm_connector *rockchip_dp_get_connector(struct rockchip_dp_=
device
> missing a "struct" -> static struct drm_connector

What the hell mistake I make in v5  :-(

Thanks a lot, I would fix this as soon as possible

>
>> *dp) +{
>> +	struct drm_connector *connector;
>> +	struct drm_device *drm_dev =3D dp->drm_dev;
>> +
>> +	drm_for_each_connector(connector, drm_dev) {
>> +		if (connector->encoder !=3D &dp->encoder)
>> +			return connector;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>>   static void rockchip_dp_drm_encoder_prepare(struct drm_encoder *en=
coder)
>>   {
>>   	struct rockchip_dp_device *dp =3D encoder_to_dp(encoder);
>> +	struct drm_connector *connector;
>> +	int ret =3D 0;
>>   	u32 val;
>> -	int ret;
>>
>> -	ret =3D rockchip_drm_crtc_mode_config(encoder->crtc,
>> -					    DRM_MODE_CONNECTOR_eDP,
>> -					    ROCKCHIP_OUT_MODE_AAAA);
>> -	if (ret < 0) {
>> +	connector =3D rockchip_dp_get_connector(dp);
>> +	if (!connector) {
>> +		DRM_ERROR("Failed to get connector by encoder[%p]\n", encoder);
>> +		return;
>> +	}
>> +
>> +	if (connector->display_info.color_formats | DRM_COLOR_FORMAT_RGB44=
4)
>> +		ret =3D rockchip_drm_crtc_mode_config(
>> +			encoder->crtc, DRM_MODE_CONNECTOR_eDP,
>> +			connector->display_info.bpc, DRM_COLOR_FORMAT_RGB444);
>> +	if (!ret) {
>>   		dev_err(dp->dev, "Could not set crtc mode config: %d.\n", ret);
>>   		return;
>>   	}
>>
>> +	connector->display_info.bpc =3D ret;
>> +	connector->display_info.color_formats =3D DRM_COLOR_FORMAT_RGB444;
>> +
>>   	ret =3D rockchip_drm_encoder_get_mux_id(dp->dev->of_node, encoder=
);
>>   	if (ret < 0)
>>   		return;
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c index 80d6fc8..428a3c1=
 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> @@ -215,7 +215,7 @@ static void dw_hdmi_rockchip_encoder_commit(stru=
ct
>> drm_encoder *encoder) static void dw_hdmi_rockchip_encoder_prepare(s=
truct
>> drm_encoder *encoder) {
>>   	rockchip_drm_crtc_mode_config(encoder->crtc, DRM_MODE_CONNECTOR_H=
DMIA,
>> -				      ROCKCHIP_OUT_MODE_AAAA);
>> +				      10, DRM_COLOR_FORMAT_RGB444);
>>   }
>>
>>   static struct drm_encoder_helper_funcs
>> dw_hdmi_rockchip_encoder_helper_funcs =3D { diff --git
>> a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
>> b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h index dc4e5f0..ef1d7fb=
 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
>> @@ -59,7 +59,7 @@ void rockchip_unregister_crtc_funcs(struct drm_dev=
ice
>> *dev, int pipe); int rockchip_drm_encoder_get_mux_id(struct device_n=
ode
>> *node,
>>   				    struct drm_encoder *encoder);
>>   int rockchip_drm_crtc_mode_config(struct drm_crtc *crtc, int
>> connector_type, -				  int out_mode);
>> +				  int bpc, int color);
>>   int rockchip_drm_dma_attach_device(struct drm_device *drm_dev,
>>   				   struct device *dev);
>>   void rockchip_drm_dma_detach_device(struct drm_device *drm_dev,
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c index 34b78e7..5d7f9b6=
 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> @@ -811,14 +811,41 @@ static const struct drm_plane_funcs vop_plane_=
funcs =3D
>> {
>>
>>   int rockchip_drm_crtc_mode_config(struct drm_crtc *crtc,
>>   				  int connector_type,
>> -				  int out_mode)
>> +				  int bpc, int color)
>>   {
>>   	struct vop *vop =3D to_vop(crtc);
>> -
>>   	vop->connector_type =3D connector_type;
>>   	vop->connector_out_mode =3D out_mode;
> this line should probably go away, as the source var "out_mode" does =
not exist
> in the function params any more, making the compilation break, and is=
 set
> below anyway.

Sorry for the failed, there are must be a problem when I backport those=
 code
to chrome-3.14 to verify.

Thanks a lot, I would update next version soon.
- Yakir

>
> Heiko
>
>> -	return 0;
>> +	/*
>> +	 * RK3288 vop only support RGB Color output.
>> +	 */
>> +	if (color !=3D DRM_COLOR_FORMAT_RGB444) {
>> +		DRM_ERROR("Only support output RGB444, not support%d\n",
>> +			  color);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * Fixme: I don't know how to describe the ROCKCHIP_OUT_MODE_P565'=
s
>> +	 * bpc, 5 or 6?
>> +	 *
>> +	 */
>> +	if (bpc >=3D 10) {
>> +		bpc =3D 10;
>> +		vop->connector_out_mode =3D ROCKCHIP_OUT_MODE_AAAA;
>> +	} else if (bpc >=3D 8) {
>> +		bpc =3D 8;
>> +		vop->connector_out_mode =3D ROCKCHIP_OUT_MODE_P888;
>> +	} else if (bpc >=3D 6) {
>> +		bpc =3D 6;
>> +		vop->connector_out_mode =3D ROCKCHIP_OUT_MODE_P888;
>> +	} else {
>> +		DRM_ERROR("unsupport bpc %d\n", bpc);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return bpc;
>>   }
>>   EXPORT_SYMBOL_GPL(rockchip_drm_crtc_mode_config);
>
>
>
