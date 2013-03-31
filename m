From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: GENERIC_GPIO considered deprecated
Date: Sun, 31 Mar 2013 15:18:33 -0700
Message-ID: <CAAVeFu++8YOOSxPbAaTudxSGcBomkGrakBjiVyD+XSee54TrWw@mail.gmail.com>
References: <CAAVeFu+QUw1WmzwaJDfjyw75PrStd3p3PHs1MU5BC7_WXMB7kw@mail.gmail.com>
 <51576214.8010307@openwide.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:49360 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755718Ab3CaWSy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 31 Mar 2013 18:18:54 -0400
In-Reply-To: <51576214.8010307@openwide.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Romain Naour <romain.naour@openwide.fr>, kgene.kim@samsung.com
Cc: linux-next <linux-next@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, tomasz.figa@gmail.com, heiko@sntech.de, linux-samsung-soc@vger.kernel.org

Hi Romain,

On Sat, Mar 30, 2013 at 3:07 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Alex,
>
> When I read your mail, I was surprised that you were speaking about GPIOs, my pathes for samsung CPUs are intended for timer sub-system.
>
> As you can see in this thread, when I send my patches "ARM: S3C24XX: Add samsung-time support for s3c24xx" and "Add samsung-time support for s5pc100". They didn't add "select GENERIC_GPIO".
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13432/focus=14980
> http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13432/focus=14982
>
> There is something wrong with the commit, I see that "select GENERIC_GPIO" was added in my patches by mistake.
>
> I recommend you to speak directly with samsung's kernel maintainer that I CC in this mail.

Indeed, it seems like these "select GENERIC_GPIO" have been added
during the merge of your patches, since I can see the line is here in
your patch (but not added by it). Kim, on the current next there are
two of these "select GENERIC_GPIO" that are added from your branch,
could you amend the patches that adds them such as they get changed
into "select ARCH_REQUIRE_GPIOLIB" instead? You can grep for "select
GENERIC_GPIO" in arch/arm to find the offending lines. We are removing
GENERIC_GPIO and this work cannot be merged until you do this since it
would break ARM builds. Thanks!

Alex.
