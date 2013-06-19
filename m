From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/7] Common Clock Framework support for Samsung S3C64xx
Date: Wed, 19 Jun 2013 23:17:06 +0900
Message-ID: <51C1BD62.8050007@samsung.com>
References: <1370476651-6743-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:37033 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756637Ab3FSORN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 10:17:13 -0400
In-Reply-To: <1370476651-6743-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org

On 06/06/13 08:57, Tomasz Figa wrote:
> This series is an attempt to move clock support on Samsung S3C64xx SoCs
> to Common Clock Framework.
>
Looks good :)

> First, support for PLL types present on S3C64xx SoCs is added to Samsung
> Common Clock Framework driver. Then the main clock driver for mentioned
> SoCs is introduced. Further patches contain fixes for drivers to make them
> compliant with CCF semantics, migration of platform code to use the new
> clock driver and removal of old clock management code.
>
> Depends on:
>   - [PATCH 0/6] Samsung watchdog support clean-up
>     http://thread.gmane.org/gmane.linux.kernel.samsung-soc/18736/focus=18989
>   - [PATCH 00/15] Final Samsung PWM support cleanup
>     http://www.spinics.net/lists/arm-kernel/msg248725.html

BTW, Tomasz, so how was going on above PWM patches?

>
> On S3C6410-based Tiny6410 board (Mini6410-compatible):
>
> Tested-by: Tomasz Figa<tomasz.figa@gmail.com>
>
> Tomasz Figa (7):
>    clk: samsung: pll: Add support for PLL6552 and PLL6553
>    clk: samsung: Add clock driver for S3C64xx SoCs
>    ARM: SAMSUNG: Add soc_is_s3c6400/s3c6410 macros
>    ARM: s3c64xx: dma: Use clk_prepare_enable/clk_disable_unprepare
>    usb: host: ohci-s3c2410 Use clk_prepare_enable/clk_disable_unprepare
>    ARM: s3c64xx: Migrate clock handling to Common Clock Framework
>    ARM: s3c64xx: Remove old clock management code
