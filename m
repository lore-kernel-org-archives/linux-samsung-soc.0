From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v4 0/16] Add Analogix Core Display Port Driver
Date: Wed, 02 Sep 2015 10:15:41 +0800
Message-ID: <55E65BCD.7090804@rock-chips.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com> <3233920.KG0buE86B2@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:42299 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461AbbIBCQO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Sep 2015 22:16:14 -0400
In-Reply-To: <3233920.KG0buE86B2@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, robherring2@gmail.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel

Hi Heiko,

=E5=9C=A8 09/02/2015 05:47 AM, Heiko Stuebner =E5=86=99=E9=81=93:
> Hi Yakir,
>
> Am Dienstag, 1. September 2015, 13:46:11 schrieb Yakir Yang:
>>     The Samsung Exynos eDP controller and Rockchip RK3288 eDP contro=
ller
>> share the same IP, so a lot of parts can be re-used. I split the com=
mon
>> code into bridge directory, then rk3288 and exynos only need to keep
>> some platform code. Cause I can't find the exact IP name of exynos d=
p
>> controller, so I decide to name dp core driver with "analogix" which=
 I
>> find in rk3288 eDP TRM ;)
>>
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
>> I have verified this series on two kinds of rockchip platform board,=
 one
>> is rk3288 sdk board which connect with a 2K display port monitor, th=
e other
>> is google jerry chromebook which connect with a eDP screen "cnm,n116=
bgeea2",
>> both of them works rightlly.
> it looks like during the rebase something did go wrong and I found so=
me issues
> I mentioned in the replies to individual patches.
>
> I did prepare a branch based on mainline [0] with both the old and th=
e new edp
> driver - rk3288_veyron_defconfig build both drivers into the image.
>
> While the old driver still works, I wasn't able to make the new one w=
ork yet
> ... the drm core does find the connector, but not that anything is co=
nnected
> to it. I'll try to dig deeper tomorrow, but maybe you'll see anything
> interesting before then.

Many thanks for your comment and debug, I would rebase on your
"edp-with-veyron" branch and fix the broken, make sure v6 would
work rightly at least in your side and my side.

- Yakir

>
> Heiko
>
> [0] https://github.com/mmind/linux-rockchip/tree/tmp/edp-with-veyron
>
>
>
>
