From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/9] multi_v7_defconfig: Enable options for Exynos Chromebooks
Date: Fri, 15 May 2015 13:37:58 +0200
Message-ID: <8715756.FNaYjNk3ol@wuerfel>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:50988 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934185AbbEOLiQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 May 2015 07:38:16 -0400
In-Reply-To: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: arm@kernel.org, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 14 May 2015 17:40:07 Javier Martinez Canillas wrote:
> Hello arm-soc maintainers,
> 
> This series is an attempt to reduce the delta between exynos_defconfig
> and multi_v7_defconfig. Primarily to enable the needed Kconfig symbols
> to make all Exynos Chromebooks peripherals to be working when building
> an image using the ARMv7 multi-platform default config.
> 
> Since the policy is now to now enable as much as possible, I did build
> as a module all the Kconfig symbols that were tristate and only enable
> as built-in those that can't be a module because are boolean options.
> 
> A nice side effect of this series is that I found that many drivers
> were not working properly when built as a module because the modalias
> information was not filled properly or at all. I've posted patches to
> fix the issues I found when testing this series.
> 
> The patches have been tested on an Exynos5250 Snow, Exynos5420 Peach
> Pit and Exynos5800 Peach Pi Chromebooks but most config options will
> be useful for others Exynos5 or other Samsung SoCs.
> 
> The series is composed of the following patches that can be applied on
> top of your next/defconfig branch [0].

Looks good to me. My preferred approach for merging would be to have
Kukjin pick up these patches and send a pull request, along with other
defconfig changes he might have for exynos.

If there are any problems with that, we can also pick them up directly.

	Arnd
