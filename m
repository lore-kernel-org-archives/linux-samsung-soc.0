From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung cleanup for v3.2
Date: Wed, 21 Sep 2011 10:50:38 +0900
Message-ID: <004201cc7800$dd184470$9748cd50$%kim@samsung.com>
References: <001901cc76b8$018d4fc0$04a7ef40$%kim@samsung.com>
 <201109202222.41747.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53832 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751122Ab1IUBuk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 21:50:40 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRU00FXYNS5L3G0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 10:50:39 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRU009KXNSFMY@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 10:50:39 +0900 (KST)
In-reply-to: <201109202222.41747.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

Arnd Bergmann wrote:
> 
> On Monday 19 September 2011, Kukjin Kim wrote:
> > This is Samsung cleanup for v3.2.
> >
> > Please pull from:
> >   git://github.com/kgene/linux-samsung.git next-samsung-cleanup
> 
> Pulled into arm-soc/next/cleanup.
> 
Thanks :)

> > If any problems, please let me know.
> 
> One tiny conflict with Nico's cross-platform series:
> 
Yes, I know. I have received same information from Stephen when he merged.

> +
> + MACHINE_START(SMDKC210, "SMDKC210")
> +       /* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
>  -      .boot_params    = S5P_PA_SDRAM + 0x100,
> ++      .atag_offset    = 0x100,
> +       .init_irq       = exynos4_init_irq,
> +       .map_io         = smdkv310_map_io,
> +       .init_machine   = smdkv310_machine_init,
> +       .timer          = &exynos4_timer,
> + MACHINE_END
> 
> I'll handle this in the upstream submission.
> 
OK, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
