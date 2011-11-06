From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung Exynos for v3.2
Date: Sun, 6 Nov 2011 16:19:35 +0100
Message-ID: <201111061619.36283.arnd@arndb.de>
References: <02dd01cc9b4e$0cb27c80$26177580$%kim@samsung.com> <4EB61826.4070601@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:50298 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753138Ab1KFPT4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Nov 2011 10:19:56 -0500
In-Reply-To: <4EB61826.4070601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Sunday 06 November 2011, Kukjin Kim wrote:
> As I replied, I re-based 'next-samsung-exynos' based on latest mainline.
> 
> So changes since previous pull request:
> 
> The following changes since commit c861cd3e92d92ae946e19099f198018fcb4fd887:
> 
>    Merge branch 'next/devel2' of 
> git://git.linaro.org/people/arnd/arm-soc (2011-11-05 18:21:21 -0700)
> 
> are available in the git repository at:
> 
>    git://github.com/kgene/linux-samsung.git next-samsung-exynos
> 
> Others same, if any problems, please kindly let me know.

Ok, looks good. I'll forward the pull request right away.

One thing that I noticed in your new Kconfig file is this however:

| choice
|         prompt "EXYNOS System Type"
|         default ARCH_EXYNOS4
| config ARCH_EXYNOS4
|         bool "SAMSUNG EXYNOS4"
|         help
|           Samsung EXYNOS4 SoCs based systems
| endchoice

This looks like the idea is to make the future EXYNOS5 and later SoCs a
separate "choice" that is mutually exclusive with EXYNOS4.

This seems to be a significant limitation considering that we are working
hard on making all platforms coexist in the same kernel binary.

Are there strong technical reasons why you could not build EXYNOS4 and
EXYNOS5 into a combined kernel? If this is at all possible, I would
recommend trying hard to do it when you add EXYNOS5.

	Arnd
