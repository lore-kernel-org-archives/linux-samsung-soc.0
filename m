From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] arch: arm: samsung: Clean-up usage of CONFIG_SERIAL_SAMSUNG_UARTS symbol
Date: Tue, 30 Sep 2014 20:36:26 +0200
Message-ID: <78824730.2ZeRMh8EV2@wuerfel>
References: <1412087695-10591-1-git-send-email-a.kesavan@samsung.com> <2267491.QlLoTEuT3L@wuerfel> <542AD5E6.9050503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:51191 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752222AbaI3Sgi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 14:36:38 -0400
In-Reply-To: <542AD5E6.9050503@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Abhilash Kesavan <a.kesavan@samsung.com>, gregkh@linuxfoundation.org, linux-samsung-soc@vger.kernel.org, jslaby@suse.cz

On Tuesday 30 September 2014 18:10:14 Tomasz Figa wrote:
> >> @@ -110,7 +110,7 @@ void __init s3c24xx_init_uartdevs(char *name,
> >>                                   struct s3c24xx_uart_resources *res,
> >>                                   struct s3c2410_uartcfg *cfg, int no)
> >>  {
> >> -#ifdef CONFIG_SERIAL_SAMSUNG_UARTS
> >> +#ifdef CONFIG_SERIAL_SAMSUNG
> >>         struct platform_device *platdev;
> >>         struct s3c2410_uartcfg *cfgptr = uart_cfgs;
> >>         struct s3c24xx_uart_resources *resp;
> > 
> > Since you hardcode the number here now, you can actually drop this #ifdef.
> 
> I believe what Abhilash did is correct, because this code is not needed
> when there is no serial support enabled.
> 

I only added the #ifdef here because it was broken when
CONFIG_SERIAL_SAMSUNG_UARTS was undefined.

	Arnd
