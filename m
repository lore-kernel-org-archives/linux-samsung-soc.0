From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V5 5/5] ARM: dts: Update Samsung I2S documentation
Date: Tue, 4 Jun 2013 10:25:26 -0700
Message-ID: <CAD=FV=U9Fc=TTcbLCjTSvbk7pV5OdnBUwyxAss1_DX1dfKUQxA@mail.gmail.com>
References: <1370348890-6645-1-git-send-email-padma.v@samsung.com>
	<1370348890-6645-6-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:51350 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751461Ab3FDRZ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 13:25:28 -0400
Received: by mail-lb0-f172.google.com with SMTP id p10so960269lbi.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jun 2013 10:25:26 -0700 (PDT)
In-Reply-To: <1370348890-6645-6-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Padma Venkat <padma.kvr@gmail.com>, sbkim73@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>

Padmavathi,

On Tue, Jun 4, 2013 at 5:28 AM, Padmavathi Venna <padma.v@samsung.com> wrote:
> This patch updates the samsung i2s documentation for pinmux and
> clock entries.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  .../devicetree/bindings/sound/samsung-i2s.txt      |   40 ++++++-------------
>  1 files changed, 13 insertions(+), 27 deletions(-)

Whoops, just asked for this and now saw it.  Thanks for posting!

One note: don't use the "dts" tag for this commit.  That should be
only for things that are touching dts / dtsi files, not for updating
docs.


> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> index 3070046..6f9d29f 100644
> --- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> @@ -8,6 +8,10 @@ Required SoC Specific Properties:
>  - dmas: list of DMA controller phandle and DMA request line ordered pairs.
>  - dma-names: identifier string for each DMA request line in the dmas property.
>    These strings correspond 1:1 with the ordered pairs in dmas.
> +- clocks: from common clock binding. Handle to iis clock and RCLK src clk.
> +- clock-names: from common clock binding: Should be "iis","i2s_opclk0" and
> +  "i2s_opclk1". "iis" is the i2s bus clock and i2s_opclk selects the src of
> +  RCLK which is a mux inside i2s controller.

>From your other patch apparently opclk0 and/or opclk1 are not
required.  Two of your i2c nodes don't have either, though I suspect
that you at least need opclk0.  See my comments there.

-Doug
