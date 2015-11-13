From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v4 3/9] ARM: EXYNOS: Move pmu specific headers under
 "linux/soc/samsung"
Date: Fri, 13 Nov 2015 14:57:26 +0530
Message-ID: <000801d11df5$86ccd960$94668c20$@samsung.com>
References: <1447155784-12667-1-git-send-email-pankaj.dubey@samsung.com>
 <1447155784-12667-4-git-send-email-pankaj.dubey@samsung.com>
 <564410FB.2000802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42642 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752670AbbKMJ0A (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Nov 2015 04:26:00 -0500
In-reply-to: <564410FB.2000802@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, thomas.ab@samsung.com, amitdanielk@gmail.com, olof@lixom.net, khilman@linaro.org, arnd@arndb.de

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski [mailto:k.kozlowski@samsung.com]
> Sent: Thursday, November 12, 2015 9:40 AM
> To: Pankaj Dubey; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Cc: kgene.kim@samsung.com; thomas.ab@samsung.com; amitdanielk@gmail.com;
> olof@lixom.net; khilman@linaro.org; arnd@arndb.de
> Subject: Re: [PATCH v4 3/9] ARM: EXYNOS: Move pmu specific headers under
> "linux/soc/samsung"
> 
> On 10.11.2015 20:42, Pankaj Dubey wrote:
> > Moving Exynos PMU specific header file into "include/linux/soc/samsung"
> > thus updated affected files under "mach-exynos" to use new location of
> > these header files.
> >
> > Signed-off-by: Amit Daniel Kachhap <amitdanielk@gmail.com>
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > ---
> >  arch/arm/mach-exynos/exynos-pmu.h           |  24 -
> >  arch/arm/mach-exynos/exynos.c               |   2 +-
> >  arch/arm/mach-exynos/mcpm-exynos.c          |   2 +-
> >  arch/arm/mach-exynos/platsmp.c              |   2 +-
> >  arch/arm/mach-exynos/pm.c                   |   4 +-
> >  arch/arm/mach-exynos/pmu.c                  |   6 +-
> >  arch/arm/mach-exynos/regs-pmu.h             | 693
----------------------------
> >  arch/arm/mach-exynos/suspend.c              |   4 +-
> >  include/linux/soc/samsung/exynos-pmu.h      |  24 +
> >  include/linux/soc/samsung/exynos-regs-pmu.h | 693
> > ++++++++++++++++++++++++++++
> 
> Did you disable the rename-detection for format-patch? Default rename
detection
> mechanism (50% of similarity) should detect two renames here:
> exynos-pmu.h and exynos-regs-pmu.h
> 

Yes. I missed to enable rename detection while creating patches.
Soon will resubmit patches with addressing your comments to all the patches
reviewed.

Thanks,
Pankaj Dubey

> Best regards,
> Krzysztof
> 
> 
> >  10 files changed, 727 insertions(+), 727 deletions(-)  delete mode
> > 100644 arch/arm/mach-exynos/exynos-pmu.h  delete mode 100644
> > arch/arm/mach-exynos/regs-pmu.h  create mode 100644
> > include/linux/soc/samsung/exynos-pmu.h
> >  create mode 100644 include/linux/soc/samsung/exynos-regs-pmu.h
