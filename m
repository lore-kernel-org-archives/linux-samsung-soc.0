From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 3/5] ARM: EXYNOS4: Add support PM for EXYNOS4212
Date: Thu, 25 Aug 2011 16:46:46 +0900
Message-ID: <CAJ0PZbT1YsiXT9k1FJfOCoU8h_XAYqAX6ECJ_=Q0RjR-D_9yyA@mail.gmail.com>
References: <1314192352-14911-1-git-send-email-kgene.kim@samsung.com>
	<1314192352-14911-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:59966 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750898Ab1HYHqr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Aug 2011 03:46:47 -0400
Received: by bke11 with SMTP id 11so1510443bke.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Aug 2011 00:46:46 -0700 (PDT)
In-Reply-To: <1314192352-14911-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Jonghwan Choi <jhbird.choi@samsung.com>

On Wed, Aug 24, 2011 at 10:25 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> From: Jonghwan Choi <jhbird.choi@samsung.com>
>
> This patch moves regarding clock stuff of PM into clock
> file to support PM on EXYNOS4210 and EXYNOS4212 with one
> single kernel image. Because some clock registers are
> different on each SoCs.
>
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/clock-exynos4210.c =A0 =A0 =A0 =A0| =A0 38 +=
+++++++++
> =A0arch/arm/mach-exynos4/clock-exynos4212.c =A0 =A0 =A0 =A0| =A0 34 +=
++++++++
> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 89 +++++++++++++++++++++++
> =A0arch/arm/mach-exynos4/include/mach/regs-clock.h | =A0 =A04 +
> =A0arch/arm/mach-exynos4/pm.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 79 ++------------------
> =A05 files changed, 172 insertions(+), 72 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/clock-exynos4210.c b/arch/arm/mach=
-exynos4/clock-exynos4210.c
> index fe74b91..a4b00b7 100644
> --- a/arch/arm/mach-exynos4/clock-exynos4210.c
> +++ b/arch/arm/mach-exynos4/clock-exynos4210.c
> +static struct sleep_save exynos4210_clock_save[] =3D {
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKSRC_IMAGE),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKSRC_LCD1),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKDIV_IMAGE),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKDIV_LCD1),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKSRC_MASK_LCD1),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_IMAGE_4210),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_LCD1),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_PERIR_4210),
> +};
> +
> --- a/arch/arm/mach-exynos4/clock-exynos4212.c
> +++ b/arch/arm/mach-exynos4/clock-exynos4212.c
> +static struct sleep_save exynos4212_clock_save[] =3D {
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKSRC_IMAGE),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKDIV_IMAGE),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_IMAGE_4212),
> + =A0 =A0 =A0 SAVE_ITEM(S5P_CLKGATE_IP_PERIR_4212),
> +};
> +
> --- a/arch/arm/mach-exynos4/clock.c
> +++ b/arch/arm/mach-exynos4/clock.c
> +static struct sleep_save exynos4_clock_save[] =3D {

Hello,

Is there any reason to have the following two
SAVE_ITEM(S5P_CLKSRC_IMAGE),
SAVE_ITEM(S5P_CLKDIV_IMAGE
defined at both clock-exynos4210.c and clock-exynos4212.c, not defined
at clock.c once?


Also, consider using CONFIG_PM_SLEEP rather than CONFIG_PM for
suspend/resume ops.


Cheers!
MyungJoo

--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
