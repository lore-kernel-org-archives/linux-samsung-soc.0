From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: samsung: Fix link error with
 CONFIG_PINCTRL_EXYNOS disabled
Date: Thu, 25 Apr 2013 15:26:05 +0200
Message-ID: <CACRpkdY61h-H14QYHhADnAz1JRa=8Wbi0aYKSRW21xm4WHOHGA@mail.gmail.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
	<6940961.67Lk2axxPL@amdc1227>
	<CACRpkdZmSj-AqUA9kd7NMN6cL2Nxa0EaKoSVkwQSrxhcWEeQtg@mail.gmail.com>
	<2113989.KXXvDDhnMa@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:51250 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756342Ab3DYN0G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Apr 2013 09:26:06 -0400
Received: by mail-oa0-f47.google.com with SMTP id n9so2840096oag.34
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2013 06:26:06 -0700 (PDT)
In-Reply-To: <2113989.KXXvDDhnMa@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mark Brown <broonie@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, Kwangwoo LEE <kwangwoo.lee@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>, Darius Augulis <augulis.darius@gmail.com>, Maurus Cuelenaere <mcuelenaere@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Abraham <thomas.abraham@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Wed, Apr 24, 2013 at 4:47 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> On Wednesday 24 of April 2013 16:27:09 Linus Walleij wrote:
>> On Tue, Apr 23, 2013 at 2:09 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> > On Tuesday 23 of April 2013 14:03:12 Linus Walleij wrote:
>> >> This does not apply to my "devel" branch in the pinctrl tree.
>> >>
>> >> Could you rebase it on that branch?
>> >>
>> >> Or is the error not even in my tree?
>> >
>> > This one got sent incorrectly due to my mistake. Please try the correct
>> > version:
>> >
>> > [PATCH RESEND 2/2] pinctrl: samsung: Fix link error with
>> > CONFIG_PINCTRL_EXYNOS disabled
>>
>> This does not apply either.
>>
>> Can you please test against the "devel" branch in the pinctrl tree?
>
> Right, it does not apply.
>
> Well, actually it does with git am -3, but it is incorrect, since the problem
> it intends to fix is not present in your tree, but rather is a merge error in
> linux-next in a merge of Kgene's and your tree...

Oh. Then you have to send the patch to Stephen Rothwell.

Yours,
Linus Walleij
