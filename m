From: amit kachhap <amit.kachhap@gmail.com>
Subject: Re: [PATCH 0/2] ARM: exynos: Enable TMU support in exynos platforms
Date: Sat, 14 Jul 2012 12:46:18 +0530
Message-ID: <CADGdYn6HLod9OtQeKcUbORwqHUJ+3rAjpR+xCyqL+oFXZC8TFw@mail.gmail.com>
References: <1342084543-8302-1-git-send-email-amit.daniel@samsung.com>
	<117e01cd60ea$99f24e60$cdd6eb20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:51477 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411Ab2GNHQS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Jul 2012 03:16:18 -0400
Received: by obbuo13 with SMTP id uo13so6072631obb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Jul 2012 00:16:18 -0700 (PDT)
In-Reply-To: <117e01cd60ea$99f24e60$cdd6eb20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lenb@kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux@roeck-us.net

On Fri, Jul 13, 2012 at 4:58 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Amit Daniel Kachhap wrote:
>>
>> These TMU enablement patches are needed for exynos4 and exynos5 TMU
>> driver patches sent earlier. The link for those are
>> http://www.spinics.net/lists/lm-sensors/msg35858.html.
>>
> How was going on above patches? I can't see them you said in linux-next now,
> it means if I apply this series in my tree, problem will be happened :(

Well, the above patches were accepted by Len for 3.5 merge but could
not done because of some last minute pull issue. I hope it will go
through in this merge window. I thought it is better to get the
enablement patches also in mainline together.
>
> Note1: I've seen Rafael's updating exynos4_tmu patch which is using struct
> dev_pm_ops for pm and applied by Guenter.
I have rebased the V5 with hwmon-next changes. So this change is
already included.
>
> Note2: would be helpful if you could do adding me in Cc of exynos tmu
> patches...
Yes sure.
>
>> Also patch 1 depends on combiner dt node patch sent by Thomas Abraham.
>> (http://www.spinics.net/lists/arm-kernel/msg184129.html)
>>
> Already in my tree.
>
>> This patchset is based Samsung Maintainer's tree,
>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-
>> next
>>
> OK.
>
>> Amit Daniel Kachhap (2):
>>   ARM: exynos4: Add devicetree node for TMU driver
>>   ARM: exynos5: Add devicetree node for TMU driver
>>
>>  arch/arm/boot/dts/exynos4210.dtsi        |    7 +++++++
>>  arch/arm/boot/dts/exynos5250.dtsi        |    6 ++++++
>>  arch/arm/mach-exynos/clock-exynos4.c     |    5 +++++
>>  arch/arm/mach-exynos/clock-exynos5.c     |    5 +++++
>>  arch/arm/mach-exynos/include/mach/irqs.h |    3 +++
>>  arch/arm/mach-exynos/include/mach/map.h  |    3 +++
>>  arch/arm/mach-exynos/mach-exynos4-dt.c   |    2 ++
>>  arch/arm/mach-exynos/mach-exynos5-dt.c   |    2 ++
>>  8 files changed, 33 insertions(+), 0 deletions(-)
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
