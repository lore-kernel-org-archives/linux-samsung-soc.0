From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: Early kernel hang with big DTB appended
Date: Fri, 11 Jan 2013 17:45:31 +0100
Message-ID: <20130111164531.GC13025@pengutronix.de>
References: <7811936.npteFbuYu2@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:57918 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755096Ab3AKQpd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jan 2013 11:45:33 -0500
Content-Disposition: inline
In-Reply-To: <7811936.npteFbuYu2@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, nico@linaro.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, bones@secretlab.ca, linux-arm-kernel@lists.infradead.org

On Thu, Jan 03, 2013 at 04:55:00PM +0100, Tomasz Figa wrote:
> Hi,
> 
> I'm observing strange behavior when booting 3.8-rc1 and -rc2 with appended 
> DTB. The kernel hangs very early when the DTB is bigger than some 
> threshold somewhere around 24 KiB. With fullest possible low level UART 
> debugging (and printk patched to use printascii) I'm receiving following 
> output:
> 
> Uncompressing Linux... done, booting the kernel.
> Booting Linux on physical CPU 0xa00
> Linux version 3.8.0-rc1-00073-gdf6efca-dirty (t.figa@amdc1227) (gcc 
> version 4.5.2 (Gentoo 4.5.2 p1.2, pie-0.4.5) ) #2 SMP PREEMPT Thu Jan 3 
> 15:37:35 CET 2013
> CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c53c7d
> CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
> 
> I tested on two Exynos-based boards (exynos4210-trats and one internal 
> exynos4412-based board) and same happens on both.
> 
> Do you have any ideas?

Another thing besides the things already mentioned is that the dtb may
not cross a 1MiB boundary. The Kernel uses a single 1Mib section
(aligned to 1Mib) to initially map the dtb. Once you cross that boundary
parts of the dtb won't be accessible for the Kernel anymore.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
