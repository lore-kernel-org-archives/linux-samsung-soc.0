From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable fan, sensors and audio for Odroid XU3
Date: Mon, 07 Dec 2015 10:43:11 +0100
Message-ID: <1670608.3mJKnXpbtb@wuerfel>
References: <1449449994-10110-1-git-send-email-k.kozlowski@samsung.com> <3286190.bAhobgE2la@wuerfel> <566553A4.6080106@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:63168 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754972AbbLGJn5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Dec 2015 04:43:57 -0500
In-Reply-To: <566553A4.6080106@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>

On Monday 07 December 2015 18:38:44 Krzysztof Kozlowski wrote:
> On 07.12.2015 18:14, Arnd Bergmann wrote:
> > On Monday 07 December 2015 09:59:54 Krzysztof Kozlowski wrote:
> >> For Odroid XU3-family enable the:
> >>  - PWM fan (to control the CPU fan using thermal subsystem),
> >>  - TI INA231 sensors (provide power measurements of big.LITTLE cores,
> >>    DRAM and GPU),
> >>  - Samsung sound (for Odroid XU3 and Snow as well).
> >>
> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >>
> > 
> > Looks good. Do you have a samsung/defconfig branch already that you
> > can put this into, or should be pick it up into arm-soc directly?
> > 
> > My preference is the former, but it would be a bit silly if that
> > is the only samsung defconfig change we need.
> 
> I had a couple of defconfig patches in my queue but I sent them last
> week to Kukjin in pull request. He didn't pull it yet. Maybe he could
> apply this patch after pulling?
> 
> Anyway we can wait for a few days to sort it out. If I don't have
> another defconfig patches then I will remind myself with applying it to
> arm-soc.
> 

Ok, sounds good.

	Arnd
