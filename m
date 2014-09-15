From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Exynos build failure in -next allmodconfig
Date: Mon, 15 Sep 2014 18:57:09 +0100
Message-ID: <20140915175709.GE12361@n2100.arm.linux.org.uk>
References: <E1XTTy1-0000vT-NC@cassiel.sirena.org.uk> <20140915163458.GS7960@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:57784 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753425AbaIOR5T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Sep 2014 13:57:19 -0400
Content-Disposition: inline
In-Reply-To: <20140915163458.GS7960@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Mon, Sep 15, 2014 at 09:34:58AM -0700, Mark Brown wrote:
> On Mon, Sep 15, 2014 at 11:57:09AM +0100, Build bot for Mark Brown wrote:
> 
> Today's -next got a build failure in ARM allmodconfig due to platsmp.c:
> 
> | arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in return expression (different address spaces)
> | arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef] <asn:2>*
> | arch/arm/mach-exynos/platsmp.c:198:31:    got void *
> | arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in return expression (different address spaces)
> | arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef] <asn:2>*
> | arch/arm/mach-exynos/platsmp.c:198:31:    got void *
> |   CC      arch/arm/mach-exynos/platsmp.o
> | /tmp/ccC9fkwF.s: Assembler messages:
> | /tmp/ccC9fkwF.s:423: Error: selected processor does not support ARM mode `isb '
> | /tmp/ccC9fkwF.s:428: Error: selected processor does not support ARM mode `isb '
> | /tmp/ccC9fkwF.s:429: Error: selected processor does not support ARM mode `dsb '
> | scripts/Makefile.build:257: recipe for target 'arch/arm/mach-exynos/platsmp.o' failed
> 
> Looks like we need a compiler flags override for that file.

Or.. the question is why a .c file is not using the proper macros.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
