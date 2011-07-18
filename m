From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/4] [CPUFREQ] EXYNOS4210: Add Support for DVS Lock
Date: Mon, 18 Jul 2011 16:08:53 +0900
Message-ID: <04a101cc4519$912ce800$b386b800$%kim@samsung.com>
References: <1309853179-19438-1-git-send-email-kgene.kim@samsung.com>
 <1309853179-19438-5-git-send-email-kgene.kim@samsung.com>
 <20110709034812.GG26900@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30152 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082Ab1GRHJB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 03:09:01 -0400
In-reply-to: <20110709034812.GG26900@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, 'Jongpill Lee' <boyko.lee@samsung.com>, 'SangWook Ju' <sw.ju@samsung.com>, 'Jonghwan Choi' <jhbird.choi@samsung.com>

Mark Brown wrote:
> 
> On Tue, Jul 05, 2011 at 05:06:19PM +0900, Kukjin Kim wrote:
> 
> > +int exynos4_cpufreq_lock(unsigned int nId,
> > +			enum cpufreq_level_request cpufreq_level);
> > +void exynos4_cpufreq_lock_free(unsigned int nId);
> 
> This feels like something cpufreq should support to at least some extent
> in the core, especially the thing with forcing a particular mode on
> suspend.  Not that I have any particularly bright ideas for how
> immediately.

Basically, I agreed, but I also have no idea yet :(
How about to use this for now then let us think the way?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
