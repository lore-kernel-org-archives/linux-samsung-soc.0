From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: [PATCH v4 19/19] irqchip: Move ARM vic.h to
 include/linux/irqchip/arm-vic.h
Date: Thu, 3 Jan 2013 13:52:53 -0600
Message-ID: <ADE657CA350FB648AAC2C43247A983F00206D69AB480@AUSP01VMBX24.collaborationhost.net>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com>
 <1357235668-9450-20-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail209.messagelabs.com ([216.82.255.3]:25347 "EHLO
	mail209.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998Ab3ACTxK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jan 2013 14:53:10 -0500
In-Reply-To: <1357235668-9450-20-git-send-email-robherring2@gmail.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>, Ryan Mallon <rmallon@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Linus Walleij <linus.walleij@linaro.org>, STEricsson <STEricsson_nomadik_linux@list.st.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Thursday, January 03, 2013 10:54 AM, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> Now that we have VIC moved to drivers/irqchip and all VIC DT init for
> platforms using irqchip_init, move gic.h and update the remaining
> includes.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Ryan Mallon <rmallon@gmail.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Alessandro Rubini <rubini@unipv.it>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: STEricsson <STEricsson_nomadik_linux@list.st.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  arch/arm/mach-ep93xx/core.c                                         |    3 +--

For ep93xx:

Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>
