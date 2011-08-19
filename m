From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Remove useless codes on NURI board
Date: Fri, 19 Aug 2011 22:51:38 +0900
Message-ID: <CAH9JG2Ufwg7+6rAsf4v_RJ-fccp=5-8ziNFZEDX5ToUP5MpJ4A@mail.gmail.com>
References: <1313758894-31814-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:60740 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753714Ab1HSNvj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 09:51:39 -0400
Received: by qwk3 with SMTP id 3so2031581qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Aug 2011 06:51:38 -0700 (PDT)
In-Reply-To: <1313758894-31814-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@samsung.com>, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Maybe charger manager codes are not merged. it's used for charger manag=
ers.

To Mr. Ham,
which patches are missing?

Thank you,
Kyungmin Park

On Fri, Aug 19, 2011 at 10:01 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> The 'nuri_cm_devices' is defined but not used.
>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/mach-nuri.c | =A0 =A07 -------
> =A01 files changed, 0 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exynos=
4/mach-nuri.c
> index 43be71b..65df994 100644
> --- a/arch/arm/mach-exynos4/mach-nuri.c
> +++ b/arch/arm/mach-exynos4/mach-nuri.c
> @@ -1037,13 +1037,6 @@ static struct platform_device nuri_max8903_dev=
ice =3D {
> =A0 =A0 =A0 =A0},
> =A0};
>
> -static struct device *nuri_cm_devices[] =3D {
> - =A0 =A0 =A0 &s3c_device_i2c5.dev,
> - =A0 =A0 =A0 &s3c_device_adc.dev,
> - =A0 =A0 =A0 NULL, /* Reserved for UART */
> - =A0 =A0 =A0 NULL,
> -};
> -
> =A0static void __init nuri_power_init(void)
> =A0{
> =A0 =A0 =A0 =A0int gpio;
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
