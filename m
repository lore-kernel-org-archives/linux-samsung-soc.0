From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: Early kernel hang with big DTB appended
Date: Fri, 04 Jan 2013 11:26:29 +0100
Message-ID: <3124835.JDXd8LMbPH@amdc1227>
References: <7811936.npteFbuYu2@amdc1227>
 <91586D499ADFD74FBCFB8425266A5DE40139F1B06030@pluto.melinkcorp.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32936 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752719Ab3ADK0h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jan 2013 05:26:37 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG300AGBJO7Y9H0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jan 2013 19:26:35 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG300CSFJO9CG90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jan 2013 19:26:35 +0900 (KST)
In-reply-to: <91586D499ADFD74FBCFB8425266A5DE40139F1B06030@pluto.melinkcorp.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "nico@linaro.org" <nico@linaro.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "bones@secretlab.ca" <bones@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Bryan,

Thanks for your reply.

On Thursday 03 of January 2013 13:40:43 Bryan Evenson wrote:
> > -----Original Message-----
> > From: linux-arm-kernel-bounces@lists.infradead.org [mailto:linux-arm-
> > kernel-bounces@lists.infradead.org] On Behalf Of Tomasz Figa
> > Sent: Thursday, January 03, 2013 10:55 AM
> > To: devicetree-discuss@lists.ozlabs.org
> > Cc: linux-samsung-soc@vger.kernel.org; linux@arm.linux.org.uk;
> > nico@linaro.org; kgene.kim@samsung.com; thomas.abraham@linaro.org;
> > bones@secretlab.ca; linux-arm-kernel@lists.infradead.org
> > Subject: Early kernel hang with big DTB appended
> > 
> > Hi,
> > 
> > I'm observing strange behavior when booting 3.8-rc1 and -rc2 with
> > appended DTB. The kernel hangs very early when the DTB is bigger than
> > some threshold somewhere around 24 KiB. With fullest possible low
> > level
> > UART debugging (and printk patched to use printascii) I'm receiving
> > following
> > output:
> > 
> > Uncompressing Linux... done, booting the kernel.
> > Booting Linux on physical CPU 0xa00
> > Linux version 3.8.0-rc1-00073-gdf6efca-dirty (t.figa@amdc1227) (gcc
> > version 4.5.2 (Gentoo 4.5.2 p1.2, pie-0.4.5) ) #2 SMP PREEMPT Thu Jan
> > 3
> > 15:37:35 CET 2013
> > CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c53c7d
> > CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction
> > cache
> > 
> > I tested on two Exynos-based boards (exynos4210-trats and one internal
> > exynos4412-based board) and same happens on both.
> > 
> > Do you have any ideas?
> 
> Tomasz,
> 
> Sounds to me like the DTB is not being fully written to memory or that
> it isn't being fully read from memory.  I've had similar problems when
> I placed the DTB too close to the end of flash and not all of the DTB
> was written to flash.

I'm using CONFIG_ARM_APPENDED_DTB, as it eases testing a bit, because DTB 
is built into the resulting uImage for u-boot (appended after zImage) and 
it does not require OF-aware versions of u-boot.

Also the uImage is stored on an ext4 partition as a regular file, so I 
would exclude any storage issues.

> 
> If you load a debug build of U-Boot, I believe there are a number of
> debug messages related to loading the device tree that U-Boot prints. 
> Then you can at least verify that U-Boot is loading the entire device
> tree.

The u-boot I have is not OF-aware, so it just prints the standard messages 
about loading the uImage.

P.S. With Nicolas' hint about image load address I managed to work around 
the issue and limit the scope of code where the bug might exist. Please 
see my reply to Nicolas' post.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
