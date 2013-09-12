From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/3] ARM: dts: Leave Exynos5250 SPI controller disabled by
 default
Date: Thu, 12 Sep 2013 13:56:44 +0200
Message-ID: <10382663.35TJtu8bGt@amdc1227>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <1378982427-5802-2-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:39527 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751778Ab3ILL4w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 07:56:52 -0400
In-reply-to: <1378982427-5802-2-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>

Hi Mark,

On Thursday 12 of September 2013 11:40:26 Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Rather than requiring each board to explicitly disable the SPI
> controllers it is not using instead require boards to enable those that
> they are using. This is less work overall since normally at most one of
> the controllers is in use and avoids issues caused by inappropriate
> pinmuxing.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-smdk5250.dts | 10 ++--------
>  arch/arm/boot/dts/exynos5250.dtsi         |  3 +++
>  2 files changed, 5 insertions(+), 8 deletions(-)

I wonder if exynos5250-arndale shouldn't be also considered in this patch.

Best regards,
Tomasz
