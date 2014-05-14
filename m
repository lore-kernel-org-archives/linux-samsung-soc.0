From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v4 4/5] ARM: dts: remove chip specific hdmi hpd pin from
 board
Date: Thu, 15 May 2014 03:45:40 +0900
Message-ID: <5373B9D4.2060601@samsung.com>
References: <1400035562-16832-1-git-send-email-rahul.sharma@samsung.com> <1400035562-16832-5-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:45982 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751077AbaENSpu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 14:45:50 -0400
In-Reply-To: <1400035562-16832-5-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com

On 05/14/14 11:46, Rahul Sharma wrote:
> From: Rahul Sharma<Rahul.Sharma@samsung.com>
>
> "gpx3-7" is chip specific pin in Exynos5420 for hdmi
> hotplug. This pin is moved to exynos5420-pinctrl.dts
> and removed from the board file.

Rahul, you may need to put the change (moving the pin from smdk5420 
board to exynos5420-pinctrl.dts) before the patch 3/5.

- Kukjin

>
> Signed-off-by: Rahul Sharma<Rahul.Sharma@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5420-smdk5420.dts |    9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 6910485..11cd9bf 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -131,15 +131,6 @@
>   		};
>   	};
>
> -	pinctrl@13400000 {
> -		hdmi_hpd_irq: hdmi-hpd-irq {
> -			samsung,pins = "gpx3-7";
> -			samsung,pin-function =<0>;
> -			samsung,pin-pud =<1>;
> -			samsung,pin-drv =<0>;
> -		};
> -	};
> -
>   	hdmi@14530000 {
>   		status = "okay";
>   		hpd-gpio =<&gpx3 7 0>;
