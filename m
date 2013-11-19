From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] pinctrl: samsung: Allow pin value to be initialized using pinfunc.
Date: Tue, 19 Nov 2013 10:59:39 -0800
Message-ID: <CAD=FV=XS0dbE7zfgDGVdp84h4fHH6tfO8aN_HNh1LbOjYy51aQ@mail.gmail.com>
References: <1384881351-10782-1-git-send-email-t.figa@samsung.com>
	<528BB1F2.4080107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f44.google.com ([209.85.212.44]:57090 "EHLO
	mail-vb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521Ab3KSS7k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Nov 2013 13:59:40 -0500
Received: by mail-vb0-f44.google.com with SMTP id w20so2399897vbb.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Nov 2013 10:59:39 -0800 (PST)
In-Reply-To: <528BB1F2.4080107@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Tue, Nov 19, 2013 at 10:46 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 11/19/2013 10:15 AM, Tomasz Figa wrote:
>> This patch extends the range of settings configurable via pinfunc API
>> to cover pin value as well. This allows configuration of default values
>> of pins.
>
> Shouldn't there be a driver that acquires the GPIO that's output to the
> pin, and configures the output value? IIRC there have been previous
> discussions re: having a list of e.g. initial GPIO output values in DT,
> and that was rejected, and this patch seems to be doing almost the exact
> same thing, just at the pinctrl level rather than GPIO level.
>
> That all said, I admit this could be a useful feature...

I haven't followed all of the previous discussions, but I know I've
run into scenarios where something like this would be useful.  The one
that comes to mind is:

* We've got GPIOs that default at bootup to a pulled up input since
the default state of the pin should be "high".

* These pins are really intended to be outputs, like an "enable",
"reset", or "power down" line for a peripheral.  The pullup is strong
enough to give us a good default state but we really want outputs.

* We'd like to provide this GPIO to a peripheral through device tree.
...and we'd like all the pinmux to be setup automatically so we use
pinctrl-names = "default".

* If we set the pinmux up as "output" then there's a chance that the
line will glitch at bootup since the pinmux happens (changing the pin
to output) before the driver has a chance to run.


Does that sound like the same scenario you're trying to solve Tomasz?
