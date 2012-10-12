From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v1 1/6] dts: exynos: add device tree support for exynos5 hdmi
Date: Sat, 13 Oct 2012 00:04:35 +0200
Message-ID: <2112429.s4dA1rqnG4@flatron>
References: <1349981868-2116-1-git-send-email-rahul.sharma@samsung.com> <1349981868-2116-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:55369 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751764Ab2JLWEf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Oct 2012 18:04:35 -0400
Received: by mail-we0-f174.google.com with SMTP id t9so1928097wey.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Oct 2012 15:04:34 -0700 (PDT)
In-Reply-To: <1349981868-2116-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On Friday 12 of October 2012 00:27:42 Rahul Sharma wrote:
> This patch adds support for device tree based discovery for exynos5
> hdmi. Hdmi node is also renamed with "exynos5-hdmi".
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250-smdk5250.dts |    4 ++++
>  arch/arm/boot/dts/exynos5250.dtsi         |    7 +++++++
>  arch/arm/mach-exynos/include/mach/map.h   |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c    |    2 ++
>  4 files changed, 14 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> b/arch/arm/boot/dts/exynos5250-smdk5250.dts index a352df4..2a478ab
> 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -166,4 +166,8 @@
>  	spi_2: spi@12d40000 {
>  		status = "disabled";
>  	};
> +
> +	hdmi {
> +		hpd-gpio = <&gpx3 7 0xf 1 3>;
> +	};
>  };
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi index f69e389..4e019b5 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -492,4 +492,11 @@
>  			#gpio-cells = <4>;
>  		};
>  	};
> +
> +	hdmi {

hdmi@14530000

> +		compatible = "samsung,exynos5-hdmi";
> +		reg = <0x14530000 0x100000>;
> +		interrupts = <0 95 0>;
> +		version = "1.4";
> +        };

Is it just me or there is something wrong with indentation of this 
bracket?

Best regards,
Tomasz Figa
