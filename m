From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/9] ARM: EXYNOS: add support for ARCH_EXYNOS5 and
 EXYNOS5250
Date: Thu, 09 Feb 2012 20:12:50 +0900
Message-ID: <068d01cce71b$c2f87da0$48e978e0$%kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-5-git-send-email-kgene.kim@samsung.com>
 <CAH9JG2UGCg=vNe-xKYdJzwQYExRK9U6xSRmHxSUxUruUCc3r4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46320 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752030Ab2BILMw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 06:12:52 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ4004K2HS6U6U0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:12:50 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400C04HTCFT40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:12:50 +0900 (KST)
In-reply-to: <CAH9JG2UGCg=vNe-xKYdJzwQYExRK9U6xSRmHxSUxUruUCc3r4g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net

Kyungmin Park wrote:
> 
> On 2/1/12, Kukjin Kim <kgene.kim@samsung.com> wrote:

[snip]

> >  machine-$(CONFIG_ARCH_EXYNOS4)		:= exynos
> > +machine-$(CONFIG_ARCH_EXYNOS5)		:= exynos
> It already has CONFIG_ARCH_EXYNOS so it's enough
> machine-$(CONFIG_ARCH_EXYNOS) := exynos

Basically I'd like to keep the ARCH_EXYNOS4 and ARCH_EXYNOS5 it can be a
duplicated line though. Because it is a different core.

[snip]

> > +config ARCH_EXYNOS5
> > +	bool "SAMSUNG EXYNOS5"
> > +	select HAVE_SMP
> > +	help
> > +	  Samsung EXYNOS5 SoCs based systems
> It's helpful to add which ARM core is used. in case of exynos4 has
> CA9, exynos5 has CA15.

Looks good, ok, the description of Cortex-A9 and Cortex-A15 will be added.

[snip]

> > +config SOC_EXYNOS5250
> > +	bool "SAMSUNG EXYNOS5250"
> > +	default y
> default y?

Yes. I think at least one SoC should be selected when one ARCH_ is selected.
And as you know, now ARCH_EXYNOS5 is used only for EXYNOS5250 SoC.

[snip]

> >  #define EXYNOS4_PA_SYSRAM0		0x02025000
> >  #define EXYNOS4_PA_SYSRAM1		0x02020000
> > +#define EXYNOS5_PA_SYSRAM		0x02020000
> Do you really use the single map file? Doesn't it better split each
series?

Now that would be better if could keep less headers.

[snip]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
