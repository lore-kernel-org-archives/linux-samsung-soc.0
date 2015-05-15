From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 7/9] ARM: multi_v7_defconfig: Enable options for Exynos
 display support
Date: Fri, 15 May 2015 09:36:14 +0900
Message-ID: <CAJKOXPfSZnrpv2g=T-UyYi-_cSN=g9DG4e8eKszY+a_rVknTqw@mail.gmail.com>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
	<1431618016-2087-8-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f45.google.com ([209.85.216.45]:43742 "EHLO
	mail-vn0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423286AbbEOAgP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 20:36:15 -0400
In-Reply-To: <1431618016-2087-8-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

2015-05-15 0:40 GMT+09:00 Javier Martinez Canillas
<javier.martinez@collabora.co.uk>:
> Many Exynos devices have devices attached to their display ports.
> This patch enables the needed Kconfig options to support different
> configuration such as simple panel, embedded DisplayPort (eDP) to
> LVDS bridges and HDMI displays.

Enabling the display would be nice but for some quite long time we had
issues with DRM on Exynos. exynos_defconfig has it enabled and most of
boards boot fine with it. Exception is Arndale 5250:
http://storage.kernelci.org/next/next-20150514/arm-exynos_defconfig/lab-khilman/boot-exynos5250-arndale.html
[    1.630290] [drm:exynos_dp_bind] *ERROR* failed: of_get_videomode() : -22
[    1.637071] exynos-drm exynos-drm: failed to bind
145b0000.dp-controller (ops exynos_dp_ops): -22
[    1.646504] exynos-drm exynos-drm: master bind failed: -22
[    1.651391] exynos-drm: probe of exynos-drm failed with error -22

Anyway it is not like I am against it... just wondering. On the other
hand enabling it could help in early detection of errors.

Best regards,
Krzysztof
