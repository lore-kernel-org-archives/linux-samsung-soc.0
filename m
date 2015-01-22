From: Inha Song <ideal.song@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ARM: dts: Add sound nodes for
 exynos4412-trats2
Date: Thu, 22 Jan 2015 10:18:40 +0900
Message-ID: <20150122101840.24bd93a3@songinha-Samsung-DeskTop-System>
References: <1421660902-29679-1-git-send-email-ideal.song@samsung.com>
 <1421660902-29679-4-git-send-email-ideal.song@samsung.com>
 <54BFD279.7080604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57442 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751531AbbAVBSp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jan 2015 20:18:45 -0500
In-reply-to: <54BFD279.7080604@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sbkim73@samsung.com, linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.de, robh+dt@kernel.org, kgene@kernel.org, galak@codeaurora.org, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org

Hi,
Thanks for your comments.

On Wed, 21 Jan 2015 17:23:21 +0100
Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:

> Hi,
> 
> On 19/01/15 10:48, Inha Song wrote:
> > --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> > +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> 
> > +	sound {
> > +		compatible = "samsung,trats2-audio";
> 
> > +		assigned-clocks = <&pmu_system_controller 0>;
> > +		assigned-clock-parents =  <&clock CLK_XUSBXTI>;
> 
> How about putting these properties in the pmu_system_controller
> node?  After all the mux clock being configured here belongs to
> the PMU subsystem. Wouldn't it work that way ?
OK, I will move assigned clock properties to pmu_system_controller DT node.

Best Regards,
Inha Song.

> 
> > +		samsung,i2s-controller = <&i2s0>;
> > +		samsung,model = "Trats2";
> > +		samsung,audio-codec = <&wm1811>;
> > +		samsung,audio-routing =
> > +			"SPK", "SPKOUTLN",
> > +			"SPK", "SPKOUTLP",
> > +			"SPK", "SPKOUTRN",
> > +			"SPK", "SPKOUTRP";
> > +	};
> 
> -- 
> Regards,
> Sylwester
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> http://mailman.alsa-project.org/mailman/listinfo/alsa-devel
