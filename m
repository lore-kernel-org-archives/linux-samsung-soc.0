From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: s5p-fimc: decrease IO registers memory
	region size
Date: Thu, 09 Sep 2010 20:26:17 +0900
Message-ID: <012001cb5011$d5109150$7f31b3f0$%kim@samsung.com>
References: <1283998956-15327-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1283998956-15327-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org, s.nawrocki@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Marek Szyprowski wrote:
> 
> From: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> IO registers region size of all FIMC versions is less than 1kB so there
> is no need to reserve 1M.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/plat-s5p/dev-fimc0.c |    2 +-
>  arch/arm/plat-s5p/dev-fimc1.c |    2 +-
>  arch/arm/plat-s5p/dev-fimc2.c |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/dev-fimc0.c b/arch/arm/plat-s5p/dev-fimc0.c
> index f9203fa..608770f 100644
> --- a/arch/arm/plat-s5p/dev-fimc0.c
> +++ b/arch/arm/plat-s5p/dev-fimc0.c
> @@ -19,7 +19,7 @@
>  static struct resource s5p_fimc0_resource[] = {
>  	[0] = {
>  		.start	= S5P_PA_FIMC0,
> -		.end	= S5P_PA_FIMC0 + SZ_1M - 1,
> +		.end	= S5P_PA_FIMC0 + SZ_4K - 1,
>  		.flags	= IORESOURCE_MEM,
>  	},
>  	[1] = {
> diff --git a/arch/arm/plat-s5p/dev-fimc1.c b/arch/arm/plat-s5p/dev-fimc1.c
> index 7ed91a3..76e3a97 100644
> --- a/arch/arm/plat-s5p/dev-fimc1.c
> +++ b/arch/arm/plat-s5p/dev-fimc1.c
> @@ -19,7 +19,7 @@
>  static struct resource s5p_fimc1_resource[] = {
>  	[0] = {
>  		.start	= S5P_PA_FIMC1,
> -		.end	= S5P_PA_FIMC1 + SZ_1M - 1,
> +		.end	= S5P_PA_FIMC1 + SZ_4K - 1,
>  		.flags	= IORESOURCE_MEM,
>  	},
>  	[1] = {
> diff --git a/arch/arm/plat-s5p/dev-fimc2.c b/arch/arm/plat-s5p/dev-fimc2.c
> index 5543d6373..24d2981 100644
> --- a/arch/arm/plat-s5p/dev-fimc2.c
> +++ b/arch/arm/plat-s5p/dev-fimc2.c
> @@ -19,7 +19,7 @@
>  static struct resource s5p_fimc2_resource[] = {
>  	[0] = {
>  		.start	= S5P_PA_FIMC2,
> -		.end	= S5P_PA_FIMC2 + SZ_1M - 1,
> +		.end	= S5P_PA_FIMC2 + SZ_4K - 1,
>  		.flags	= IORESOURCE_MEM,
>  	},
>  	[1] = {
> --
> 1.7.2.2

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
