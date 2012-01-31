From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: add support GPIO for EXYNOS5250
Date: Tue, 31 Jan 2012 22:40:43 +0000
Message-ID: <20120131224043.GD8338@n2100.arm.linux.org.uk>
References: <1328025040-4751-1-git-send-email-kgene.kim@samsung.com> <1328025040-4751-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:38087 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753352Ab2AaWk7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 17:40:59 -0500
Content-Disposition: inline
In-Reply-To: <1328025040-4751-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Sangsu Park <sangsu4u.park@samsung.com>

On Wed, Feb 01, 2012 at 12:50:39AM +0900, Kukjin Kim wrote:
> From: Sangsu Park <sangsu4u.park@samsung.com>
> 
> This patch adds follwing.
> - IO-map for EXYNOS5250 GPIO support
> - EXYNOS5250 GPIO bank size/number definitions
> - memory map definition for S5P GPIO4
> 
> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Do you actually need these static mapping definitions?  The samsung
gpiolib initialization is called from a core_initcall(), and at this
time ioremap() is fully capable of working.
