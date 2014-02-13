From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: DTS: exynos5420: Rename hsi2c compatible to exynos5250-hsi2c
Date: Fri, 14 Feb 2014 08:40:34 +0900
Message-ID: <52FD57F2.8@samsung.com>
References: <1391688477-8124-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391688477-8124-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/06/14 21:07, Naveen Krishna Chatradhi wrote:
> As per the changes submitted for the i2c-exynos5.c driver with the
> compatible string being named after the first SoC it is observed on.
> This patch modifes the existing hsi2c compatible strings in
> arch/arm/boot/dts.
>
> Signed-off-by: Naveen Krishna Chatradhi<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm/boot/dts/exynos5420.dtsi |   14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 11dd202..c5187d1 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -486,7 +486,7 @@
>   	};
>
>   	hsi2c_4: i2c@12CA0000 {
> -		compatible = "samsung,exynos5-hsi2c";
> +		compatible = "samsung,exynos5250-hsi2c";
>   		reg =<0x12CA0000 0x1000>;
>   		interrupts =<0 60 0>;
>   		#address-cells =<1>;
> @@ -499,7 +499,7 @@
>   	};
>
>   	hsi2c_5: i2c@12CB0000 {
> -		compatible = "samsung,exynos5-hsi2c";
> +		compatible = "samsung,exynos5250-hsi2c";
>   		reg =<0x12CB0000 0x1000>;
>   		interrupts =<0 61 0>;
>   		#address-cells =<1>;
> @@ -512,7 +512,7 @@
>   	};
>
>   	hsi2c_6: i2c@12CC0000 {
> -		compatible = "samsung,exynos5-hsi2c";
> +		compatible = "samsung,exynos5250-hsi2c";
>   		reg =<0x12CC0000 0x1000>;
>   		interrupts =<0 62 0>;
>   		#address-cells =<1>;
> @@ -525,7 +525,7 @@
>   	};
>
>   	hsi2c_7: i2c@12CD0000 {
> -		compatible = "samsung,exynos5-hsi2c";
> +		compatible = "samsung,exynos5250-hsi2c";
>   		reg =<0x12CD0000 0x1000>;
>   		interrupts =<0 63 0>;
>   		#address-cells =<1>;
> @@ -538,7 +538,7 @@
>   	};
>
>   	hsi2c_8: i2c@12E00000 {
> -		compatible = "samsung,exynos5-hsi2c";
> +		compatible = "samsung,exynos5250-hsi2c";
>   		reg =<0x12E00000 0x1000>;
>   		interrupts =<0 87 0>;
>   		#address-cells =<1>;
> @@ -551,7 +551,7 @@
>   	};
>
>   	hsi2c_9: i2c@12E10000 {
> -		compatible = "samsung,exynos5-hsi2c";
> +		compatible = "samsung,exynos5250-hsi2c";
>   		reg =<0x12E10000 0x1000>;
>   		interrupts =<0 88 0>;
>   		#address-cells =<1>;
> @@ -564,7 +564,7 @@
>   	};
>
>   	hsi2c_10: i2c@12E20000 {
> -		compatible = "samsung,exynos5-hsi2c";
> +		compatible = "samsung,exynos5250-hsi2c";
>   		reg =<0x12E20000 0x1000>;
>   		interrupts =<0 203 0>;
>   		#address-cells =<1>;

Naveen,

Please don't post separately for one series. It's hard to find to look 
at regarding patches.

And please post regarding binding doc together. Additionally if you run 
checkpatch, you can see see below complaining.

"WARNING: DT compatible string "samsung,exynos5250-hsi2c" appears 
un-documented -- check ./Documentation/devicetree/bindings/"

- Kukjin
