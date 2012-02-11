From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 03/11] ARM: EXYNOS: add clock part for EXYNOS5250 SoC
Date: Sat, 11 Feb 2012 20:14:30 +0000
Message-ID: <20120211201430.GB24564@sirena.org.uk>
References: <1328981685-8602-1-git-send-email-kgene.kim@samsung.com>
 <1328981685-8602-4-git-send-email-kgene.kim@samsung.com>
 <201202112007.08672.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35963 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751691Ab2BKUOl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Feb 2012 15:14:41 -0500
Content-Disposition: inline
In-Reply-To: <201202112007.08672.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@ti.com>, Kyungmin Park <kmpark@infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, olof@lixom.net

On Sat, Feb 11, 2012 at 08:07:08PM +0000, Arnd Bergmann wrote:

> what the risk is in changing exynos4 at the same time. It would
> be great if we can have all exynos use the common struct clk in 3.4,
> but I'm also happy if we just get exynos5 to do it that way from the
> beginning and move exynos4 over in 3.5 after you have had a chance
> to make sure everything still works.

Are we likely to get the common struct clk in 3.4?  It's all been
extremely quiet on that front except for complaints about the lack of
progress.
