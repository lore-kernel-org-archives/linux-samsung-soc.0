From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V4 4/4] ARM: dts: add clock provider information for i2s
 controllers in Exynos5250
Date: Mon, 3 Jun 2013 13:18:01 -0700
Message-ID: <CAD=FV=X_XVmQ-jyorxATqBad5hhdFe5dodg_AzjsRQ-S+1=NeA@mail.gmail.com>
References: <1370236744-16802-1-git-send-email-padma.v@samsung.com>
	<1370236744-16802-5-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:38590 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754049Ab3FCUSD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Jun 2013 16:18:03 -0400
Received: by mail-lb0-f179.google.com with SMTP id w20so1280185lbh.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jun 2013 13:18:02 -0700 (PDT)
In-Reply-To: <1370236744-16802-5-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, broonie@kernel.org, Mike Turquette <mturquette@linaro.org>

Padmavathi,

On Sun, Jun 2, 2013 at 10:19 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> +               clocks = <&clock_audss EXYNOS_I2S_BUS>,
> +                       <&clock_audss EXYNOS_I2S_BUS>,
> +                       <&clock_audss EXYNOS_SCLK_I2S>,
> +                       <&clock_audss EXYNOS_MOUT_AUDSS>,
> +                       <&clock_audss EXYNOS_MOUT_I2S>;
> +               clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
> +                               "mout_audss", "mout_i2s";

Are there bindings for these clocks? Would be nice to see a
description for what they are supposed to be.

I looked up i2s_opclk0 / i2s_opclk1 and they look reasonable at a
quick glance. ...and it does seem right that iis and i2s_opclk0 are
the same. ...but I don't see any place that uses the last two. Is
there an in-flight patch?

-Doug
