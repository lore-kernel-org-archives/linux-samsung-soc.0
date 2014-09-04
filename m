From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 18/19] ARM: SAMSUNG: Remove remaining legacy code
Date: Thu, 4 Sep 2014 18:03:45 +0200
Message-ID: <201409041803.46098.arnd@arndb.de>
References: <1404496099-26708-1-git-send-email-t.figa@samsung.com> <53C67783.4090407@samsung.com> <1409825317.5546.94.camel@x220>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409825317.5546.94.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 04 September 2014, Paul Bolle wrote:
> On Wed, 2014-07-16 at 15:00 +0200, Tomasz Figa wrote:
> > On 16.07.2014 12:24, Paul Bolle wrote:
> > > On Fri, 2014-07-04 at 19:48 +0200, Tomasz Figa wrote:
> > >> -config S5P_GPIO_DRVSTR
> > >> -  bool
> > >> -  help
> > >> -    Internal configuration to get and set correct GPIO driver strength
> > >> -    helper
> > >> -
> > > 
> > > This one is used (as a macro) in drivers/gpio/gpio-samsung.c. Is a patch
> > > that touches that macro queued somewhere?
> > 
> > The code you mention should be removed as well as it's no longer needed.
> > Will include in a follow-up series. Thanks for reporting this and
> > remaining missed parts.
> 
> That check for CONFIG_S5P_GPIO_DRVSTR is still present in v3.17-rc3 and
> next-20140903. Should I submit the trivial patch to remove it (and the
> dead code it hides)?
> 

Yes, I think this one is an obvious candidate for removal.

	Arnd
