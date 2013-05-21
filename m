From: Doug Anderson <dianders@chromium.org>
Subject: Re: clk: Exynos5250: Add clocks for G3D
Date: Tue, 21 May 2013 13:10:33 -0700
Message-ID: <CAD=FV=VrQpFjhUx03U3_bZp5HzVd3cMSh0krJb0wjxsgwuWa7g@mail.gmail.com>
References: <1369139801-1889-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:48123 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769Ab3EUUKf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 16:10:35 -0400
Received: by mail-lb0-f171.google.com with SMTP id v20so1267943lbc.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 May 2013 13:10:34 -0700 (PDT)
In-Reply-To: <1369139801-1889-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, arunkk.samsung@gmail.com, prasanna.ps@samsung.com, Tomasz Figa <t.figa@samsung.com>

Arun,

On Tue, May 21, 2013 at 5:36 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
> This patch adds the required clocks for ARM Mali IP
> in Exynos5250.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>
> ---
> .../devicetree/bindings/clock/exynos5250-clock.txt         |    2 ++
>  drivers/clk/samsung/clk-exynos5250.c                       |   12 +++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)

This looks reasonable to me.  Thanks for posting.

Reviewed-by: Doug Anderson <dianders@chromium.org>

-Doug
