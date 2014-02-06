From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Consolidate Kconfig entries
Date: Thu, 06 Feb 2014 16:02:08 +0100
Message-ID: <5101685.tPb8PWOH5Q@amdc1032>
References: <1391687996-26011-1-git-send-email-sachin.kamat@linaro.org>
 <52F397DF.6050209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38373 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752681AbaBFPCN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 10:02:13 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0K000J7XRN8LB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Feb 2014 00:02:11 +0900 (KST)
In-reply-to: <52F397DF.6050209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, olof@lixom.net


Hi,

On Thursday, February 06, 2014 03:10:39 PM Tomasz Figa wrote:
> Hi Sachin,
> 
> On 06.02.2014 12:59, Sachin Kamat wrote:
> > Instead of repeating the Kconfig entries for every SoC, move them under
> > ARCH_EXYNOS4 and 5 and move the entries common to both 4 and 5 under
> > ARCH_EXYNOS. Also, since the individual SoCs do not have any specific
> > machine/platform code, keep them as boolean symbols instead of user

All soc_is_exynosxxxx() dependent code gets thrown away is specific SoC
support is not selected.  With this change this is not longer true.
Moreover some drivers are doing explicit ifdef checks for specific SoC
support, i.e. thermal driver.

> > selectable and select them from Exynos4 and 5 config symbols. Individual
> > SoC symbols can be removed eventually once the driver Kconfig dependencies
> > on these symbols are removed.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > ---
> >   arch/arm/Kconfig             |   12 ++++++
> >   arch/arm/mach-exynos/Kconfig |   97 ++++++++++--------------------------------
> >   2 files changed, 35 insertions(+), 74 deletions(-)
> 
> I fully agree that there is no real need of having per-SoC Kconfig 
> entries, since the differences caused by them are quite insignificant. 

I think so but some numbers to back it up would be good..

> Moreover, this makes me wonder if there is even need to distinguish 
> between ARCH_EXYNOS4 and ARCH_EXYNOS5...

Well, once again, seeing some numbers would be good. :)

> Anyway, I second this patch:
> 
> Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
