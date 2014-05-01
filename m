From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V2] ASoC: SAMSUNG: Add sound card driver for Snow board
Date: Thu, 1 May 2014 08:54:14 -0700
Message-ID: <CAD=FV=Wa4CovkxBng0SkUUAryiFqa=m63tro1Yv1jRgp4e95aw@mail.gmail.com>
References: <1398243705-31151-1-git-send-email-tushar.behera@linaro.org>
	<20140424133920.GA12304@sirena.org.uk>
	<5359E18B.60600@linaro.org>
	<20140429222915.GU15125@sirena.org.uk>
	<5360E5E7.8090807@linaro.org>
	<20140430180314.GA3245@sirena.org.uk>
	<53623004.5010805@linaro.org>
	<20140501141510.GW3245@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f181.google.com ([209.85.220.181]:35233 "EHLO
	mail-vc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755521AbaEAPyQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 11:54:16 -0400
Received: by mail-vc0-f181.google.com with SMTP id hy4so4062473vcb.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2014 08:54:14 -0700 (PDT)
In-Reply-To: <20140501141510.GW3245@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Tushar Behera <tushar.behera@linaro.org>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, sbkim73@samsung.com, Randy Dunlap <rdunlap@infradead.org>, Mike Turquette <mturquette@linaro.org>

Hi,

On Thu, May 1, 2014 at 7:15 AM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, May 01, 2014 at 04:59:08PM +0530, Tushar Behera wrote:
>
>> Okay, I will extend the existing clock driver to support XCLKOUT.
>
> It may make more sense to add another clock driver for this clock
> depending on how things are done, I don't know.
>
>> Of the many parents of XCLKOUT, we need to set XXTI clock as the parent.
>> Is it okay if we pass two clocks "mclk" (XCLKOUT) and "mclk_parent"
>> (XXTI) to sound-card driver via DT and do the necessary reparenting
>> during the sound-card driver probe call?
>
> No, that's not OK at all, it won't allow for configuration of the
> system.  This is what I was talking about when I was talking the clock
> framework extensions to allow the clock tree to be configured using DT,
> that would allow the settings to be put in DT.
>
>> Else, we can push that change to bootloader (to set the XCLKOUT mux
>> register) and only enable/disable the clock in sound-card driver.
>
> That's not going to work given that the existing bootloaders don't do
> this.

This is exactly the thing (expected clock parenting) we agreed could
be put in the device tree I think.  ...but I don't know that anyone
proposed exactly how that would work.

NOTE: in existing ChromeOS this type of thing is done a tiny amount in
<https://chromium.googlesource.com/chromiumos/third_party/kernel-next/+/chromeos-3.8/arch/arm/mach-exynos/mach-exynos5-dt.c>.
 See apply_clock_muxing().

-Doug
