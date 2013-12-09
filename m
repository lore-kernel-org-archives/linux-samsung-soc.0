From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: Leave Exynos5250 SPI controller disabled by
 default
Date: Mon, 09 Dec 2013 16:23:03 +0100
Message-ID: <5026211.5mW8H3pyKS@amdc1227>
References: <1385381710-5212-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26837 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761195Ab3LIPXP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 10:23:15 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXJ00HLBPEPAU30@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Dec 2013 15:23:13 +0000 (GMT)
In-reply-to: <1385381710-5212-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

Hi Kukjin,

On Monday 25 of November 2013 12:15:08 Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Rather than requiring each board to explicitly disable the SPI controllers
> it is not using instead require boards to enable those that they are using.
> This is less work overall since normally at most one of the controllers is
> in use and avoids issues caused by inappropriate pinmuxing.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> Acked-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/boot/dts/cros5250-common.dtsi    |  9 +--------
>  arch/arm/boot/dts/exynos5250-arndale.dts  | 12 ------------
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |  6 ++----
>  arch/arm/boot/dts/exynos5250.dtsi         |  3 +++
>  4 files changed, 6 insertions(+), 24 deletions(-)

Seems like you have missed this series. Could you apply it?

Best regards,
Tomasz
