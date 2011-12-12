From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 2/3] s5p-g2d: add G2D to mach-nuri
Date: Mon, 12 Dec 2011 23:32:28 +0900
Message-ID: <CAH9JG2XLiFqGyjohtLBT9U6jfwnP4xfuoNMEA=ds_2-gBs2Ong@mail.gmail.com>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
	<1323446682-25252-3-git-send-email-k.debski@samsung.com>
	<20111212052745.GA686@sirena.org.uk>
	<CAH9JG2UBb0Dp3i9Hzwx36AykKS5wZd5fsaP3y-og8VVoGqfhtg@mail.gmail.com>
	<20111212100316.GB31568@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:64079 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752628Ab1LLOc3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Dec 2011 09:32:29 -0500
Received: by dajs34 with SMTP id s34so1750222daj.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2011 06:32:28 -0800 (PST)
In-Reply-To: <20111212100316.GB31568@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kamil Debski <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, kgene.kim@samsung.com

On Mon, Dec 12, 2011 at 7:03 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Dec 12, 2011 at 06:27:30PM +0900, Kyungmin Park wrote:
>> On 12/12/11, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
>
>> >> + =A0&s5p_device_g2d,
>
>> > For devices like g2d which are always part of the SoC and which do=
n't
>> > require any external wiring on the board I was thinking we should =
just
>> > have the core code for the SoC register the device rather than inc=
luding
>> > it in each board individually. =A0It'd save effort and ensure that=
 people
>> > automatically get to use the feature.
>
>> I'm welcome to use these scheme. make a common.c and register it aut=
omatically.
>> but I'm not sure we're ready to use this scheme. and I hope to start
>> these work at smdk board instead of this patch.
>
> I'm not sure I understand why we would not be ready to do things like
> this? =A0I'd also expect that doing things in a board specific fashio=
n
> might create issues with things being set up twice.

Please see the below,
https://lkml.org/lkml/2011/11/15/16

Even though I can't agree with his opinions. There are other voice like=
 this.

I also want to common registration and select at each board.

Thank you,
Kyungmin Park

> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
