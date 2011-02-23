From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix wrong constants in the hotplug assembly code.
Date: Wed, 23 Feb 2011 16:47:46 +0900
Message-ID: <AANLkTinpjGwd+pFr1oKQb1jiaih2h81Wp9G7Df8J1LLk@mail.gmail.com>
References: <1298444621-3739-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:51998 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752536Ab1BWHrr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Feb 2011 02:47:47 -0500
Received: by gxk8 with SMTP id 8so1309907gxk.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2011 23:47:47 -0800 (PST)
In-Reply-To: <1298444621-3739-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Russell King <rmk+kernel@arm.linux.org.uk>

Hi,

At that time Russell modified the s5cv310, tegra, and realview also. I
think you also modify it.

Thank you,
Kyungmin Park

On Wed, Feb 23, 2011 at 4:03 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch fixes wrong constants in the hotplug assembly code for
> Exynos4 such as Russell's changing in vexpress hotplug and fixes
> hard-coded control register constatns also.
>
> Reported-by: Changhwan Youn <chaos.youn@samsung.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/hotplug.c | =A0 =A08 ++++----
> =A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/hotplug.c b/arch/arm/mach-exynos4/=
hotplug.c
> index 4c42f9c..2b5909e 100644
> --- a/arch/arm/mach-exynos4/hotplug.c
> +++ b/arch/arm/mach-exynos4/hotplug.c
> @@ -30,13 +30,13 @@ static inline void cpu_enter_lowpower(void)
> =A0 =A0 =A0 =A0 * Turn off coherency
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0" =A0 =A0 =A0 mrc =A0 =A0 p15, 0, %0, c1, c0, 1\n"
> - =A0 =A0 =A0 " =A0 =A0 =A0 bic =A0 =A0 %0, %0, #0x20\n"
> + =A0 =A0 =A0 " =A0 =A0 =A0 bic =A0 =A0 %0, %0, %3\n"
> =A0 =A0 =A0 =A0" =A0 =A0 =A0 mcr =A0 =A0 p15, 0, %0, c1, c0, 1\n"
> =A0 =A0 =A0 =A0" =A0 =A0 =A0 mrc =A0 =A0 p15, 0, %0, c1, c0, 0\n"
> =A0 =A0 =A0 =A0" =A0 =A0 =A0 bic =A0 =A0 %0, %0, %2\n"
> =A0 =A0 =A0 =A0" =A0 =A0 =A0 mcr =A0 =A0 p15, 0, %0, c1, c0, 0\n"
> =A0 =A0 =A0 =A0 =A0: "=3D&r" (v)
> - =A0 =A0 =A0 =A0 : "r" (0), "Ir" (CR_C)
> + =A0 =A0 =A0 =A0 : "r" (0), "Ir" (CR_C), "Ir" (0x40)
> =A0 =A0 =A0 =A0 =A0: "cc");
> =A0}
>
> @@ -49,10 +49,10 @@ static inline void cpu_leave_lowpower(void)
> =A0 =A0 =A0 =A0" =A0 =A0 =A0 orr =A0 =A0 %0, %0, %1\n"
> =A0 =A0 =A0 =A0" =A0 =A0 =A0 mcr =A0 =A0 p15, 0, %0, c1, c0, 0\n"
> =A0 =A0 =A0 =A0" =A0 =A0 =A0 mrc =A0 =A0 p15, 0, %0, c1, c0, 1\n"
> - =A0 =A0 =A0 " =A0 =A0 =A0 orr =A0 =A0 %0, %0, #0x20\n"
> + =A0 =A0 =A0 " =A0 =A0 =A0 orr =A0 =A0 %0, %0, %2\n"
> =A0 =A0 =A0 =A0" =A0 =A0 =A0 mcr =A0 =A0 p15, 0, %0, c1, c0, 1\n"
> =A0 =A0 =A0 =A0 =A0: "=3D&r" (v)
> - =A0 =A0 =A0 =A0 : "Ir" (CR_C)
> + =A0 =A0 =A0 =A0 : "Ir" (CR_C), "Ir" (0x40)
> =A0 =A0 =A0 =A0 =A0: "cc");
> =A0}
>
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
