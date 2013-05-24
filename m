From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RESEND PATCH 4/5] clk: samsung: Add set_rate() clk_ops for PLL36xx
Date: Sat, 25 May 2013 00:20:05 +0200
Message-ID: <2497806.WgtiTKYQrX@flatron>
References: <1369391478-7665-1-git-send-email-vikas.sajjan@linaro.org> <1369391478-7665-5-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:50026 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756580Ab3EXWUK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 18:20:10 -0400
Received: by mail-bk0-f47.google.com with SMTP id jg1so2767735bkc.34
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 May 2013 15:20:09 -0700 (PDT)
In-Reply-To: <1369391478-7665-5-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: yadi.brar01@gmail.com, linux-samsung-soc@vger.kernel.org, dianders@chromium.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org

Hi,

On Friday 24 of May 2013 16:01:17 Vikas Sajjan wrote:
> This patch adds set_rate and round_rate clk_ops for PLL36xx
> The round_rate() implementation as of now is dummy, it returns the same
> rate which is passed as input.
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  drivers/clk/samsung/clk-pll.c |   67
> +++++++++++++++++++++++++++++++++++++++++ 1 file changed, 67
> insertions(+)
> 

I have exactly the same comments for this patch as for patch 3/5.

Best regards,
Tomasz
