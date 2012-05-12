From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCHv2 0/3] Add support for DRM display subsystem
Date: Sun, 13 May 2012 08:54:55 +0900
Message-ID: <4FAEF84F.9090404@samsung.com>
References: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:42703 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754347Ab2ELWzC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 May 2012 18:55:02 -0400
Received: by pbbrp8 with SMTP id rp8so4660988pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 May 2012 15:55:02 -0700 (PDT)
In-Reply-To: <1331635180-7207-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

On 03/13/12 19:39, Marek Szyprowski wrote:
> Hello,
>
> This patch set adds support for Exynos DRM display subsystem for
> Universal C210 and NURI boards. Exynos DRM driver has been merged to 3.3
> kernel tree and provides unified and more powerful alternative for
> s3c-fb and s5p-tv drivers. V2 includes update for the latest changes in
> platform data structure (added 'panel' entry).
>
> Best regards
>
> Marek Szyprowski
> Samsung Poland R&D Center
>
> Patch summary:
>
> Marek Szyprowski (3):
>    ARM: Exynos: add platform device for core DRM subsystem
>    ARM: Exynos: Add DRM core device support for Universal C210 board
>    ARM: Exynos: Add DRM core support for NURI board
>
>   arch/arm/mach-exynos/Kconfig               |    7 ++++++
>   arch/arm/mach-exynos/Makefile              |    1 +
>   arch/arm/mach-exynos/dev-drm.c             |   29 ++++++++++++++++++++++++
>   arch/arm/mach-exynos/mach-nuri.c           |   33 ++++++++++++++++++++++++++++
>   arch/arm/mach-exynos/mach-universal_c210.c |   33 ++++++++++++++++++++++++++++
>   arch/arm/plat-samsung/include/plat/devs.h  |    2 +
>   6 files changed, 105 insertions(+), 0 deletions(-)
>   create mode 100644 arch/arm/mach-exynos/dev-drm.c
>
Applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
