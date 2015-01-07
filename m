From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable CONFIG_LOCKUP_DETECTOR
Date: Wed, 07 Jan 2015 13:22:28 +0100
Message-ID: <1420633348.32552.2.camel@AMDC1943>
References: <1420632932-6964-1-git-send-email-moon.linux@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1420632932-6964-1-git-send-email-moon.linux@yahoo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <moon.linux@yahoo.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Kevin Hilman <khilman@linaro.org>, Sachin Kamat <sachin.kamat@samsung.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Vivek Gautam <gautam.vivek@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On =C5=9Bro, 2015-01-07 at 17:45 +0530, Anand Moon wrote:
> ARM Enable CONFIG_LOCKUP_DETECTOR to validation of kernel locks
>=20
> v2 Fixed the commit log
> This config item helps getting some useful information when lockup
> happens. If you want to validate locks then probably you want
> PROVE_LOCKING... but its overhead is larger.
>=20
> Anyway the overhead of LOCKUP_DETECTOR is small and multi_v7_defconfi=
g
> has it enabled so I guess exynos may do it as well.

Err? Why did you include my response as commit message? It does not
really make sense.

Let me point this once again:
1. The commit message is inaccurate because CONFIG_LOCKUP_DETECTOR does
not validate the locks.
2. Please write proper commit message describing WHY you want to add
this config option.

Best regards,
Krzysztof

>=20
> Tested on Exynos5422 ODROID XU3 board.
>=20
> Signed-off-by: Anand Moon <moon.linux@yahoo.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exy=
nos_defconfig
> index 5ef14de..ecd9987 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -178,6 +178,7 @@ CONFIG_PRINTK_TIME=3Dy
>  CONFIG_DEBUG_FS=3Dy
>  CONFIG_MAGIC_SYSRQ=3Dy
>  CONFIG_DEBUG_KERNEL=3Dy
> +CONFIG_LOCKUP_DETECTOR=3Dy
>  CONFIG_DETECT_HUNG_TASK=3Dy
>  CONFIG_DEBUG_RT_MUTEXES=3Dy
>  CONFIG_DEBUG_SPINLOCK=3Dy
