From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V4 1/4] ARM: dts: exynos5420: add i2s controllers
Date: Wed, 14 Aug 2013 11:21:40 +0530
Message-ID: <CAAgF-BcXDeLiOMA-S-TSNEGG1hMyCyNTJCyEwmb=SO5waOsu5A@mail.gmail.com>
References: <1376302070-1877-1-git-send-email-padma.v@samsung.com>
	<3916118.YsNJ4NTaJS@amdc1227>
	<20130812131235.GX6427@sirena.org.uk>
	<1427610.pB8BGbMKTL@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:55489 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752624Ab3HNFvk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Aug 2013 01:51:40 -0400
In-Reply-To: <1427610.pB8BGbMKTL@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Padmavathi Venna <padma.v@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org

Hi Tomasz,

On Mon, Aug 12, 2013 at 10:32 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Monday 12 of August 2013 14:12:36 Mark Brown wrote:
>> On Mon, Aug 12, 2013 at 01:41:23PM +0200, Tomasz Figa wrote:
>> > On Monday 12 of August 2013 12:34:48 Mark Brown wrote:
>> > > I'd expect that to interact badly with the pinmuxing - unless the
>> > > device is disabled it'll try to grab its pins on probe which is not
>> > > going to be a good idea unless it is actually wired up for use in
>> > > the system.  Or is there some other mechanism for handling that?
>> >
>> > Ah, good point. Now I wonder whether pinctrl nodes shouldn't be
>> > considered board-specific and specified in board-level dts instead?
>>
>> It seems a bit cleaner to use the current mechanism in that it stops the
>> device appearing at all and hence repeated efforts to probe, plus a
>> simple enable is less error prone, the way these SoCs are designed you
>> don't have to pick which pinmux is in use for most of the IPs.  Where
>> there are multiple options it does seem like a good approach though.
>>
>> Tastes may differ though.
>
> Right, if this SoC has only one pinmux setting for this IP, then it's
> fine.

Yes. This IP has only default pin configuration.

>
> Padmavathi, this was the only issue I spotted, so have my:
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Thanks for your review.

>
> Best regards,
> Tomasz
>

Best Regards,
Padma
