From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/5] ARM: EXYNOS4: fix improper gpio configuration
Date: Fri, 10 Jun 2011 12:13:18 +0530
Message-ID: <BANLkTik4qbuxb58DQ6mROUkykUymVWnPXA@mail.gmail.com>
References: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
	<1307687667-9127-4-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:61975 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751634Ab1FJGnU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 02:43:20 -0400
Received: by bwz15 with SMTP id 15so1940649bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2011 23:43:19 -0700 (PDT)
In-Reply-To: <1307687667-9127-4-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Jun 10, 2011 at 12:04 PM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> These pins are incorrectly configured for PCM2
> configure them to SPDIF(_OUT & _EXT_CLK)
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
> =C2=A0arch/arm/mach-exynos4/dev-audio.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/dev-audio.c b/arch/arm/mach-exynos=
4/dev-audio.c
> index 6347594..5add5fa 100644
> --- a/arch/arm/mach-exynos4/dev-audio.c
> +++ b/arch/arm/mach-exynos4/dev-audio.c
> @@ -335,7 +335,7 @@ struct platform_device exynos4_device_ac97 =3D {
>
> =C2=A0static int exynos4_spdif_cfg_gpio(struct platform_device *pdev)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin_range(EXYNOS4_GPC1(0), 2, S3C_=
GPIO_SFN(3));
> + =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin_range(EXYNOS4_GPC1(0), 2, S3C_=
GPIO_SFN(4));
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
