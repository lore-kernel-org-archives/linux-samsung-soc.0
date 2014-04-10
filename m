From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/27] ARM: EXYNOS: Add Exynos3250 SoC ID
Date: Thu, 10 Apr 2014 11:43:36 +0200
Message-ID: <5032959.JQvlxpLHiQ@wuerfel>
References: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
 <1397122124-15690-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397122124-15690-2-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 10 April 2014 18:28:18 Chanwoo Choi wrote:
> This patch add Exynos3250's SoC ID. Exynos 3250 is System-On-Chip(SoC) that
> is based on the 32-bit RISC processor for Smartphone. Exynos3250 uses Cortex-A7
> dual cores and has a target speed of 1.0GHz.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig             | 22 ++++++++++++++++++++++
>  arch/arm/mach-exynos/exynos.c            |  1 +
>  arch/arm/plat-samsung/include/plat/cpu.h | 10 ++++++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index fc8bf18..6da8a68 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -11,6 +11,17 @@ if ARCH_EXYNOS
>  
>  menu "SAMSUNG EXYNOS SoCs Support"
>  
> +config ARCH_EXYNOS3
> +	bool "SAMSUNG EXYNOS3"
> +	select ARM_AMBA
> +	select CLKSRC_OF
> +	select HAVE_ARM_SCU if SMP
> +	select HAVE_SMP
> +	select PINCTRL
> +	select PM_GENERIC_DOMAINS if PM_RUNTIME
> +	help
> +	  Samsung EXYNOS3 SoCs based systems
> +

Isn't S5PV210 also called an Exynos3 these days? Are we going to get
any conflicts here when merging that code into Exynos as Tomasz has
suggested in the past?

	Arnd
