From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: S3C[24|64]xx: move includes back under <mach/> scope
Date: Tue, 14 Jan 2014 15:11:47 +0100
Message-ID: <3526096.UdPXMDriCf@wuerfel>
References: <1389707618-17011-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:49544 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751329AbaANOMO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jan 2014 09:12:14 -0500
In-Reply-To: <1389707618-17011-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Heiko Stuebner <heiko@sntech.de>

On Tuesday 14 January 2014 14:53:38 Linus Walleij wrote:
> When refactoring and breaking out the includes for the
> machine-specific GPIO configuration, two files were created
> in <linux/platform_data/gpio-samsung-s3c[24|64]xx.h>, but as
> that namespace shall be used for defining data exchanged
> between machines and drivers, using it for these broad macros
> and config settings is wrong.
> 
> Move the headers back into the machine-local
> <mach/gpio-samsung.h> file and think about the next step.
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

Acked-by: Arnd Bergmann <arnd@arndb.de>
