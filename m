From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v4] s3c/s3c24xx: arm: leds: Make s3c24xx LEDS driver
 use gpiolib. Fix error disabling pull during probe.
Date: Thu, 29 Dec 2011 01:56:40 +0000
Message-ID: <20111229015640.GB4839@sirena.org.uk>
References: <4EE7E0E7.1020802@solonet.org.ua>
 <063a01ccbfac$498513c0$dc8f3b40$%kim@samsung.com>
 <4EFB851F.9080805@solonet.org.ua>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:40793 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754670Ab1L2B4r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 20:56:47 -0500
Content-Disposition: inline
In-Reply-To: <4EFB851F.9080805@solonet.org.ua>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Denis Kuzmenko <linux@solonet.org.ua>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Richard Purdie' <rpurdie@rpsys.net>, 'Joe Perches' <joe@perches.com>

On Wed, Dec 28, 2011 at 11:07:43PM +0200, Denis Kuzmenko wrote:
> On 12/21/2011 08:46 AM, Kukjin Kim wrote:
> > Denis Kuzmenko wrote:

> >> Make s3c24xx LEDS driver use gpiolib. Fix error disabling pull during
> >> probe.

> >> Signed-off-by: Denis Kuzmenko <linux@solonet.org.ua>

> > Acked-by: Kukjin Kim <kgene.kim@samsung.com>

> > Richard, I think, this should be handled in your tree.

> ping Richard

Take a look at the git logs - Richard hasn't been actively maintaining a
tree for the LEDs for some time now.
