From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 00/17] clk: Add per-controller locks to fix deadlocks
Date: Fri, 19 Aug 2016 18:58:47 +0200
Message-ID: <20160819165847.GA7100@kozik-lap>
References: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
 <65703100-1e16-6c34-babe-40e630180688@samsung.com>
 <20160819144640.GM21682@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35777 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754103AbcHSQ6x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 19 Aug 2016 12:58:53 -0400
Content-Disposition: inline
In-Reply-To: <20160819144640.GM21682@localhost.localdomain>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, alsa-

On Fri, Aug 19, 2016 at 03:46:40PM +0100, Charles Keepax wrote:
> On Tue, Aug 16, 2016 at 03:51:10PM +0200, Krzysztof Kozlowski wrote:
> > On 08/16/2016 03:34 PM, Krzysztof Kozlowski wrote:
> > > Hi,
> > > 
> > > RFC, please, do not apply, maybe except patch #1 which is harmless.
> > > 
> > > 
> > > Introduction
> > > ============
> > > The patchset brings new entity: clock controller representing a hardware
> > > block.  The clock controller comes with its own prepare lock which
> > > is used then in many places.  The idea is to fix the deadlock mentioned
> > > in commit 10ff4c5239a1 ("i2c: exynos5: Fix possible ABBA deadlock by keeping
> > > I2C clock prepared") and commit 34e81ad5f0b6 ("i2c: s3c2410: fix ABBA deadlock
> > > by keeping clock prepared").
> > > 
> > 
> > Damn, I forgot to describe the overall idea. :) It is mentioned in patch
> > 15 but probably not many will have enough of patience to reach it.
> > 
> > The locking idea
> > ================
> > Clock controllers representing different hardware blocks, will contain
> > its own prepare lock which protects the clocks inside controller.  The
> > hierarchy itself is protected by global lock.
> > 
> > In prepare path, the global prepare lock is removed.  This is direct
> > solution for the deadlock.
> > 
> > Clock hierarchy imposes also hierarchy between controllers so when a
> > prepare happens, also parents have to be locked.
> > 
> > Following locking design was chosen:
> > 1. For prepare/unprepare paths: lock only clock controller and its
> >    parents.
> > 2. For recalc rates paths: lock global lock, the controller and its
> >    children.
> > 3. For reparent paths: lock entire tree up down (children and parents)
> >    and the global lock as well.
> > 
> > 
> > In each case of traversing the clock hierarchy, the locking of
> > controllers is always from children to parents.
> > 
> > 
> > Best regards,
> > Krzysztof
> 
> I have been playing with these patches on my Arndale board and
> they certainly do seem to resolve the interaction issues I have
> been SPI and the clocking framework, which is awesome and lets me
> sensibly add the clocking framework into our codec drivers. I will
> keep investigating and for what its worth have a little more
> detailed look through the code.

I am really happy to hear it!

Along with other Samsung guys from Poland we really spent a lot of time
figuring out all the locking cases, possible scenarios and new issues
which could come out of it.

I am glad that it solves also other people's cases, not only ours!

Certainly there is a lot of things to improve in the patchset. Probably
merging the new "clock controller" entity into clock provider makes
sense.

Best regards,
Krzysztof
