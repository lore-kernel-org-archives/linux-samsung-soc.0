From: Amit Kachhap <amit.kachhap@linaro.org>
Subject: Re: [PATCH 4/4] ARM: exynos4: remove useless code to save/restore L2
 and GIC state
Date: Fri, 11 Nov 2011 11:58:58 +0530
Message-ID: <CAK44p21H0mGnWRhMx4VSW5FCg4ytY4hzAy4CE3bjFeGan5fxRA@mail.gmail.com>
References: <1320426228-21746-1-git-send-email-amit.kachhap@linaro.org>
	<1320426228-21746-5-git-send-email-amit.kachhap@linaro.org>
	<4EB421FE.407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:60167 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753618Ab1KKG27 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Nov 2011 01:28:59 -0500
Received: by qao25 with SMTP id 25so3471460qao.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2011 22:28:58 -0800 (PST)
In-Reply-To: <4EB421FE.407@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org, kgene.kim@samsung.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

On 4 November 2011 23:03, Sylwester Nawrocki <s.nawrocki@samsung.com> w=
rote:
> On 11/04/2011 06:03 PM, amit.kachhap@linaro.org wrote:
>> From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
>>
>> Following the merge of CPU PM notifiers and L2 resume code, this pat=
ch
>> removes useless code to save and restore L2 and GIC registers.
>>
>> This is now automatically covered by suspend calls which integrated
>> CPU PM notifiers and new sleep code that allows to resume L2 before =
MMU
>> is turned on.
>>
>> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos4/pm.c | =A0 86 -----------------------------=
---------------
>> =A01 files changed, 0 insertions(+), 86 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/pm.c b/arch/arm/mach-exynos4/pm.c
>> index 62e4f43..7499f14 100644
>> --- a/arch/arm/mach-exynos4/pm.c
>> +++ b/arch/arm/mach-exynos4/pm.c
>> @@ -63,77 +63,6 @@ static struct sleep_save exynos4_vpll_save[] =3D =
{
>> =A0};
>>
>> =A0static struct sleep_save exynos4_core_save[] =3D {
>> - =A0 =A0 /* GIC side */
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x000),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x004),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x008),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x00C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x014),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_CPU + 0x018),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x000),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x004),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x100),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x104),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x108),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x300),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x304),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x308),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x400),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x404),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x408),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x40C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x410),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x414),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x418),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x41C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x420),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x424),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x428),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x42C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x430),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x434),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x438),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x43C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x440),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x444),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x448),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x44C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x450),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x454),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x458),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x45C),
>> -
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x800),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x804),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x808),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x80C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x810),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x814),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x818),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x81C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x820),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x824),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x828),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x82C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x830),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x834),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x838),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x83C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x840),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x844),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x848),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x84C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x850),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x854),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x858),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0x85C),
>> -
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC00),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC04),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC08),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC0C),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC10),
>> - =A0 =A0 SAVE_ITEM(S5P_VA_GIC_DIST + 0xC14),
>
>
> This list is not complete anyway, some peripheral devices interrupts =
do not
> work after resume from system suspend to RAM.
> Is there any code already handling GIC state during system suspend/re=
sume cycles?
> Or you refer to some upcoming patches ?

In my next patch series I have left the GIC save/restore from platform =
code.

>
> --
> Thanks,
> Sylwester
>
