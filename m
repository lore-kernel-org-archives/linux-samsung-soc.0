From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/6] pinctrl: samsung: Allow pin value to be initialized
 using pinfunc
Date: Wed, 9 Jul 2014 09:35:11 +0200
Message-ID: <CACRpkdbZXNCHWOK0J2BCKoZN723FwosZQEa2wQHW4KpqX9EvrQ@mail.gmail.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
	<1404315664-3174-7-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:59919 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754886AbaGIHfL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jul 2014 03:35:11 -0400
Received: by mail-ob0-f181.google.com with SMTP id wp4so7436360obc.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jul 2014 00:35:11 -0700 (PDT)
In-Reply-To: <1404315664-3174-7-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>

On Wed, Jul 2, 2014 at 5:41 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch extends the range of settings configurable via pinfunc API
> to cover pin value as well. This allows configuration of default values
> of pins, which is useful for pins that are not supposed to be used by
> any dedicated driver, but need certain board-specific setting.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Patch applied. It always makes me a little bit sad that we didn't get
generic pin config in place before this driver but now we have to live
with it.

Yours,
Linus Walleij
