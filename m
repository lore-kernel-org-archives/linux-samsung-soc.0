From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ARM: dts: Add sound nodes for
 exynos4412-trats2
Date: Wed, 21 Jan 2015 17:23:21 +0100
Message-ID: <54BFD279.7080604@samsung.com>
References: <1421660902-29679-1-git-send-email-ideal.song@samsung.com>
 <1421660902-29679-4-git-send-email-ideal.song@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41655 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752259AbbAUQXc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jan 2015 11:23:32 -0500
In-reply-to: <1421660902-29679-4-git-send-email-ideal.song@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inha Song <ideal.song@samsung.com>
Cc: alsa-devel@alsa-project.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, kgene@kernel.org, sbkim73@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

On 19/01/15 10:48, Inha Song wrote:
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts

> +	sound {
> +		compatible = "samsung,trats2-audio";

> +		assigned-clocks = <&pmu_system_controller 0>;
> +		assigned-clock-parents =  <&clock CLK_XUSBXTI>;

How about putting these properties in the pmu_system_controller
node?  After all the mux clock being configured here belongs to
the PMU subsystem. Wouldn't it work that way ?

> +		samsung,i2s-controller = <&i2s0>;
> +		samsung,model = "Trats2";
> +		samsung,audio-codec = <&wm1811>;
> +		samsung,audio-routing =
> +			"SPK", "SPKOUTLN",
> +			"SPK", "SPKOUTLP",
> +			"SPK", "SPKOUTRN",
> +			"SPK", "SPKOUTRP";
> +	};

-- 
Regards,
Sylwester
