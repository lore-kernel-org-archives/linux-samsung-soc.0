From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 12/14] arm64: dts: add Exynos7 based Espresso board dts file
Date: Wed, 27 Aug 2014 13:32:20 +0200
Message-ID: <53FDC1C4.2010201@samsung.com>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-4-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10523 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755973AbaH0LcZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 07:32:25 -0400
In-reply-to: <1409132660-1898-4-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, catalin.marinas@arm.com
Cc: naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cpgs@samsung.com, Rob Herring <robh@kernel.org>

Hi Naveen,

Please see my comments inline.

On 27.08.2014 11:44, Naveen Krishna Chatradhi wrote:
> This patch adds initial dts file for the Espresso board
> based on Exynos7 from Samsung.

[snip]

> +	mmc@15740000 {

Please migrate this dts file to the reference-based syntax.

> +		status = "okay";
> +		num-slots = <1>;
> +		broken-cd;
> +		caps2-mmc-hs200-1_8v;
> +		supports-highspeed;
> +		non-removable;
> +		card-detect-delay = <200>;
> +		clock-frequency = <800000000>;
> +		samsung,dw-mshc-ciu-div = <3>;
> +		samsung,dw-mshc-sdr-timing = <0 4>;
> +		samsung,dw-mshc-ddr-timing = <0 2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_rdqs &sd0_bus1 &sd0_bus4 &sd0_bus8>;
> +		bus-width = <8>;
> +
> +		slot@0 {
> +			reg = <0>;
> +			bus-width = <8>;

Why is bus-width repeated?

Best regards,
Tomasz
