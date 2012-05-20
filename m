From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 05/10] ARM: Samsung: Update the device names for spi clock lookup
Date: Sat, 19 May 2012 22:43:54 -0600
Message-ID: <20120520044354.C5DBE3E03B8@localhost>
References: <1336514694-22393-1-git-send-email-thomas.abraham@linaro.org> <1336514694-22393-6-git-send-email-thomas.abraham@linaro.org> <20120509085249.GA28702@sirena.org.uk> <CAJuYYwQ+Wn11puF7AdPD41Jntbuj7oZHqNfzQA2T8V=2cigQnw@mail.gmail.com> <20120509142836.GT3955@opensource.wolfsonmicro.com> <CAJuYYwSTJoNRuN87GoTZMgF-qahbu02kJ9SUd7omQ5WD0VjTww@mail.gmail.com> <20120513145134.GA6381@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:54872 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809Ab2ETEn5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 May 2012 00:43:57 -0400
Received: by dady13 with SMTP id y13so5428681dad.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 21:43:56 -0700 (PDT)
In-Reply-To: <20120513145134.GA6381@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, rob.herring@calxeda.com, jaswinder.singh@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Sun, 13 May 2012 15:51:35 +0100, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, May 10, 2012 at 01:17:32AM +0800, Thomas Abraham wrote:
> > On 9 May 2012 22:28, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> 
> > > This means that bisection will be broken - anything with only one tree
> > > won't be able to load the SPI driver successfully until it's merged
> > > with the other which isn't ideal.
> 
> > Yes, we would have that problem until the two trees are merged. But I
> > still prefer not to squash the two patches which already contain huge
> > diff.
> 
> I'd not say the diff is *that* big (and most of what's there is simple
> and repetitive), and bisection is a very useful tool.  I know I
> frequently find it enormously painful trying to figure out breakage when
> large chunks of the history don't work usefully.

I agree.  Squash them!

g.


-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
