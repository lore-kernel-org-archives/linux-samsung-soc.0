From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: [PATCH v4 14/19] ARM: remove unneeded vic.h includes
Date: Thu, 3 Jan 2013 13:52:01 -0600
Message-ID: <ADE657CA350FB648AAC2C43247A983F00206D69AB47F@AUSP01VMBX24.collaborationhost.net>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com>
 <1357235668-9450-15-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail131.messagelabs.com ([216.82.242.99]:48349 "EHLO
	mail131.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753710Ab3ACTwS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jan 2013 14:52:18 -0500
In-Reply-To: <1357235668-9450-15-git-send-email-robherring2@gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>, Rob Herring <rob.herring@calxeda.com>, Ryan Mallon <rmallon@gmail.com>, Hubert Feurstein <hubert.feurstein@contec.at>, Alessandro Rubini <rubini@unipv.it>, Linus Walleij <linus.walleij@linaro.org>, STEricsson <STEricsson_nomadik_linux@list.st.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "patches@opensource.wolfsonmicro.com" <patches@opensource.wolfsonmicro.com>

On Thursday, January 03, 2013 10:54 AM, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> Numerous includes of asm/hardware/vic.h aren't needed, so remove them.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Ryan Mallon <rmallon@gmail.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Hubert Feurstein <hubert.feurstein@contec.at>
> Cc: Alessandro Rubini <rubini@unipv.it>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: STEricsson <STEricsson_nomadik_linux@list.st.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: patches@opensource.wolfsonmicro.com
> ---
>  arch/arm/mach-ep93xx/adssphere.c              |    1 -
>  arch/arm/mach-ep93xx/edb93xx.c                |    1 -
>  arch/arm/mach-ep93xx/gesbc9312.c              |    1 -
>  arch/arm/mach-ep93xx/micro9.c                 |    1 -
>  arch/arm/mach-ep93xx/simone.c                 |    1 -
>  arch/arm/mach-ep93xx/snappercl15.c            |    1 -
>  arch/arm/mach-ep93xx/ts72xx.c                 |    1 -
>  arch/arm/mach-ep93xx/vision_ep9307.c          |    1 -

For ep93xx:

Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>
