From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: Add Exynos5250 Snow Rev5+ support
Date: Wed, 30 Sep 2015 08:38:23 +0200
Message-ID: <560B835F.6070708@osg.samsung.com>
References: <1443527855-434-1-git-send-email-javier@osg.samsung.com>
 <CAD=FV=Vmdv6sTmbVyxE=04ycNCOzEWJpfMpzGnihOwaW0ZFzmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39996 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753516AbbI3Gi3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Sep 2015 02:38:29 -0400
In-Reply-To: <CAD=FV=Vmdv6sTmbVyxE=04ycNCOzEWJpfMpzGnihOwaW0ZFzmQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello Doug,

On 09/29/2015 07:28 PM, Doug Anderson wrote:

[snip]

> 
> 
>>  arch/arm/boot/dts/Makefile                    |   1 +
>>  arch/arm/boot/dts/exynos5250-snow-common.dtsi | 684 ++++++++++++++++++++++++++
>>  arch/arm/boot/dts/exynos5250-snow-rev5.dts    |  47 ++
>>  arch/arm/boot/dts/exynos5250-snow.dts         | 666 +------------------------
>>  4 files changed, 733 insertions(+), 665 deletions(-)
> 
> Thanks!  Note:
> 
> $ pwclient git-am 7285451
> Applying patch #7285451 using 'git am'
> Description: ARM: dts: Add Exynos5250 Snow Rev5+ support
> Applying: ARM: dts: Add Exynos5250 Snow Rev5+ support
> .git/rebase-apply/patch:774: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.
>

sigh, sorry for missing that one.
 
> 
> One other nit is that the exynos5250-snow.dts" ends up with the
> "max98095" pinctrl properties sorted differently than the
> "exynos5250-snow-rev5.dts".  Is it worth reordering the
> "exynos5250-snow.dts" in the same patch?
>

Right, I'll change exynos5250-snow.dts to have pinctrl-names
before pinctrl-0 that will not only match max98090 properties
order but also be consistent with the rest of the dev nodes.
 
> Otherwise this looks fine to me.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 

Thanks a lot for your feedback and review!

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
