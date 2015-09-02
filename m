From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 03/16] drm: bridge: analogix/dp: split exynos dp driver
 to bridge dir
Date: Wed, 02 Sep 2015 09:45:05 +0800
Message-ID: <55E654A1.7010100@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <1441086598-24995-1-git-send-email-ykk@rock-chips.com> <2618155.E00Pak1qvi@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:47613 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751513AbbIBBpw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Sep 2015 21:45:52 -0400
In-Reply-To: <2618155.E00Pak1qvi@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel

Heiko,

=E5=9C=A8 09/02/2015 04:46 AM, Heiko Stuebner =E5=86=99=E9=81=93:
> Am Dienstag, 1. September 2015, 13:49:58 schrieb Yakir Yang:
>> Split the dp core driver from exynos directory to bridge
>> directory, and rename the core driver to analogix_dp_*,
>> leave the platform code to analogix_dp-exynos.
>>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> [...]
>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c similarity inde=
x 50%
>> rename from drivers/gpu/drm/exynos/exynos_dp_core.c
>> rename to drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index bed0252..7d62f22 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> [...]
>
>>   	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>>
>>   	ret =3D drm_connector_init(dp->drm_dev, connector,
>> -				 &exynos_dp_connector_funcs,
>> +				 &analogix_dp_connector_funcs,
>>   				 DRM_MODE_CONNECTOR_eDP);
>>   	if (ret) {
>>   		DRM_ERROR("Failed to initialize connector with drm\n");
>>   		return ret;
>>   	}
>>
>> -	drm_connector_helper_add(connector, &exynos_dp_connector_helper_fu=
ncs);
>> +	drm_connector_helper_add(connector,
>> +				 &analogix_dp_connector_helper_funcs);
>>   	drm_connector_register(connector);
> this should only run on exynos, as we're doing all our connector regi=
stration
> in the core driver after all components are bound, so I guess somethi=
ng like
> the following is needed:
>
>         if (dp->plat_data && dp->plat_data->dev_type =3D=3D EXYNOS_DP=
)
>                 drm_connector_register(connector);
>

Oh, good catch, thanks

>
>>   	drm_mode_connector_attach_encoder(connector, encoder);
>>
> [...]
>
>> @@ -1301,7 +1239,10 @@ static int exynos_dp_bind(struct device *dev,=
 struct
>> device *master, void *data) if (IS_ERR(dp->reg_base))
>>   		return PTR_ERR(dp->reg_base);
>>
>> -	dp->hpd_gpio =3D of_get_named_gpio(dev->of_node, "samsung,hpd-gpio=
", 0);
>> +	dp->hpd_gpio =3D of_get_named_gpio(dev->of_node, "hpd-gpios", 0);
>> +	if (gpio_is_valid(dp->hpd_gpio))
> this should be !gpio_is_valid ... i.e. only check the old property if=
 the new
> one is _not_ valid

Oh, much appreciate  ;)

- Yakir

>
>> +		dp->hpd_gpio =3D of_get_named_gpio(dev->of_node,
>> +						 "samsung,hpd-gpio", 0);
>>
>>   	if (gpio_is_valid(dp->hpd_gpio)) {
>>   		/*
>
>
>
