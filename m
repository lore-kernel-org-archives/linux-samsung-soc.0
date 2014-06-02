From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Exynos induced build error with recent arm-soc
Date: Tue, 3 Jun 2014 00:42:16 +0100
Message-ID: <20140602234216.GD933@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:43640 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752811AbaFBXnv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jun 2014 19:43:51 -0400
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, arm@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Spotted with a randconfig today:

arch/arm/mach-exynos/built-in.o: In function `exynos_set_cpu_boot_addr':
pm_domains.c:(.text+0x19c): undefined reference to `sysram_ns_base_addr'
arch/arm/mach-exynos/built-in.o:(.data+0x94): undefined reference to `exynos_enter_aftr'

This should be fixed before the merge window...

The failing .config is:

http://www.arm.linux.org.uk/developer/build/file.php?lid=8598

and the resulting build log with errors:

http://www.arm.linux.org.uk/developer/build/result.php?type=log&cid=3001&lid=8600&format=build

Thanks.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
