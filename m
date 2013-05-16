From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Thu, 16 May 2013 02:13:25 +0200
Message-ID: <2396115.JIWghi6qt6@flatron>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <4040680.Aq1C9TECZX@flatron> <CAD=FV=VQ5XS8UWeYyFmUqY=_pLzQ-E=vKR53vwLVXWNonXG4Tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:36224 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753622Ab3EPAN3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 20:13:29 -0400
Received: by mail-ee0-f54.google.com with SMTP id e50so1450328eek.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 17:13:28 -0700 (PDT)
In-Reply-To: <CAD=FV=VQ5XS8UWeYyFmUqY=_pLzQ-E=vKR53vwLVXWNonXG4Tg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

On Wednesday 15 of May 2013 16:55:37 Doug Anderson wrote:
> Tomasz / Linus,
> 
> On Wed, May 15, 2013 at 3:06 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > Yes. I don't like the current way too much either, duplication being
> > one of the reasons.
> 
> Do you have any other ideas?  It sounds like Linus didn't like my
> suggestion and makes some good points...

I don't have anything interesting at the moment. It's a bit late now here 
(2 AM), so I'm going to get some sleep first.

Also after reading Stephen's reply, I'm wondering if hogging wouldn't 
solve the problem indeed. (It might have to be fixed on pinctrl-samsung 
first, as last time I tried to use it, it caused some errors from pinctrl 
core, but haven't time to track them down, as it wasn't anything important 
at that time).

Best regards,
Tomasz
