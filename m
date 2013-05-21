From: Doug Anderson <dianders@chromium.org>
Subject: Re: clk: Exynos5250: Add clocks for G3D
Date: Tue, 21 May 2013 15:43:43 -0700
Message-ID: <CAD=FV=XCzcY4-dN=2OYkrkTU9HYxykSUPnm++RVQ6a6g4t-XUA@mail.gmail.com>
References: <1369139801-1889-1-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:61235 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407Ab3EUWnq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 May 2013 18:43:46 -0400
Received: by mail-la0-f52.google.com with SMTP id fo13so1303985lab.39
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 May 2013 15:43:43 -0700 (PDT)
In-Reply-To: <1369139801-1889-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, arunkk.samsung@gmail.com

Arun,

On Tue, May 21, 2013 at 5:36 AM, Arun Kumar K <arun.kk@samsung.com> wrote:
> @@ -262,6 +270,7 @@ struct samsung_div_clock exynos5250_div_clks[] __initdata = {
>         DIV(none, "aclk166", "mout_aclk166", DIV_TOP0, 8, 3),
>         DIV(none, "aclk333", "mout_aclk333", DIV_TOP0, 20, 3),
>         DIV(none, "aclk200", "mout_aclk200", DIV_TOP0, 12, 3),
> +       DIV(aclk_400_g3d, "aclk_400_g3d", "mout_aclk400", DIV_TOP0, 24, 3),

Doh!  I looked at this more and it looks like I missed something.
You've added this clock to the range assigned for "[Peripheral Clock
Gates]".  This is not a gate clock but is a div clock.

Perhaps it should be in a different range?  Could make IDs that start
at 512 or something?

-Doug
