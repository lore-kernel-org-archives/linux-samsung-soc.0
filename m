From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Add PSCI function IDs for cpu-{on,off} on
 exynos7
Date: Tue, 19 Jan 2016 10:32:25 +0000
Message-ID: <20160119103224.GA25024@leverpostej>
References: <1453198884-28723-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453198884-28723-1-git-send-email-alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 19, 2016 at 03:51:24PM +0530, Alim Akhtar wrote:
> This patch adds cpu-{on,off} function IDs as per PSCI specification,
> with this we can boot multiple CPUs and can use cpu hotplug on
> exynos7 platform.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos7.dtsi |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> index f9c5a549c2c0..1a2bb3b453e5 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -65,6 +65,8 @@
>  	psci {
>  		compatible = "arm,psci-0.2";
>  		method = "smc";
> +		cpu_on = <0xC4000003>;
> +		cpu_off = <0x84000002>;
>  	};

There is no need for this patch.

The "arm,psci-0.2" compatible string implicitly tells the kernel that
the full set of mandatory PSCI 0.2 functions are present, with the IDs
mandated by PSCI 0.2. That includes CPU_ON and CPU_OFF amongst others.

The only reason to provide IDs is to function on kernels without PSCI
0.2 support. Given the compatible string hasn't been updated for that,
this is insufficient for that case.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
