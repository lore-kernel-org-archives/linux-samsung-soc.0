From: jonghwa3.lee@samsung.com
Subject: Re: [RESEND PATCH] arm: exynos: Allow rtc alarm and tick wakeup irq
 for exynos3250.
Date: Thu, 18 Sep 2014 11:04:16 +0900
Message-ID: <541A3DA0.1040805@samsung.com>
References: <1410923262-4771-1-git-send-email-jonghwa3.lee@samsung.com>
 <CAGm_ybjMaLHPALp519fe=UdMy1DeJbcxUxJN+hcPecttY7A_tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49044 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756570AbaIRCET convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 22:04:19 -0400
In-reply-to: <CAGm_ybjMaLHPALp519fe=UdMy1DeJbcxUxJN+hcPecttY7A_tQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On 2014=EB=85=84 09=EC=9B=94 17=EC=9D=BC 17:53, Vikas Sajjan wrote:

> Hi,
>=20
> On Wed, Sep 17, 2014 at 8:52 AM, Jonghwa Lee <jonghwa3.lee@samsung.co=
m> wrote:
>> Add rtc alarm and tick irq to wakeup sources in exynos3250.
>>
>> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
>> Acked-by : Chanwoo choi <cw00.choi@samsung.com>
>> ---
>>  arch/arm/mach-exynos/pm.c |    9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
>> index fa7218a..d78dcf9 100644
>> --- a/arch/arm/mach-exynos/pm.c
>> +++ b/arch/arm/mach-exynos/pm.c
>> @@ -66,6 +66,12 @@ static struct sleep_save exynos_core_save[] =3D {
>>
>>  static u32 exynos_irqwake_intmask =3D 0xffffffff;
>>
>> +static const struct exynos_wkup_irq exynos3250_wkup_irq[] =3D {
>> +       { 105, BIT(1) }, /* RTC alarm */
>> +       { 106, BIT(2) }, /* RTC tick */
>> +       { /* sentinel */ },
>> +};
>> +
>>  static const struct exynos_wkup_irq exynos4_wkup_irq[] =3D {
>>         { 76, BIT(1) }, /* RTC alarm */
>>         { 77, BIT(2) }, /* RTC tick */
>> @@ -81,9 +87,10 @@ static const struct exynos_wkup_irq exynos5250_wk=
up_irq[] =3D {
>>  static int exynos_irq_set_wake(struct irq_data *data, unsigned int =
state)
>>  {
>>         const struct exynos_wkup_irq *wkup_irq;
>> -
>>         if (soc_is_exynos5250())
>>                 wkup_irq =3D exynos5250_wkup_irq;
>> +       else if (soc_is_exynos3250())
>> +               wkup_irq =3D exynos3250_wkup_irq;
>=20
>=20
> Don't add anymore soc_is_exynosxxx() checks, please rebase on [1],
> which refactors the pm.c to use DT based lookup.
>=20
> [1] http://www.spinics.net/lists/arm-kernel/msg355266.html
>


Okay, I'll wait those patches are merged, then I'll rebase and repost i=
t.

Thanks,
Jonghwa.
