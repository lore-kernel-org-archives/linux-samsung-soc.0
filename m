From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] clk: samsung: Fix PLL35XX lock time
Date: Tue, 8 Oct 2013 09:09:11 -0700
Message-ID: <CAD=FV=WcKpO947DgF6xwWALpVMYPOaZ=G_1+iRmFjac2bQGAMw@mail.gmail.com>
References: <1381215399-25394-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f181.google.com ([209.85.220.181]:55912 "EHLO
	mail-vc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754301Ab3JHQJN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Oct 2013 12:09:13 -0400
Received: by mail-vc0-f181.google.com with SMTP id hz10so3735600vcb.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Oct 2013 09:09:11 -0700 (PDT)
In-Reply-To: <1381215399-25394-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Arun Kumar <arunkk.samsung@gmail.com>

Arun,

On Mon, Oct 7, 2013 at 11:56 PM, Arun Kumar K <arun.kk@samsung.com> wrote:
> PLL35XX lock factor is 250 as per the manual whereas its
> wrongly set as 270 now.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  drivers/clk/samsung/clk-pll.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I don't think this is right.  I believe that it needs to be passed in
by the SoC.  On exynos5250 I see 250 in both the manual and in our
code.  On exynos5420 manual I actually see 200 now.  I'm not actually
sure where the 270 came from, now that I search for it.

-Doug
