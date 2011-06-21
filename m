From: Praveen Paneri <paneri@gmail.com>
Subject: Re: [RFC][PATCH 3/5] ARM: SAMSUNG: Adding IO mapping for OTG PHY.
Date: Tue, 21 Jun 2011 17:45:57 +0530
Message-ID: <BANLkTimFqos8FwBiR6-HT8muu4Jtog=5kQ@mail.gmail.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
	<1308639827-2121-4-git-send-email-p.paneri@samsung.com>
	<BANLkTintiDOi1mtc0M_qKbxYm+YmDU_Ttw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:38435 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751056Ab1FUMP6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 08:15:58 -0400
In-Reply-To: <BANLkTintiDOi1mtc0M_qKbxYm+YmDU_Ttw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Banajit Goswami <banajit.goswami@gmail.com>
Cc: linux-usb@vger.kernel.org, kgene.kim@samsung.com, tmarri@apm.com, balbi@ti.com, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, a.kesavan@samsung.com, linux-arm-kernel@lists.infradead.org

Hi,

On Tue, Jun 21, 2011 at 4:48 PM, Banajit Goswami
<banajit.goswami@gmail.com> wrote:
> Hi Praveen,
>
> On Tue, Jun 21, 2011 at 12:33 PM, <p.paneri@samsung.com> wrote:
>>
>> From: Praveen Paneri <p.paneri@samsung.com>
>>
>> Adding virtual addresses for OTG PHY.
>>
>> Signed-off-by: Praveen Paneri <p.paneri@samsung.com>
>> ---
>> =A0arch/arm/mach-s5p64x0/cpu.c | =A0 =A05 +++++
>> =A01 files changed, 5 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu=
=2Ec
>> index a5c0095..8dc6f20 100644
>> --- a/arch/arm/mach-s5p64x0/cpu.c
>> +++ b/arch/arm/mach-s5p64x0/cpu.c
>> @@ -57,6 +57,11 @@ static struct map_desc s5p64x0_iodesc[] __initdat=
a =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phy=
s_to_pfn(S5P64X0_PA_VIC1),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_16K,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVI=
CE,
>> + =A0 =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S3C_VA_USB_HSPHY,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(S5P64X0_PA_USB_HSPHY),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_1M,
>
> Do we really need 1M for this??
Accepted, will give lesser length in subsequent versions.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
>> =A0 =A0 =A0 =A0},
>> =A0};
>>
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Praveen Paneri
