From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 6/6] pinctrl: exynos: Handle suspend/resume of GPIO EINT
 registers
Date: Wed, 22 May 2013 15:32:36 +0200
Message-ID: <4391865.a7p9jbyZ7B@amdc1227>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
 <4536937.hnhaYZLnaG@amdc1227>
 <CAD=FV=VYhBP+V6SQt5SkFZszdVxSJ6AZk-C-zx1Di-RZBYhGvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29922 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753042Ab3EVNco (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 May 2013 09:32:44 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MN700CCGC937K10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 May 2013 14:32:41 +0100 (BST)
In-reply-to: <CAD=FV=VYhBP+V6SQt5SkFZszdVxSJ6AZk-C-zx1Di-RZBYhGvw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Tuesday 21 of May 2013 21:46:35 Doug Anderson wrote:
> Tomasz,
> 
> On Tue, May 21, 2013 at 10:05 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> >         return 0;
> > 
> > +
> > +err_domains:
> > +       bank = d->ctrl->pin_banks;
> > +       for (undo = 0; undo < i; ++undo) {
> 
> ++bank is missing, I think.  This will free the same bank many times.

Shit, this is what happens when you post patches so late and in a hurry. Will 
send something sane in a while.

> optional: could also avoid extra 'undo' variable and remove in reverse
> order by changing i to signed and counting down to 0.

Sure.

Best regards,
Tomasz

> -Doug
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
