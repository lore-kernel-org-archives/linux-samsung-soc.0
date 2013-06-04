From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V5 2/5] clk: samsung: register audio subsystem clocks
 using common clock framework
Date: Tue, 4 Jun 2013 10:09:24 -0700
Message-ID: <CAD=FV=X6FNsYDwrcd1ksF47F5MEq=9-=iX1ifP6S5vKRUVm=uw@mail.gmail.com>
References: <1370348890-6645-1-git-send-email-padma.v@samsung.com>
	<1370348890-6645-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:52720 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758511Ab3FDRJ0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 13:09:26 -0400
Received: by mail-lb0-f180.google.com with SMTP id r10so943174lbi.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jun 2013 10:09:25 -0700 (PDT)
In-Reply-To: <1370348890-6645-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, broonie@kernel.org, Mike Turquette <mturquette@linaro.org>

Padmavathi,

On Tue, Jun 4, 2013 at 5:28 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> Audio subsystem is introduced in s5pv210 and exynos platforms.
> This has seperate clock controller which can control i2s0 and
> pcm0 clocks. This patch registers the audio subsystem clocks
> with the common clock framework on Exynos family.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  .../devicetree/bindings/clock/clk-exynos-audss.txt |   64 ++++++++++
>  drivers/clk/samsung/Makefile                       |    1 +
>  drivers/clk/samsung/clk-exynos-audss.c             |  133 ++++++++++++++++++++
>  include/dt-bindings/clk/exynos-audss-clk.h         |   25 ++++
>  4 files changed, 223 insertions(+), 0 deletions(-)

Thanks for fixing up my nits.  This looks good to me.

Reviewed-by: Doug Anderson <dianders@chromium.org>
