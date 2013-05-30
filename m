From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/5] clk: samsung: Add set_rate() clk_ops for PLL36xx
Date: Thu, 30 May 2013 09:50:53 -0700
Message-ID: <CAD=FV=X3FEyzzOhKoLo882iTiAjwDO5tYxfLLEHDmHc5v-1fJA@mail.gmail.com>
References: <1369834677-20312-1-git-send-email-vikas.sajjan@linaro.org>
	<1369834677-20312-5-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35525 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934534Ab3E3Quz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 May 2013 12:50:55 -0400
Received: by mail-lb0-f173.google.com with SMTP id t10so796466lbi.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 May 2013 09:50:53 -0700 (PDT)
In-Reply-To: <1369834677-20312-5-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <thomas.abraham@linaro.org>, Patch Tracking <patches@linaro.org>, linaro-kernel@lists.linaro.org

Vikas / Yadwinder,

On Wed, May 29, 2013 at 6:37 AM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> This patch adds set_rate and round_rate clk_ops for PLL36xx
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  drivers/clk/samsung/clk-pll.c |   59 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)

Looks good to me.  I one nit on space/vs tab after
PLL36XX_LOCK_STAT_SHIFT that would be nice to fix, but not major.

Reviewed-by: Doug Anderson <dianders@chromium.org>
