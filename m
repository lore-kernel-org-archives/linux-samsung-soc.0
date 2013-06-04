From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V5 4/5] ARM: dts: add clock provider information for i2s
 controllers in Exynos5250
Date: Tue, 4 Jun 2013 10:12:36 -0700
Message-ID: <CAD=FV=X6u51rYuBOT+EGBdKptgCSM-6PvW9L9Xgbiih9wOH+3A@mail.gmail.com>
References: <1370348890-6645-1-git-send-email-padma.v@samsung.com>
	<1370348890-6645-5-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:54785 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757649Ab3FDRMj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 13:12:39 -0400
Received: by mail-lb0-f180.google.com with SMTP id r10so925198lbi.25
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jun 2013 10:12:38 -0700 (PDT)
In-Reply-To: <1370348890-6645-5-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Padma Venkat <padma.kvr@gmail.com>, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>

Padmavathi,

On Tue, Jun 4, 2013 at 5:28 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> Add clock lookup information for i2s controllers on exynos5250 SoC.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |   10 ++++++++++

Would still like to see a separate patch documenting these clocks in
"Documentation/devicetree/bindings/sound/samsung-i2s.txt".  ...but
what's here looks good, thanks!

Reviewed-by: Doug Anderson <dianders@chromium.org>
