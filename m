From: Doug Anderson <dianders@google.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 17:55:32 -0700
Message-ID: <CAD=FV=VmHGj9wz5neR+mkcpt6yvxb4jiFEhyO=E4JZRPZNMFbA@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<4040680.Aq1C9TECZX@flatron>
	<CAD=FV=VQ5XS8UWeYyFmUqY=_pLzQ-E=vKR53vwLVXWNonXG4Tg@mail.gmail.com>
	<2396115.JIWghi6qt6@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:43192 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754447Ab3EPAze (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 20:55:34 -0400
Received: by mail-la0-f47.google.com with SMTP id fq12so2434235lab.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 17:55:33 -0700 (PDT)
In-Reply-To: <2396115.JIWghi6qt6@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Tomasz,

On Wed, May 15, 2013 at 5:13 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> I don't have anything interesting at the moment. It's a bit late now here
> (2 AM), so I'm going to get some sleep first.

Sorry for keeping you up.  Sleep is good!


> Also after reading Stephen's reply, I'm wondering if hogging wouldn't
> solve the problem indeed. (It might have to be fixed on pinctrl-samsung
> first, as last time I tried to use it, it caused some errors from pinctrl
> core, but haven't time to track them down, as it wasn't anything important
> at that time).

I will give it a shot tomorrow morning and see how it looks.  I'll
also evaluate Stephen's suggestions then once I've see how it looks
with the current bindings...

-Doug
