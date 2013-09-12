From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: Disable Exynos5250 I2S controllers by default
Date: Thu, 12 Sep 2013 13:24:28 +0200
Message-ID: <1905951.GCMqAyg6ym@amdc1227>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36179 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754497Ab3ILLYf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 07:24:35 -0400
In-reply-to: <1378982427-5802-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>

Hi Mark,

On Thursday 12 of September 2013 11:40:25 Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Rather than requiring each board to explicitly disable the I2S
> controllers it is not using instead require boards to enable those that
> they are using.
> 
> This is required for audio operation on Arndale, one of the unused I2S
> controllers is pinmuxed with the LDO enable GPIOs for the WM1811A.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts  | 4 ++++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts | 8 --------
>  arch/arm/boot/dts/exynos5250.dtsi         | 3 +++
>  3 files changed, 7 insertions(+), 8 deletions(-)

Looks reasonably.

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
