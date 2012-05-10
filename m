From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCHv2 0/3] Add support for DRM display subsystem
Date: Thu, 10 May 2012 18:53:18 +0900
Message-ID: <CAH9JG2V_9RVPvEHodDD422r=o4QxHcrMO-YXv2KUGYeys=ZjqA@mail.gmail.com>
References: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
	<037301cd2e90$529112e0$f7b338a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:41878 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758486Ab2EJJxS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 05:53:18 -0400
Received: by gglu4 with SMTP id u4so783744ggl.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 May 2012 02:53:18 -0700 (PDT)
In-Reply-To: <037301cd2e90$529112e0$f7b338a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>

On 5/10/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Marek Szyprowski wrote:
>>
>> Hello,
>>
>> This patch set adds support for Exynos DRM display subsystem for
>> Universal C210 and NURI boards. Exynos DRM driver has been merged to 3.3
>> kernel tree and provides unified and more powerful alternative for
>> s3c-fb and s5p-tv drivers. V2 includes update for the latest changes in
>> platform data structure (added 'panel' entry).
>>
>> Best regards
>>
>> Marek Szyprowski
>> Samsung Poland R&D Center
>>
>> Patch summary:
>>
>> Marek Szyprowski (3):
>>   ARM: Exynos: add platform device for core DRM subsystem
>>   ARM: Exynos: Add DRM core device support for Universal C210 board
>>   ARM: Exynos: Add DRM core support for NURI board
>>
>>  arch/arm/mach-exynos/Kconfig               |    7 ++++++
>>  arch/arm/mach-exynos/Makefile              |    1 +
>>  arch/arm/mach-exynos/dev-drm.c             |   29
> ++++++++++++++++++++++++
>>  arch/arm/mach-exynos/mach-nuri.c           |   33
>> ++++++++++++++++++++++++++++
>>  arch/arm/mach-exynos/mach-universal_c210.c |   33
>> ++++++++++++++++++++++++++++
>>  arch/arm/plat-samsung/include/plat/devs.h  |    2 +
>>  6 files changed, 105 insertions(+), 0 deletions(-)
>>  create mode 100644 arch/arm/mach-exynos/dev-drm.c
>>
>> --
>> 1.7.1.569.g6f426
>
> Well, 2nd and 3rd patches can break multi-platform for EXYNOS SoCs with one
> kernel image.
>
> And I won't apply new feature for non-dt board file from now on. I think,
> we
> need to support DT in mach-exynos/ instead of non-DT and DT together, so
> please consider to move on dt supporting for Samsung mobile boards.
>

Probably you misunderstand Arnd word.

"From the statements made so far, I can see no clear policy that we can
apply to everyone. My take on this is that for any work I spend on
multiplatform kernel, I concentrate on the DT-based board files and
get them to work together first, but leave it up to the individual
subarch maintainers whether they want to add other board files into
the mix."

It doesn't mean add new feature to non-DT board. don't add new board file.

In this case, DRM is not yet ready to support DT.

Okay, you can just drop this patches. but please note that this
patches are posted at Mar 13 before you decide.

BR,
Kyungmin Park

> Note that I have a plan to replace board files with DT supporting in
> mach-exynos/ next time.
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
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
