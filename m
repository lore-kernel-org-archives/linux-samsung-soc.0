From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 14/19] ARM: remove unneeded vic.h includes
Date: Fri, 04 Jan 2013 14:08:00 +0100
Message-ID: <50E6D430.7030709@free-electrons.com>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com> <1357235668-9450-15-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([94.23.32.191]:34783 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754731Ab3ADNIG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jan 2013 08:08:06 -0500
In-Reply-To: <1357235668-9450-15-git-send-email-robherring2@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, thomas.petazzoni@free-electrons.com, Rob Herring <rob.herring@calxeda.com>, Hartley Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>, Hubert Feurstein <hubert.feurstein@contec.at>, Alessandro Rubini <rubini@unipv.it>, Linus Walleij <linus.walleij@linaro.org>, STEricsson <STEricsson_nomadik_linux@list.st.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Le 03/01/2013 18:54, Rob Herring a =E9crit :
> diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.=
c
> index 9be910f..b1b5131 100644
> --- a/arch/arm/mach-sunxi/sunxi.c
> +++ b/arch/arm/mach-sunxi/sunxi.c
> @@ -21,7 +21,6 @@
> =20
>  #include <linux/irqchip/sunxi.h>
> =20
> -#include <asm/hardware/vic.h>
> =20
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>

Just a little nitpick, could you remove the extra line as well?

Other than that, for sunxi,
Acked-By: Maxime Ripard <maxime.ripard@free-electrons.com>

--=20
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
