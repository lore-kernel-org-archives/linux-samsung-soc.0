From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH 5/10] ARM: S5PV210: Add SCLK_SPDIF clock
Date: Fri, 8 Oct 2010 19:51:17 +0900
Message-ID: <AANLkTi=qpfv3z-dE7N9XO6GyTta43Fgy3gYN9DX5R1nP@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286193154-17201-1-git-send-email-sw.youn@samsung.com>
	<001b01cb66d1$d2a27010$77e75030$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:38511 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753031Ab0JHKvT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:51:19 -0400
Received: by wyb28 with SMTP id 28so958634wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2010 03:51:18 -0700 (PDT)
In-Reply-To: <001b01cb66d1$d2a27010$77e75030$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

On Fri, Oct 8, 2010 at 7:16 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Seungwhan Youn wrote:
>>
>> This patch add SCLK_SPDIF clock to support source clock of S/PDIF
>> on S5PV210.
>>
>> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
>> ---
>> =C2=A0arch/arm/mach-s5pv210/clock.c | =C2=A0 62
>> +++++++++++++++++++++++++++++++++++------
>> =C2=A01 files changed, 53 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/c=
lock.c
>> index d562670..195a088 100644
>> --- a/arch/arm/mach-s5pv210/clock.c
>> +++ b/arch/arm/mach-s5pv210/clock.c
>> @@ -431,6 +431,12 @@ static struct clk init_clocks_disable[] =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D &clk_p,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .enable =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D s5pv210_clk_ip3_ctrl,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ctrlbit =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (1 << 6),
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D "spdif",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D -1,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &clk_p,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .enable =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D s5pv210_clk_ip3_ctrl,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ctrlbit =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D (1 << 0),
>> =C2=A0 =C2=A0 =C2=A0 },
>> =C2=A0};
>>
>> @@ -660,6 +666,53 @@ static struct clksrc_sources clkset_sclk_spdif =
=3D {
>> =C2=A0 =C2=A0 =C2=A0 .nr_sources =C2=A0 =C2=A0 =3D ARRAY_SIZE(clkset=
_sclk_spdif_list),
>> =C2=A0};
>>
>> +static int s5pv210_spdif_set_rate(struct clk *clk, unsigned long ra=
te)
>> +{
>> + =C2=A0 =C2=A0 struct clk *pclk;
>> + =C2=A0 =C2=A0 int ret;
>> +
>> + =C2=A0 =C2=A0 pclk =3D clk_get_parent(clk);
>> + =C2=A0 =C2=A0 if (IS_ERR(pclk))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> +
>> + =C2=A0 =C2=A0 ret =3D pclk->ops->set_rate(pclk, rate);
>> + =C2=A0 =C2=A0 clk_put(pclk);
>> +
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>
> Similar with previous reply...please refer to it...
>

Please refer my previous reply on "[PATCH 3/10] ARM: S5PC100: Add
SCLK_SPDIF clock".

(snip)

Thanks,
Claude
