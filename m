From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 0/4] clk: Samsung: audss: Add support for Exynos5420
Date: Mon, 12 Aug 2013 15:45:15 +0530
Message-ID: <CAAgF-Bf_RsayREKxcv5GevPD_seJwiOBrCRnq3eyeZZ7ks_sSw@mail.gmail.com>
References: <1373458313-18970-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:55945 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755963Ab3HLKPQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 06:15:16 -0400
Received: by mail-ob0-f171.google.com with SMTP id tb18so8699807obb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Aug 2013 03:15:15 -0700 (PDT)
In-Reply-To: <1373458313-18970-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Doug Anderson <dianders@chromium.org>, abrestic@chromium.org

Hi Kukjin,

Any comments on this patch set?

Thanks
Padma

On Wed, Jul 10, 2013 at 5:41 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> This patch set adds support for audio subsystem clks on Exynos5420. Exynos5420
> audio subsystem has a gate bit for ADMA controller and the some of parent clks
> for mout_i2s are also different from Exynos5250. So this patch adds provision
> for supporting both the platforms by passing the parent clk names through
> device tree.
>
> Andrew Bresticker (3):
>   clk: exynos-audss: add support for Exynos 5420
>   clk: exynos-audss: allow input clocks to be specified in device tree
>   ARM: dts: exynos5420: add audio clock controller
>
> Padmavathi Venna (1):
>   ARM: dts: Correct the /include entry on exynos5420 dtsi file
>
>  .../devicetree/bindings/clock/clk-exynos-audss.txt |   38 +++++++++++++++++--
>  arch/arm/boot/dts/exynos5420.dtsi                  |   13 ++++++-
>  drivers/clk/samsung/clk-exynos-audss.c             |   36 ++++++++++++++++--
>  include/dt-bindings/clk/exynos-audss-clk.h         |    3 +-
>  4 files changed, 80 insertions(+), 10 deletions(-)
>
> --
> 1.7.4.4
>
