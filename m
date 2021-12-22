Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB0EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Dec 2021 19:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237195AbhLVTBz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Dec 2021 14:01:55 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:26471 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231511AbhLVTBz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Dec 2021 14:01:55 -0500
X-IronPort-AV: E=Sophos;i="5.88,227,1635174000"; 
   d="scan'208";a="104382674"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Dec 2021 04:01:53 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 87E8240DF445;
        Thu, 23 Dec 2021 04:01:50 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] drm/exynos: Use platform_get_irq*() variants to fetch IRQ's
Date:   Wed, 22 Dec 2021 19:01:29 +0000
Message-Id: <20211222190134.24866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi All,

This patch series aims to drop using platform_get_resource() for IRQ types
in preparation for removal of static setup of IRQ resource from DT core
code.

Dropping usage of platform_get_resource() was agreed based on
the discussion [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (5):
  drm/exynos/exynos7_drm_decon: Use platform_get_irq_byname() to get the
    interrupt
  drm/exynos: mixer: Use platform_get_irq() to get the interrupt
  drm/exynos/exynos_drm_fimd: Use platform_get_irq_byname() to get the
    interrupt
  drm/exynos/fimc: Use platform_get_irq() to get the interrupt
  drm/exynos: gsc: Use platform_get_irq() to get the interrupt

 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 12 +++---------
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 13 +++++--------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 13 ++++---------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 10 +++-------
 drivers/gpu/drm/exynos/exynos_mixer.c      | 14 ++++++--------
 5 files changed, 21 insertions(+), 41 deletions(-)

-- 
2.17.1

