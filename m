From: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 5/8] ARM: EXYNOS: Support secondary CPU boot of Exynos3250
Date: Tue, 15 Apr 2014 10:39:41 +0530
Message-ID: <CAHbNUh3m7n1OT9fc715vth=k6BdAvVZoYJjBvo8xT25TPji18w@mail.gmail.com>
References: <1397527192-21988-1-git-send-email-cw00.choi@samsung.com>
	<1397527192-21988-6-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397527192-21988-6-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hyunhee.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, =?UTF-8?B?67CV7LCs7Zi4?= <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, marc.zyngier-5wv7dgnIgG8@public.gmane.org, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 15 April 2014 07:29, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch fix the offset of CPU boot address and don't operate smc call
> of SMC_CMD_CPU1BOOT command for Exynos3250.
>
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/mach-exynos/firmware.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
> index aa01c42..6205d4f 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -30,13 +30,16 @@ static int exynos_do_idle(void)
>
>  static int exynos_cpu_boot(int cpu)
>  {
> +       if (soc_is_exynos3250()) {
> +               return 0;
>         /*
>          * The second parameter of SMC_CMD_CPU1BOOT command means CPU id.
>          * But, Exynos4212 has only one secondary CPU so second parameter
>          * isn't used for informing secure firmware about CPU id.
>          */
> -       if (soc_is_exynos4212())
> +       } else if (soc_is_exynos4212()) {
>                 cpu = 0;
> +       }
>

As you already return in case of Exynos3250, you need not change this.
First commit hunk without the opening brace should be sufficient.

>         exynos_smc(SMC_CMD_CPU1BOOT, cpu, 0, 0);
>         return 0;
> @@ -46,7 +49,7 @@ static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
>  {
>         void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
>
> -       if (!soc_is_exynos4212())
> +       if (!soc_is_exynos4212() && !soc_is_exynos3250())
>                 boot_reg += 4*cpu;
>
>         __raw_writel(boot_addr, boot_reg);
> --
> 1.8.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Tushar Behera
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
