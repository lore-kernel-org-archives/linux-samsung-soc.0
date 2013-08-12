From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V4 4/4] ARM: dts: Enable sound support on smdk5420
Date: Mon, 12 Aug 2013 13:17:13 +0200
Message-ID: <2159996.Aa92FNgf18@amdc1227>
References: <1376302070-1877-1-git-send-email-padma.v@samsung.com>
 <1376302070-1877-5-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48313 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752569Ab3HLLRT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 07:17:19 -0400
In-reply-to: <1376302070-1877-5-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

Hi Padmavathi,

On Monday 12 of August 2013 15:37:50 Padmavathi Venna wrote:
> This patch enables i2s0 and sound support on smdk5420.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> b/arch/arm/boot/dts/exynos5420-smdk5420.dts index a898b3f..b1b745c
> 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -139,4 +139,14 @@
>  		};
>  	};
> 
> +	i2s0: i2s@03830000 {
> +		status = "okay";
> +	};

After addressing my comment on node status for patch 1/4, you could get rid 
of the node above.

Best regards,
Tomasz
