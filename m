From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos: fix RTC interrupt for exynos5410
Date: Sun, 7 Jan 2018 11:05:53 +0100
Message-ID: <20180107100553.e5lbc7tsmo7l2xyo@kozik-lap>
References: <20171221213020.3080361-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171221213020.3080361-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Dec 21, 2017 at 10:30:07PM +0100, Arnd Bergmann wrote:
> According to the comment added to exynos_dt_pmu_match[] in commit
> 8b283c025443 ("ARM: exynos4/5: convert pmu wakeup to stacked domains"),
> the RTC is not able to wake up the system through the PMU on Exynos5410,
> unlike Exynos5420.
> 
> However, when the RTC DT node got added, it was a straight copy of
> the Exynos5420 node, which now causes a warning from dtc.
> 
> This removes the incorrect interrupt-parent, which should get the
> interrupt working and avoid the warning.
> 
> Fixes: e1e146b1b062 ("ARM: dts: exynos: Add RTC and I2C to Exynos5410")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos5410.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>

I reverted my commit [1] and applied yours. What is interesting... RTC
works fine in any combination (so even routing interrupts through
non-interrupt-controller PMU).

Best regards,
Krzysztof


[1] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt&id=6737b081409a4373e9d02c75aea7b916481e31b5
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
