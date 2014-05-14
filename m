From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 4/5] ARM: dts: remove chip specific hdmi hpd pin from
 board
Date: Wed, 14 May 2014 21:51:55 +0200
Message-ID: <5373C95B.5080601@gmail.com>
References: <1400035562-16832-1-git-send-email-rahul.sharma@samsung.com> <1400035562-16832-5-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:49466 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175AbaENTwJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 15:52:09 -0400
In-Reply-To: <1400035562-16832-5-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On 14.05.2014 04:46, Rahul Sharma wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
> 
> "gpx3-7" is chip specific pin in Exynos5420 for hdmi
> hotplug. This pin is moved to exynos5420-pinctrl.dts
> and removed from the board file.
> 
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |    9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 6910485..11cd9bf 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -131,15 +131,6 @@
>  		};
>  	};
>  
> -	pinctrl@13400000 {
> -		hdmi_hpd_irq: hdmi-hpd-irq {
> -			samsung,pins = "gpx3-7";
> -			samsung,pin-function = <0>;
> -			samsung,pin-pud = <1>;
> -			samsung,pin-drv = <0>;

Again, the same comment as for patch 1/5. This pin is being configured
as input, which doesn't look like a dedicated special function pin.
Shouldn't this node rather stay here?

Best regards,
Tomasz
