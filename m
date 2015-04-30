From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] Revert "ARM: dts: add display power domain for exynos5250"
Date: Thu, 30 Apr 2015 02:37:59 +0200
Message-ID: <55417967.80304@collabora.co.uk>
References: <1427107800-21668-1-git-send-email-javier.martinez@collabora.co.uk>	 <7hr3r2suiw.fsf@deeprootsystems.com> <1430336716.19504.92.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:55780 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891AbbD3AiN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Apr 2015 20:38:13 -0400
In-Reply-To: <1430336716.19504.92.camel@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kevin Hilman <khilman@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, inki.dae@samsung.com

Hello,

On 04/29/2015 09:45 PM, Sjoerd Simons wrote:
> On Wed, 2015-04-29 at 10:40 -0700, Kevin Hilman wrote:
>> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
> 
>> Tested-by: Kevin Hilman <khilman@linaro.org>
>> 
>> FWIW, this patch fixes the boot panics when using MMC rootfs on
>> exynos5800-peach-pi with current linux-next that have been happening
>> for awhile.
> 
> That seems unlikely as this patch changes things in the exynos5250.dtsi,
> which isn't used by exynos5800-peach-pi.?
>

Indeed, it will be surprising if $subject changes any behavior on
Exynos5420/5422/5800 machines.

FWIW, this patch is not needed anymore since the right fix is Krzysztof's
"drm/exynos: Enable DP clock to fix display on Exynos5250 and other" patch
which is already in linux-next.

The regression on Exynos5420/5422/5800 that has been for a while is fixed
by "ARM: dts: Make DP a consumer of DISP1 power domain on Exynos5420" [0]
which has been posted many weeks ago.
 
>> For several months now, DRM/display related stuff is very routinely
>> breaking basic booting on exynos5, which gives the rather strong
>> impression that the DRM stuff is not tested well enough to be merged.
> 
> Unfortunately it seems to have been that way for ages, but only has
> started being visible since Javier turned on the various exynos DRM
> drivers on in exynos_defconfig.. So now we're actually seeing bugs
> rather then just having broken code sit around :/
>

Agreed.

Best regards,
Javier

[0]: https://lkml.org/lkml/2015/4/12/153
