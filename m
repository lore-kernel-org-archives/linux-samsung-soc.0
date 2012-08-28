From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Use non-secure MDMA1
Date: Tue, 28 Aug 2012 16:56:45 -0700
Message-ID: <503D5ABD.9040801@samsung.com>
References: <5886686.Vz6SVkoRWm@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5886686.Vz6SVkoRWm@amdc1227>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Boojin Kim <boojin.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/28/12 04:08, Tomasz Figa wrote:
> Using secure MDMA1 on TrustZone-enabled boards causes early boot crash,
> so use non-secure instead.
>
> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-exynos/dma.c              | 2 +-
>   arch/arm/mach-exynos/include/mach/map.h | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/dma.c b/arch/arm/mach-exynos/dma.c
> index f60b66d..8858df5 100644
> --- a/arch/arm/mach-exynos/dma.c
> +++ b/arch/arm/mach-exynos/dma.c
> @@ -261,7 +261,7 @@ static struct dma_pl330_platdata exynos_mdma1_pdata = {
>   };
>
>   static AMBA_AHB_DEVICE(exynos_mdma1,  "dma-pl330.2", 0x00041330,
> -	EXYNOS4_PA_MDMA1, {EXYNOS4_IRQ_MDMA1},&exynos_mdma1_pdata);
> +	EXYNOS4_PA_NS_MDMA1, {EXYNOS4_IRQ_MDMA1},&exynos_mdma1_pdata);
>
>   static int __init exynos_dma_init(void)
>   {
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
> exynos/include/mach/map.h
> index 51943f2..5df5910 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -89,7 +89,8 @@
>   #define EXYNOS4_PA_L2CC			0x10502000
>
>   #define EXYNOS4_PA_MDMA0		0x10810000
> -#define EXYNOS4_PA_MDMA1		0x12840000
> +#define EXYNOS4_PA_S_MDMA1		0x12840000
> +#define EXYNOS4_PA_NS_MDMA1		0x12850000
>   #define EXYNOS4_PA_PDMA0		0x12680000
>   #define EXYNOS4_PA_PDMA1		0x12690000
>   #define EXYNOS5_PA_MDMA0		0x10800000

Cc'ed Boojin Kim.

Well, just fix the address is enough like exynos5 stuff? I don't have 
any idea why we need secure mdma and non-secure mdma both here...

diff --git a/arch/arm/mach-exynos/include/mach/map.h 
b/arch/arm/mach-exynos/include/mach/map.h
index c72b675..c941053 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -89,7 +89,7 @@
  #define EXYNOS4_PA_L2CC                        0x10502000

  #define EXYNOS4_PA_MDMA0		0x10810000
-#define EXYNOS4_PA_MDMA1		0x12840000
+#define EXYNOS4_PA_MDMA1		0x12850000
  #define EXYNOS4_PA_PDMA0		0x12680000
  #define EXYNOS4_PA_PDMA1		0x12690000
  #define EXYNOS5_PA_MDMA0		0x10800000
--

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
