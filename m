From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 6/6] pinctrl: exynos: Handle suspend/resume of GPIO
 EINT registers
Date: Wed, 22 May 2013 08:57:39 -0700
Message-ID: <CAD=FV=X3B9feSMmRQd5PYj01U+GEXMFG3tvj7hCY=89Uh9ccEg@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<4536937.hnhaYZLnaG@amdc1227>
	<CAD=FV=VYhBP+V6SQt5SkFZszdVxSJ6AZk-C-zx1Di-RZBYhGvw@mail.gmail.com>
	<3059629.yu4Ei1BXhd@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:49335 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753397Ab3EVP5l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 May 2013 11:57:41 -0400
Received: by mail-la0-f45.google.com with SMTP id ec20so2150262lab.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 May 2013 08:57:39 -0700 (PDT)
In-Reply-To: <3059629.yu4Ei1BXhd@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Tomasz,

On Wed, May 22, 2013 at 7:03 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> Some GPIO EINT control registers needs to be preserved across
> suspend/resume cycle. This patch extends the driver to take care of
> this.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>
> Changes since v2:
>  - Fixed error path
> Changes since v1:
>  - Added optional debugging messages
>  - Added proper error path in initialization
>
>  drivers/pinctrl/pinctrl-exynos.c | 116 ++++++++++++++++++++++++++++++++++++++-
>  drivers/pinctrl/pinctrl-exynos.h |   1 +
>  2 files changed, 114 insertions(+), 3 deletions(-)

Looks good to me.  Thanks!

Good thing I tried the printouts too--they pointed to the fact that
"git am" had somehow applied part 4 ("Add support for SoC-specific
suspend/resume callbacks") incorrectly and with no warning!  It had
put the resume() call at the beginning of the suspend function.
Weird.  I had to fall back to using "patch -p1 to apply".  :-/


On exynos5250-snow (pinmux backported to 3.8):

Tested-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Doug Anderson <dianders@chromium.org>
