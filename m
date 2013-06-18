From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 00/38] Thirty eight patches big Exynos cleanup
Date: Tue, 18 Jun 2013 20:09:57 +0200
Message-ID: <44244927.ekNqhkrd4q@flatron>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com> <1490899.cyTqiG9bBR@amdc1227> <51C09E3C.5050108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f42.google.com ([209.85.214.42]:44553 "EHLO
	mail-bk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932812Ab3FRSKC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 14:10:02 -0400
Received: by mail-bk0-f42.google.com with SMTP id jk13so1939113bkc.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 11:10:00 -0700 (PDT)
In-Reply-To: <51C09E3C.5050108@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>

On Wednesday 19 of June 2013 02:51:56 Kukjin Kim wrote:
> On 06/18/13 20:11, Tomasz Figa wrote:
> > On Tuesday 18 of June 2013 19:23:29 Kukjin Kim wrote:
> >> Tomasz Figa wrote:
> >>> Hi All,
> >>> 
> >>> As I promised, I am doing some spring (or rather summer) cleaning
> >>> of Exynos- and Samsung- related code.
> >>> 
> >>> This first part consists mostly of removing dead code remaining
> >>> after
> >>> removal of ATAGS support for Exynos, but several patches cleans up
> >>> other things found by the way.
> >>> 
> >>> See particular patches for more detailed description.
> >>> 
> >>> On Exynos4210-based Trats board:
> >>> Tested-by: Tomasz Figa<t.figa@samsung.com>
> >>> 
> >>> Build tested every patch with s3c6400_defconfig, s5pv210_defconfig
> >>> and exynos_defconfig.
> >>> 
> >>> Changes since v1:
> >>>   - Split patches removing SOC_EXYNOS4412
> >>>   - Adjusted drivers to check for ARCH_EXYNOS in addition to
> >>>   PLAT_S5P
> >>>   - Fixed compilation issue on s5pc100
> >>>   - Removed empty line from mach-exynos/Makefile
> >>>   - Removed SAMSUNG_GPIOLIB_4BIT selection from ARCH_EXYNOS
> >>>   - Sorted Kconfig and Makefile entries
> >>>   - Added additional cleanup from Arnd (split and slightly modified)
> >> 
> >> Tomasz, good job.
> > 
> > Thanks.
> > 
> >> After looking at, almost same with your previous version but
> >> modifying 16, 19, 21, 25(just Cc) and adding some patches 17, 18, 29
> >> and 35 to 38. Would be helpful to  me if you could note about that
> >> in this series ;-)> 
> > OK, my bad, haven't though about it, sorry. Will remember to do it
> > next time such series update happens.
> > 
> > By the way, patch 14 has been updated as well.
> 
> Thanks ;)
> 
> > Best regards,
> > Tomasz
> > 
> >> Anyway, looks good I will apply this series
> > 
> > OK, thanks.
> > 
> >> except removing
> >> CONFIG_SOC_EXYNOS4412 patches.
> > 
> > I don't really understand this decision, but if you really insist...
> 
> Sorry about that, but exynos4412 is not same with exynos4212 except
> number of cores and exynos4412 is not one kind...

OK, so it seems like I got misinformed about the number of cores being the 
only difference.

> > Still, I think current setup is wrong, because you need to specify
> > both SoCs in drivers and both Kconfig entries must have "select" and
> > "depends on" clauses duplicated, while there are places currently
> > where only one has been specified by mistake.
> > 
> > So if we can't get this duplication removed, I'd suggest introducing
> > CONFIG_SOC_EXYNOS4X12 which would represent the whole SoC series and
> > making existing two entries just simple bools selecting the new one.
> 
> Could be a solution but let's wait until something will be implemented
> in mainline for exynos4412 not exynos4212 :)

OK. Looking forward to it.

Btw. This leaves us with two things broken:
 - sdhci-s3c checks for defined(CONFIG_SOC_EXYNOS4212), but does not check 
for defined(CONFIG_SOC_EXYNOS4412),
 - exynos-thermal checks for defined(CONFIG_SOC_EXYNOS4412), but does not 
check for defined(CONFIG_SOC_EXYNOS4212).

I think this must be fixed, because selecting only Exynos4212 in kernel 
config you end up without exynos-thermal, while selecting only Exynos4412 
breaks sdhci-s3c.

Best regards,
Tomasz

> Thanks,
> - Kukjin
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
