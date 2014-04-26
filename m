From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 4/7] ARM: EXYNOS: Enter a15 lowpower mode for Exynos3250
 based on Cortex-a7
Date: Sat, 26 Apr 2014 02:25:03 +0200
Message-ID: <535AFCDF.20503@gmail.com>
References: <1398388572-30239-1-git-send-email-cw00.choi@samsung.com> <1398388572-30239-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398388572-30239-5-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: sajjan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, hyunhee.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On 25.04.2014 03:16, Chanwoo Choi wrote:
> This patch decide proper lowpower mode of either a15 or a9 according to own ID
> from Main ID register.
>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Marc Zynigier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>   arch/arm/mach-exynos/hotplug.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
> index 5eead53..acf3119 100644
> --- a/arch/arm/mach-exynos/hotplug.c
> +++ b/arch/arm/mach-exynos/hotplug.c
> @@ -135,16 +135,21 @@ void __ref exynos_cpu_die(unsigned int cpu)
>   	int primary_part = 0;
>
>   	/*
> -	 * we're ready for shutdown now, so do it.
> -	 * Exynos4 is A9 based while Exynos5 is A15; check the CPU part
> -	 * number by reading the Main ID register and then perform the
> -	 * appropriate sequence for entering low power.
> +	 * Prepare the CPU for shutting down. The required sequence of
> +	 * operations depends on core type. CPUID part number can be used to
> +	 * determine the right way.
>   	 */
> -	asm("mrc p15, 0, %0, c0, c0, 0" : "=r"(primary_part) : : "cc");
> -	if ((primary_part & 0xfff0) == 0xc0f0)
> +	primary_part = read_cpuid_part_number();
> +
> +	switch (primary_part) {
> +	case ARM_CPU_PART_CORTEX_A7:
> +	case ARM_CPU_PART_CORTEX_A15:
>   		cpu_enter_lowpower_a15();
> -	else
> +		break;
> +	default:
>   		cpu_enter_lowpower_a9();
> +		break;
> +	}
>
>   	platform_do_lowpower(cpu, &spurious);
>
>

I have noticed Leela Krishna Amudala's patch [1] that removes this 
distinction completely and simply uses generic code. Could you check if 
this works on Exynos3250 as well? If yes, then this patch could be 
dropped and Leela's one would be enough.

[1] 
http://www.mail-archive.com/linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg29064.html

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
