From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 12/12] clocksource: samsung-time: Add Device Tree
 support
Date: Mon, 18 Feb 2013 09:48:12 +0000
Message-ID: <20130218094812.GA23831@e106331-lin.cambridge.arm.com>
References: <1361033044-27629-1-git-send-email-tomasz.figa@gmail.com>
 <1361033044-27629-13-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:61426 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752979Ab3BRJsS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Feb 2013 04:48:18 -0500
Content-Disposition: inline
In-Reply-To: <1361033044-27629-13-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "linux@simtec.co.uk" <linux@simtec.co.uk>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "kwangwoo.lee@gmail.com" <kwangwoo.lee@gmail.com>, "jacmet@sunsite.dk" <jacmet@sunsite.dk>, "augulis.darius@gmail.com" <augulis.darius@gmail.com>, "mcuelenaere@gmail.com" <mcuelenaere@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "buserror@gmail.com" <buserror@gmail.com>, "christer@weinigel.se" <christer@weinigel.se>, "jekhor@gmail.com" <jekhor@gmail.com>, "ghcstop@gmail.com" <ghcstop@gmail.com>

Hi,

[...]

> +static void samsung_timer_parse_dt(struct device_node *np,
> +					const struct of_device_id *match)
> +{
> +	int i;
> +	u32 val;
> +
> +	timer_base = of_iomap(np, 0);
> +	if (!timer_base)
> +		panic("failed to map timer registers");
> +
> +	for (i = 0; i < SAMSUNG_PWM_NUM; ++i)
> +		timer_variant.irqs[i] = irq_of_parse_and_map(np, i);
> +
> +	if (!timer_variant.irqs[timer_source.event_id])
> +		panic("no clock event irq provided");
> +
> +	switch ((unsigned int)match->data) {
> +	case TYPE_S3C24XX:
> +		timer_variant.bits = 16;
> +		timer_variant.prescale = 25;
> +		timer_variant.prescale = 50;

Redundant conflicting assignments here.

Thanks,
Mark.
