From: Doug Anderson <dianders@chromium.org>
Subject: Re: State of pinctrl and exynos5250?
Date: Thu, 7 Mar 2013 20:55:42 -0800
Message-ID: <CAD=FV=WdhwN9RQRPKFc3G8euCeDfqdhz69KZJzqD5mJSgV9O-Q@mail.gmail.com>
References: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com>
	<1534249.MsU3ROUVJz@flatron>
	<CAD=FV=XMpL7z-UX4UgqaUv-=QcJAPOD3bKbLVTRsR15RTG1A2Q@mail.gmail.com>
	<CAJuYYwR41V4m_tZU5Usksb7L8ynOAQpK2i3QP33JDmW9YDkvPw@mail.gmail.com>
	<CACRpkdaCzmW5C1tEm5D=WRyoZc5+gGf2gVtTt1QSkF8SNKrjRg@mail.gmail.com>
	<CAD=FV=XGm+aeb2VFsbUit13VaoQFVd6vz3-_4zjQUCc0PPOLCg@mail.gmail.com>
	<CACRpkdZ0u2xNEYr=DM4tsfnT16p1Q-ykeEVDkziiLXJgJ=TiEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:43072 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752172Ab3CHEzo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 23:55:44 -0500
Received: by mail-lb0-f172.google.com with SMTP id n8so1051042lbj.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Mar 2013 20:55:43 -0800 (PST)
In-Reply-To: <CACRpkdZ0u2xNEYr=DM4tsfnT16p1Q-ykeEVDkziiLXJgJ=TiEg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, Will Newton <will.newton@gmail.com>

Linus,

On Thu, Mar 7, 2013 at 6:04 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Mar 7, 2013 at 5:13 PM, Doug Anderson <dianders@chromium.org> wrote:
>
>> ...I think the most important issue at hand is the device tree
>> bindings for pinmux on this device.  It sounds like you are in
>> agreement that the best thing is to have a pinmux specified per-slot.
>
> I don't know, Stephen's point to have one single pinctrl set-up for the
> entire device seems perfectly valid, why do you need to specify it
> per-slot at all?

OK by me.  It seemed more "pure" to specify it per-slot (in case we
ever did have a struct device per slot, it would make live easier).
...but it doesn't seem incorrect to have it once for the entire
device.

:)

-Doug

P.S. sorry for double mail for some people...
