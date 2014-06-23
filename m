From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: DTS: correct the capability string for mmc0
Date: Mon, 23 Jun 2014 20:36:57 +0900
Message-ID: <034701cf8ed7$70c78330$52568990$@samsung.com>
References: <1403522420-1208-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45083 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753124AbaFWLhA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 07:37:00 -0400
In-reply-to: <1403522420-1208-1-git-send-email-ch.naveen@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org

Naveen Krishna Chatradhi wrote:
> 
> MMC capability for HS200 is parsed in mmc/core/host.c as
> dts string "mmc-hs200-1_8v".
> 
> This patch corrects the dts string for Exynos5420 based peach-pit
> and Exynos5800 based peach-pi boards.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |    2 +-
>  arch/arm/boot/dts/exynos5800-peach-pi.dts  |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-
> peach-pit.dts
> index 7649982..7dea480 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -173,7 +173,7 @@
>  	status = "okay";
>  	num-slots = <1>;
>  	broken-cd;
> -	caps2-mmc-hs200-1_8v;
> +	mmc-hs200-1_8v;
>  	supports-highspeed;
>  	non-removable;
>  	card-detect-delay = <200>;
> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-
> peach-pi.dts
> index 2c2c137..bb3ee76 100644
> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
> @@ -171,7 +171,7 @@
>  	status = "okay";
>  	num-slots = <1>;
>  	broken-cd;
> -	caps2-mmc-hs200-1_8v;
> +	mmc-hs200-1_8v;
>  	supports-highspeed;
>  	non-removable;
>  	card-detect-delay = <200>;
> --
> 1.7.9.5

Applied, thanks.

- Kukjin
