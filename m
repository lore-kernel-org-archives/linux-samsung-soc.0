From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/3] pinctrl: add samsung pinctrl and gpiolib driver
Date: Fri, 8 Jun 2012 05:32:13 -0700
Message-ID: <20120608123213.GP12766@atomide.com>
References: <1337816857-14694-1-git-send-email-thomas.abraham@linaro.org>
 <1337816857-14694-2-git-send-email-thomas.abraham@linaro.org>
 <CACRpkdZDnFW4-bDsHN5BOr2e5NLGzouSBY7ngf-VsoPn-SyxAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:27967 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756314Ab2FHMcS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jun 2012 08:32:18 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZDnFW4-bDsHN5BOr2e5NLGzouSBY7ngf-VsoPn-SyxAA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org, Stephen Warren <swarren@wwwdotorg.org>

* Linus Walleij <linus.walleij@linaro.org> [120531 18:40]:
> On Thu, May 24, 2012 at 7:47 AM, Thomas Abraham
> <thomas.abraham@linaro.org> wrote:
> 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> 
> It would be nice if some DT person could review the bindings, but if
> nothing happens
> I will accept them as-is.

Looks OK to me, that's a bit slower way of parsing pins compared to
just register value pairs but allows naming them. And it was agreed
that it's up to the driver to define it's binding.
 
> This driver is special since it seems to keep all pin, group and
> function information
> in the device tree, but not like Tony is doing it in pinctrl-simple,
> if I understand
> correctly?

Looks like it's using static arrays which I was too using earlier.
That too should be OK for now, then at some point we can probably
have something generic to manage the pins for at least some drivers.

Regards,

Tony
 
