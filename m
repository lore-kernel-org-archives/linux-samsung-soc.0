From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/6] ASoC: max98088: Document DT bindings
Date: Fri, 20 Feb 2015 13:12:15 +0100
Message-ID: <54E7249F.2020900@samsung.com>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>
 <1424283959-16289-2-git-send-email-afaerber@suse.de>
 <54E5EB36.9020007@collabora.co.uk> <54E5EF73.2090302@suse.de>
 <CAD=FV=VoFnbEsKi4mDDkaTrTXboJmm0UNV5iCk1CvV5ndEZtsA@mail.gmail.com>
 <54E62E1C.4030105@suse.de> <54E6314E.5060509@suse.de>
 <54E64C09.5000505@collabora.co.uk> <54E681A8.6040702@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53156 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754045AbbBTMMW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Feb 2015 07:12:22 -0500
In-reply-to: <54E681A8.6040702@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>

On 20/02/15 01:36, Andreas F=C3=A4rber wrote:
>>> >> So it seems the mclk is not always set up properly by the kernel=
,
>>> >> relying on firmware. Who's in charge of setting that clock up?
>> >=20
>> > Right, it seems audio is only working due the firmware doing some =
previous
>> > setup. Probably it works on every boot if you have "sound init" as=
 a part of
>> > the u-boot boot commands?
>
> Indeed it does, 24 MHz without the reparenting patch, and sound worki=
ng.

You can have parent of the CLKOUT clock set by the clk core if it is
specified in device tree in the PMU (the clkout clock supplier) device
node.

Similarly as we did for the Odroix U3:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/ar=
ch/arm/boot/dts/exynos4412-odroid-common.dtsi#n39

Relying on the clk_set_rate() to set the parent clock is not optimal
IMO. Presumably you need to set select stable parent clock for clkout
like XXTI. But I'm not very familiar with exyno5250 and that might be
something different.

--=20
Regards,
Sylwester
