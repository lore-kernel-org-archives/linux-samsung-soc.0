From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V4 1/4] ASoC: Samsung: I2S: Add quirks as driver data
 in I2S
Date: Mon, 12 Aug 2013 16:57:53 -0600
Message-ID: <52096871.4030703@wwwdotorg.org>
References: <1376300994-1679-1-git-send-email-padma.v@samsung.com> <1376300994-1679-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:41499 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752290Ab3HLW56 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 18:57:58 -0400
In-Reply-To: <1376300994-1679-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Kumar Gala <galak@codeaurora.org>

(CCing DT maintainers...)

On 08/12/2013 03:49 AM, Padmavathi Venna wrote:
> Samsung has different versions of I2S introduced in different
> platforms. Each version has some new support added for multichannel,
> secondary fifo, s/w reset control and internal mux for rclk src clk.
> Each newly added change has a quirk. So this patch adds all the
> required quirks as driver data and based on compatible string from
> dtsi fetches the quirks.

> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> index 025e66b..25a0024 100644
> --- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
> @@ -2,7 +2,11 @@
>  
>  Required SoC Specific Properties:
>  
> -- compatible : "samsung,i2s-v5"
> +- compatible : should be one of the following.
> +   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
> +   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
> +     secondary fifo, s/w reset control and internal mux for root clk src.

Those descriptions seem a little odd. If I have an SoC that isn't
s5pv210, yet supports "8/16/24bit multichannel(5.1) I2S with secondary
fifo, s/w reset control and internal mux for root clk src", will
compatible="samsung,s5pv210-i2s" work for my HW?

I wonder if you should instead include the IP block version in the
compatible value?

Alternatively, perhaps simply removing the description of the
capabilities of each SoC would make the binding document more typical.

Although all that said, given the semantic meaning of compatible; to
describe which specific SW-visible interface is available (which include
the feature-set), I feel my comments are a little odd:-)

>  - reg: physical base address of the controller and length of memory mapped
>    region.
>  - dmas: list of DMA controller phandle and DMA request line ordered pairs.
> @@ -21,13 +25,6 @@ Required SoC Specific Properties:
>  
>  Optional SoC Specific Properties:
>  
> -- samsung,supports-6ch: If the I2S Primary sound source has 5.1 Channel
> -  support, this flag is enabled.
> -- samsung,supports-rstclr: This flag should be set if I2S software reset bit
> -  control is required. When this flag is set I2S software reset bit will be
> -  enabled or disabled based on need.
> -- samsung,supports-secdai:If I2S block has a secondary FIFO and internal DMA,
> -  then this flag is enabled.
>  - samsung,idma-addr: Internal DMA register base address of the audio
>    sub system(used in secondary sound source).

Is it likely that a driver that fully implements those properties can
run on future HW without modification, perhaps adding some extra
properties to enable any new features?

In other words, I don't think we have an answer to the question: Should
differences between similar HW blocks be encoded into DT properties, or
should the driver encode them into some table, and look them up from
compatible value?

This patch changes between those two options. I'm not sure if there's
consensus that one option is better than the other, and hence whether
this patch is actually necessary or useful.

(although I dare say that at least samsung,supports-rstclr should be
modified to use the new reset controller bindings)

>  - pinctrl-0: Should specify pin control groups used for this controller.
> @@ -36,7 +33,7 @@ Optional SoC Specific Properties:
>  Example:
>  
>  i2s0: i2s@03830000 {
> -	compatible = "samsung,i2s-v5";
> +	compatible = "samsung,s5pv210-i2s";
>  	reg = <0x03830000 0x100>;
>  	dmas = <&pdma0 10
>  		&pdma0 9
> @@ -46,9 +43,6 @@ i2s0: i2s@03830000 {
>  		<&clock_audss EXYNOS_I2S_BUS>,
>  		<&clock_audss EXYNOS_SCLK_I2S>;
>  	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
> -	samsung,supports-6ch;
> -	samsung,supports-rstclr;
> -	samsung,supports-secdai;
>  	samsung,idma-addr = <0x03000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2s0_bus>;
