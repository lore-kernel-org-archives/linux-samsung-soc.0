From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: Role of PLL_ENABLE_BIT
Date: Thu, 31 Jul 2014 12:07:50 +0200
Message-ID: <53DA1576.6020504@suse.de>
References: <2111968107.110151406781109677.JavaMail.weblogic@epmlwas02a> <CAKew6eUinuZ0gNu5EzH7+N2VQiXD6ujZ9FY9rwY-cqa=WkxZjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56155 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755880AbaGaKHy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 06:07:54 -0400
In-Reply-To: <CAKew6eUinuZ0gNu5EzH7+N2VQiXD6ujZ9FY9rwY-cqa=WkxZjA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, hsnaves@gmail.com
Cc: Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Yadwinder Singh <yadi.brar@samsung.com>

Hi Humberto,

Somehow the original message didn't arrive on linux-samsung-soc...

Am 31.07.2014 06:51, schrieb Yadwinder Singh Brar:
>> ------- Original Message -------
>> Sender : Humberto Naves<hsnaves@gmail.com>
>> Date : Jul 31, 2014 00:16 (GMT+09:00)
>> Title : Role of PLL_ENABLE_BIT
>>
>> Hi,
>>
>>
>> I am using an ODROID-XU board, and I was trying to change the rates =
of some PLL clocks for a while, but I could not. After a while, I reali=
zed that the cpu was trapped in an infinite loop waiting for the PLL35X=
X_LOCK_STAT bit to be set. Furthermore, I discovered that the reason wa=
s that the the PLL35XX_ENABLE_BIT was not set.
>>
>>
>> I wonder if this is really a driver problem, since in the set_rate f=
unctions, the ENABLE_BIT is not set. Can someone confirm if this is ind=
eed the expected behavior of the driver?
>>
>=20
> hmm .. actually it doesn't clear also ENABLE_BIT, I wonder how its ge=
tting clear
> in your case since we don't have enable/disable() implemented yet.
>=20
>>
>>
>> By the way, In order to solve this issue, I changed the files accord=
ing to the following diff
>>
>>
>> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk=
-pll.c
>> index b07fad2..9300274 100644
>> --- a/drivers/clk/samsung/clk-pll.c
>> +++ b/drivers/clk/samsung/clk-pll.c
>> @@ -131,14 +131,15 @@ static const struct clk_ops samsung_pll3000_cl=
k_ops =3D {
>>  /* Maximum lock time can be 270 * PDIV cycles */
>>  #define PLL35XX_LOCK_FACTOR (270)
>>
>> -#define PLL35XX_MDIV_MASK       (0x3FF)
>> -#define PLL35XX_PDIV_MASK       (0x3F)
>> -#define PLL35XX_SDIV_MASK       (0x7)
>> +#define PLL35XX_MDIV_MASK (0x3FF)
>> +#define PLL35XX_PDIV_MASK (0x3F)
>> +#define PLL35XX_SDIV_MASK (0x7)
>>  #define PLL35XX_LOCK_STAT_MASK (0x1)
>> -#define PLL35XX_MDIV_SHIFT      (16)
>> -#define PLL35XX_PDIV_SHIFT      (8)
>> -#define PLL35XX_SDIV_SHIFT      (0)
>> +#define PLL35XX_MDIV_SHIFT (16)
>> +#define PLL35XX_PDIV_SHIFT (8)
>> +#define PLL35XX_SDIV_SHIFT (0)
>>  #define PLL35XX_LOCK_STAT_SHIFT (29)
>> +#define PLL35XX_ENABLE_SHIFT (31)
>>
>>  static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw,
>>   unsigned long parent_rate)
>> @@ -190,6 +191,7 @@ static int samsung_pll35xx_set_rate(struct clk_h=
w *hw, unsigned long drate,
>>   /* If only s change, change just s value only*/
>>   tmp &=3D ~(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT);
>>   tmp |=3D rate->sdiv << PLL35XX_SDIV_SHIFT;
>> + tmp |=3D (1 << PLL35XX_ENABLE_SHIFT);
>>   __raw_writel(tmp, pll->con_reg);
>>
>>   return 0;
>> @@ -206,6 +208,7 @@ static int samsung_pll35xx_set_rate(struct clk_h=
w *hw, unsigned long drate,
>>   tmp |=3D (rate->mdiv << PLL35XX_MDIV_SHIFT) |
>>   (rate->pdiv << PLL35XX_PDIV_SHIFT) |
>>   (rate->sdiv << PLL35XX_SDIV_SHIFT);
>> + tmp |=3D (1 << PLL35XX_ENABLE_SHIFT);

It appears tmp is a u32. Does that make 1 << 31 a safe expression wrt
signedness, or does it need to be 1u << PLL35XX_ENABLE_SHIFT?
Did you verify the result?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
