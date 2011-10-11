From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RESEND][PATCH V2 0/2] Add a common macro for creating struct
 clk_lookup entries
Date: Tue, 11 Oct 2011 20:56:23 +0900
Message-ID: <057301cc880c$cc7f1f50$657d5df0$%kim@samsung.com>
References: <1318333530-7023-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34672 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918Ab1JKL4Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 07:56:25 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSW006DXH60CGX0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 20:56:24 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSW0096MH5ZFE10@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 11 Oct 2011 20:56:23 +0900 (KST)
In-reply-to: <1318333530-7023-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>
Cc: khilman@ti.com, nsekhar@ti.com, hsweeten@visionengravers.com, rmallon@gmail.com, s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de, plagnioj@jcrosoft.com, amit.kucheria@canonical.com, kernel@pengutronix.de, hjk@hansjkoch.de, linux@arm.linux.org.uk

Padmavathi Venna wrote:
> 
> From: Padmavathi Venna <padma.v@samsung.com>
> 
> This patchset consolidates the macro that creates 'struct clk_lookup'
> entries by introducing a common macro 'CLKDEV_INIT' as suggested by
> Russell King. Few of the platforms have been modified to use this new
macro.
> 
> I have done the replacement by using python script. I have only build
tested
> for below platforms with existing defconfigs.
> 
> Changes since V1:
> - Removed "&" and "," from the CLKDEV_INIT macro.
> - Replaced the platform specific macros to use the new CLKDEV_INIT macro.
> - Rebased the patches on the latest master branch of Linux-Next.
> 
> Padmavathi Venna (2):
>   ARM: CLKDEV: Add Common Macro for clk_lookup
>   ARM: Using CLKDEV_INIT for creating clk_lookup instance
> 
>  arch/arm/mach-davinci/board-dm646x-evm.c |    5 +-
>  arch/arm/mach-davinci/clock.h            |    7 --
>  arch/arm/mach-davinci/da830.c            |  101 ++++++++++----------
>  arch/arm/mach-davinci/da850.c            |   95 ++++++++++----------
>  arch/arm/mach-davinci/dm355.c            |   87 +++++++++---------
>  arch/arm/mach-davinci/dm365.c            |  113 +++++++++++-----------
>  arch/arm/mach-davinci/dm644x.c           |   77 ++++++++--------
>  arch/arm/mach-davinci/dm646x.c           |   81 ++++++++--------
>  arch/arm/mach-davinci/tnetv107x.c        |  133
+++++++++++++-------------
>  arch/arm/mach-ep93xx/clock.c             |   61 ++++++-------
>  arch/arm/mach-imx/clock-imx1.c           |   38 +++-----
>  arch/arm/mach-imx/clock-imx21.c          |   91 +++++++++----------
>  arch/arm/mach-imx/clock-imx25.c          |   79 +++++++---------
>  arch/arm/mach-imx/clock-imx27.c          |  111 ++++++++++------------
>  arch/arm/mach-imx/clock-imx31.c          |  103 ++++++++++-----------
>  arch/arm/mach-imx/clock-imx35.c          |  117 +++++++++++------------
>  arch/arm/mach-lpc32xx/clock.c            |   75 +++++++--------
>  arch/arm/mach-mx5/clock-mx51-mx53.c      |  149
++++++++++++++--------------
> --
>  arch/arm/mach-mxs/clock-mx23.c           |   39 +++-----
>  arch/arm/mach-mxs/clock-mx28.c           |   71 +++++++--------
>  arch/arm/mach-tcc8k/clock.c              |  107 ++++++++++-----------
>  include/linux/clkdev.h                   |    7 ++
>  22 files changed, 838 insertions(+), 909 deletions(-)
> 
> --
> 1.7.4.4

(Cc'ed Arnd)

Looks ok to me and on Samsung stuff also.

If required,
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Russell,
Maybe as you know, this is required on upcoming Samsung stuff. Actually it's
just change/consolidate on other stuff but add on Samsung stuff. So if
you're ok, how about sending this to upstream via arm-soc or your tree in
this merge window?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
