From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to
 module init
Date: Thu, 20 Nov 2014 15:22:23 +0530
Message-ID: <CAFp+6iFCLfSECHZ21Ho8-+USie3pmtqZwh7x2ULqdNjGXGX1pw@mail.gmail.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
	<7hh9xwxsev.fsf@deeprootsystems.com>
	<546CCAB8.9050402@collabora.co.uk>
	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
	<CAFp+6iEgBYP3cgThss8U1wS=O-rapnQz_akD+y9zR7JtWhhKTg@mail.gmail.com>
	<546DAA23.9070204@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:34338 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755932AbaKTJwY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 04:52:24 -0500
Received: by mail-qa0-f53.google.com with SMTP id bm13so1717839qab.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2014 01:52:23 -0800 (PST)
In-Reply-To: <546DAA23.9070204@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kevin Hilman <khilman@kernel.org>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Hi Javier,


On Thu, Nov 20, 2014 at 2:15 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Vivek,
>
> On 11/20/2014 08:51 AM, Vivek Gautam wrote:
>>>
>>> I tested linux-next on Exynos5800 peach-pi board with linux-next and and the two
>>> patches $Subject and [0].
>>>
>>> Below is my git hash:
>>> 4d9e6ee drm/exynos: Move platform drivers registration to module init
>>> 4545ed4 POSTED: arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
>>> 36391a5 Add linux-next specific files for 20141119
>>> 9b1ced1 Merge branch 'akpm/master'
>>> 282497e mm: add strictlimit knob
>>
>> used exynos_defconfig
>>
>
> Same here.
>
>>>
>>> With this display works for me.
>>> Without $Subject patch i get lookup in drm.
>>>
>
> I tested with today linux-next (next-20141120) and display is indeed
> working for me. So it seems that whatever caused the error in the
> phy-exynos-mipi-video driver reported by Paolo, got fixed recently.
>
> My working git hash is:
>
> 65a8d01 arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> a9b43cb drm/exynos: Move platform drivers registration to module init
> 5b83d7a Add linux-next specific files for 20141120
> 1172916 mm: add strictlimit knob
>
> I did have to disable CONFIG_SND_SOC_SNOW though, otherwise the kernel
> did not boot due the issue reported previously by Kevin.
>
>>> Javier can you tell me your git hash. Was it on yesterday's linux-next ?
>>
>
> In fact, my branch where I could reproduce the phy-exynos-mipi-video issue
> was not based on yesterday's next but next-20141117. The git hash is:
>
> 9fb5d7c arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> f740096 drm/exynos: Move platform drivers registration to module init
> efefb5c Add linux-next specific files for 20141117
> 8c944d7 mm: add strictlimit knob
>
>> With 3.18-rc5 i could see display on Exynos5800 peach-pi with
>> following git hash:
>>
>> b6dca11 drm/exynos: dp: Remove support for unused dptx-phy
>> 7cc5c2d ARM: exynos_defconfig: Enable options for display panel support
>> d0aca5e arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
>> fc14f9c Linux 3.18-rc5
>> e35c5a2 Merge tag 'armsoc-for-rc5' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
>>
>> I don't need this drm lockup patch with 3.18-rc5 (with exynos_defconfig).
>>
>
> Yes, that works because the commit that caused the Exynos DRM lockup was:
>
> 43c0767 ("of/platform: Move platform devices under /sys/devices/platform")
>
> which landed in next-20141105.
>
> Reverting 43c0767 and only applying [0] should have the same effect.
>
>> I am checking further with linux-samsung, coz i could see weird
>> behavior as mentioned
>> in [1] with linux-samsun/for-next merged with above git hash.
>>
>
> Great, it should be good to know what caused:

On linux-samsung tree the only patch that's missing apart from dptx-phy patches
is the syscon patch from Pankaj Dubey:
b784b98 mfd: syscon: Decouple syscon interface from platform devices

So with below git hash, linux-samsung/for-next display works fine along with
other devices that request PMU system controller :

7bd219e drm/exynos: dp: Remove support for unused dptx-phy
e8f21fd arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
7099bde Revert "Revert "ARM: exynos_defconfig: Enable options for
display panel support""
713a994 mfd: syscon: Decouple syscon interface from platform devices
7552917 Revert "ARM: exynos_defconfig: Enable options for display
panel support"             /* This is Kukjin's for-next today */
ff0391a Merge branch 'v3.19-samsung-defconfig' into for-next
26c6283 Merge branch 'v3.18-samsung-fixes' into for-next
cf864fd Merge branch 'v3.18-samsung-defconfig' into for-next
98b6380 ARM: exynos_defconfig: Enable max77802 rtc and clock drivers
839275c ARM: exynos_defconfig: Use 16 minors per MMC block device
0526f27 ARM: dts: Explicitly set dr_mode on exynos5250-snow
fc14f9c Linux 3.18-rc5


>
> exynos-mipi-video-phy 10040714.video-phy: can't request region for resource [mem 0x10040714-0x1004071f]

The only reason i see this fails is since PMU is now requesting the
entire memory
region with base 0x10040000. We should convert the mipi-phy pmu
register handling
too through syscon.

>
> even when I could not reproduce it anymore with today's linux-next.
>
>>>> [0]: https://lkml.org/lkml/2014/10/30/394
>>>> [1]: http://www.spinics.net/lists/linux-samsung-soc/msg39032.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
