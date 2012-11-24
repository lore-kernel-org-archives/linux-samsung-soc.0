From: Alexander Varnin <fenixk19@mail.ru>
Subject: Re: [PATCH] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Sat, 24 Nov 2012 13:01:31 +0400
Message-ID: <50B08CEB.70308@mail.ru>
References: <201211240116.44494.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp42.i.mail.ru ([94.100.177.102]:34095 "EHLO smtp42.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932788Ab2KXJBg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Nov 2012 04:01:36 -0500
In-Reply-To: <201211240116.44494.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>

I've done it within another function, because otherwise users of other
chips would pay for a one more runtime check, which they don't need. On
the other hand, this function get called not so frequently, to make it
valueable. The first version of my patch i've used internally worked as
you said, so i can resend it.

I want to ask more experienced users of s3c2443. If this problem occure=
s
on all s3c2443 chips, or only with some series of it? Maybe we need som=
e
more checks, not to break working cases.

24.11.2012 04:16, Heiko St=C3=BCbner =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> What does this do or what should it do? Also it gets calculated but
>>> never used?
>>>
>>> And please use scripts/checkpatch.pl to verify your patch follows
>>> coding guidelines, as this block is especially hard to read.
> So essentially register-reads somehow returned transformed data, but =
the write=20
> is done according to the datasheet.
>
>
> It would definitely be better to integrate it into the existing _irqe=
xt_type=20
> function instead of introducing a second one.
>
> The cpu_id is present in the samsung_cpu_id var and the list of cpus =
including=20
> the s3c2443 can be found in common.c. With this it would be possible =
to=20
> identify when the irq code is run on a s3c2443 machine and the origin=
al=20
> _irqext_type function could change the behaviour accordingly.
>
> Not sure if it would make sense to introduce soc_is_s3c2443() etc mac=
ros for=20
> this.
>
> And of course the actual block doing the transformation on read would=
 need a=20
> more elaborate comment on the why and how, because in 3 years someone=
 might=20
> not directly see what this does and why it was necessary.
>
