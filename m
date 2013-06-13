From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: exynos: ack level-triggered interrupts
 before unmasking
Date: Thu, 13 Jun 2013 20:20:06 +0200
Message-ID: <CACRpkdZT_jvUzMmOrmwLOR5Gc2TWEp85kWa+yyMAp1bG3xrWXw@mail.gmail.com>
References: <1371058399-31933-1-git-send-email-dianders@chromium.org>
	<1371141522-29255-3-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:57184 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758780Ab3FMSUH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 14:20:07 -0400
Received: by mail-oa0-f53.google.com with SMTP id k14so2399062oag.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jun 2013 11:20:06 -0700 (PDT)
In-Reply-To: <1371141522-29255-3-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, Luigi Semenzato <semenzato@chromium.org>, ilho215.lee@samsung.com, Eunki Kim <eunki_kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 13, 2013 at 6:38 PM, Doug Anderson <dianders@chromium.org> wrote:

> A level-triggered interrupt should be acked after the interrupt line
> becomes inactive and before it is unmasked, or else another interrupt
> will be immediately triggered.  Acking before or after calling the
> handler is not enough.
>
> Signed-off-by: Luigi Semenzato <semenzato@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes in v2:
> - Greatly simplified using Tomasz's suggestion of irqd_get_trigger_type
> - Moved acking out of the bank spinlock since since it's not needed.
> - Linus W. has already applied parts 1 and 2, so not resending.

Thanks, this v2 version applied with Tomasz ACK.

Yours,
Linus Walleij
