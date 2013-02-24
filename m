From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: return real error codes when pinctrl is not included
Date: Sun, 24 Feb 2013 23:42:32 +0100
Message-ID: <CACRpkdbKFWcT_Oa00nd_Op5ndOEc-cEkZm6fzHRuxs0Rc+ZOeA@mail.gmail.com>
References: <201302231855.47560.heiko@sntech.de>
	<201302231856.35083.heiko@sntech.de>
	<CACRpkdbA-S7qYHnN72c65Wo_Q7qD3tUxUSNYEXkk4gHbpez4+Q@mail.gmail.com>
	<201302242334.42408.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f180.google.com ([209.85.210.180]:46363 "EHLO
	mail-ia0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759357Ab3BXWmd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Feb 2013 17:42:33 -0500
Received: by mail-ia0-f180.google.com with SMTP id f27so1949357iae.39
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Feb 2013 14:42:32 -0800 (PST)
In-Reply-To: <201302242334.42408.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Tomasz Figa <t.figa@samsung.com>, Prathyush K <prathyush@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org

On Sun, Feb 24, 2013 at 11:34 PM, Heiko St=FCbner <heiko@sntech.de> wro=
te:

> [Me]
>> This make me suspect that you have this ugly patch in some
>> private repo and I will be seeing it again and again :-(
>
> All my s3c24xx work is done is my spare time, so I have to confess I =
came up
> with this "ugly patch" all by myself when working on dt support for m=
y machine
> and stumbling upon the described problem with the pin configuration.
>
> So, as it is obviously wrong, I also won't hold onto it.
>
> In any case, thanks for the thorough explanation, which I probably wo=
n't
> forget anytime soon.

Hm, maybe I have come across as too harsh and then I feel bad about
that :-(

I really want spare-time contributors, they are often more valueable
in addition to the corporate ones since they provide an outside view
of things.

Yours,
Linus Walleij
