From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [GIT PULL] Samsung devel-2 for v3.2
Date: Tue, 4 Oct 2011 13:59:17 +0100
Message-ID: <20111004125916.GC6934@opensource.wolfsonmicro.com>
References: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com>
 <20111002192950.GB1005@sirena.org.uk>
 <019201cc8293$7776a790$6663f6b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:47924 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756570Ab1JDM7T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Oct 2011 08:59:19 -0400
Content-Disposition: inline
In-Reply-To: <019201cc8293$7776a790$6663f6b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Oct 04, 2011 at 09:45:16PM +0900, Kukjin Kim wrote:
> Mark Brown wrote:

> > As I reported the other day this change breaks the boot early on on the
> > Cragganmore S3C6410 based systems (I've not actually fired up my
> > SMDK6410 but I suspect it may have issues too).  I did make some brief
> > attempts to debug but as there's no console output at all and the diff
> > is rather large it's not easy to see what's gone wrong. 

> Could you please test on Cragganmore board again only with my for-next-test
> branch?

> (I have did 'git-revert' some patches which have some dependencies with
> other tree to build without others.)

Sure - it may be tomorrow morning (so late tomorrow your time) before
I'm sitting in front of a board for long enough to do it.
