From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V5 0/2] video: drm: Add Device tree support to DRM-FIMD
Date: Fri, 7 Sep 2012 16:10:12 +0900
Message-ID: <CAAQKjZMBP1N-knHrojKy1=MiDqDvbHaCFJOq_1zz3nXkEK4J2w@mail.gmail.com>
References: <1347008858-12069-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:51077 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754522Ab2IGHKM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 03:10:12 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr13so3618072pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Sep 2012 00:10:12 -0700 (PDT)
In-Reply-To: <1347008858-12069-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

Applied.

Thanks.
Inki Dae

2012/9/7 Leela Krishna Amudala <l.krishna@samsung.com>:
> This patch set adds device tree support for DRM-FIMD for Samsung's Exynos5250.
> It includes parsing platform data from dts file. Also, adds the driver data
> for exynos4 and exynos5 devices.
>
> This patchset is based and tested on top of v3.6-rc4 on smdk5250 board
> Also depends on below patchset
> http://lists.freedesktop.org/archives/dri-devel/2012-August/026076.html
>
> Changes since V4:
>         - Changed the compatible string from "samsung,exynos4-fb" to
>           "samsung,exynos4-fimd".
>
> Changes since V3:
>         - Removed the fimd version from driver data and using timing base
>           address instead
>         - Removed the drm_ prefixes to the structures and fucntions
>
> Changes since V2:
>         - Added driver data to exynos5-drm-fimd as per Marek Szyprowski suggestion
>
> Changes since V1:
>         - Corrected typo errors and changed compatibility string
>
> Leela Krishna Amudala (2):
>   drm/exynos: add platform_device_id table and driver data for drm fimd
>   video: drm: exynos: Add device tree support
>
>  Documentation/devicetree/bindings/fb/drm-fimd.txt |   80 ++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c          |  138 ++++++++++++++++++++-
>  2 files changed, 212 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/fb/drm-fimd.txt
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
