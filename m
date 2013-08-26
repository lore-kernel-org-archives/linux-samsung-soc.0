From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 5/5] clk/exynos5420: assign dout_pixel id to pixel clock divider
Date: Tue, 27 Aug 2013 01:49:29 +0200
Message-ID: <2957212.KZ8HRQb1uk@flatron>
References: <1377508383-15185-1-git-send-email-rahul.sharma@samsung.com> <1377508383-15185-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:55986 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751838Ab3HZXte (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 19:49:34 -0400
Received: by mail-ea0-f174.google.com with SMTP id z15so1911698ead.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2013 16:49:33 -0700 (PDT)
In-Reply-To: <1377508383-15185-6-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com

Hi Rahul,

On Monday 26 of August 2013 14:43:03 Rahul Sharma wrote:
> dout_pixel is a new ID allocated for pixel clock divider. It is
> queried in the driver to pass as the parent to hdmi clock while
> switching between parents.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  Documentation/devicetree/bindings/clock/exynos5420-clock.txt |    5
> +++++ drivers/clk/samsung/clk-exynos5420.c                         |   
> 5 ++++- 2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt index
> 6f16aa8..4c069bd 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> @@ -187,6 +187,11 @@ clock which they consume.
> 
>    mout_hdmi		1024
> 
> +  Divider		ID
> +  ----------------------------
> +
> +  dout_pixel		2048

That's an even bigger hole.

Could you check in the documentation how many muxes are present in the 
clock controller of Exynos5420, add some margin (presumably rounding up to 
some nice value, not necessarily to a power of two) and calculate a more 
reasonable start value for dividers?

Best regards,
Tomasz'
