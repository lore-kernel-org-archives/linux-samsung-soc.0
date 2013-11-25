From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] i2c: s3c2410: dont need CPU_FREQ transitions for
 exynos series
Date: Mon, 25 Nov 2013 15:41:43 -0800
Message-ID: <CAD=FV=Wu13jiFggjp9FZrnB0ejODR7ix_jSby+waZwpcACLwXA@mail.gmail.com>
References: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
	<1384841915-8264-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:63737 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751768Ab3KYXlo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 18:41:44 -0500
Received: by mail-vc0-f174.google.com with SMTP id id10so3216295vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Nov 2013 15:41:43 -0800 (PST)
In-Reply-To: <1384841915-8264-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Simon Glass <sjg@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Ben Dooks <ben-linux@fluff.org>, Grant Likely <grant.likely@secretlab.ca>, "broonie@kernel.org" <broonie@kernel.org>, "cpgs ." <cpgs@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Naveen,

On Mon, Nov 18, 2013 at 10:18 PM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> For Exynos4 and Exynos5 SoCs from Samsung the i2c clock is based
> on a fixed 66 MHz peripheral clock, and therefore is completely
> independent of the cpu frequency.
> Thus, registering for a CPU freq notifier is very wasteful.
>
> This patch modifes the code such that, i2c bus registers to
> cpu_freq_transition only if CONFIG_CPU_FREQ_S3C24XX is enabled.
>
> This change should save a bunch of cpufreq transitions calls
> which does not apply to exynos SoCs.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes since v2:
> None, Rebased on for-next of linux-i2c git repo.
>
> Changes since v1:
> Use CONFIG_CPU_FREQ_S3C24XX instead of (CONFIG_CPU_FREQ & !CONFIG_EXYNOS)
> As commented by Tomasz
>
>  drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Can you please spin this with comments from
<https://patchwork.kernel.org/patch/3235091/>?  Thanks!

-Doug
