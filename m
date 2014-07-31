From: Humberto Naves <hsnaves@gmail.com>
Subject: Re: Role of PLL_ENABLE_BIT
Date: Thu, 31 Jul 2014 12:46:44 +0200
Message-ID: <CAEe5pB9QzqfNFGMSKNxc7ncGDp-sCUMdm7--uY6aT9YWjHZ5Aw@mail.gmail.com>
References: <2111968107.110151406781109677.JavaMail.weblogic@epmlwas02a>
 <CAKew6eUinuZ0gNu5EzH7+N2VQiXD6ujZ9FY9rwY-cqa=WkxZjA@mail.gmail.com> <53DA1576.6020504@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:44285 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751855AbaGaKrF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 06:47:05 -0400
Received: by mail-oa0-f53.google.com with SMTP id j17so1909422oag.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2014 03:47:04 -0700 (PDT)
In-Reply-To: <53DA1576.6020504@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Vikas Sajjan <sajjan.linux@gmail.com>, Yadwinder Singh <yadi.brar@samsung.com>

Hi Andreas,

I guess the original message was not plain text, and majordomo refused
to deliver it :-(
The signedness is not an issue, if I just use what I sent in the
patch, the set_rate function works like a charm. But otherwise, the
whole system freezes and I have to reboot the machine.

Best,
Humberto

On Thu, Jul 31, 2014 at 12:07 PM, Andreas F=C3=A4rber <afaerber@suse.de=
> wrote:
> Hi Humberto,
>
> Somehow the original message didn't arrive on linux-samsung-soc...
>
> Am 31.07.2014 06:51, schrieb Yadwinder Singh Brar:
>>> ------- Original Message -------
>>> Sender : Humberto Naves<hsnaves@gmail.com>
>>> Date : Jul 31, 2014 00:16 (GMT+09:00)
>>> Title : Role of PLL_ENABLE_BIT
>>>
>>> Hi,
>>>
>>>
>>> I am using an ODROID-XU board, and I was trying to change the rates=
 of some PLL clocks for a while, but I could not. After a while, I real=
ized that the cpu was trapped in an infinite loop waiting for the PLL35=
XX_LOCK_STAT bit to be set. Furthermore, I discovered that the reason w=
as that the the PLL35XX_ENABLE_BIT was not set.
>>>
>>>
>>> I wonder if this is really a driver problem, since in the set_rate =
functions, the ENABLE_BIT is not set. Can someone confirm if this is in=
deed the expected behavior of the driver?
>>>
>>
>> hmm .. actually it doesn't clear also ENABLE_BIT, I wonder how its g=
etting clear
>> in your case since we don't have enable/disable() implemented yet.
>>
>>>
>>>
>>> By the way, In order to solve this issue, I changed the files accor=
ding to the following diff
>>>
>>>
>>> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/cl=
k-pll.c
>>> index b07fad2..9300274 100644
>>> --- a/drivers/clk/samsung/clk-pll.c
>>> +++ b/drivers/clk/samsung/clk-pll.c
>>> @@ -131,14 +131,15 @@ static const struct clk_ops samsung_pll3000_c=
lk_ops =3D {
>>>  /* Maximum lock time can be 270 * PDIV cycles */
>>>  #define PLL35XX_LOCK_FACTOR (270)
>>>
>>> -#define PLL35XX_MDIV_MASK       (0x3FF)
>>> -#define PLL35XX_PDIV_MASK       (0x3F)
>>> -#define PLL35XX_SDIV_MASK       (0x7)
>>> +#define PLL35XX_MDIV_MASK (0x3FF)
>>> +#define PLL35XX_PDIV_MASK (0x3F)
>>> +#define PLL35XX_SDIV_MASK (0x7)
>>>  #define PLL35XX_LOCK_STAT_MASK (0x1)
>>> -#define PLL35XX_MDIV_SHIFT      (16)
>>> -#define PLL35XX_PDIV_SHIFT      (8)
>>> -#define PLL35XX_SDIV_SHIFT      (0)
>>> +#define PLL35XX_MDIV_SHIFT (16)
>>> +#define PLL35XX_PDIV_SHIFT (8)
>>> +#define PLL35XX_SDIV_SHIFT (0)
>>>  #define PLL35XX_LOCK_STAT_SHIFT (29)
>>> +#define PLL35XX_ENABLE_SHIFT (31)
>>>
>>>  static unsigned long samsung_pll35xx_recalc_rate(struct clk_hw *hw=
,
>>>   unsigned long parent_rate)
>>> @@ -190,6 +191,7 @@ static int samsung_pll35xx_set_rate(struct clk_=
hw *hw, unsigned long drate,
>>>   /* If only s change, change just s value only*/
>>>   tmp &=3D ~(PLL35XX_SDIV_MASK << PLL35XX_SDIV_SHIFT);
>>>   tmp |=3D rate->sdiv << PLL35XX_SDIV_SHIFT;
>>> + tmp |=3D (1 << PLL35XX_ENABLE_SHIFT);
>>>   __raw_writel(tmp, pll->con_reg);
>>>
>>>   return 0;
>>> @@ -206,6 +208,7 @@ static int samsung_pll35xx_set_rate(struct clk_=
hw *hw, unsigned long drate,
>>>   tmp |=3D (rate->mdiv << PLL35XX_MDIV_SHIFT) |
>>>   (rate->pdiv << PLL35XX_PDIV_SHIFT) |
>>>   (rate->sdiv << PLL35XX_SDIV_SHIFT);
>>> + tmp |=3D (1 << PLL35XX_ENABLE_SHIFT);
>
> It appears tmp is a u32. Does that make 1 << 31 a safe expression wrt
> signedness, or does it need to be 1u << PLL35XX_ENABLE_SHIFT?
> Did you verify the result?
>
> Regards,
> Andreas
>
> --
> SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=
=C3=BCrnberg
