From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 05/10] drm/rockchip: analogix_dp: add rk3399 eDP
 support
Date: Wed, 25 May 2016 13:55:11 +0800
Message-ID: <57453E3F.8030600@rock-chips.com>
References: <1464066147-22734-1-git-send-email-ykk@rock-chips.com>
 <1464073043-4931-1-git-send-email-ykk@rock-chips.com>
 <6183955.XzKjc41sjW@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:54641 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932126AbcEYFz1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2016 01:55:27 -0400
In-Reply-To: <6183955.XzKjc41sjW@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Javier Martinez Canillas <javier@osg.samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org



On 05/24/2016 06:17 PM, Heiko Stuebner wrote:
> Am Dienstag, 24. Mai 2016, 14:57:23 schrieb Yakir Yang:
> [........]
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c index 29c4105..d5d=
4e04
>> 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -148,6 +148,10 @@ rockchip_dp_drm_encoder_atomic_check(struct
>> drm_encoder *encoder, struct drm_connector_state *conn_state)
>>   {
>>   	struct rockchip_crtc_state *s =3D to_rockchip_crtc_state(crtc_sta=
te);
>> +	struct rockchip_dp_device *dp =3D to_dp(encoder);
>> +	int ret;
>> +
>> +	s->output_type =3D DRM_MODE_CONNECTOR_eDP;
>>
>>   	/*
>>   	 * FIXME(Yakir): driver should configure the CRTC output video
>> @@ -162,8 +166,27 @@ rockchip_dp_drm_encoder_atomic_check(struct
>> drm_encoder *encoder, * But if I configure CTRC to RGBaaa, and eDP d=
river
>> still keep * RGB666 input video mode, then screen would works prefec=
t.
>>   	 */
>> -	s->output_mode =3D ROCKCHIP_OUT_MODE_AAAA;
>> -	s->output_type =3D DRM_MODE_CONNECTOR_eDP;
>> +
>> +	ret =3D drm_of_encoder_active_endpoint_id(dp->dev->of_node, encode=
r);
>> +	if (ret < 0)
>> +		return;
> this needs a value returned (probably ret), otherwise you create a
> warning: =E2=80=98return=E2=80=99 with no value, in function returnin=
g non-void
Done,

Thanks,
- Yakir
>
> drm_of_encoder_active_endpoint_id also always returns -EINVAL on rk32=
88-
> veyron-jerry because encoder->crtc is unset in
> drm_of_encoder_active_endpoint and that breaks display output right n=
ow.
>
> Looking through drm code it seems only two functions would set encode=
r->crtc
> - drm_atomic_helper_update_legacy_modeset_state
> - drm_crtc_helper_set_config
>
> drm_crtc_helper_set_config callback got dropped in the atomic-convers=
ion and
> the other sounds to be somewhat in the legacy area.
>
> After that drm-internals get a bit confusing.
>
>
> Heiko
>
>
>
