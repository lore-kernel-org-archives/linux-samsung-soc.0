From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 4/4] [CPUFREQ] EXYNOS4210: Add Support for DVS Lock
Date: Tue, 19 Jul 2011 16:03:43 +0100
Message-ID: <20110719150343.GD9652@opensource.wolfsonmicro.com>
References: <1309853179-19438-1-git-send-email-kgene.kim@samsung.com>
 <1309853179-19438-5-git-send-email-kgene.kim@samsung.com>
 <20110709034812.GG26900@sirena.org.uk>
 <04a101cc4519$912ce800$b386b800$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:55413 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751354Ab1GSPDq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jul 2011 11:03:46 -0400
Content-Disposition: inline
In-Reply-To: <04a101cc4519$912ce800$b386b800$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, 'Jongpill Lee' <boyko.lee@samsung.com>, 'SangWook Ju' <sw.ju@samsung.com>, 'Jonghwan Choi' <jhbird.choi@samsung.com>

On Mon, Jul 18, 2011 at 04:08:53PM +0900, Kukjin Kim wrote:

> > This feels like something cpufreq should support to at least some extent
> > in the core, especially the thing with forcing a particular mode on
> > suspend.  Not that I have any particularly bright ideas for how
> > immediately.

> Basically, I agreed, but I also have no idea yet :(
> How about to use this for now then let us think the way?

Probably just as well.  For the suspend stuff we should be able to
implement a generic override the governor callback for use in suspend
entry easily enough but for other things I'm drawing a blank right now.
