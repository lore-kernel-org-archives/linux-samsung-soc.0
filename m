From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [git pull] soc_device_match() interface for matching against soc_bus attributes
Date: Wed, 30 Nov 2016 16:37:24 +0100
Message-ID: <27912062.8CdzEp3sLr@wuerfel>
References: <1479904376-12453-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1479904376-12453-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: arm@kernel.org, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms+renesas@verge.net.au>, Krzysztof Kozlowski <krzk@kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Yangbo Lu <yangbo.lu@nxp.com>, lf Hansson <ulf.hansson@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, November 23, 2016 1:32:56 PM CET Geert Uytterhoeven wrote:
> soc_device_match() interface for matching against soc_bus attributes
> 
> This provides core infrastructure as a dependency for several users
> (Freescale/NXP, Samsung, Renesas).
> 
> Its core parts have been acked by Greg, and the fixes by Arnd and/or
> Greg (the last fix only received an informal ack, that's why I hadn't
> added the ack).
> 
> This has already been pulled by Ulf, and is present in mmc/next, as a
> dependency for a Freescale/NXP driver update.
> 
> 

I've pulled this into next/drivers and also into a separate 
next/socdevice-match that we can use for keeping track. Thanks,

	Arnd
