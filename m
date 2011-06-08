From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] ARM: S5PV210: Fix build breakage due to renaming of S3C_VA_USB_HSPHY
Date: Wed, 8 Jun 2011 20:24:49 +0530
Message-ID: <BANLkTinP=J07jsprzGO=+hsjMQ9C6_VBcw@mail.gmail.com>
References: <1307532337-29348-1-git-send-email-thomas.ab@samsung.com>
	<005501cc25e3$7df601e0$79e205a0$%szyprowski@samsung.com>
	<BANLkTi=c1p7yxswvymBWS1PQeqW=+weKbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:50177 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752694Ab1FHOyu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2011 10:54:50 -0400
Received: by qyk7 with SMTP id 7so1962082qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jun 2011 07:54:49 -0700 (PDT)
In-Reply-To: <BANLkTi=c1p7yxswvymBWS1PQeqW=+weKbQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, arm-linux <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.ab@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 8 June 2011 19:43, Kyungmin Park <kmpark@infradead.org> wrote:
> On Wed, Jun 8, 2011 at 10:53 PM, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Hello,
>>
>> There is already the patch that fixes this issue available on
>> kgene/s5p_fixes_for_linus branch. Please check commit 08115a139 from
>> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.gi=
t
>>
>> On Wednesday, June 08, 2011 1:26 PM Thomas Abraham wrote:
>>
>>> Commit 8f1d169f999fea892c3fcbf5a79ae8525a477572
>>> ("ARM: EXYNOS4: Add usb host phy control") renamed S3C_VA_USB_HSPHY
>>> to S5P_VA_USB_HSPHY in s5p-map.h file. Fix build for S5PV210 platfo=
rm.
>
> Hi Thomas & Marek,

Hi Mr. Park,

>
> We lived for long time with mismatch prefix.
> So how about to clean up the mismatch prefix, S3C_* and S5P_* at this=
 time?
>
> One method is that it just passes the physical address and driver
> should ioremap at driver instead of static mapping.
>
> How do you think?

USB Phy region static mapping could be moved to driver but how do we
have handle SROMC? There is no particular driver as such for SROMC.
There are others such as COREPERI_BASE and DMC that do not have any
driver.

And most of the platform data and code are reusable across SoC since
we use common macros. For example, arch/arm/plat-samsung/dev-hsmmc.c.
If we use physical address in such cases, we will have to duplicate
it.

As long as we can reuse s3c prefix for s5p plaforms, probably we
should continue using them. Any new additions for S5P platforms should
use the s5p prefix. Or we could arrive at a common consensus and stick
to it. I prefer not to rename s3c prefixes which are reusable for s5p
platforms.

Thanks,
Thomas.

>
> Thank you,
> Kyungmin Park
>
>>>
>>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>>> ---
>>> =A0arch/arm/mach-s5pv210/cpu.c | =A0 =A02 +-
>>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cp=
u.c
>>> index 61e6c24..b343582 100644
>>> --- a/arch/arm/mach-s5pv210/cpu.c
>>> +++ b/arch/arm/mach-s5pv210/cpu.c
>>> @@ -91,7 +91,7 @@ static struct map_desc s5pv210_iodesc[] __initdat=
a =3D {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
>>> =A0 =A0 =A0 }, {
>>> - =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned lon=
g)S3C_VA_USB_HSPHY,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned lon=
g)S5P_VA_USB_HSPHY,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D__phys_t=
o_pfn(S5PV210_PA_HSPHY),
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
>>> --
>>> 1.6.6.rc2
>>
>> S3C_VA_USB_HSPHY is the correct name, it is also used on s3c64xx and
>> s3c-hsotg driver (see drivers/usb/gadget).
>>
>> Best regards
>> --
>> Marek Szyprowski
>> Samsung Poland R&D Center
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
