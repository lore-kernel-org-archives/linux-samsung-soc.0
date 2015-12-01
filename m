From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 03/10] gpio: samsung: move gpio-samsung driver back to platform code
Date: Tue, 01 Dec 2015 16:33:24 +0100
Message-ID: <7302923.ORKinVl6Ne@wuerfel>
References: <1448467615-447097-1-git-send-email-arnd@arndb.de> <1448467615-447097-4-git-send-email-arnd@arndb.de> <565CEB0A.4090107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:52432 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751989AbbLAPeN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Dec 2015 10:34:13 -0500
In-Reply-To: <565CEB0A.4090107@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Ben Dooks <ben.dooks@codethink.co.uk>

On Tuesday 01 December 2015 09:34:18 Krzysztof Kozlowski wrote:
> On 26.11.2015 01:06, Arnd Bergmann wrote:
> > diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> > index 57729b915003..83697414bfa0 100644
> > --- a/arch/arm/plat-samsung/Kconfig
> > +++ b/arch/arm/plat-samsung/Kconfig
> > @@ -294,6 +294,9 @@ config SAMSUNG_WDT_RESET
> >         Compile support for system restart by triggering watchdog reset.
> >         Used on SoCs that do not provide dedicated reset control.
> >  
> > +config GPIO_SAMSUNG
> > +     def_bool SAMSUNG_ATAGS
> > +
> 
> I think this should be put inside "if SAMSUNG_ATAGS" section, just
> before SAMSUNG_PM_GPIO (with default=y?). It makes more consistent with
> rest of the options depending on ATAGS.

Good idea, changed that now.

> Rest seems fine:
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Thanks,

	Arnd
