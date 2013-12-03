From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Allow pin value to be initialized using pinfunc.
Date: Tue, 03 Dec 2013 10:33:43 +0100
Message-ID: <2004634.MefHDYV4b2@flatron>
References: <1384881351-10782-1-git-send-email-t.figa@samsung.com> <2715269.S45Tc0DQGQ@flatron> <CACRpkdYDONQ-7U3hGYnx7jb0_Y=rcOcvy-2F1dO058FfOO4stg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:47037 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752815Ab3LCJdr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Dec 2013 04:33:47 -0500
In-Reply-To: <CACRpkdYDONQ-7U3hGYnx7jb0_Y=rcOcvy-2F1dO058FfOO4stg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kevin Bracey <kevin@bracey.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kmpark@infradead.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Tuesday 03 of December 2013 10:31:12 Linus Walleij wrote:
> On Tue, Nov 26, 2013 at 1:30 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> 
> > IMHO a way to specify a default safe state of all pins (with lowest power
> > consumption, without possibility of glitching external devices, etc.)
> > would be really useful for Samsung platforms (and probably Renesas ones
> > as Kevin wrote).
> 
> I'm following :-)
> 
> Now if we could see some more details and a patch, that would
> be great ...

Yeah, I would like to see them too. ;)

Unfortunately my make_pinctrl_default_state_patches() function is
returning -ENOTIME at the moment. :( (I hope to get it fixed
later this month, though.)

Best regards,
Tomasz
