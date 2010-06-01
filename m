From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2] ARM: S5PV210: Add Power Management Support
Date: Tue, 1 Jun 2010 13:53:21 +0100
Message-ID: <20100601125320.GA10031@sirena.org.uk>
References: <1275356164-7896-1-git-send-email-kgene.kim@samsung.com> <20100601020329.GT4720@trinity.fluff.org> <AANLkTinNCTUtXDeRTOBi05Yv7FoatY2ruWmnNtTSmg36@mail.gmail.com> <20100601041633.GB30276@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50084 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755990Ab0FAMxc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jun 2010 08:53:32 -0400
Content-Disposition: inline
In-Reply-To: <20100601041633.GB30276@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@trinity.fluff.org>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, ????????? <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Jongpill Lee <boyko.lee@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jun 01, 2010 at 05:16:33AM +0100, Ben Dooks wrote:
> On Tue, Jun 01, 2010 at 12:23:39PM +0900, Kyungmin Park wrote:

> > It's common function. Please add it to platform init instead of each board init.

> I know Mark Brown would rather this be the case too, but the original intent
> was that each board would declare itself to be capable of PM by calling this
> function to ensure that any boards which had not been validated or where
> simply incapable of suspend/resume did not end up with this enabled.

This does result in rather confusing behaviour, in that the attempts to
suspend end up getting silently ignored which isn't what you expect.
Other ARM platforms deal with this by erroring out of the suspend if
they can tell that it's not going to work and otherwise just trusting
the system integrator to know what they're doing when they turn on
suspend in Kconfig.

It would be more friendly to at least put in a default implementation
which prints an error telling the user what they need to do to actually
get suspend working.
