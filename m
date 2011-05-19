From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix card insert/removal event detection on
 smdkv310 board
Date: Fri, 20 May 2011 01:40:31 +0530
Message-ID: <BANLkTimudnvSSiECQ6Ys80et_MzgGV5srA@mail.gmail.com>
References: <1305554761-2954-1-git-send-email-thomas.ab@samsung.com>
	<000a01cc13ea$4afb9b20$e0f2d160$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:39770 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933926Ab1ESUKb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 16:10:31 -0400
Received: by yia27 with SMTP id 27so1068851yia.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 May 2011 13:10:31 -0700 (PDT)
In-Reply-To: <000a01cc13ea$4afb9b20$e0f2d160$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Marek,

On Mon, May 16, 2011 at 10:27 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On Monday, May 16, 2011 4:06 PM Thomas Abraham wrote:
>
>> On SMDKV310 board, a card detect gpio pin is available that is direc=
tly
>> connected to the io pad of the sdhci controller. Fix incorrect value
>> of cd_type field in platform data for sdhci instance 0 and 2.
>>
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos4/mach-smdkv310.c | =A0 =A04 ++--
>> =A01 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-
>> exynos4/mach-smdkv310.c
>> index 1526764..f6b1c7e 100644
>> --- a/arch/arm/mach-exynos4/mach-smdkv310.c
>> +++ b/arch/arm/mach-exynos4/mach-smdkv310.c
>> @@ -78,7 +78,7 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs[]
>> __initdata =3D {
>> =A0};
>>
>> =A0static struct s3c_sdhci_platdata smdkv310_hsmmc0_pdata __initdata=
 =3D {
>> - =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_CD_G=
PIO,
>> + =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_CD_I=
NTERNAL,
>> =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D EXYNOS4_GPK0(2),
>> =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
>
> When you are changing the card detection type from GPIO to INTERNAL y=
ou should
> also remove 'ext_cd_gpio' and 'ext_cd_gpio_invert' definitions.

Thanks for your comments. I will fix this and submit another patch.

Thomas.

>
>> =A0 =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK_=
DIV_EXTERNAL,
>> @@ -96,7 +96,7 @@ static struct s3c_sdhci_platdata smdkv310_hsmmc1_p=
data
>> __initdata =3D {
>> =A0};
>>
>> =A0static struct s3c_sdhci_platdata smdkv310_hsmmc2_pdata __initdata=
 =3D {
>> - =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_CD_G=
PIO,
>> + =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_CD_I=
NTERNAL,
>> =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D EXYNOS4_GPK2(2),
>> =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,
>
> The same as with hsmmc0.
>
>> =A0 =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK_=
DIV_EXTERNAL,
>> --
>
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
