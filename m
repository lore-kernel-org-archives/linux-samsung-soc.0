From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] sdhci-s3c: fix incorrect spinlock usage after merge
Date: Mon, 20 Sep 2010 18:29:12 -0700
Message-ID: <20100920182912.a29ff3d1.akpm@linux-foundation.org>
References: <1284987822-17955-1-git-send-email-m.szyprowski@samsung.com>
	<20100921011711.GB5873@void.printf.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:43697 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750960Ab0IUBWD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Sep 2010 21:22:03 -0400
In-Reply-To: <20100921011711.GB5873@void.printf.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chris Ball <cjb@laptop.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, w.sang@pengutronix.de

On Tue, 21 Sep 2010 02:17:11 +0100 Chris Ball <cjb@laptop.org> wrote:

> On Mon, Sep 20, 2010 at 03:03:42PM +0200, Marek Szyprowski wrote:
> > In the commit f522886e202a34a2191dd5d471b3c4d46410a9a0 a merge conflict
> > in the sdhci-s3c driver been fixed. However the fix used incorrect
> > spinlock operation - it cause a race with sdhci interrupt service. The
> > correct way to solve it is to use spin_lock_irqsave/irqrestore() calls.
> 
> Thanks, applied to mmc-next with:
> Signed-off-by: Chris Ball <cjb@laptop.org>
> 
> Andrew, not sure how best to get this upstream -- do you want to send
> this up to Linus (for -rc5) via your queue in -mm?

Ordinarily I'd expect you to send it to Linus.

I tend to merge important-looking bugfixes in my tree in case
maintainers lose them (happens regularly).  I'll then start spamming
the maintainer with the patch.  If the maintainer remains dead then I
might merge it myself, or I might tag it for -stable backporting and
try again in the next kernel.  

If the maintainer can't be bothered setting up a pull request then he
can just send an acked-by and explicitly ask me to merge it up and
I'll then add it to my next approximately-weekly Linus patchbombing.
