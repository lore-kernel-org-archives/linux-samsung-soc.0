From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [GIT PULL] Samsung devel-2 for v3.2
Date: Fri, 7 Oct 2011 20:14:43 +0100
Message-ID: <20111007191443.GA12004@opensource.wolfsonmicro.com>
References: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com> <20111002192950.GB1005@sirena.org.uk> <005801cc817c$5d42f9e0$17c8eda0$%kim@samsung.com> <201110071956.12034.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48617 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754025Ab1JGTOp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 15:14:45 -0400
Content-Disposition: inline
In-Reply-To: <201110071956.12034.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Fri, Oct 07, 2011 at 07:56:11PM +0200, Arnd Bergmann wrote:
> On Monday 03 October 2011, Kukjin Kim wrote:
> > Mark Brown wrote:

> > > As I reported the other day this change breaks the boot early on on the
> > > Cragganmore S3C6410 based systems (I've not actually fired up my
> > > SMDK6410 but I suspect it may have issues too).  I did make some brief

> > Hmm, I thought it has no problem when I saw Thomas Abraham's 'serial:
> > samsung' patches because he said it works fine with my for-next plus his
> > patches on SMDK6410...Anyway, I need to sort it out.

> > Arnd, please hold this on, will request again soon.

> Any update on this?

We've got a lot closer to working out what's wrong (and got useful
logging) but not nailed it down yet.  Kukjin has confirmed that he can
see what's likely the same issue on his systems.  My suggestion is that
we go ahead with the pull request for now and then fix incrementally,
there's a relatively small set of systems affected.  If it gets to more
than a couple of -rcs we know which patches are problematic and so can
always revert.
