From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS4: IRQ flags for SMSC911X set as HIGH
Date: Fri, 25 Mar 2011 08:07:09 +0530
Message-ID: <AANLkTikkYn8Ocga_208HsxWVppUBH=YH-MVMMRV2kjvT@mail.gmail.com>
References: <1300958437-23247-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:53573 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934385Ab1CYChK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2011 22:37:10 -0400
Received: by vws1 with SMTP id 1so501673vws.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Mar 2011 19:37:10 -0700 (PDT)
In-Reply-To: <1300958437-23247-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

I found that there are already some patches submitted for this purpose.

http://www.spinics.net/lists/linux-samsung-soc/msg04371.html
http://www.spinics.net/lists/linux-samsung-soc/msg04372.html

Sorry for the trouble. Please ignore this patch.

Regards,
Tushar

On 24 March 2011 14:50, Tushar Behera <tushar.behera@linaro.org> wrote:
>
> There is a mismatch in IRQ flag and irq_polarity settings for
> SMSC911X. This results in a kernel warning.
>
> IRQ flag is set to HIGH to match the irq_polarity.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
> ---
> =C2=A0arch/arm/mach-exynos4/mach-smdkc210.c | =C2=A0 =C2=A02 +-
> =C2=A0arch/arm/mach-exynos4/mach-smdkv310.c | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/mach-smdkc210.c b/arch/arm/mach-ex=
ynos4/mach-smdkc210.c
> index 25a2568..5ad5e13 100644
> --- a/arch/arm/mach-exynos4/mach-smdkc210.c
> +++ b/arch/arm/mach-exynos4/mach-smdkc210.c
> @@ -120,7 +120,7 @@ static struct resource smdkc210_smsc911x_resource=
s[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.start =C2=A0=3D=
 IRQ_EINT(5),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.end =C2=A0 =C2=
=A0=3D IRQ_EINT(5),
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_IRQ | IRQF_TRIGGER_LOW,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_IRQ | IRQF_TRIGGER_HIGH,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-ex=
ynos4/mach-smdkv310.c
> index 88e0275..a44529d 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -122,7 +122,7 @@ static struct resource smdkv310_smsc911x_resource=
s[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.start =C2=A0=3D=
 IRQ_EINT(5),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.end =C2=A0 =C2=
=A0=3D IRQ_EINT(5),
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_IRQ | IRQF_TRIGGER_LOW,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_IRQ | IRQF_TRIGGER_HIGH,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0};
>
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml



--
Tushar Behera
