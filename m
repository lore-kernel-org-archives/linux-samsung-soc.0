From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 4/6] ARM: dts: add dt nodes for exynos5420 hdmi subsystem
Date: Tue, 27 Aug 2013 01:29:48 +0200
Message-ID: <1957834.igXyqAoa6C@flatron>
References: <1377509901-9467-1-git-send-email-rahul.sharma@samsung.com> <1377509901-9467-5-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:43233 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751575Ab3HZX3w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 19:29:52 -0400
In-Reply-To: <1377509901-9467-5-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On Monday 26 of August 2013 15:08:19 Rahul Sharma wrote:
> Add hdmi, mixer, ddc device tree nodes for Exynos 5420 SoC.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   15 +++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi         |   19 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> b/arch/arm/boot/dts/exynos5420-smdk5420.dts index bafba25..140565f
> 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -61,4 +61,19 @@
>  		};
>  	};
> 
> +	hdmi@14530000 {
> +		status = "okay";
> +		hpd-gpio = <&gpx3 7 0>;
> +	};
> +
> +	i2c_2: i2c@12C80000 {
> +		samsung,i2c-sda-delay = <100>;
> +		samsung,i2c-max-bus-freq = <66000>;
> +		status = "okay";
> +
> +		hdmiddc@50 {
> +			compatible = "samsung,exynos4210-hdmiddc";
> +			reg = <0x50>;
> +		};
> +	};
>  };

As I mentioned in my reply for previous version of this patch, changes 
done to this board dts file should be moved to next patch instead and its 
subject appropriately modified.

Best regards,
Tomasz
