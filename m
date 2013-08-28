From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/18] ASoC: Samsung: Do not queue cyclic buffers multiple times
Date: Wed, 28 Aug 2013 09:06:27 +0200
Message-ID: <CACRpkdZd+LJeZdSjsD6OCLOnZ0VrDg0aa-e163NXsw6ajWf7rA@mail.gmail.com>
References: <1376243970-6489-1-git-send-email-tomasz.figa@gmail.com>
	<1376243970-6489-10-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:65319 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752299Ab3H1HG1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 03:06:27 -0400
Received: by mail-ob0-f179.google.com with SMTP id fb19so6266526obc.38
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 00:06:27 -0700 (PDT)
In-Reply-To: <1376243970-6489-10-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org, Dan Williams <djbw@fb.com>, Jaroslav Kysela <perex@perex.cz>, Kukjin Kim <kgene.kim@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Padmavathi Venna <padma.v@samsung.com>, Russell King <linux@arm.linux.org.uk>, Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.de>, Vinod Koul <vinod.koul@intel.com>

On Sun, Aug 11, 2013 at 7:59 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> The legacy S3C-DMA API required every period of a cyclic buffer to be
> queued separately. After conversion of Samsung ASoC to Samsung DMA
> wrappers somebody made an assumption that the same is needed for DMA
> engine API, which is not true.
>
> In effect, Samsung ASoC DMA code was queuing the whole cyclic buffer
> multiple times with a shift of one period per iteration, leading to:
>   a) severe memory waste - up to 13x times more DMA transfer descriptors
>      are allocated than needed,
>   b) possible memory corruption, because further cyclic buffers were out
>      of the original buffers, due to the offset.
>
> This patch fixes this problem by making the legacy S3C-DMA API use the
> same semantics as DMA engine (the whole cyclic buffer is enqueued at
> once) and modifying users of Samsung DMA wrappers in cyclic mode to
> behave appropriately.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

If patch 1 thru 9 are uncontroversial now, maybe Vinod can apply
these for v3.12 so we can get less noise and risk of collissions
in the next merge window?

Just an idea.

Yours,
Linus Walleij
