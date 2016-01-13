From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 0/7] drm/exynos/hdmi: add Exynos5433 support
Date: Wed, 13 Jan 2016 15:01:49 +0100
Message-ID: <569658CD.3090406@samsung.com>
References: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30057 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759679AbcAMOCS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Jan 2016 09:02:18 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0W00BBU9NSWQB0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Jan 2016 14:02:16 +0000 (GMT)
In-reply-to: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Inki,

Ping.

Regards
Andrzej

On 11/02/2015 02:16 PM, Andrzej Hajda wrote:
> Hi Inki, Krzysztof,
> 
> This patchset adds support for Exynos 5433 HDMI.
> There are also few preparation/cleanup patches.
> All patches except one touch only exynos-drm.
> Sixth patch adds binding properties for Exynos5433 HDMI,
> Krzysztof could you look at it.
> 
> The patchset is based on exynos-drm-next.
> 
> Regards
> Andrzej
> 
> 
> Andrzej Hajda (7):
>   drm/exynos/hdmi: clock code re-factoring
>   drm/exynos/hdmi: constify global variables
>   drm/exynos/hdmi: use array specifier for HDMI-PHY configurations
>   drm/exynos/hdmi: code cleanup
>   drm/exynos/hdmi: stop programming registers with default values
>   dt-bindings: exynos_hdmi: add bindings for Exynos5433 variant
>   drm/exynos/hdmi: add Exynos5433 support
> 
>  .../devicetree/bindings/video/exynos_hdmi.txt      |  27 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c               | 454 +++++++++++++++------
>  drivers/gpu/drm/exynos/regs-hdmi.h                 |   9 +-
>  3 files changed, 352 insertions(+), 138 deletions(-)
> 
