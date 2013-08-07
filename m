From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V3 0/7] Add i2s nodes on Exynos5420 and enable sound
 support on sdmk5420
Date: Wed, 7 Aug 2013 14:33:27 +0530
Message-ID: <CAAgF-BcoZr-ei5SthVTb6G0ETDqTUg5p_9i315xBt2roFXDKuA@mail.gmail.com>
References: <1375865442-5323-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f50.google.com ([209.85.219.50]:35704 "EHLO
	mail-oa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932162Ab3HGJD2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 05:03:28 -0400
In-Reply-To: <1375865442-5323-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "broonie@kernel.org" <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, abrestic@chromium.org

Hi,

Abandoning this series due to some mistake in the post.  Will post new
patch set.

Thanks
Padma

On Wed, Aug 7, 2013 at 2:20 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> Changes since V2:
>         - Seperated out driver side changes and dts changes in two
>           patch sets
>         - Added proper names for wm8994 regulators as commented by Mark
>         - Moved common i2s nodes into the exynos5.dtsi
>         - Added clock info in wm8994 node as requested by Mark.
>         - Registered the 16.9MHz oscillator clock as fixed clock in the
>           machine file. Right now no user of this clock but as Mark requested
>           to add mclk info in wm8994 node, I added this part.
>
> This patch set is dependent on the following i2c, dma and audio subsystem
> clk controller patches.
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/20077
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/20661
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/20668
>
> This patch set is made based on Kukjin Kim for-next branch.
>
> Andrew Bresticker (1):
>   ARM: dts: exynos5420: add i2s controllers
>
> Padmavathi Venna (6):
>   ARM: dts: Change i2s compatible string on exynos5250
>   ARM: dts: Add i2c bus 1 and it's audio codec child node on smdk5420
>   ARM: dts: exynos5250: move common i2s properties to exynos5 dtsi
>   ARM: dts: Add osc clock node on smdk5420.
>   ASoC: Samsung: wm8994: Register the osc clock.
>   ARM: dts: Enable sound support on smdk5420
>
>  arch/arm/boot/dts/exynos5.dtsi            |   21 ++++++++
>  arch/arm/boot/dts/exynos5250.dtsi         |   17 +------
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |   78 +++++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi         |   32 ++++++++++++
>  sound/soc/samsung/smdk_wm8994.c           |   12 +++++
>  5 files changed, 144 insertions(+), 16 deletions(-)
>
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
