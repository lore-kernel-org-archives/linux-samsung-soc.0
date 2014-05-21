From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: dts: move dp hpd gpio pin to pinctrl_0 for exynos5420
 peach_pit
Date: Wed, 21 May 2014 22:36:57 +0900
Message-ID: <036b01cf74f9$bcaf7d90$360e78b0$@samsung.com>
References: <1400675242-7423-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27820 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750877AbaEUNhA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 09:37:00 -0400
In-reply-to: <1400675242-7423-1-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com

Rahul Sharma wrote:
> 
> DP Hpd Gpio pin which is "gpx2-6" in Exynos 5420 based peach board,
> belongs to Pinctrl_0. It has moved to pinctrl_0 from pinctrl_3.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
> Based on Kukjin's for-next branch.
> 
>  arch/arm/boot/dts/exynos5420-peach-pit.dts |   14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> index d4127b0..29f64de 100644
> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
> @@ -117,6 +117,13 @@
>  		samsung,pin-pud = <1>;
>  		samsung,pin-drv = <0>;
>  	};
> +
> +	dp_hpd_gpio: dp_hpd_gpio {
> +		samsung,pins = "gpx2-6";
> +		samsung,pin-function = <0>;
> +		samsung,pin-pud = <3>;
> +		samsung,pin-drv = <0>;
> +	};
>  };
> 
>  &pinctrl_3 {
> @@ -133,13 +140,6 @@
>  		samsung,pin-pud = <0>;
>  		samsung,pin-drv = <0>;
>  	};
> -
> -	dp_hpd_gpio: dp_hpd_gpio {
> -		samsung,pins = "gpx2-6";
> -		samsung,pin-function = <0>;
> -		samsung,pin-pud = <3>;
> -		samsung,pin-drv = <0>;
> -	};
>  };
> 
>  &rtc {
> --
> 1.7.9.5

Yeah, probably it happened when I applied your patch with rebase on top of
samsung-dt branch. Sorry about that.

BTW, I think alphabetical ordering would be nice like following...

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts
b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index d4127b0..79008ac 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -111,6 +111,13 @@
 		samsung,pin-drv = <0>;
 	};
 
+	dp_hpd_gpio: dp_hpd_gpio {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <0>;
+		samsung,pin-pud = <3>;
+		samsung,pin-drv = <0>;
+	};
+
 	hdmi_hpd_irq: hdmi-hpd-irq {
 		samsung,pins = "gpx3-7";
 		samsung,pin-function = <0>;
@@ -133,13 +140,6 @@
 		samsung,pin-pud = <0>;
 		samsung,pin-drv = <0>;
 	};
-
-	dp_hpd_gpio: dp_hpd_gpio {
-		samsung,pins = "gpx2-6";
-		samsung,pin-function = <0>;
-		samsung,pin-pud = <3>;
-		samsung,pin-drv = <0>;
-	};
 };
 
 &rtc {


I will take this ;-)

Thanks,
Kukjin
