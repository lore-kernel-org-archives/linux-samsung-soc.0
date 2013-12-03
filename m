From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Allow pin value to be initialized using pinfunc.
Date: Tue, 3 Dec 2013 10:31:12 +0100
Message-ID: <CACRpkdYDONQ-7U3hGYnx7jb0_Y=rcOcvy-2F1dO058FfOO4stg@mail.gmail.com>
References: <1384881351-10782-1-git-send-email-t.figa@samsung.com>
	<CACRpkdbyjm0X9RX+8WjqQxBPyRjBOAunkqVcO-0KUd1PTdGavA@mail.gmail.com>
	<5293ACA6.7060403@bracey.fi>
	<2715269.S45Tc0DQGQ@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:49146 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668Ab3LCJbM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Dec 2013 04:31:12 -0500
Received: by mail-ob0-f182.google.com with SMTP id wp4so14205406obc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2013 01:31:12 -0800 (PST)
In-Reply-To: <2715269.S45Tc0DQGQ@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kevin Bracey <kevin@bracey.fi>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kmpark@infradead.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Tue, Nov 26, 2013 at 1:30 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> IMHO a way to specify a default safe state of all pins (with lowest power
> consumption, without possibility of glitching external devices, etc.)
> would be really useful for Samsung platforms (and probably Renesas ones
> as Kevin wrote).

I'm following :-)

Now if we could see some more details and a patch, that would
be great ...

Yours,
Linus Walleij
