From: Arun Kumar K <arunkk.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: Add usb2phy support on exynos5420
Date: Wed, 30 Apr 2014 15:55:14 +0530
Message-ID: <5360CF8A.5010809@gmail.com>
References: <1398848110-6152-1-git-send-email-gautam.vivek@samsung.com> <1398848110-6152-4-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398848110-6152-4-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Vivek,

On 04/30/14 14:25, Vivek Gautam wrote:
> Add required device node for usb2phy to let enable USB 2.0
> support.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index cfa3755..16b860a 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -737,4 +737,14 @@
>  		clock-names = "secss";
>  		samsung,power-domain = <&g2d_pd>;
>  	};
> +
> +	phy@12130000 {

As we will be changing over to reference-based updation of nodes in the
board dts files, it would be good to add node reference also while
adding new nodes. Like : usb_phy: phy@12130000 {

Regards
Arun

> +		compatible = "samsung,exynos5250-usb2-phy";
> +		reg = <0x12130000 0x100>;
> +		clocks = <&clock CLK_USBH20>, <&clock CLK_SCLK_USBPHY300>;
> +		clock-names = "phy", "ref";
> +		#phy-cells = <1>;
> +		samsung,sysreg-phandle = <&sysreg_system_controller>;
> +		samsung,pmureg-phandle = <&pmu_system_controller>;
> +	};
>  };
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
