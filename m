From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos5250-arndale: Keep G3D regulator always
 on
Date: Fri, 14 Feb 2014 07:44:59 +0900
Message-ID: <52FD4AEB.40401@samsung.com>
References: <1392141043-27170-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1392141043-27170-1-git-send-email-t.figa@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Vikas Sajjan <vikas.sajjan@linaro.org>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/12/14 02:50, Tomasz Figa wrote:
> Apparently, if G3D regulator is powered off, the SoC cannot enter low
> power modes and just hangs. This patch fixes this by keeping the
> regulator always on when the system is running, as suggested by Exynos 4
> User's Manual in case of Exynos4210/4x12 SoCs (Exynos5250 UM does not
> have such note, but observed behavior seems to confirm that it is true
> for this SoC as well).
>
> This fixes an issue preventing Arndale board from entering sleep mode
> observed since commit
>
> 346f372f7b72a0 clk: exynos5250: Add CLK_IGNORE_UNUSED flag for pmu clock
>
> that landed in kernel 3.11, which has fixed the clock driver to make the
> SoC actually try to enter the sleep mode.
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> Acked-by: Kyungmin Park<kyungmin.park@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>   arch/arm/boot/dts/exynos5250-arndale.dts | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index e14dd62..5e9ddb8 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -287,6 +287,7 @@
>   					regulator-name = "vdd_g3d";
>   					regulator-min-microvolt =<1000000>;
>   					regulator-max-microvolt =<1000000>;
> +					regulator-always-on;
>   					regulator-boot-on;
>   					op_mode =<1>;
>   				};

Looks good to me, applied. BTW, the patch you mentioned has been merged 
since v3.10 so I fixed it.

Thanks,
Kukjin
