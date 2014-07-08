From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] pinctrl: samsung: Handle GPIO request and free using
 pinctrl helpers
Date: Tue, 8 Jul 2014 10:57:47 +0200
Message-ID: <CACRpkdbytxN_+zwCDzo6zf8M-6aQm2fHSPjwA9oH6u8cN2hnaw@mail.gmail.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
	<1404315664-3174-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:58667 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750927AbaGHI5s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 04:57:48 -0400
Received: by mail-oa0-f53.google.com with SMTP id l6so6029685oag.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jul 2014 01:57:48 -0700 (PDT)
In-Reply-To: <1404315664-3174-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>

On Wed, Jul 2, 2014 at 5:41 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch adds .request() and .free() operations to gpio_chip of
> pinctrl-samsung driver, which call pinctrl request and free helpers to
> request and free pinctrl pin along with GPIO pin.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>

Patch applied.

Yours,
Linus Walleij
