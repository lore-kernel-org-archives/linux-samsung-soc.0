From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH v2 00/16] ASoC: samsung: Add clk provider for I2S
 internal clocks
Date: Sat, 24 Jan 2015 02:53:41 +0100
Message-ID: <54C2FB25.4030501@gmx.net>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:58278 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752472AbbAXByl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 20:54:41 -0500
In-Reply-To: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, broonie@kernel.org, kgene@kernel.org, alsa-devel@alsa-project.org
Cc: padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hello,

I've tested the series on my X2 and so far I haven't encountered any
obvious issues with it.

I have a small question though. With the move to simple-audio-card the
old driver (selected by SND_SOC_ODROIDX2) is probably going away after
some time.
Currently SND_SOC_ODROIDX2 also selects SND_SOC_MAX98090 and
SND_SAMSUNG_I2S, which I believe (correct me if I'm wrong) are necessary
to use the sound subsystem even with simple-audio-card (since the
max98090 codec has to be built at least). I've found no way of selecting
these two manually, so at the moment I need both CONFIG_SND_SIMPLE_CARD
and SND_SOC_ODROIDX2 enabled to use sound. Is this intended behaviour?


And while I'm at it. I'm booting the board with an upstream u-boot
version which sets the MPLL to 800MHz, which AFAIK is the clocking rate
that makes less 'trouble' (but at the expense of performance).
I was wondering if anyone can comment on whether the recent rework has
any influence on the behaviour when booting with the vendor u-boot
(which sets the MPLL to 880MHz). IIRC then clock rounding issues arose
there.

It would be interesting to know if this series gets us closer to drive
the MPLL with the recommended (?) higher clocking rate.


With best wishes,
Tobias



Sylwester Nawrocki wrote:
> This series is an attempt to resolve the CDCLK clock gating issue on Odroid
> X2/U3 as reported by Daniel Drake [1], by exposing the CDCLK gate clock 
> (and the two other clocks) through clk API. 
> 
> Changes since previous version:
>  - removed check for the i2s_opclk1 mux input clock while creating the mux
>    and div clocks,
>  - the DT binding documentation changes reworked (addressing review comments),
>  - added include/dt-bindings/sound/samsung-i2s.h header file defining
>    the clk indices, it's been put into a separate patch together with the I2S 
>    DT binding documentation updates to make merging of the ASoC and the dts
>    patches separately easier,
>  - a patch fixing compatible strings of I2S1, I2S2 in exynos4.dtsi is included
>    in this series.
> 
> This whole series may need more testing on other SoCs, so far I only tested 
> it on Odroid Exynos4412 X2, with the I2S working in slave mode.
> 
> [1] http://mailman.alsa-project.org/pipermail/alsa-devel/2014-September/081753.html
> 
> Sylwester Nawrocki (16):
>   ASoC: samsung: i2s: Remove unused gpios field from struct i2s
>   ASoC: samsung: i2s: samsung_i2s_get_driver_data() cleanup
>   ASoC: samsung: i2s: Add return value checks in probe()
>   ASoC: samsung: i2s: Request memory region in driver probe()
>   ASoC: samsung: i2s: Move clk_get() to platform driver probe()
>   ASoC: samsung: i2s: Move clk enable to the platform driver probe()
>   ASoC: samsung: i2s: Add get_other_dai helper function
>   ASoC: samsung: i2s: Remove an unneeded goto usage
>   ASoC: samsung: i2s: Add spinlock in place of local_irq_* calls
>   ASoC: samsung: i2s: Protect more registers with a spinlock
>   ASoC: samsung: odroidx2: Handle I2S CDCLK clock conditionally
>   ASoC: samsung: i2s: Add clk provider DT binding documentation
>   ASoC: samsung: i2s: Add clock provider for the I2S internal clocks
>   ARM: dts: Exynos4 and Odroid X2/U3 sound device nodes update
>   ARM: dts: Switch Odroid X2/U2 to simple-audio-card
>   ARM: dts: Fix I2S1, I2S2 compatible for exynos4 SoCs
> 
>  .../devicetree/bindings/sound/samsung-i2s.txt      |   22 ++
>  arch/arm/boot/dts/exynos4.dtsi                     |   13 +-
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |   27 +-
>  arch/arm/boot/dts/exynos4412-odroidu3.dts          |    8 +-
>  arch/arm/boot/dts/exynos4412-odroidx2.dts          |    8 +-
>  include/dt-bindings/sound/samsung-i2s.h            |    8 +
>  sound/soc/samsung/i2s.c                            |  362 ++++++++++++--------
>  sound/soc/samsung/odroidx2_max98090.c              |    6 +-
>  8 files changed, 295 insertions(+), 159 deletions(-)
>  create mode 100644 include/dt-bindings/sound/samsung-i2s.h
> 
