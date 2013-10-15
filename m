From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: Exynos5420: Add dt support for gscaler
Date: Tue, 15 Oct 2013 20:51:54 +0200
Message-ID: <1455132.3iFLDg6lah@flatron>
References: <1381836054-6590-1-git-send-email-l.krishna@samsung.com> <1381836054-6590-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:49926 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754754Ab3JOSv5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 14:51:57 -0400
In-Reply-To: <1381836054-6590-3-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org, khw0178.kim@samsung.com, prathyush.k@samsung.com, cpgs@samsung.com

Hi Leela,

On Tuesday 15 of October 2013 16:50:54 Leela Krishna Amudala wrote:
> Adds G-Scaler devices to the DT device list
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi index 7f0296c..f86aeea 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -31,6 +31,8 @@
>  		i2c1 = &i2c_1;
>  		i2c2 = &i2c_2;
>  		i2c3 = &i2c_3;
> +		gsc0 = &gsc_0;
> +		gsc1 = &gsc_1;

Do you really need these aliases?

>  	};
> 
>  	cpus {
> @@ -313,4 +315,22 @@
>  		clocks = <&clock 431>, <&clock 143>;
>  		clock-names = "mixer", "sclk_hdmi";
>  	};
> +
> +	gsc_0:  gsc@0x13e00000 {

coding style: There should be no 0x in node name and the name should
be more meaningful, e.g. video-scaler.

Best regards,
Tomasz
