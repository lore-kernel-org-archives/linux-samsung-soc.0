From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/4] drm/panel: Add Samsung prefix to panel drivers
Date: Sat, 08 Aug 2015 15:54:43 +0900
Message-ID: <55C5A7B3.2010701@samsung.com>
References: <1438964855-16989-1-git-send-email-thierry.reding@gmail.com> <1438964855-16989-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:36638 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754153AbbHHGyu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Aug 2015 02:54:50 -0400
Received: by pdco4 with SMTP id o4so52810525pdc.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Aug 2015 23:54:50 -0700 (PDT)
In-Reply-To: <1438964855-16989-3-git-send-email-thierry.reding@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

W dniu 08.08.2015 o 01:27, Thierry Reding pisze:
> From: Thierry Reding <treding@nvidia.com>
> 
> The likelihood of getting a large number of panel drivers from different
> vendors is quite high. Add a prefix to the two existing Samsung panel
> drivers to set a guideline for future patch submissions. Using vendor
> prefixes consistently should allow a cleaner organization of the tree.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/configs/exynos_defconfig                                 | 2 +-
>  arch/arm/configs/multi_v7_defconfig                               | 2 +-

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof


>  drivers/gpu/drm/panel/Kconfig                                     | 8 ++++----
>  drivers/gpu/drm/panel/Makefile                                    | 4 ++--
>  drivers/gpu/drm/panel/{panel-ld9040.c => panel-samsung-ld9040.c}  | 2 +-
>  .../gpu/drm/panel/{panel-s6e8aa0.c => panel-samsung-s6e8aa0.c}    | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
>  rename drivers/gpu/drm/panel/{panel-ld9040.c => panel-samsung-ld9040.c} (99%)
>  rename drivers/gpu/drm/panel/{panel-s6e8aa0.c => panel-samsung-s6e8aa0.c} (99%)
