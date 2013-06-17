From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: exynos: ack level-triggered interrupts before unmasking
Date: Mon, 17 Jun 2013 18:58:47 +0200
Message-ID: <CACRpkdaO=nJGhrWxc6Kyub=XsgZhEQB+Apqzy=hHv4G+y9bS8Q@mail.gmail.com>
References: <1371487843-2066-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:49417 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751486Ab3FQQ6s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:58:48 -0400
Received: by mail-oa0-f52.google.com with SMTP id g12so3776401oah.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 09:58:47 -0700 (PDT)
In-Reply-To: <1371487843-2066-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, Luigi Semenzato <semenzato@chromium.org>, Ilho Lee <ilho215.lee@samsung.com>, Eunki Kim <eunki_kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 17, 2013 at 6:50 PM, Doug Anderson <dianders@chromium.org> wrote:

> A level-triggered interrupt should be acked after the interrupt line
> becomes inactive and before it is unmasked, or else another interrupt
> will be immediately triggered.  Acking before or after calling the
> handler is not enough.
>
> Signed-off-by: Luigi Semenzato <semenzato@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Tomasz Figa <t.figa@samsung.com>
> ---
> Changes in v3:
> - Rebased atop (44b6d93 pinctrl: rockchip: correctly handle arguments
>   of pinconf options)

OK patch applied (cleanly this time).

Yours,
Linus Walleij
