From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration
 to module init
Date: Thu, 20 Nov 2014 09:45:23 +0100
Message-ID: <546DAA23.9070204@collabora.co.uk>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>	<7hh9xwxsev.fsf@deeprootsystems.com>	<546CCAB8.9050402@collabora.co.uk>	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com> <CAFp+6iEgBYP3cgThss8U1wS=O-rapnQz_akD+y9zR7JtWhhKTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:60908 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750848AbaKTIpa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 03:45:30 -0500
In-Reply-To: <CAFp+6iEgBYP3cgThss8U1wS=O-rapnQz_akD+y9zR7JtWhhKTg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>, Kevin Hilman <khilman@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Hello Vivek,

On 11/20/2014 08:51 AM, Vivek Gautam wrote:
>>
>> I tested linux-next on Exynos5800 peach-pi board with linux-next and and the two
>> patches $Subject and [0].
>>
>> Below is my git hash:
>> 4d9e6ee drm/exynos: Move platform drivers registration to module init
>> 4545ed4 POSTED: arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
>> 36391a5 Add linux-next specific files for 20141119
>> 9b1ced1 Merge branch 'akpm/master'
>> 282497e mm: add strictlimit knob
> 
> used exynos_defconfig
>

Same here.

>>
>> With this display works for me.
>> Without $Subject patch i get lookup in drm.
>>

I tested with today linux-next (next-20141120) and display is indeed
working for me. So it seems that whatever caused the error in the
phy-exynos-mipi-video driver reported by Paolo, got fixed recently.

My working git hash is:

65a8d01 arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
a9b43cb drm/exynos: Move platform drivers registration to module init
5b83d7a Add linux-next specific files for 20141120
1172916 mm: add strictlimit knob

I did have to disable CONFIG_SND_SOC_SNOW though, otherwise the kernel
did not boot due the issue reported previously by Kevin.

>> Javier can you tell me your git hash. Was it on yesterday's linux-next ?
> 

In fact, my branch where I could reproduce the phy-exynos-mipi-video issue
was not based on yesterday's next but next-20141117. The git hash is:

9fb5d7c arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
f740096 drm/exynos: Move platform drivers registration to module init
efefb5c Add linux-next specific files for 20141117
8c944d7 mm: add strictlimit knob

> With 3.18-rc5 i could see display on Exynos5800 peach-pi with
> following git hash:
> 
> b6dca11 drm/exynos: dp: Remove support for unused dptx-phy
> 7cc5c2d ARM: exynos_defconfig: Enable options for display panel support
> d0aca5e arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> fc14f9c Linux 3.18-rc5
> e35c5a2 Merge tag 'armsoc-for-rc5' of
> git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
> 
> I don't need this drm lockup patch with 3.18-rc5 (with exynos_defconfig).
> 

Yes, that works because the commit that caused the Exynos DRM lockup was:

43c0767 ("of/platform: Move platform devices under /sys/devices/platform")

which landed in next-20141105.

Reverting 43c0767 and only applying [0] should have the same effect.

> I am checking further with linux-samsung, coz i could see weird
> behavior as mentioned
> in [1] with linux-samsun/for-next merged with above git hash.
>

Great, it should be good to know what caused:

exynos-mipi-video-phy 10040714.video-phy: can't request region for resource [mem 0x10040714-0x1004071f]

even when I could not reproduce it anymore with today's linux-next.

>>> [0]: https://lkml.org/lkml/2014/10/30/394
>>> [1]: http://www.spinics.net/lists/linux-samsung-soc/msg39032.html

Best regards,
Javier
