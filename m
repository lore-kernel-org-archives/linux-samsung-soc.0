From: Dave Jones <davej@redhat.com>
Subject: Re: [CPUFREQ] EXYNOS: Make EXYNOS common cpufreq driver
Date: Fri, 9 Dec 2011 10:39:26 -0500
Message-ID: <20111209153925.GA21045@redhat.com>
References: <03b301ccb48a$1fc93bb0$5f5bb310$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39096 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753845Ab1LIPjb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Dec 2011 10:39:31 -0500
Content-Disposition: inline
In-Reply-To: <03b301ccb48a$1fc93bb0$5f5bb310$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jc.lee@samsung.com

On Wed, Dec 07, 2011 at 11:44:21AM +0900, Kukjin Kim wrote:
 > From: Jaecheol Lee <jc.lee@samsung.com>
 > 
 > To support various EXYNOS series SoCs commonly,
 > added exynos common structure.
 > exynos-cpufreq.c => EXYNOS series common cpufreq driver
 > exynos4210-cpufreq.c => EXYNOS4210 support cpufreq driver
 > 
 > Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
 > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Please rediff this one and resend. It doesn't apply on top of the other patches..

Applying: [CPUFREQ] EXYNOS4210: Remove code about bus on cpufreq
Applying: [CPUFREQ] EXYNOS4210: Update frequency table for cpu divider
Applying: [CPUFREQ] EXYNOS4210: cpufreq code is changed for stable working
Applying: [CPUFREQ] EXYNOS: Make EXYNOS common cpufreq driver
error: patch failed: drivers/cpufreq/Makefile:42
error: drivers/cpufreq/Makefile: patch does not apply
Patch failed at 0005 [CPUFREQ] EXYNOS: Make EXYNOS common cpufreq driver
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".

I'll push out what I have applied so far to cpufreq.next

thanks,
	Dave
