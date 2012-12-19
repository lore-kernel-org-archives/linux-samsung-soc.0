From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 1/5 RESEND] cpufreq: exynos: Remove unused variable & IS_ERR
Date: Wed, 19 Dec 2012 11:52:38 +0100
Message-ID: <1484988.Q8kjeUgMrE@vostro.rjw.lan>
References: <002701cdd6a7$25fd9270$71f8b750$%choi@samsung.com> <002201cddd9d$fcb42200$f61c6600$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hydra.sisk.pl ([212.160.235.94]:37573 "EHLO hydra.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751299Ab2LSKrY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Dec 2012 05:47:24 -0500
In-Reply-To: <002201cddd9d$fcb42200$f61c6600$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Jaecheol Lee' <jc.lee@samsung.com>, 'Russell King' <linux@arm.linux.org.uk>

On Tuesday, December 18, 2012 08:04:45 PM Kukjin Kim wrote:
> Jonghwan Choi wrote:
> > 
> > The variable 'max_support_idx, min_support_idx, pm_lock_idx"
> > are never used, so remove the unused variable.
> > 
> > Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> > ---
> 
> Basically, looks OK to me...
> 
> Rafael, are you taking this series in your tree?
> Or let me pick into Samsung tree?

Please take it to the Samsung tree, if that's not a problem.

I generally prefer driver changes to go through platform trees where they can
get more testing coverage.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
