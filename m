From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 6/6] ASoC: samsung: Add DT bindings documentation for
 TM2 sound subsystem
Date: Tue, 14 Jun 2016 18:32:24 -0500
Message-ID: <20160614233224.GA4477@rob-hp-laptop>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-7-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36175 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751332AbcFNXc0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 19:32:26 -0400
Content-Disposition: inline
In-Reply-To: <1465815160-28504-7-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com

On Mon, Jun 13, 2016 at 12:52:40PM +0200, Sylwester Nawrocki wrote:
> This patch adds DT binding documentation for Exnos5433 based TM2
> and TM2E boards sound subsystem.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  .../bindings/sound/samsung,tm2-wm5110.txt          | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-wm5110.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-wm5110.txt b/Documentation/devicetree/bindings/sound/samsung,tm2-wm5110.txt
> new file mode 100644
> index 0000000..32f69fcc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,tm2-wm5110.txt
> @@ -0,0 +1,39 @@
> +Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
> +
> +Required properties:
> +
> + - compatible : "samsung,tm2-audio"

SoC specific compatible string please.

> + - samsung,model : the user-visible name of this sound complex

I think we have a standard property for this.

> + - clocks : must contain an entry for each entry in clock-names,
> +   see ../clocks/clock-bindings.txt for details
> + - clock-names : must include the following entries:
> +   "mclk1", "mclk2"

> + - samsung,i2s-controller : the phandle of the I2S controller
> + - samsung,speaker-amplifier : the phandle of the MAX98504 amplifier

We should have standard properties for these. 2nd ones I've seen today.

> + - samsung,audio-routing : a list of the connections between audio
> +   components;  each entry is a pair of strings, the first being the
> +   connection's sink, the second being the connection's source;
> +   valid names for sources and sinks are the WM5110's and MAX98504's
> +   pins and the jacks on the board:
> +   HP, SPK, Main Mic, Sub Mic, Third Mic, Headset Mic.
> + - mic-bias-gpios : GPIO pin that enables the Main Mic bias regulator
> +
> +Example:
> +
> +sound {
> +	compatible = "samsung,tm2-audio";
> +	clocks = <&pmu_system_controller 0>, <&s2mps13_osc 2>;
> +	clock-names = "mclk1", "mclk2";
> +	samsung,i2s-controller = <&i2s0>;
> +	samsung,speaker-amplifier = <&max98504>;
> +	samsung,model = "wm5110";
> +	mic-bias-gpios = <&gpr3 2 0>;
> +	samsung,audio-routing =
> +		"HP", "HPOUT1L",
> +		"HP", "HPOUT1R",
> +		"SPK", "SPKOUT",
> +		"SPKOUT", "HPOUT2L",
> +		"SPKOUT", "HPOUT2R",
> +		"Main Mic", "MICBIAS2",
> +		"IN1R", "Main Mic";
> +};
> -- 
> 1.9.1
> 
