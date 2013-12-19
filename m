From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/4] drm: exynos: hdmi: Add dt support for hdmiphy settings
Date: Thu, 19 Dec 2013 14:19:56 +0100
Message-ID: <9657044.3cgrCkZ0Il@amdc1227>
References: <1387455148-22999-1-git-send-email-s.shirish@samsung.com>
 <1387455148-22999-5-git-send-email-s.shirish@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:57963 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752369Ab3LSNUO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 08:20:14 -0500
In-reply-to: <1387455148-22999-5-git-send-email-s.shirish@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shirish S <s.shirish@samsung.com>
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, devicetree@vger.kernel.org, kgene.kim@samsung.com, s.nawrocki@samsung.com, shirish@chromium.org, linux-samsung-soc@vger.kernel.org

On Thursday 19 of December 2013 17:42:28 Shirish S wrote:
> This patch adds dt support to hdmiphy config settings
> as it is board specific and depends on the signal pattern
> of board.
> 
> Signed-off-by: Shirish S <s.shirish@samsung.com>
> ---
>  .../devicetree/bindings/video/exynos_hdmi.txt      |   34 ++++++++
>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   89 ++++++++++++++++----
>  2 files changed, 105 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> index 323983b..0766e6e 100644
> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
> @@ -13,6 +13,31 @@ Required properties:
>  	b) pin number within the gpio controller.
>  	c) optional flags and pull up/down.
>  
> +Optional-but-recommended properties:
> +- hdmiphy-configs: following information about the hdmiphy config settings.
> +	a) "config<N>: config<N>" specifies the phy configuration settings,

Why do you need this "config<N>: " part? (This is called "label" in DT
terminology by the way and can be used to reference the node from
properties of other nodes, by so called "phandle".)

> +		where 'N' denotes the number of configuration, since every
> +		pixel clock can have its unique configuration.
> +		"samsung,pixel-clock" specifies the pixel clock
> +		"samsung,de-emphasis-level" provides fine control of TMDS data
> +		 pre emphasis, below shown is example for
> +		data de-emphasis register at address 0x145D0040.
> +			hdmiphy@38[16] for bits[3:0] permitted values are in
> +			the range of 760 mVdiff to 1400 mVdiff at 20mVdiff
> +			increments for every LSB
> +			hdmiphy@38[16] for bits[7:4] permitted values are in
> +			the range of 0dB to -7.45dB at increments of -0.45dB
> +			for every LSB.
> +		"samsung,clock-level" provides fine control of TMDS data
> +		amplitude for each channel,
> +		for example if 0x145D005C is the address of clock level
> +		register then,
> +			hdmiphy@38[23] for bits [1:0] permitted values are in
> +			the range of 0 mVdiff & 60 mVdiff for each channel at
> +			increments 20 mVdiff of amplitude levels for every LSB,
> +			hdmiphy@38[23] for bits [7:3] permitted values are in
> +			the range of 790 and 1430 mV at 20mV increments for
> +			every LSB.
>  Example:
>  
>  	hdmi {
> @@ -20,4 +45,13 @@ Example:
>  		reg = <0x14530000 0x100000>;
>  		interrupts = <0 95 0>;
>  		hpd-gpio = <&gpx3 7 1>;
> +		hdmiphy-configs {
> +			config0: config0 {
> +				samsung,pixel-clock = <25200000>;
> +				samsung,de-emphasis-level =  /bits/ 8 <0x26>;

nit: Two spaces before "/bits/".

> +				samsung,clock-level =  /bits/ 8 < 0x66>;

nit: Two spaces before "/bits/" and incorrect space after "<".

Generally the list of configurations should look like below:

	phy-configs {
		#address-cells = <1>;
		#size-cells = <0>;

		config@0 {
			reg = <0>;
			/* other properties... */
		};

		config@1 {
			reg = <1>;
			/* other properties... */
		};

		/* ... */
	};

This is how bus-like structures should be represented in device tree.
Also, since this is HDMI node, maybe it's enough to call the node simply
phy-configs. Please rework the patches to use this correct representation.

> +
> +			/* ... */
> +		}
>  	};
[snip]
> +	for_each_child_of_node(phy_conf, cfg_np) {
> +		if (of_property_read_u32(cfg_np, "samsung,pixel-clock",
> +							&pixel_clock))
> +			continue;
> +
> +		for (i = 0; i < ARRAY_SIZE(hdata->nr_confs); i++) {
> +			if (hdata->confs[i].pixel_clock == pixel_clock)

Can you have more than one config with the same pixel clock?

Even if not, the code could be made more readable if the code
below is moved outside the if and continue keyword is used instead.

Best regards,
Tomasz
