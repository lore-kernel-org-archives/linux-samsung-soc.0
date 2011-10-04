From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add ARCH_EXYNOS and reorganize
 arch/arm/mach-exynos
Date: Tue, 04 Oct 2011 21:45:11 +0900
Message-ID: <019101cc8293$74796d20$5d6c4760$%kim@samsung.com>
References: <001f01cc80e5$3abd1c80$b0375580$%kim@samsung.com>
 <5785830.Sj7W4aL3qy@wuerfel> <4E89AD44.80609@samsung.com>
 <3709260.I9R44Iti1S@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46285 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932079Ab1JDMpM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Oct 2011 08:45:12 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSJ00EWOKR6VLL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Oct 2011 21:45:11 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSJ00L5YKRBPF60@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 04 Oct 2011 21:45:11 +0900 (KST)
In-reply-to: <3709260.I9R44Iti1S@wuerfel>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, =?ks_c_5601-1987?B?J8GksObH5S9TL1cgU29sdXRpb26ws7nfxsAoUy5MU0kpL0U1KA==?= =?ks_c_5601-1987?B?w6XA0ykvu++8usD8wNon?= <kyoungheon@samsung.com>

Arnd Bergmann wrote:
> 
> On Monday 03 October 2011 21:40:36 Kukjin Kim wrote:
> > Yes, absolutely. As I said, the 'mach-exynos' can support upcoming
> > Samsung EXYNOS SoCs and the way is better than making mach-exynos5.
> >
> > My bigger plan is finally to make current directories to 3 mach- dir.
> > (mach-s3c, mach-s5p, and mach-exynos) and 1 plat-samsung directory. Of
> > course, the mach- directories can be reduced later.
> >
> > Firstly, as you can see, I'm merging plat-s3c24xx and plat-s5p into one
> > plat-samsung directory and actually the <plat/*.h> files and dev-*.c
> > files have been moved into plat-samsung. Maybe I can finish it during
> > 3.2-rc.
> 
> Ok, sounds good. So for my understanding: is s5p a completely separate
> line from exynos, or are they more of an evolutionary succession where
> you draw the line between the last uniprocessor and the first SMP
> chip?
> 
As you know, Samsung has announced 'EXYNOS' as a new Samsung SoC name then
we have used it. Frankly, I'm not sure the name of 'S5P' will be used later
or not. If any updates let you know.

> > Secondary, upcoming Samsung EXYNOS SoCs will be supported in mach-exynos
> > directory and this patch is required to that. For example, the EXYNOS5
> > SoCs (Cortex A15) will be supported in that with other EXYNOS4 SoCs soon
> > and of course it reduces code duplication
> 
> My feeling is that it would be nicer to just add exynos5 to the mach-
exynos4
> directory for now, in the same way that omap3/4/5 are in the mach-omap2
> directory. We can do a big rename later once the reorganization of code
> within those directories that you explained above is complete.
> 
> If you still want to do the big rename right now, I would suggest doing
> it at the end of the 3.2 merge window, so that all other patches that
> might need to touch the mach-exynos4 directory can go in first.
> 
Thanks for your suggestion.
OK, I will and it will be sent to upstream via arm-soc at the end of the
3.2 merge window.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
