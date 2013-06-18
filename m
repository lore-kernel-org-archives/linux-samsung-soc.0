From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 00/38] Thirty eight patches big Exynos cleanup
Date: Wed, 19 Jun 2013 02:51:56 +0900
Message-ID: <51C09E3C.5050108@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com> <1c0b01ce6c0d$e0475930$a0d60b90$%kim@samsung.com> <1490899.cyTqiG9bBR@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:36437 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755322Ab3FRRwB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 13:52:01 -0400
Received: by mail-pd0-f176.google.com with SMTP id t12so4149667pdi.35
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 10:52:01 -0700 (PDT)
In-Reply-To: <1490899.cyTqiG9bBR@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>

On 06/18/13 20:11, Tomasz Figa wrote:
> On Tuesday 18 of June 2013 19:23:29 Kukjin Kim wrote:
>> Tomasz Figa wrote:
>>> Hi All,
>>>
>>> As I promised, I am doing some spring (or rather summer) cleaning
>>> of Exynos- and Samsung- related code.
>>>
>>> This first part consists mostly of removing dead code remaining after
>>> removal of ATAGS support for Exynos, but several patches cleans up
>>> other things found by the way.
>>>
>>> See particular patches for more detailed description.
>>>
>>> On Exynos4210-based Trats board:
>>> Tested-by: Tomasz Figa<t.figa@samsung.com>
>>>
>>> Build tested every patch with s3c6400_defconfig, s5pv210_defconfig
>>> and exynos_defconfig.
>>>
>>> Changes since v1:
>>>   - Split patches removing SOC_EXYNOS4412
>>>   - Adjusted drivers to check for ARCH_EXYNOS in addition to PLAT_S5P
>>>   - Fixed compilation issue on s5pc100
>>>   - Removed empty line from mach-exynos/Makefile
>>>   - Removed SAMSUNG_GPIOLIB_4BIT selection from ARCH_EXYNOS
>>>   - Sorted Kconfig and Makefile entries
>>>   - Added additional cleanup from Arnd (split and slightly modified)
>>
>> Tomasz, good job.
>
> Thanks.
>
>> After looking at, almost same with your previous version but modifying 16,
>> 19, 21, 25(just Cc) and adding some patches 17, 18, 29 and 35 to 38. Would
>> be helpful to  me if you could note about that in this series ;-)
>
> OK, my bad, haven't though about it, sorry. Will remember to do it next time
> such series update happens.
>
> By the way, patch 14 has been updated as well.
>
Thanks ;)

> Best regards,
> Tomasz
>
>> Anyway, looks good I will apply this series
>
> OK, thanks.
>
>> except removing
>> CONFIG_SOC_EXYNOS4412 patches.
>
> I don't really understand this decision, but if you really insist...
>
Sorry about that, but exynos4412 is not same with exynos4212 except 
number of cores and exynos4412 is not one kind...

> Still, I think current setup is wrong, because you need to specify both SoCs
> in drivers and both Kconfig entries must have "select" and "depends on" clauses
> duplicated, while there are places currently where only one has been specified
> by mistake.
>
> So if we can't get this duplication removed, I'd suggest introducing
> CONFIG_SOC_EXYNOS4X12 which would represent the whole SoC series and making
> existing two entries just simple bools selecting the new one.
>
Could be a solution but let's wait until something will be implemented 
in mainline for exynos4412 not exynos4212 :)

Thanks,
- Kukjin
