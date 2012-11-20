From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/4] i2c-s3c2410: use exponential back off while
 polling for bus idle
Date: Tue, 20 Nov 2012 04:49:00 +0000
Message-ID: <20121120044859.GA10154@sirena.org.uk>
References: <1352981613-2098-1-git-send-email-ch.naveen@samsung.com>
 <1352981613-2098-4-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47579 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428Ab2KTEtI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 23:49:08 -0500
Content-Disposition: inline
In-Reply-To: <1352981613-2098-4-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, khali@linux-fr.org, w.sang@pengutronix.de, naveenkrishna.ch@gmail.com, djkurtz@chromium.org

On Thu, Nov 15, 2012 at 05:43:32PM +0530, Naveen Krishna Chatradhi wrote:

> +	iicstat = readl(i2c->regs + S3C2410_IICSTAT);
> +	delay = 1;
> +	while ((iicstat & S3C2410_IICSTAT_START) &&
> +	       ktime_us_delta(now, start) < S3C2410_IDLE_TIMEOUT) {
> +		usleep_range(delay, 2 * delay);
> +		if (delay < S3C2410_IDLE_TIMEOUT / 10)
> +			delay <<= 1;
> +		now = ktime_get();
> +		iicstat = readl(i2c->regs + S3C2410_IICSTAT);
> +	}

> -	/* first, try busy waiting briefly */
> -	do {
> -		cpu_relax();
> -		iicstat = readl(i2c->regs + S3C2410_IICSTAT);
> -	} while ((iicstat & S3C2410_IICSTAT_START) && --spins);

On the hardware I was using when I wrote the original code here we were
hitting 1-2 spins often enough to be interesting - starting off with a
direct busy wait was definitely useful when doing large batches of I/O,
especially compared to sleeps which might cause us to schedule.

> -	/* if that timed out sleep */
> -	if (!spins) {
> -		msleep(1);
> -		iicstat = readl(i2c->regs + S3C2410_IICSTAT);
> -	}

It seems like it'd be better to do the exponential backoff bit here
instead of removing the busy wait completely.
