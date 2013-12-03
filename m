From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Allow pin value to be initialized using pinfunc.
Date: Tue, 3 Dec 2013 10:29:42 +0100
Message-ID: <CACRpkdYrPd9tnO48bA_5n+-k=KEDyhY7czkCNhTZfpgF3ar+LQ@mail.gmail.com>
References: <1384881351-10782-1-git-send-email-t.figa@samsung.com>
	<528BB1F2.4080107@wwwdotorg.org>
	<CAD=FV=XS0dbE7zfgDGVdp84h4fHH6tfO8aN_HNh1LbOjYy51aQ@mail.gmail.com>
	<528BB913.6080409@wwwdotorg.org>
	<CAH9JG2UjnL5bZzNUuJhWY3GpwPD=rJvR2O4Hcpm33G+prSS=BA@mail.gmail.com>
	<CACRpkdbyjm0X9RX+8WjqQxBPyRjBOAunkqVcO-0KUd1PTdGavA@mail.gmail.com>
	<5293ACA6.7060403@bracey.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:56888 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751688Ab3LCJ3o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Dec 2013 04:29:44 -0500
Received: by mail-ob0-f182.google.com with SMTP id wp4so14307153obc.27
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2013 01:29:42 -0800 (PST)
In-Reply-To: <5293ACA6.7060403@bracey.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Bracey <kevin@bracey.fi>
Cc: Kyungmin Park <kmpark@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Nov 25, 2013 at 9:01 PM, Kevin Bracey <kevin@bracey.fi> wrote:

> I've been working on extending the shmobile PFC driver to provide
> "gpio-mode" and implement PIN_CONFIG_OUTPUT as described by
> Documentation/pinctrl.txt, primarily to handle sleep states, but I have
> begun to wonder about the initial state problem, as discussed here.
>
> As far as I can see, we can't currently specify "fallback" states for pins,
> which is one of Tomasz' key requirements.

That depends on what you mean with "fallback states" so let's hash
this out.

> We can specify "hog" states, and we can specify "default for a driver", but
> not "default before/in absence of a driver" or "sleep in absence of a
> driver". Having a hog precludes any finer driver control, AFAICT.

So the way it currently works is that hogs are usually used when
there is no corresponding driver that can take care of the pins.

If there are four SPI pins and no driver for that SPI block, a way
to e.g. ground them is to do so using pinctrl hogs.

Whenever a driver and a struct device * for this SPI block appears,
it is wise to transfer control of these over to the device core, which
will take any "default" state before doing probe() on the device
driver, and then give you the option to use the nice pinctrl_pm*
accessors to let the device core switch between "default" "idle"
and "sleep" states if these are defined.

> Some of our existing pre-pinconf board files have a "unused pins" table
> which is used to claim and pull GPIOs. I've converted that to "hog" pinconf,
> but that only works because the table omits all pins used by drivers. And,
> unsurprisingly, that's been error-prone; if those tables originally covered
> all unused pins, they don't any more.
>
> I'd like confidence that we can get every pin into the correct state by
> having a fully-populated table containing all pins, that can be used
> regardless of which drivers start. I think what we're lacking is a "weak
> hog". Whatever you call that. :)
>
> That would also specify the state to fallback to when a group is released
> (where we currently do pinmux_disable_setting).

So I guess what you're after is a kind of hog that will be pushed
aside and ignored if a struct device with an associated state appears
that will use the same pin?

It is true that we currently require the tables to be strict and not
overlap like this, so ideally you should remove the hogs when you
have a device driver, but you're actually describing an interesting
case here:

What if I have a driver for this IP block, and it was supposed to
take care of a few pins, but I decide not to compile it into my
kernel? Or if I have it as a module and only modprobe it later
at runtime?

So a suggested patch to support weak hogs would be interesting
to look at. Can you provide details on how you think this would
work?

Yours,
Linus Walleij
