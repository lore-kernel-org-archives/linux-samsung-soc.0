From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: Re: [PATCH 1/1] Revert "ARM: dts: add display power domain for
 exynos5250"
Date: Wed, 29 Apr 2015 21:45:16 +0200
Message-ID: <1430336716.19504.92.camel@collabora.co.uk>
References: <1427107800-21668-1-git-send-email-javier.martinez@collabora.co.uk>
	 <7hr3r2suiw.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:55506 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751907AbbD2TpW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Apr 2015 15:45:22 -0400
In-Reply-To: <7hr3r2suiw.fsf@deeprootsystems.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, inki.dae@samsung.com

On Wed, 2015-04-29 at 10:40 -0700, Kevin Hilman wrote:
> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:

> Tested-by: Kevin Hilman <khilman@linaro.org>
> 
> FWIW, this patch fixes the boot panics when using MMC rootfs on
> exynos5800-peach-pi with current linux-next that have been happening
> for awhile.

That seems unlikely as this patch changes things in the exynos5250.dtsi,
which isn't used by exynos5800-peach-pi.?

> For several months now, DRM/display related stuff is very routinely
> breaking basic booting on exynos5, which gives the rather strong
> impression that the DRM stuff is not tested well enough to be merged.

Unfortunately it seems to have been that way for ages, but only has
started being visible since Javier turned on the various exynos DRM
drivers on in exynos_defconfig.. So now we're actually seeing bugs
rather then just having broken code sit around :/

-- 
Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Collabora Ltd.
