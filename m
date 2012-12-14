From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] i2c-core: Add gpio based bus arbitration implementation
Date: Fri, 14 Dec 2012 09:06:49 -0700
Message-ID: <50CB4E99.9060506@wwwdotorg.org>
References: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com> <1355464254-12768-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:33929 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756417Ab2LNQGx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 11:06:53 -0500
In-Reply-To: <1355464254-12768-2-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, grundler@chromium.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, w.sang@pengutronix.de, ben-linux@fluff.org, khali@linux-fr.org, naveen@chromium.org

On 12/13/2012 10:50 PM, Naveen Krishna Chatradhi wrote:
> The arbitrator is a general purpose function which uses two GPIOs to
> communicate with another device to claim/release a bus.

> diff --git a/Documentation/devicetree/bindings/i2c/arbitrator-i2c.txt b/Documentation/devicetree/bindings/i2c/arbitrator-i2c.txt
> new file mode 100644
> index 0000000..cb91ea8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/arbitrator-i2c.txt
> @@ -0,0 +1,56 @@
> +Device-Tree bindings for i2c gpio based bus arbitrator
> +
> +bus-arbitration-gpios :
> +	Two GPIOs to use with the GPIO-based bus arbitration protocol
> +(see below).
> +The first should be an output, and is used to claim the I2C bus,
> +the second should be an input, and signals that the other side (Client)
> +wants to claim the bus. This allows two masters to share the same I2C bus.

I'm confused why this is even needed; the I2C protocol itself defines
how multi-master is supposed to work, just using the regular SCL/SDA lines.
