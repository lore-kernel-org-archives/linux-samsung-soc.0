From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v7 3/7] gpio: samsung: Skip initialization if device tree is present
Date: Fri, 23 Aug 2013 01:19:53 +0200
Message-ID: <2011022.7zNcjpuhKL@flatron>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com> <3452017.UPhKO6xNO5@flatron> <1c9a01ce9f1e$473b58b0$d5b20a10$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:39702 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753954Ab3HVXUD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Aug 2013 19:20:03 -0400
In-Reply-To: <1c9a01ce9f1e$473b58b0$d5b20a10$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Mark Rutland' <mark.rutland@arm.com>, devicetree@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Ian Campbell' <ian.campbell@citrix.com>, 'Pawel Moll' <pawel.moll@arm.com>, 'Stephen Warren' <swarren@wwwdotorg.org>, 'Marc Zyngier' <marc.zyngier@arm.com>, 'Rob Herring' <rob.herring@calxeda.com>, linux-gpio@vger.kernel.org, 'Mark Brown' <broonie@kernel.org>, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Thomas Gleixner' <tglx@linutronix.de>

On Thursday 22 of August 2013 18:59:23 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > On Thursday 22 of August 2013 01:21:25 Linus Walleij wrote:
> > > On Wed, Aug 21, 2013 at 11:21 PM, Tomasz Figa
> > > <tomasz.figa@gmail.com>
> > 
> > wrote:
> > > > Since this driver does not handle GPIO on device tree enabled
> > > > platforms
> > > > any more, it should be bypassed whenever device tree is available,
> > > > to
> > > > not conflict with the new pinctrl-samsung driver.
> > > > 
> > > > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > > 
> > > This seems like something I should apply to the GPIO tree
> > > right now, shall I?
> > 
> > Would be nice, but since this patch is a dependency for rest of this
> > series and there are no other dependencies on GPIO tree, it might be
> > easier to just let Kukjin take all the patches with required Acks.
> 
> Oh, I didn't see any dependencies...but if so, Linus do you agree with
> Tomasz' opinion?

Without this patch DT-based bootup would fail, because the legacy GPIO 
driver would kick in and register GPIO chips before the pinctrl driver. 
Things would compile fine, though. So this is a run time dependency, not 
compile time.

> Please let me know so that I could take this with others into the
> samsung tree. And please kindly ignore my previous reply on this ;-)

I would be really happy if we could finally merge this for this release. 
This series is not really invasive in any way, so it is unlikely to 
introduce any regressions and it has waited so many releases, without any 
significant changes, due to a lot of other dependencies.

Best regards,
Tomasz
