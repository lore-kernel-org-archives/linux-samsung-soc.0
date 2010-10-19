From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Bug fix spin_lock recursion in clk_enable()
 and clk_disable()
Date: Tue, 19 Oct 2010 10:12:21 +0900
Message-ID: <AANLkTimWLcPGTYp+ShXzVu11TtzThj5O57rWxqOfZV=0@mail.gmail.com>
References: <1286843980-23684-1-git-send-email-jc.lee@samsung.com>
	<4CBCD3A5.5070701@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:35765 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755116Ab0JSBN2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Oct 2010 21:13:28 -0400
Received: by bwz12 with SMTP id 12so9239bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Oct 2010 18:13:19 -0700 (PDT)
In-Reply-To: <4CBCD3A5.5070701@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Jaecheol Lee <jc.lee@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Minho Ban <mhban@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tue, Oct 19, 2010 at 8:09 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> On 12/10/10 01:39, Jaecheol Lee wrote:
>> From: Minho Ban <mhban@samsung.com>
>>
>> The clk_enable() and clk_disable() can be used process and ISR eithe=
r.
>> So spin_lock_irqsave should be used instead.
>>
>> Signed-off-by: Minho Ban <mhban@samsung.com>
>> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
>> ---
>> =C2=A0arch/arm/plat-samsung/clock.c | =C2=A0 12 ++++++++----
>> =C2=A01 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/c=
lock.c
>> index e8d20b0..2a991a5 100644
>> --- a/arch/arm/plat-samsung/clock.c
>> +++ b/arch/arm/plat-samsung/clock.c
>> @@ -138,31 +138,35 @@ void clk_put(struct clk *clk)
>>
>> =C2=A0int clk_enable(struct clk *clk)
>> =C2=A0{
>> + =C2=A0 =C2=A0 unsigned long flags;
>> +
>> =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(clk) || clk =3D=3D NULL)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>>
>> =C2=A0 =C2=A0 =C2=A0 clk_enable(clk->parent);
>>
>> - =C2=A0 =C2=A0 spin_lock(&clocks_lock);
>> + =C2=A0 =C2=A0 spin_lock_irqsave(&clocks_lock, flags);
>>
>> =C2=A0 =C2=A0 =C2=A0 if ((clk->usage++) =3D=3D 0)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (clk->enable)(clk, =
1);
>>
>> - =C2=A0 =C2=A0 spin_unlock(&clocks_lock);
>> + =C2=A0 =C2=A0 spin_unlock_irqrestore(&clocks_lock, flags);
>> =C2=A0 =C2=A0 =C2=A0 return 0;
>> =C2=A0}
>>
>> =C2=A0void clk_disable(struct clk *clk)
>> =C2=A0{
>> + =C2=A0 =C2=A0 unsigned long flags;
>> +
>> =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(clk) || clk =3D=3D NULL)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>>
>> - =C2=A0 =C2=A0 spin_lock(&clocks_lock);
>> + =C2=A0 =C2=A0 spin_lock_irqsave(&clocks_lock, flags);
>>
>> =C2=A0 =C2=A0 =C2=A0 if ((--clk->usage) =3D=3D 0)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (clk->enable)(clk, =
0);
>>
>> - =C2=A0 =C2=A0 spin_unlock(&clocks_lock);
>> + =C2=A0 =C2=A0 spin_unlock_irqrestore(&clocks_lock, flags);
>> =C2=A0 =C2=A0 =C2=A0 clk_disable(clk->parent);
>
> I'm not sure, but I don't belive that the clk_ api has
> ever been callable from non-sleepable contexts such as
> interrupt handlers.
>
> I would welcome RMK's response (or any other response)
> about this issue?
>
> Personally, given that some clk_ calls may sleep esp.
> for pll enables, I would prefer to see this patch
> dropped in favour of fixing the users.

I tend to agree.
I would like to know any such case where enabling/disabling of some
clock is so urgent as to require doing from ISR and not from a tasklet
scheduled from ISR.
Also let us not make it impossible in future to switch to common clock =
api
by Jeremy Kerr, that doesn't allow calls from IRQ context.
