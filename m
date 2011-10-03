From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: EXYNOS: Add ARCH_EXYNOS and reorganize arch/arm/mach-exynos
Date: Mon, 03 Oct 2011 16:04:11 +0200
Message-ID: <3709260.I9R44Iti1S@wuerfel>
References: <001f01cc80e5$3abd1c80$b0375580$%kim@samsung.com> <5785830.Sj7W4aL3qy@wuerfel> <4E89AD44.80609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:65102 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751339Ab1JCOEN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Oct 2011 10:04:13 -0400
In-Reply-To: <4E89AD44.80609@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, =?utf-8?B?7KCV6rK97ZeML1MvVyBTb2x1dGlvbuqwnOuwnO2MgChTLkxTSSkvRTUo7LGF7J6EKS/sgrzshLHsoITsnpA=?= <kyoungheon@samsung.com>

On Monday 03 October 2011 21:40:36 Kukjin Kim wrote:
> Yes, absolutely. As I said, the 'mach-exynos' can support upcoming 
> Samsung EXYNOS SoCs and the way is better than making mach-exynos5.
> 
> My bigger plan is finally to make current directories to 3 mach- dir. 
> (mach-s3c, mach-s5p, and mach-exynos) and 1 plat-samsung directory. Of 
> course, the mach- directories can be reduced later.
>
> Firstly, as you can see, I'm merging plat-s3c24xx and plat-s5p into one 
> plat-samsung directory and actually the <plat/*.h> files and dev-*.c 
> files have been moved into plat-samsung. Maybe I can finish it during 
> 3.2-rc.

Ok, sounds good. So for my understanding: is s5p a completely separate
line from exynos, or are they more of an evolutionary succession where
you draw the line between the last uniprocessor and the first SMP
chip?
 
> Secondary, upcoming Samsung EXYNOS SoCs will be supported in mach-exynos 
> directory and this patch is required to that. For example, the EXYNOS5 
> SoCs (Cortex A15) will be supported in that with other EXYNOS4 SoCs soon 
> and of course it reduces code duplication 

My feeling is that it would be nicer to just add exynos5 to the mach-exynos4
directory for now, in the same way that omap3/4/5 are in the mach-omap2
directory. We can do a big rename later once the reorganization of code
within those directories that you explained above is complete.

If you still want to do the big rename right now, I would suggest doing
it at the end of the 3.2 merge window, so that all other patches that
might need to touch the mach-exynos4 directory can go in first.

	Arnd
