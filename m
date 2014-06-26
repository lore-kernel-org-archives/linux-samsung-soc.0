From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 0/3] drm/exynos: add framework to control DISP1BLK setting
Date: Thu, 26 Jun 2014 11:23:25 +0530
Message-ID: <CAEC9eQM-JDtQc_wN2Wyqw+ihFRixaOhc5wTq3jztckUwZMREHg@mail.gmail.com>
References: <1403705752-24469-1-git-send-email-ajaykumar.rs@samsung.com>
	<CAOt82ecshdX9ALWYWT4u8QcF+NqJTEfUb6pka0D-9-btHJGM1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:56709 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753147AbaFZFx1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 01:53:27 -0400
Received: by mail-vc0-f177.google.com with SMTP id ij19so2983493vcb.36
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2014 22:53:26 -0700 (PDT)
In-Reply-To: <CAOt82ecshdX9ALWYWT4u8QcF+NqJTEfUb6pka0D-9-btHJGM1Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@google.com>, vikas.sajjan@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, InKi Dae <inki.dae@samsung.com>

On Thu, Jun 26, 2014 at 5:24 AM, YoungJun Cho <yj44.cho@gmail.com> wrote:
> Hi Ajay,
>
> I'm sorry for say that the patchset for exynos drm supporting I80 i/f
> includes yours.
>
> The patchset is still in reviewing and I'm preparing v5.
>
> Please check this:
> http://www.spinics.net/lists/dri-devel/msg60943.html
>
> Thank you.
> Best regards YJ
>
> On Jun 25, 2014 11:19 PM, "Ajay Kumar" <ajaykumar.rs@samsung.com> wrote:
>>
>> This series is based on exynos-drm-next branch of Inki Dae's tree at:
>> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
>>
>> Exynos SOC have a DISP1BLK register where we can select
>> the path for FIMD output. We can redirect the video data
>> directly to DP/MIPI interface, or we can pass it via
>> image enhancement chips.
>>
>> Since we don't use any image enhancement chips in exynos-drm,
>> we need to set FIMD BYPASS in DISP1BLK.
>>
>> This patchset is tested for basic display + DPMS + S2R on snow and
>> peach_pit.
>>
>> Ajay Kumar (3):
>>   [PATCH 1/3] drm/exynos: Control DISP1BLK system register in FIMD
>>   [PATCH 2/3] ARM: dts: exynos5420: Add sysreg phandle to FIMD node
>>   [PATCH 3/3] ARM: dts: exynos5250: Add sysreg phandle to FIMD node
>>
>>  .../devicetree/bindings/video/samsung-fimd.txt     |    2 ++
>>  arch/arm/boot/dts/exynos5250.dtsi                  |    1 +
>>  arch/arm/boot/dts/exynos5420.dtsi                  |    1 +
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   19
>> +++++++++++++++++++
>>  include/video/samsung_fimd.h                       |    5 +++++
>>  5 files changed, 28 insertions(+)
>>
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
