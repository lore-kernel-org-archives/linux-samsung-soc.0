From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL 1/5] Samsung defconfig updates for v4.2
Date: Thu, 11 Jun 2015 14:28:07 -0700
Message-ID: <7h381ydjfc.fsf@deeprootsystems.com>
References: <5571E49E.3050707@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:36056 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751385AbbFKV2K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 17:28:10 -0400
Received: by pdjm12 with SMTP id m12so10501917pdj.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2015 14:28:10 -0700 (PDT)
In-Reply-To: <5571E49E.3050707@kernel.org> (Kukjin Kim's message of "Sat, 06
	Jun 2015 03:04:14 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Kukjin Kim <kgene@kernel.org> writes:

> Hi Arnd, Olof, Kevin
>
> Here is exynos_defconfig updates for v4.2.
> Please pull.
>
> Thanks,
> Kukjin
>
> The following changes since commit 030bbdbf4c833bc69f502eae58498bc5572db736:
>
>   Linux 4.1-rc3 (2015-05-10 15:12:29 -0700)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-defconfig-2
>
> for you to fetch changes up to f882d3cfe87800000e5fa91160db401bb7a38d28:
>
>   ARM: exynos_defconfig: Enable CONFIG_SENSORS_INA2XX for Odroid-XU3
> (2015-06-03 09:31:29 +0900)
>
> ----------------------------------------------------------------
> exynos_defconfig updates for v4.2
>
> - enable DRM_EXYNOS_DSI and DRM_PANEL_S6E8AA0
>   for full X11 display on Trats2 board
> - enable SENSORS_PWM_FAN
>   to control fan power on Odroid-XU3 board
> - enable SENSORS_INA2XX
>   for power monitor sensor on Odriod-XU3 board
> - do savedefconfig
>   to remove useless configs and check its dependencies
>
> ----------------------------------------------------------------

Pulled into next/defconfig.

Thanks,

Kevin
