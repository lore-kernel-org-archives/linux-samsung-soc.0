From: Doug Anderson <dianders@chromium.org>
Subject: Re: State of pinctrl and exynos5250?
Date: Tue, 5 Mar 2013 17:06:37 -0800
Message-ID: <CAD=FV=VyREAvvFHKoNygOx8x=OTY4dZRzt=11DWQOeESBsXZdA@mail.gmail.com>
References: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com>
	<1534249.MsU3ROUVJz@flatron>
	<CAJuYYwRSHYHs=0qOaWq7_U8+ARz-SYLQM5UAGTd8jTA_4x2wow@mail.gmail.com>
	<CAD=FV=X8-CAQxfjaw0Fq37j4CvMbYKytaCOpd6Qt6sO++YjJQQ@mail.gmail.com>
	<CAJuYYwQN-0JFptS+zNG3oq6-a0Tn8UjYWB7892H3QcNa-7SAuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:48443 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753339Ab3CFBGj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 20:06:39 -0500
Received: by mail-la0-f54.google.com with SMTP id gw10so6871720lab.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 17:06:37 -0800 (PST)
In-Reply-To: <CAJuYYwQN-0JFptS+zNG3oq6-a0Tn8UjYWB7892H3QcNa-7SAuA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>, Linus Walleij <linus.walleij@linaro.org>

Thomas,

On Tue, Mar 5, 2013 at 4:01 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> So now I have: pinctrl_0 is SPI[46], pinctrl_1 is SPI[45], pinctrl_2
> is SPI[50] and pinctrl_3 is SPI[47]. I am yet to test this and
> confirm. If you feel these are wrong, could you please let me know.

Yes, that matches my findings / guesses.  ;)


> Right, I did not pay attention to the bisecting problem. What I have
> now is, a set of individual patches that migrate i2c, sdhci, dwmmc,
> i2s, spi and keypad drivers to pinctrl based pin-configuration. In
> addition to that, two patches that add default pin-state information
> for Exynos4 and Exynos5 platforms. Since there are multiple drivers
> involved, is it okay to keep them as separate patches?

My own personal opinion is that it's worth keeping bisect working and
also a good idea to keep the patches to the individual drivers
separate.  That would mean adding support for either pinctrl or gpio
in the short term (like Linus did for i2c).  Once everything is moved
over then killing gpio support would be OK by me.

I'd feel most strongly about not killing dw_mmc since that is such a
critical driver for booting.  i2s/spi/keypad are a little less
critical and I'd be more OK with them breaking as long as it was clear
in the commit message that breakage is expected.

I'm a bit of a latecomer to this conversation, though, so I'm not sure
my ack / nak holds much weight.  If someone else thinks it's more
important to kill the old GPIO stuff (or more important to avoid
useless churn) then their opinion ought to hold.

-Doug
