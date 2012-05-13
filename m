From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: EXYNOS: fix the hotplug for Cortex-A15
Date: Sat, 12 May 2012 21:15:11 -0700
Message-ID: <CAOesGMiMko9AEmwS7ZqJKxK2H6VA62TyLuMVRe00Tf=EjtYhNw@mail.gmail.com>
References: <01a301cd2de0$7ebaada0$7c3008e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:63868 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750749Ab2EMEPN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 May 2012 00:15:13 -0400
Received: by dady13 with SMTP id y13so4600247dad.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 21:15:12 -0700 (PDT)
In-Reply-To: <01a301cd2de0$7ebaada0$7c3008e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, chaos.youn@samsung.com, Russell King <rmk+kernel@arm.linux.org.uk>

Hi,

As mentioned in your earlier git pull request:

On Wed, May 9, 2012 at 5:37 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> From: Changhwan Youn <chaos.youn@samsung.com>
>
> The sequence of cpu_enter_lowpower() for Cortex-A15
> is different from the sequence for Cortex-A9.
> This patch implements cpu_enter_lowpower() for EXYNOS5
> SoC which has Cortex-A15 cores.
>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> Note, I didn't see common code for fix of hotplug for Cortex-A15.
> If any regarding patch, please kindly let me know, thanks.
>
> =A0arch/arm/mach-exynos/hotplug.c | =A0 39 ++++++++++++++++++++++++++=
+++++++++++--
> =A01 files changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/ho=
tplug.c
> index 9c17a0a..2a444b1 100644
> --- a/arch/arm/mach-exynos/hotplug.c
> +++ b/arch/arm/mach-exynos/hotplug.c

[..]
> @@ -112,7 +143,11 @@ void platform_cpu_die(unsigned int cpu)
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * we're ready for shutdown now, so do it
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 cpu_enter_lowpower();
> + =A0 =A0 =A0 if (soc_is_exynos5250())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_enter_lowpower_a15();
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu_enter_lowpower_a9();
> +

This should be done by checking for the actual CPU in the system
instead of which SoC it is running on, otherwise you will need to over
time grow this list of SoCs that happen to have A15.


-Olof
