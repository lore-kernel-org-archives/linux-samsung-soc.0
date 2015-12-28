From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: s3c: simplify s3c_irqwake_{e,}intallow definition
Date: Mon, 28 Dec 2015 12:13:03 +0100
Message-ID: <9962016.2akClDTaVy@wuerfel>
References: <16503982.4JeEM7ZXq8@wuerfel> <56808A41.2050105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:55274 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751004AbbL1LNn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Dec 2015 06:13:43 -0500
In-Reply-To: <56808A41.2050105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Monday 28 December 2015 10:02:57 Krzysztof Kozlowski wrote:
> On 18.12.2015 23:45, Arnd Bergmann wrote:
> > For a long time, gcc has warned about odd configurations on s3c64xx:
> > 
> > In file included from arch/arm/plat-samsung/pm.c:34:0:
> > arch/arm/mach-s3c64xx/include/mach/pm-core.h:61:0: warning: "s3c_irqwake_eintallow" redefined
> >  #define s3c_irqwake_eintallow ((1 << 28) - 1)
> > In file included from arch/arm/plat-samsung/pm.c:33:0:
> > arch/arm/plat-samsung/include/plat/pm.h:49:0: note: this is the location of the previous definition
> >  #define s3c_irqwake_eintallow 0
> > 
> > The definitions of s3c_irqwake_intallow and s3c_irqwake_eintallow are a bit consistent
> > between the various platforms. Things have become easier now that it's only s3c24xx
> > and s3c64xx that use them at all, so I've tried to rearrange the definitions to
> > make it more obvious what is going on.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > This fixes a very old and harmless warning, please apply to a cleanup branch
> > if you agree.
> > 
> 
> Looks correct and makes sense. Hoping you compiled it on all machs:
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I built many thousand kernels with this patch, but also had other patches applied
at the same time, notably the s3c64xx multiplatform series, so I can make a reasonable
assumption that I'm not introducing regressions, unless it relies on something else
I have queued up and not yet sent.

	Arnd
