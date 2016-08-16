From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFC 12/17] ASoC: samsung: Switch to new clock controller API
Date: Tue, 16 Aug 2016 18:41:41 +0200
Message-ID: <20160816164141.GB9249@kozik-lap>
References: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
 <1471354514-24224-13-git-send-email-k.kozlowski@samsung.com>
 <20160816141345.GT9347@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38455 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222AbcHPQlq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 12:41:46 -0400
Content-Disposition: inline
In-Reply-To: <20160816141345.GT9347@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org, Marek Szyprowski <m.szyprowski@samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>Javier Martinez Canillas <j>

On Tue, Aug 16, 2016 at 03:13:45PM +0100, Mark Brown wrote:
> On Tue, Aug 16, 2016 at 03:35:09PM +0200, Krzysztof Kozlowski wrote:
> > Allocate a clock controller and use new clk_register_with_ctrl() API.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> >  	i2s_unregister_clocks(i2s);
> > +	clk_ctrl_unregister(i2s->clk_ctrl);
> 
> devm?

Right, that would make sense. Thanks for pointing this out.

Best regards,
Krzysztof
