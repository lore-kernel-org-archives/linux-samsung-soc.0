From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 05/10] ARM: s3c64xx: enable sparse IRQ support
Date: Fri, 6 Mar 2015 17:43:16 +0000
Message-ID: <20150306174316.GA26692@opensource.wolfsonmicro.com>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de> <1425299763-4066822-6-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59839 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754843AbbCFRnT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Mar 2015 12:43:19 -0500
Content-Disposition: inline
In-Reply-To: <1425299763-4066822-6-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, dmitry.torokhov@gmail.com, Maurus Cuelenaere <mcuelenaere@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, cw00.choi@samsung.com, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>, a.kesavan@samsung.com, ch.naveen@samsung.com, jic23@kernel.org

On Mon, Mar 02, 2015 at 01:35:58PM +0100, Arnd Bergmann wrote:
> This is another prerequisite for enabling multiplatform
> support, and it is the part I am least certain about.
> 
> I assume it will cause the extra boot message "Cannot
> allocate irq_descs @ IRQ%d, assuming pre-allocated" to
> be printed, but otherwise work ok. This definitely needs
> to be tested on real hardware to see if it works.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

This one appears to cause some problems with the IRQs on
Cragganmore, I need to look into it a bit more but it looks like
one of the PMICs can't allocate its IRQs:

[    0.961455] wm831x 1-0034: WM8311 revision C
[    0.965066] wm831x 1-0034: Failed to allocate IRQs: -17

And the CODEC can't request its IRQ:

[    4.252735] arizona spi0.1: WM5102 revision C
[    4.269763] arizona spi0.1: Failed to request primary IRQ 263: -22

Hopefully I can look into this a little more next week.

Thanks,
Charles
