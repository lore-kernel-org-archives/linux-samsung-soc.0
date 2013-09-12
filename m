From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/3] ARM: dts: Leave Exynos5250 SPI controller disabled by
 default
Date: Thu, 12 Sep 2013 17:51:58 +0200
Message-ID: <3266701.1laYrVSaLy@amdc1227>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <10382663.35TJtu8bGt@amdc1227> <20130912135028.GR29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49539 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753558Ab3ILPwI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 11:52:08 -0400
In-reply-to: <20130912135028.GR29403@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org

On Thursday 12 of September 2013 14:50:28 Mark Brown wrote:
> On Thu, Sep 12, 2013 at 01:56:44PM +0200, Tomasz Figa wrote:
> > I wonder if exynos5250-arndale shouldn't be also considered in this
> > patch.
> There are no SPI devices on that board (at least not ones that are
> currently instantiated by the DT).

I can see a bunch of nodes simply adding status = "disabled" in dts of 
arndale.

Best regards,
Tomasz
