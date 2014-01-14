From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: s3c24xx: explicit dependency on <plat/gpio-cfg.h>
Date: Tue, 14 Jan 2014 15:20:36 +0100
Message-ID: <2340755.WhXRgu2emH@phil>
References: <1389708788-18331-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:51143 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751413AbaANOVA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jan 2014 09:21:00 -0500
In-Reply-To: <1389708788-18331-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mark Brown <broonie@kernel.org>

Am Dienstag, 14. Januar 2014, 15:13:08 schrieb Linus Walleij:
> Previously the custom GPIO header for the S3C24xx would in turn
> bring in the custom pin control implementation from
> <plat/gpio-cfg.h>. This is not good as it mixes up two
> subsystems and makes the dependencies hard to track. Make
> the dependency explicit by explicitly including the pin
> control header where needed.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Maintainers: this builds on top of the previous patch moving
> headers back to <mach/*>. This will also boil in linux-next,
> ACKs appreciated.
> ---

Acked-by: Heiko Stuebner <heiko@sntech.de>
