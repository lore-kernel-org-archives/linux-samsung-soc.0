From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RESEND PATCH 1/1] ARM: exynos_defconfig: Enable SBS battery
 support
Date: Mon, 11 Aug 2014 17:42:49 +0200
Message-ID: <35198339.PY7xVRQz0X@amdc1032>
References: <1407755198-17568-1-git-send-email-javier.martinez@collabora.co.uk>
 <1761549.yKSqfXafKr@amdc1032> <53E8BC8B.70709@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53599 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932094AbaHKPnS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 11:43:18 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NA500JO1FO4XO30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Aug 2014 00:43:17 +0900 (KST)
In-reply-to: <53E8BC8B.70709@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


Hi,

On Monday, August 11, 2014 02:52:27 PM Javier Martinez Canillas wrote:
> Hello Bartlomiej,
> 
> On 08/11/2014 02:40 PM, Bartlomiej Zolnierkiewicz wrote:
> >> index fc7d168..c390bb9 100644
> >> --- a/arch/arm/configs/exynos_defconfig
> >> +++ b/arch/arm/configs/exynos_defconfig
> >> @@ -77,6 +77,7 @@ CONFIG_SPI_S3C64XX=y
> >>  CONFIG_I2C_S3C2410=y
> >>  CONFIG_DEBUG_GPIO=y
> >>  CONFIG_POWER_SUPPLY=y
> >> +CONFIG_BATTERY_SBS=m
> > 
> > Why not make it "=y"?
> > 
> > Rationale:
> > - currently no hardware related option uses "=m" in exynos_defconfig
> > - it would match the SBS option usage in multi_v7_defconfig
> >
> >>  CONFIG_CHARGER_TPS65090=y
> >>  # CONFIG_HWMON is not set
> >>  CONFIG_THERMAL=y
> > 
> 
> I know but personally I think this should be changed. The idea of having a multi
> platform kernel is to build a single kernel image that can be used to boot
> different platforms. Not all platforms have a SBS-compliant battery so this
> support shouldn't be built in the kernel image IMHO.
> 
> This also matches to what real users will do since distributions most likely
> will have a minimal kernel and every possible hardware support will be enabled
> as a loadable kernel module. This is what distros do for other platforms too.
> 
> If someone has a different use case and wants a kernel image that is optimized
> for a particular platform then she has to create its own defconfig anyways.

Distributions usually use their own configs anyway and the current most
popular use case for exynos_defconfig (not multi_v7_defconfig) seems to
be to build kernel image alone and use it without any modules:

$ grep "=m" arch/arm/configs/exynos_defconfig
CONFIG_DM_CRYPT=m

$ grep "=m" .config
CONFIG_NET_IP_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_IPV6=m
CONFIG_INET6_XFRM_MODE_TRANSPORT=m
CONFIG_INET6_XFRM_MODE_TUNNEL=m
CONFIG_INET6_XFRM_MODE_BEET=m
CONFIG_IPV6_SIT=m
CONFIG_DM_CRYPT=m
CONFIG_CRYPTO_RNG=m
CONFIG_CRYPTO_ANSI_CPRNG=m

What I'm trying to say is that there is a high probability that people
will continue to use just the kernel image for exynos_defconfig and
will therefore miss SBS battery support altogether (which is only 3.6
kB of code more in the kernel image so there is no much gain in making
it modular currently).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
