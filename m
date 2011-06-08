From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: S5PV210: Fix build breakage due to renaming of S3C_VA_USB_HSPHY
Date: Wed, 8 Jun 2011 19:43:42 +0530
Message-ID: <BANLkTimo82WFQsKbgsf9nWw2OWhzxDawOw@mail.gmail.com>
References: <1307532337-29348-1-git-send-email-thomas.ab@samsung.com>
	<005501cc25e3$7df601e0$79e205a0$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:48877 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755024Ab1FHONn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2011 10:13:43 -0400
Received: by qwk3 with SMTP id 3so238995qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jun 2011 07:13:43 -0700 (PDT)
In-Reply-To: <005501cc25e3$7df601e0$79e205a0$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 8 June 2011 19:23, Marek Szyprowski <m.szyprowski@samsung.com> wrote=
:
> Hello,
>
> There is already the patch that fixes this issue available on
> kgene/s5p_fixes_for_linus branch. Please check commit 08115a139 from
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Thanks Marek. I apologize for the noise.

>
> On Wednesday, June 08, 2011 1:26 PM Thomas Abraham wrote:
>
>> Commit 8f1d169f999fea892c3fcbf5a79ae8525a477572
>> ("ARM: EXYNOS4: Add usb host phy control") renamed S3C_VA_USB_HSPHY
>> to S5P_VA_USB_HSPHY in s5p-map.h file. Fix build for S5PV210 platfor=
m.
>>
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv210/cpu.c | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu=
=2Ec
>> index 61e6c24..b343582 100644
>> --- a/arch/arm/mach-s5pv210/cpu.c
>> +++ b/arch/arm/mach-s5pv210/cpu.c
>> @@ -91,7 +91,7 @@ static struct map_desc s5pv210_iodesc[] __initdata=
 =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> =A0 =A0 =A0 }, {
>> - =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned long=
)S3C_VA_USB_HSPHY,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned long=
)S5P_VA_USB_HSPHY,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D__phys_to=
_pfn(S5PV210_PA_HSPHY),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> --
>> 1.6.6.rc2
>
> S3C_VA_USB_HSPHY is the correct name, it is also used on s3c64xx and
> s3c-hsotg driver (see drivers/usb/gadget).
>
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
