From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 5/6] pinctrl: samsung: Allow per-bank SoC-specific private data
Date: Fri, 17 May 2013 12:24:41 -0700
Message-ID: <CAD=FV=VPoBEQ6fGscPYBnVyThKbMdOgXznrMoA97HHaTp0coGA@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-6-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:56141 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725Ab3EQTYn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 15:24:43 -0400
Received: by mail-la0-f50.google.com with SMTP id ed20so4641011lab.37
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 12:24:41 -0700 (PDT)
In-Reply-To: <1368807872-2601-6-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Tomasz,

On Fri, May 17, 2013 at 9:24 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch extends pin bank descriptor structure with SoC-specific
> private data field that allows SoC-specific drivers to store their own
> private data.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/pinctrl/pinctrl-samsung.h | 1 +
>  1 file changed, 1 insertion(+)

Sure.  Seems like it could be squashed into the next patch, but I
think it looks fine separate too.

On exynos5250-snow (pinmux backported to 3.8):

Tested-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Doug Anderson <dianders@chromium.org>
