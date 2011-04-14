From: Angus Ainslie <angus.ainslie@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Register HSMMC2 before HSMMC0 on SMDKV310 board
Date: Thu, 14 Apr 2011 01:49:40 -0600
Message-ID: <BANLkTimUkDRrL=-JgGjJhgU_MJ=CVPQJMg@mail.gmail.com>
References: <1302669534-28926-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:61707 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752364Ab1DNHtk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Apr 2011 03:49:40 -0400
Received: by iyb14 with SMTP id 14so1228287iyb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Apr 2011 00:49:40 -0700 (PDT)
In-Reply-To: <1302669534-28926-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, linaro-dev@lists.linaro.org

On Tue, Apr 12, 2011 at 10:38 PM, Tushar Behera
<tushar.behera@linaro.org> wrote:
> On Exynos4210 SOC, of all the HSMMC controllers only HSMMC2 can
> be used as a boot media. Hence the default SD/MMC card should be
> connected to HSMMC2. The secondary card is connected to HSMMC0.
>
> If HSMMC0 is registered before HSMMC2, the device node for default
> MMC card changes depending on whether secondary card is connected
> or not. It creates problem in mounting the file-system present in
> default SD/MMC card. Hence HSMMC2 should be registered before HSMMC0.
>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> =A0arch/arm/mach-exynos4/mach-smdkv310.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-ex=
ynos4/mach-smdkv310.c
> index f6b1c7e..4f34d43 100644
> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
> @@ -168,9 +168,9 @@ static struct i2c_board_info i2c_devs1[] __initda=
ta =3D {
> =A0};
>
> =A0static struct platform_device *smdkv310_devices[] __initdata =3D {
> + =A0 =A0 =A0 &s3c_device_hsmmc2,
> =A0 =A0 =A0 =A0&s3c_device_hsmmc0,
> =A0 =A0 =A0 =A0&s3c_device_hsmmc1,
> - =A0 =A0 =A0 &s3c_device_hsmmc2,
> =A0 =A0 =A0 =A0&s3c_device_hsmmc3,
> =A0 =A0 =A0 =A0&s3c_device_i2c1,
> =A0 =A0 =A0 =A0&s3c_device_rtc,
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

If you use the UUID of the filesystem it doesn't matter which device
node it gets registered as.

Angus

--=20
Angus Ainslie <angus.ainslie@linaro.org>
Team Lead, Samsung Landing Team
