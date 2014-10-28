From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCHv2 1/2] ARM: EXYNOS: Add EXYNOS4415 SoC ID
Date: Tue, 28 Oct 2014 12:48:44 +0900
Message-ID: <02b501cff262$127d44b0$3777ce10$@kernel.org>
References: <1414373759-4362-1-git-send-email-cw00.choi@samsung.com>
 <1414373759-4362-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1414373759-4362-2-git-send-email-cw00.choi@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, jaewon02.kim@samsung.com, arnd@arndb.de, sw0312.kim@samsung.com, tomasz.figa@gmail.com, yj44.cho@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, olof@lixom.net, ideal.song@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Chanwoo Choi wrote:
> 
> This patch add Exynos4415's SoC ID.
> 
Since the CPU ID has been removed as per comments, need to update the commit
message accordingly.

> Exynos4415 is based on the 32-bit RISC
> processor for Smartphone. Exynos4415 uses Cortex A9 quad-cores and has a target
> speed of 1.6GHz and provides 8.5GB/s memory bandwidth.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig  | 5 +++++
>  arch/arm/mach-exynos/exynos.c | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 46f3c0d..349c867 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -75,6 +75,11 @@ config SOC_EXYNOS4412
>  	default y
>  	depends on ARCH_EXYNOS4
> 
> +config SOC_EXYNOS4415
> +	bool "SAMSUNG EXYNOS4415"
> +	default y
> +	depends on ARCH_EXYNOS4
> +

I think, this is not required more...

Thanks,
Kukjin

>  config SOC_EXYNOS5250
>  	bool "SAMSUNG EXYNOS5250"
>  	default y
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index 1b46460..1da531f 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -252,6 +252,7 @@ static const struct of_device_id exynos_dt_pmu_match[] = {
>  	{ .compatible = "samsung,exynos4210-pmu" },
>  	{ .compatible = "samsung,exynos4212-pmu" },
>  	{ .compatible = "samsung,exynos4412-pmu" },
> +	{ .compatible = "samsung,exynos4415-pmu" },
>  	{ .compatible = "samsung,exynos5250-pmu" },
>  	{ .compatible = "samsung,exynos5260-pmu" },
>  	{ .compatible = "samsung,exynos5410-pmu" },
> @@ -359,6 +360,7 @@ static char const *exynos_dt_compat[] __initconst = {
>  	"samsung,exynos4210",
>  	"samsung,exynos4212",
>  	"samsung,exynos4412",
> +	"samsung,exynos4415",
>  	"samsung,exynos5",
>  	"samsung,exynos5250",
>  	"samsung,exynos5260",
> --
> 1.8.5.5
