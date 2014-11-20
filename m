From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to
 module init
Date: Thu, 20 Nov 2014 13:21:16 +0530
Message-ID: <CAFp+6iEgBYP3cgThss8U1wS=O-rapnQz_akD+y9zR7JtWhhKTg@mail.gmail.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
	<7hh9xwxsev.fsf@deeprootsystems.com>
	<546CCAB8.9050402@collabora.co.uk>
	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:54936 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750838AbaKTHvR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 02:51:17 -0500
Received: by mail-qg0-f53.google.com with SMTP id q108so1689774qgd.40
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2014 23:51:16 -0800 (PST)
In-Reply-To: <CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

Hi,


On Thu, Nov 20, 2014 at 12:36 PM, Vivek Gautam
<gautamvivek1987@gmail.com> wrote:
> Hi Javier, Kevin,
>
>
>
> On Wed, Nov 19, 2014 at 10:22 PM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
>> [adding Paolo and Vivek as cc]
>>
>> Hello,
>>
>> On 11/18/2014 07:41 PM, Kevin Hilman wrote:
>>>
>>> It fixes the DRM deadlock, issue for me on exynos5800-peach-pi, but then
>>> it proceeds to panic in the workqueue code called by the asoc max98090
>>> codec[1].
>>>
>>> If I then disable CONFIG_SND_SOC_SNOW, I can get it to boot to a shell,
>>> but I still don't have display output.
>>>
>>
>> Paolo Pisati pointed out in another thread that he needed the patch
>> "[PATCH v2 2/2] arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy"
>> is also needed to get display working for exynos on linux-next.
>>
>> I've pinged Kukjin to apply this as a -rc fix since is needed after
>> a5ec598 ("phy: exynos-dp-video: Use syscon support to control pmu register")
>> landed in 3.18 which broke the Exynos Display Port PHY:
>>
>> exynos-dp-video-phy 10040728.video-phy: Failed to lookup PMU regmap
>>
>> I've an Exynos5800 Peach Pi now so I wanted to test display on it. Just $subject
>> and [0] should be enough to have display working on Peach Pi with linux-next but
>> it fails to me with:
>>
>> exynos-mipi-video-phy 10040714.video-phy: can't request region for resource [mem 0x10040714-0x1004071f]
>>
>> The same issue was reported by Paolo a couple of days ago [1].
>>
>> Vivek,
>>
>> Any idea what could cause this regression on linux-next? As reported by Paolo this
>> works well for me in 3.18-rc5.
>
> I tested linux-next on Exynos5800 peach-pi board with linux-next and and the two
> patches $Subject and [0].
>
> Below is my git hash:
> 4d9e6ee drm/exynos: Move platform drivers registration to module init
> 4545ed4 POSTED: arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> 36391a5 Add linux-next specific files for 20141119
> 9b1ced1 Merge branch 'akpm/master'
> 282497e mm: add strictlimit knob

used exynos_defconfig

>
> With this display works for me.
> Without $Subject patch i get lookup in drm.
>
> Javier can you tell me your git hash. Was it on yesterday's linux-next ?

With 3.18-rc5 i could see display on Exynos5800 peach-pi with
following git hash:

b6dca11 drm/exynos: dp: Remove support for unused dptx-phy
7cc5c2d ARM: exynos_defconfig: Enable options for display panel support
d0aca5e arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
fc14f9c Linux 3.18-rc5
e35c5a2 Merge tag 'armsoc-for-rc5' of
git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc

I don't need this drm lockup patch with 3.18-rc5 (with exynos_defconfig).

I am checking further with linux-samsung, coz i could see weird
behavior as mentioned
in [1] with linux-samsun/for-next merged with above git hash.

>> [0]: https://lkml.org/lkml/2014/10/30/394
>> [1]: http://www.spinics.net/lists/linux-samsung-soc/msg39032.html




-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
