From: Romain Naour <romain.naour@openwide.fr>
Subject: Re: GENERIC_GPIO considered deprecated
Date: Sat, 30 Mar 2013 23:07:16 +0100
Message-ID: <51576214.8010307@openwide.fr>
References: <CAAVeFu+QUw1WmzwaJDfjyw75PrStd3p3PHs1MU5BC7_WXMB7kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:43913 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753585Ab3C3WOh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Mar 2013 18:14:37 -0400
In-Reply-To: <CAAVeFu+QUw1WmzwaJDfjyw75PrStd3p3PHs1MU5BC7_WXMB7kw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, tomasz.figa@gmail.com, kgene.kim@samsung.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org

Le 21/03/2013 03:15, Alexandre Courbot a =C3=A9crit :
> Hi Romain,
>
> I have submitted a series of patches that deprecates the use of
> GENERIC_GPIO as a first step towards the consolidation of GPIO around
> gpiolib. The goal of this set of to remove all "select GENERIC_GPIO"
> instances and it should be merged into linux-next starting from today=
=2E
>
> I noticed that your patch "ARM: S3C24XX: Add samsung-time support for
> s3c24xx" adds two new selections of GENERIC_GPIO - would you mind
> changing them to "select ARCH_REQUIRE_GPIOLIB" for consistency with m=
y
> change? The result should be the same on your side.
>
> Thanks,
> Alex.
>

Hi Alex,

When I read your mail, I was surprised that you were speaking about=20
GPIOs, my pathes for samsung CPUs are intended for timer sub-system.

As you can see in this thread, when I send my patches "ARM: S3C24XX: Ad=
d=20
samsung-time support for s3c24xx" and "Add samsung-time support for=20
s5pc100". They didn't add "select GENERIC_GPIO".
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13432/focus=3D14=
980
http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13432/focus=3D14=
982

There is something wrong with the commit, I see that "select=20
GENERIC_GPIO" was added in my patches by mistake.

I recommend you to speak directly with samsung's kernel maintainer that=
=20
I CC in this mail.

Regards,
Romain Naour
