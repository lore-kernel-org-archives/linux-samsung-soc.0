From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung devel-2 for v3.2
Date: Fri, 7 Oct 2011 19:56:11 +0200
Message-ID: <201110071956.12034.arnd@arndb.de>
References: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com> <20111002192950.GB1005@sirena.org.uk> <005801cc817c$5d42f9e0$17c8eda0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:49199 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753157Ab1JGR4V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 13:56:21 -0400
In-Reply-To: <005801cc817c$5d42f9e0$17c8eda0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Monday 03 October 2011, Kukjin Kim wrote:
> Mark Brown wrote:
> > 
> > On Sun, Oct 02, 2011 at 06:25:36PM +0900, Kukjin Kim wrote:
> > 
> > >       gpio/samsung: gpio-samsung.c to support Samsung GPIOs
> > 
> > As I reported the other day this change breaks the boot early on on the
> > Cragganmore S3C6410 based systems (I've not actually fired up my
> > SMDK6410 but I suspect it may have issues too).  I did make some brief
> > attempts to debug but as there's no console output at all and the diff
> > is rather large it's not easy to see what's gone wrong.
> 
> Hmm, I thought it has no problem when I saw Thomas Abraham's 'serial:
> samsung' patches because he said it works fine with my for-next plus his
> patches on SMDK6410...Anyway, I need to sort it out.
> 
> Arnd, please hold this on, will request again soon.

Any update on this?

Note that in general, I would prefer to get more separate pull
requests for the individual feature branches that you use internally
than having it all in one devel branch.

Time is running out before the merge window, so I'm not asking you
to change it again. I will pull it when you send it, but if you
have trouble with some specific parts of this, you can also send
me pull requests for the parts that are good.

	Arnd
