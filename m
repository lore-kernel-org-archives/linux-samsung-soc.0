From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3] pinctrl: samsung: fix suspend/resume functionality
Date: Mon, 20 May 2013 23:26:52 -0700
Message-ID: <20130521062652.GE19627@quad.lixom.net>
References: <1368746388-20194-1-git-send-email-dianders@chromium.org>
 <1368765198-25550-1-git-send-email-dianders@chromium.org>
 <CACRpkdZ1zBrp+jpgw8o_PVd_bcQMpkFXvRAwfJH6KCztT4jx+w@mail.gmail.com>
 <CAD=FV=XOiVdkEhYu+u-aGkD0DpxWn369uD_r4Pmw=7gHKLjOuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:42391 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754323Ab3EUG05 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 02:26:57 -0400
Received: by mail-pd0-f180.google.com with SMTP id 10so281485pdc.25
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 May 2013 23:26:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAD=FV=XOiVdkEhYu+u-aGkD0DpxWn369uD_r4Pmw=7gHKLjOuQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 20, 2013 at 07:59:27AM -0700, Doug Anderson wrote:
> Linus,
> 
> On Mon, May 20, 2013 at 4:47 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> > Looks good to me.
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > How are you going to merge this?
> >
> > Samsung tree?
> >
> > My pinctrl development tree?
> >
> > Or my fixes tree, if it's a regression for v3.10?
> 
> It is a regression for v3.10 so it would be nice to get it in there
> (Tomasz's patches, too).
> 
> It looks like the majority of recent commits to this file went through
> your tree and that seems fine to me unless anyone else on this thread
> has objections.

Sounds good to me.


-Olof
