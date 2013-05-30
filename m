From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/5] clk: samsung: Add set_rate() clk_ops for PLL35xx
Date: Thu, 30 May 2013 09:25:29 -0700
Message-ID: <CAD=FV=VnrVAR6Uiy9VXAhbPLQxzeuQXZ3m0WQ6YhJzehaUdBog@mail.gmail.com>
References: <1369834677-20312-1-git-send-email-vikas.sajjan@linaro.org>
	<1369834677-20312-4-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:64958 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933985Ab3E3QZb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 May 2013 12:25:31 -0400
Received: by mail-lb0-f179.google.com with SMTP id r11so768382lbv.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 May 2013 09:25:30 -0700 (PDT)
In-Reply-To: <1369834677-20312-4-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas / Yadwinder,

On Wed, May 29, 2013 at 6:37 AM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> From: Yadwinder Singh Brar <yadi.brar@samsung.com>
>
> This patch add set_rate() and round_rate() for PLL35xx
>
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c |  103 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 102 insertions(+), 1 deletion(-)
[ cut ]
> +#define PLL35XX_LOCK_STAT_MASK  (0x1)

optional: Mask is _slightly_ overkill here. Could just assume that
it's a 1-bit thing and do (1 << PLL35XX_LOCK_STAT_SHIFT).


All comments are optional, so feel free to add my Reviewed-by:

Reviewed-by: Doug Anderson <dianders@chromium.org>
