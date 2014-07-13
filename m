From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung cleanup for S5P SoCs for 3.17
Date: Sat, 12 Jul 2014 21:20:22 -0700
Message-ID: <20140713042022.GA14186@quad.lixom.net>
References: <53BB2658.4050808@samsung.com>
 <20140712165948.GA10012@quad.lixom.net>
 <20140712194416.GA6800@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:51398 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711AbaGMET6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Jul 2014 00:19:58 -0400
Received: by mail-pd0-f170.google.com with SMTP id g10so1244142pdj.15
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jul 2014 21:19:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140712194416.GA6800@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sat, Jul 12, 2014 at 08:44:16PM +0100, Mark Brown wrote:
> On Sat, Jul 12, 2014 at 09:59:48AM -0700, Olof Johansson wrote:
> 
> > I've merged these in. I noticed lack of acked-by from Mark Brown, so I pinged
> > him on IRC about it and the branch is currently at the top so it's easy to drop
> > in case he has objections (cc:d here too).
> 
> Don't know if I've seen these changes (though IIRC they might've gone to
> the work account).  I suspect we're going to get some conflicts since
> we've also got other changes going on in ASoC so it is probably going to
> be easier to merge at least that patch via ASoC.

Ok, no problem -- dropped from arm-soc now (and I'll merge the new
version shortly).


-Olof
