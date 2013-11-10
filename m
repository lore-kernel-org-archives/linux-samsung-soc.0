From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] clk: exynos5250: register APLL rate table
Date: Sun, 10 Nov 2013 18:14:37 +0100
Message-ID: <1713728.JoffI8rva3@flatron>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org> <1383905648-23733-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:54730 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159Ab3KJROi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 12:14:38 -0500
Received: by mail-ee0-f53.google.com with SMTP id e51so1974200eek.40
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Nov 2013 09:14:37 -0800 (PST)
In-Reply-To: <1383905648-23733-3-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org

Hi Sachin, Andrew,

On Friday 08 of November 2013 15:44:08 Sachin Kamat wrote:
> From: Andrew Bresticker <abrestic@chromium.org>
> 
> Register the APLL rate table so that we can set the APLL rate from
> the cpufreq driver.
> 
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |   25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)

You know that you still need to fix the cpufreq driver to use these,
don't you? Anyway:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
