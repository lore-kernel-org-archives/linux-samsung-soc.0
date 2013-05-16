From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 18:22:00 -0600
Message-ID: <519426A8.8090908@wwwdotorg.org>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <4040680.Aq1C9TECZX@flatron> <CAD=FV=VQ5XS8UWeYyFmUqY=_pLzQ-E=vKR53vwLVXWNonXG4Tg@mail.gmail.com> <2396115.JIWghi6qt6@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:59598 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753391Ab3EPAWE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 20:22:04 -0400
In-Reply-To: <2396115.JIWghi6qt6@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Doug Anderson <dianders@google.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

On 05/15/2013 06:13 PM, Tomasz Figa wrote:
> On Wednesday 15 of May 2013 16:55:37 Doug Anderson wrote:
>> Tomasz / Linus,
>>
>> On Wed, May 15, 2013 at 3:06 PM, Tomasz Figa <tomasz.figa@gmail.com> 
> wrote:
>>> Yes. I don't like the current way too much either, duplication being
>>> one of the reasons.
>>
>> Do you have any other ideas?  It sounds like Linus didn't like my
>> suggestion and makes some good points...
> 
> I don't have anything interesting at the moment. It's a bit late now here 
> (2 AM), so I'm going to get some sleep first.
> 
> Also after reading Stephen's reply, I'm wondering if hogging wouldn't 
> solve the problem indeed. (It might have to be fixed on pinctrl-samsung 
> first, as last time I tried to use it, it caused some errors from pinctrl 
> core, but haven't time to track them down, as it wasn't anything important 
> at that time).

One issue I noticed with the DT fragments earlier in this thread. It
looks like hogs in the Samsung pinctrl bingings end up looking like:

pinctrl {
    pina {
        samsung,pins = <PIN_A PIN_B PIN_C>;
        samsung,pin-function = <0xf>;
        samsung,pin-pud = <0>;
        ...
    };
    pinp {
        samsung,pins = <PIN_P PIN_Q>;
        samsung,pin-function = <0xe>;
        samsung,pin-pud = <1>;
        ...
    };
    pinx {
        samsung,pins = <PIN_X PIN_Y PIN_Z>;
        samsung,pin-function = <0xd>;
        samsung,pin-pud = <2>;
        ...
    };

    pinctrl-names = "default";
    pinctrl-0 = <&pina &pinp &pinx>;
};

That pinctrl-0 property could get rather large (hard to write/maintain,
unwieldy) if it needs to set up lots of different configurations. That's
why I made the equivalent Tegra bindings be:

pinctrl {
    pins_default {
        pina {
            samsung,pins = <PIN_A PIN_B PIN_C>;
            samsung,pin-function = <0xf>;
            samsung,pin-pud = <0>;
            ...
        };
        pinp {
            samsung,pins = <PIN_P PIN_Q>;
            samsung,pin-function = <0xe>;
            samsung,pin-pud = <1>;
            ...
        };
        pinx {
            samsung,pins = <PIN_X PIN_Y PIN_Z>;
            samsung,pin-function = <0xd>;
            samsung,pin-pud = <2>;
            ...
        };
    };

    pinctrl-names = "default";
    pinctrl-0 = <&pins_default>;
};

The extra level within the "pinctrl configuration node" ("pins_default"
here) makes the pinctrl-0 property a lot easier to write, and the
advantage happens at every use-site that needs to configure different
subsets of the relevant pins in different ways.

If you're changing all the bindings anyway, introducing this extra level
might be something to think about.

I did try to explain my philosophy here when we all got together to
design the pinctrl bindings, but I obviously didn't explain it well
enough, or people didn't like it anyway.
