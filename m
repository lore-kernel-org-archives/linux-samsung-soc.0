From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: clock updates
Date: Fri, 25 Jun 2010 08:01:45 +0200
Message-ID: <000801cb142b$e6624420$b326cc60$%szyprowski@samsung.com>
References: <20100623232422.GB16584@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17042 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750825Ab0FYGCt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 02:02:49 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4K00FI93GOFYB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jun 2010 15:02:48 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4K00FOK3GKDE@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jun 2010 15:02:48 +0900 (KST)
In-reply-to: <20100623232422.GB16584@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>, 'Linux Samsung SoC' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

Hello,

On Thursday, June 24, 2010 1:24 AM Ben Dooks wrote:

> I've been looking into updating the current samsung socs to use
> clkdev to lookup clocks. Currently we have a few issues that we
> could do with sorting before running the conversion to clkdev.
> 
> Firstly, the s5pc100 has some clocks that could be merged into
> common s5p, and a few which don't seem to match the others in
> the s5p series.
> 
> The i2s clocks which we should look at mergining are:
> 
> i2s_cdclk<0..2>
> pcm_cdclk<0..l>
> 
> also, clocks that have may need changing:
> 
> rotator	     => rot
> keyif	     => keypad
> 
> this isn't an complete list, still working on the changes.
> 
> The big changes with respect to drivers is that we will now be using
> clk_get(dev, NULL) to get the clock names, and any bus clocks such
> as the sdhci bus clock will be updated.
> 
> The intention with both the SDHCI and the SPI is to change the clock
> lookups to reflect the mux positions, so the sdhci clocks on the
> s3c64xx would be changed to use the following lookups:
> 
> hsmmc	=> mux0
> mmc_bus	=> mux2
> 48m	=> mux3

I like this idea, but I wonder how the drivers will be able to get/control
the additional peripheral clocks (like sclk_fimc and sclk_cam for fimc for
example)?

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
