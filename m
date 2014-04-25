From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 02/10] ARM: EXYNOS: Cleanup "mach-exynos/common.h"
 file
Date: Fri, 25 Apr 2014 23:06:29 +0200
Message-ID: <535ACE55.1010609@gmail.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com> <1398429166-5539-1-git-send-email-pankaj.dubey@samsung.com> <1398429166-5539-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398429166-5539-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, s.nawrocki@samsung.com, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Pankaj,

On 25.04.2014 14:32, Pankaj Dubey wrote:
> Remove unused and unwanted declarations from "mach-exynos/common.h"
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>   arch/arm/mach-exynos/common.h |    6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
> index 9ef3f83..31c5964 100644
> --- a/arch/arm/mach-exynos/common.h
> +++ b/arch/arm/mach-exynos/common.h
> @@ -15,14 +15,8 @@
>   #include <linux/reboot.h>
>   #include <linux/of.h>
>
> -void mct_init(void __iomem *base, int irq_g0, int irq_l0, int irq_l1);
> -
> -struct map_desc;
> -void exynos_init_io(void);
> -void exynos_restart(enum reboot_mode mode, const char *cmd);
>   void exynos_cpuidle_init(void);
>   void exynos_cpufreq_init(void);

Why don't you remove these 2 as well?

Best regards,
Tomasz
