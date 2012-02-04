From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add files about definition of C2C
Date: Sat, 4 Feb 2012 14:04:05 +0000
Message-ID: <20120204140405.GW889@n2100.arm.linux.org.uk>
References: <000501cce314$cf9fcff0$6edf6fd0$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:35471 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753093Ab2BDOER (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 4 Feb 2012 09:04:17 -0500
Content-Disposition: inline
In-Reply-To: <000501cce314$cf9fcff0$6edf6fd0$%lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kisang Lee <kisang80.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Greg Kroah-Hartman' <greg@kroah.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>

On Sat, Feb 04, 2012 at 05:13:00PM +0900, Kisang Lee wrote:
> Cc: Arnd Bergmann <arnd <at> arndb.de>
> Cc: Greg Kroah-Hartman <greg <at> kroah.com>
> 
> Following files are added for C2C driver
> c2c.h : Definition of C2C platform data and mode
> regs-c2c.h : Definition of C2C registers
> 
> Signed-off-by: Kisang Lee <kisang80.lee@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/c2c.h      |   65 +++++++++++++++++++++++
>  arch/arm/mach-exynos/include/mach/regs-c2c.h |   71 ++++++++++++++++++++++++++

Does anything other than these two files (in your second patch):

 drivers/misc/c2c/samsung-c2c.c |  500 ++++++++++++++++++++++++++++++++++++++++
 drivers/misc/c2c/samsung-c2c.h |  300 ++++++++++++++++++++++++

use the regs-c2c.h file?  If not, it should be placed next to the
drivers itself, and not in some random include directory far
away from the drivers.
