From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/4] drm/bridge: Add vendor prefixes
Date: Sat, 08 Aug 2015 15:53:10 +0900
Message-ID: <55C5A756.7050308@samsung.com>
References: <1438964855-16989-1-git-send-email-thierry.reding@gmail.com> <1438964855-16989-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:33534 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754098AbbHHGxZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Aug 2015 02:53:25 -0400
Received: by pabyb7 with SMTP id yb7so70270484pab.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Aug 2015 23:53:25 -0700 (PDT)
In-Reply-To: <1438964855-16989-2-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

W dniu 08.08.2015 o 01:27, Thierry Reding pisze:
> From: Thierry Reding <treding@nvidia.com>
> 
> Use vendor prefixes for Kconfig symbols and filenames. This should make
> it easier to identify the various bridge drivers and to organize the
> directory.
> 
> While at it, rename dw_hdmi.[ch] to dw-hdmi.[ch] for consistency.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/configs/exynos_defconfig                    |  4 ++--
>  arch/arm/configs/multi_v7_defconfig                  |  4 ++--
>  drivers/gpu/drm/bridge/Kconfig                       | 10 +++++-----
>  drivers/gpu/drm/bridge/Makefile                      |  6 +++---
>  drivers/gpu/drm/bridge/{dw_hdmi.c => dw-hdmi.c}      |  2 +-
>  drivers/gpu/drm/bridge/{dw_hdmi.h => dw-hdmi.h}      |  0
>  drivers/gpu/drm/bridge/{ptn3460.c => nxp-ptn3460.c}  |  0
>  drivers/gpu/drm/bridge/{ps8622.c => parade-ps8622.c} |  0
>  8 files changed, 13 insertions(+), 13 deletions(-)
>  rename drivers/gpu/drm/bridge/{dw_hdmi.c => dw-hdmi.c} (99%)
>  rename drivers/gpu/drm/bridge/{dw_hdmi.h => dw-hdmi.h} (100%)
>  rename drivers/gpu/drm/bridge/{ptn3460.c => nxp-ptn3460.c} (100%)
>  rename drivers/gpu/drm/bridge/{ps8622.c => parade-ps8622.c} (100%)

I assume this will go through some DRM tree? If yes then:
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
