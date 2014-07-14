From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] cpuidle: big.LITTLE: add MCPM dependency
Date: Mon, 14 Jul 2014 20:55:53 +0200
Message-ID: <6876751.hCLZ4zM0XT@wuerfel>
References: <4345351.RJRQd7ghCF@wuerfel> <53C42522.9060907@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:57349 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756183AbaGNS4W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 14:56:22 -0400
In-Reply-To: <53C42522.9060907@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kgene.kim@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>, Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Monday 14 July 2014 20:44:50 Daniel Lezcano wrote:
> > --- a/drivers/cpuidle/Kconfig.arm
> > +++ b/drivers/cpuidle/Kconfig.arm
> > @@ -10,6 +10,7 @@ config ARM_ARMADA_370_XP_CPUIDLE
> >   config ARM_BIG_LITTLE_CPUIDLE
> >       bool "Support for ARM big.LITTLE processors"
> >       depends on ARCH_VEXPRESS_TC2_PM || ARCH_EXYNOS
> > +     depends on MCPM
> 
> Why do we want to depend on MCPM ? If I want to enable the cpuidle 
> driver, the Kconfig should select the dependencies instead of letting 
> the user to figure out what dependency is missing in order to enable the 
> cpuidle option, no ?
> 
> +       select MCPM
> 

MCPM is a user-selectable option, which doesn't mix well with 'select'.

If you want to use 'select' here, better also change

	bool "Multi-Cluster Power Management"

to just

	bool

in the ARM global Kconfig. The normal way to deal with these dependencies
though is to have platforms 'select' the features they allow and have
device drivers 'depends on' the same symbol.

	Arnd
