From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/6] clk: exynos5250: add clock ID for div_pcm0
Date: Sat, 21 Sep 2013 17:19:01 +0200
Message-ID: <3865571.vRPq0Or7Pr@flatron>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org> <1379711637-5226-3-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:56295 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752271Ab3IUPTI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Sep 2013 11:19:08 -0400
In-Reply-To: <1379711637-5226-3-git-send-email-abrestic@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: linux-samsung-soc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Rahul Sharma <rahul.sharma@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Padmavathi Venna <padma.v@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.orglinux-

Hi Andrew,

On Friday 20 of September 2013 14:13:54 Andrew Bresticker wrote:
> There is no gate for the PCM clock input to the AudioSS block, so
> the parent of sclk_pcm is div_pcm0.  Add a clock ID for it so that
> we can reference it in device trees.
> 
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> ---
>  Documentation/devicetree/bindings/clock/exynos5250-clock.txt | 1 +
>  drivers/clk/samsung/clk-exynos5250.c                         | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
