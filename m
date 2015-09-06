From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 11/16] drm: bridge: analogix/dp: add platform device
 type support
Date: Sun, 06 Sep 2015 12:07:22 +0800
Message-ID: <55EBBBFA.3020801@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <1441087620-25586-1-git-send-email-ykk@rock-chips.com> <55E8E77C.4020305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:47248 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750991AbbIFEH6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Sep 2015 00:07:58 -0400
In-Reply-To: <55E8E77C.4020305@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Hi Krzysztof,

=E5=9C=A8 09/04/2015 08:36 AM, Krzysztof Kozlowski =E5=86=99=E9=81=93:
> On 01.09.2015 15:07, Yakir Yang wrote:
>
> Empty commit message. Please explain here why you want to add platfor=
m
> device type support.
>
> Actually the title is confusing. You are not adding support for platf=
orm
> device types but rather adding a field containing type of device.
>
>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2:
>> - Add GNU license v2 declared and samsung copyright
>>
>>   drivers/gpu/drm/exynos/exynos_dp.c              |  1 +
>>   drivers/gpu/drm/rockchip/analogix_dp-rockchip.c |  1 +
>>   include/drm/bridge/analogix_dp.h                | 16 +++++++++++++=
+++
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/ex=
ynos/exynos_dp.c
>> index 6060d2c..40ef727 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
>> @@ -224,6 +224,7 @@ static int exynos_dp_bind(struct device *dev, st=
ruct device *master, void *data)
>>   	dp->dev =3D dev;
>>   	dp->drm_dev =3D drm_dev;
>>  =20
>> +	dp->plat_data.dev_type =3D EXYNOS_DP;
>>   	dp->plat_data.power_on =3D exynos_dp_poweron;
>>   	dp->plat_data.power_off =3D exynos_dp_poweroff;
>>   	dp->plat_data.get_modes =3D exynos_dp_get_modes;
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drive=
rs/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index efea045..4934271 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -293,6 +293,7 @@ static int rockchip_dp_bind(struct device *dev, =
struct device *master,
>>   		return ret;
>>   	}
>>  =20
>> +	dp->plat_data.dev_type =3D RK3288_DP;
>>   	dp->plat_data.attach =3D NULL;
>>   	dp->plat_data.get_modes =3D NULL;
>>   	dp->plat_data.power_on =3D rockchip_dp_poweron;
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/a=
nalogix_dp.h
>> index 8b4ffad..7209a64 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -1,9 +1,25 @@
>> +/*
>> + * Analogix Core DP (Display Port) interface driver.
>> + *
>> + * Copyright (C) 2012 Samsung Electronics Co., Ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify it
>> + * under the terms of the GNU General Public License as published b=
y the
>> + * Free Software Foundation; either version 2 of the License, or (a=
t your
>> + * option) any later version.
>> + */
> Two questions:
> 1. Why this change is here? I would rather expect it at patch 3/16 wh=
en
> you created this file... That is the usual time for adding copyrights=
=2E

Yep, I should move this to 03/16.

> 2. Does this file contains previous Samsung work?

Hmm... I think this haven't contains the previous Samsung works,
but I have the cover the head message from analogix_dp_core driver
(include the copyright, but without ant author).

Thanks
- Yakir

> Best regards,
> Krzysztof
>
>>   #ifndef _ANALOGIX_DP_H_
>>   #define _ANALOGIX_DP_H_
>>  =20
>>   #include <drm/drm_crtc.h>
>>  =20
>> +enum analogix_dp_devtype {
>> +	EXYNOS_DP,
>> +	RK3288_DP,
>> +};
>> +
>>   struct analogix_dp_plat_data {
>> +	enum analogix_dp_devtype dev_type;
>>   	struct drm_panel *panel;
>>  =20
>>   	int (*power_on)(struct analogix_dp_plat_data *);
>>
>
>
>
