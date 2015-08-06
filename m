From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [RFC PATCH 0/8] Add Analogix Core Display Port Driver
Date: Thu, 6 Aug 2015 23:00:47 +0800
Message-ID: <55C3769F.2010405@rock-chips.com>
References: <1438868947-22132-1-git-send-email-ykk@rock-chips.com>
 <000201d0d056$06cff040$146fd0c0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.139]:45082 "EHLO
	regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075AbbHFPAy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Aug 2015 11:00:54 -0400
In-Reply-To: <000201d0d056$06cff040$146fd0c0$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jingoohan1@gmail.com>, 'Heiko Stuebner' <heiko@sntech.de>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Fabio Estevam' <fabio.estevam@freescale.com>, 'Inki Dae' <inki.dae@samsung.com>
Cc: djkurtz@google.com, dianders@google.com, 'Takashi Iwai' <tiwai@suse.de>, 'Andrzej Hajda' <a.hajda@samsung.com>, 'Thierry Reding' <treding@nvidia.com>, 'Philipp Zabel' <p.zabel@pengutronix.de>, 'David Airlie' <airlied@linux.ie>, 'Gustavo Padovan' <gustavo.padovan@collabora.co.uk>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Vincent Palatin' <vpalatin@chromium.org>, 'Mark Yao' <mark.yao@rock-chips.com>, 'Andy Yan' <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Jingoo,

=E5=9C=A8 2015/8/6 22:41, Jingoo Han =E5=86=99=E9=81=93:
> On Thursday, August 06, 2015 10:49 PM, Yakir Yang wrote:
>> Hi all,
>>     Samsung exynos and Rockchip rk3288 almost share same dp controll=
er,
>> so I split the common code out, then rk3288 and exynos can re-used t=
he
>> same dp core driver. Cause I can't find the exact IP name of exynos =
dp
>> controller, so I decide to name dp core driver with "analogix" which=
 I
>> find in rk3288 eDP TRM ;)
>
> OK, I see.
> The Samsung Exynos eDP contoller and Rockchip rk3288 eDP contoller sh=
are
> the same IP. So, a lot of parts can be re-used. I agree with this.
> However, we have to review the code carefully, as others did.
Yeah, feel happy to be reviewed  ;)

> I also cannot find the exact IP name. The "analogix" may be the vendo=
r name
> of this IP.
Okay, so "analogix" is okay for now

Thanks,
- Yakir
> Best regards,
> Jingoo Han
>
>> Beyond that, there are three light registers setting differents bewt=
een
>> exynos and rk3288.
>> 1. RK3288 have five special pll resigters which not indicata in exyn=
os
>>     dp controller.
>> 2. The address of DP_PHY_PD(dp phy power manager register) are diffe=
rent
>>     between rk3288 and exynos.
>> 3. Rk3288 and exynos have different setting with AUX_HW_RETRY_CTL(dp=
 debug
>>     register).
>>
>> My series patches can be divider into two parts: One for spliting th=
e
>> analogix_dp code from exynos dp driver. Another are trying to add rk=
3288
>> dp driver support.
>>
>> Best regards,
>> - Yakir
>>
>>
>> --
>> 2.1.2
>
>
>
>
