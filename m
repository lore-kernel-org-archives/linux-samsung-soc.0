From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] pinctrl: samsung: fix suspend/resume functionality
Date: Mon, 20 May 2013 07:59:27 -0700
Message-ID: <CAD=FV=XOiVdkEhYu+u-aGkD0DpxWn369uD_r4Pmw=7gHKLjOuQ@mail.gmail.com>
References: <1368746388-20194-1-git-send-email-dianders@chromium.org>
	<1368765198-25550-1-git-send-email-dianders@chromium.org>
	<CACRpkdZ1zBrp+jpgw8o_PVd_bcQMpkFXvRAwfJH6KCztT4jx+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ1zBrp+jpgw8o_PVd_bcQMpkFXvRAwfJH6KCztT4jx+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Linus,

On Mon, May 20, 2013 at 4:47 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> Looks good to me.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> How are you going to merge this?
>
> Samsung tree?
>
> My pinctrl development tree?
>
> Or my fixes tree, if it's a regression for v3.10?

It is a regression for v3.10 so it would be nice to get it in there
(Tomasz's patches, too).

It looks like the majority of recent commits to this file went through
your tree and that seems fine to me unless anyone else on this thread
has objections.

Thanks!

-Doug
