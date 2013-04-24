From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: samsung: Fix link error with
 CONFIG_PINCTRL_EXYNOS disabled
Date: Wed, 24 Apr 2013 16:27:09 +0200
Message-ID: <CACRpkdZmSj-AqUA9kd7NMN6cL2Nxa0EaKoSVkwQSrxhcWEeQtg@mail.gmail.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
	<1398545.9FqHoC0WZW@flatron>
	<CACRpkdbJj9Newk+sCTvJzxA4V2cmJ3hzuQELv7t1wFMhd_Y8+Q@mail.gmail.com>
	<6940961.67Lk2axxPL@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:32955 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755963Ab3DXO1J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Apr 2013 10:27:09 -0400
Received: by mail-ie0-f172.google.com with SMTP id c12so2155425ieb.31
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Apr 2013 07:27:09 -0700 (PDT)
In-Reply-To: <6940961.67Lk2axxPL@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mark Brown <broonie@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Kukjin Kim <kgene.kim@samsung.com>, Kwangwoo LEE <kwangwoo.lee@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>, Darius Augulis <augulis.darius@gmail.com>, Maurus Cuelenaere <mcuelenaere@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Tue, Apr 23, 2013 at 2:09 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> On Tuesday 23 of April 2013 14:03:12 Linus Walleij wrote:

>> This does not apply to my "devel" branch in the pinctrl tree.
>>
>> Could you rebase it on that branch?
>>
>> Or is the error not even in my tree?
>
> This one got sent incorrectly due to my mistake. Please try the correct
> version:
>
> [PATCH RESEND 2/2] pinctrl: samsung: Fix link error with CONFIG_PINCTRL_EXYNOS
> disabled

This does not apply either.

Can you please test against the "devel" branch in the pinctrl tree?

Yours,
Linus Walleij
