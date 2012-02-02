From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: add support GPIO for EXYNOS5250
Date: Thu, 2 Feb 2012 11:27:26 -0700
Message-ID: <20120202182726.GO15343@ponder.secretlab.ca>
References: <1328025040-4751-1-git-send-email-kgene.kim@samsung.com>
 <1328025040-4751-2-git-send-email-kgene.kim@samsung.com>
 <20120131224043.GD8338@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:61959 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755295Ab2BBS12 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Feb 2012 13:27:28 -0500
Received: by pbdu11 with SMTP id u11so2224532pbd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2012 10:27:28 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20120131224043.GD8338@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangsu Park <sangsu4u.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, Jan 31, 2012 at 10:40:43PM +0000, Russell King - ARM Linux wrote:
> On Wed, Feb 01, 2012 at 12:50:39AM +0900, Kukjin Kim wrote:
> > From: Sangsu Park <sangsu4u.park@samsung.com>
> > 
> > This patch adds follwing.
> > - IO-map for EXYNOS5250 GPIO support
> > - EXYNOS5250 GPIO bank size/number definitions
> > - memory map definition for S5P GPIO4
> > 
> > Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> Do you actually need these static mapping definitions?  The samsung
> gpiolib initialization is called from a core_initcall(), and at this
> time ioremap() is fully capable of working.

Indeed.  Please get rid of the S5P_VA_GPIO* macros and use ioremap to
set up the registers mappings.  I understand that the existing code
already does that, but I don't want to see any more added.  Also, it
is easy to fix by adding the ioremap calls to samsung_gpio_init()

g.
