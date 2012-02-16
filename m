From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 08/11] ARM: EXYNOS: add support for ARCH_EXYNOS5 and EXYNOS5250
Date: Thu, 16 Feb 2012 05:14:59 +0000
Message-ID: <201202160515.00068.arnd@arndb.de>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com> <1328981685-8602-9-git-send-email-kgene.kim@samsung.com> <CAH9JG2Usa5k0J0uoyOPxnPG5y9bZAFD+5AR43mbFN04P7t3Npw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:50765 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214Ab2BPFQb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 00:16:31 -0500
In-Reply-To: <CAH9JG2Usa5k0J0uoyOPxnPG5y9bZAFD+5AR43mbFN04P7t3Npw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, olof@lixom.net

On Thursday 16 February 2012, Kyungmin Park wrote:
> >
> > +config ARCH_EXYNOS5
> > +     bool "SAMSUNG EXYNOS5"
> > +     select HAVE_SMP
> > +     help
> > +       Samsung EXYNOS5 (Cortex-A15) SoC based systems
> This config is located at choice. It means it can't build the exynos4
> and exynos5 simultaneously. I'm not sure it's acceptable for mainline.

If we use the new common struct clk on exynos5 but not exynos4, it should
stay a "choice" for the time being and get turned into a nonexclusive
selection as soon as exynos4 moves over.

If exynos4 and exynos5 end up using the same struct clk in 3.4, I would
indeed ask to do this change now.

	Arnd
