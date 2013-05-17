From: Doug Anderson <dianders@google.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Fri, 17 May 2013 07:56:48 -0700
Message-ID: <CAD=FV=X7AK2+Ur2ZcHMrFm1Ty7wVN7_7Lr=ThhNasFKnt-2SFg@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<2465185.vYkbXUqoOT@flatron>
	<CACRpkdZvN_0fd6N11NeSRtVZd5A1oE9TEhbOOz6Q27x6M39bcQ@mail.gmail.com>
	<4505921.rFrq65cY6P@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:41744 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755322Ab3EQO4u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 10:56:50 -0400
Received: by mail-la0-f44.google.com with SMTP id fr10so4376389lab.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 07:56:48 -0700 (PDT)
In-Reply-To: <4505921.rFrq65cY6P@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Tomasz,

On Fri, May 17, 2013 at 5:38 AM, Tomasz Figa <t.figa@samsung.com> wrote:
>> You might want to have a debugfs file in your driver for inspecting
>> them though, that sounds like it could be helpful. I'd recommend
>> augmenting your .pin_config_dbg_show() callback in the
>> struct pinconf_ops to display this for each pin, in addition to the
>> current configuration.
>
> Seems reasonable.

If you do this I'd love to be CCed.  I have a super-ugly userspace
tool that shows this info and have been contemplating moving it into
debugfs and cleaning it up there.

See <https://gerrit.chromium.org/gerrit/#/c/51380/>

A small snippet of the output looks like:

GPIO x3[4]@0x11400c60: con=0x0 dat=0 pulldwn(1) drv=1(0)
GPIO x3[5]@0x11400c60: con=0xf dat=1  nopull(0) drv=1(0)
GPIO x3[6]@0x11400c60: con=0x0 dat=1 pulldwn(1) drv=1(0)
GPIO x3[7]@0x11400c60: con=0x0 dat=0 pulldwn(1) drv=1(0)
GPIO e0[0]@0x13400000: con=0x0 dat=0 pulldwn(1) drv=1(0) pdn= low(0),
pdn= nopull(0)
GPIO e0[1]@0x13400000: con=0x0 dat=0 pulldwn(1) drv=1(0) pdn=  in(2),
pdn=pulldwn(1)
GPIO e0[2]@0x13400000: con=0x0 dat=0 pulldwn(1) drv=1(0) pdn=  in(2),
pdn=pulldwn(1)

-Doug
