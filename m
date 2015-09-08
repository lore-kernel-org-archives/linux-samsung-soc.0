From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable USB Video Class support
Date: Tue, 8 Sep 2015 10:40:58 +0200
Message-ID: <55EE9F1A.9030703@osg.samsung.com>
References: <1441662323-15468-1-git-send-email-javier@osg.samsung.com>
 <55EE9820.2010202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34811 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752866AbbIHIlF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 04:41:05 -0400
In-Reply-To: <55EE9820.2010202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

[adding Bartlomiej to cc]

Hello Krzysztof,

On 09/08/2015 10:11 AM, Krzysztof Kozlowski wrote:
> On 08.09.2015 06:45, Javier Martinez Canillas wrote:
>> The Exynos5420 Peach Pit and Exynos5800 Peach Pi boards have a built-in
>> Silicon Motion USB UVC WebCam. Enable support for the USB Video Class
>> driver and its needed media Kconfig symbols so the camera is supported.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>>
>>  arch/arm/configs/exynos_defconfig | 4 ++++
>>  1 file changed, 4 insertions(+)
> 
> The patch itself looks good but now I wonder whether we are not putting
> to much stuff built-in. The exynos_defconfig does not replace the
> distribution distro. For a fully working board the distro should prepare
> it's own config.
>

Agreed that exynos_defconfig is not meant to replace a distro config.

> I understand that in this case the USB webcams are parts of device (like
> on all laptops)... a little bit similar as camera sensors on mobile
> phones. Yet on mobile phone usually the camera itself is part of SoC,
> only the sensor is external.
> 
> Actually what we need is a kind of policy for exynos_defconfig - what
> should be inside as built-in and what as module?
>

I had the same conversation with Bartlomiej before in [0] when I tried to
enable the SBS battery driver as module. I save you a click and quote him:

"the current most popular use case for exynos_defconfig
(not multi_v7_defconfig) seems to be to build kernel image
alone and use it without any modules"

Which seems to be true, so my understanding is that exynos_defconfig is a
minimal defconfig for Exynos platforms and for easy of test/use, everything
should be built-in while multi_v7_defconfig would be more similar to a conf
used by distros where most things would be built as a module when possible.

Other SoC specific deconfig do it differently, OMAP for example does the
opposite and tries to build as much stuff as possible as a module.

> Best regards,
> Krzysztof
> 
>

[0]: http://lists.infradead.org/pipermail/linux-arm-kernel/2014-August/278757.html

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
