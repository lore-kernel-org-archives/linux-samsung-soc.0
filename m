From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/5] ARM: EXYNOS: add support PM for EXYNOS5250
Date: Wed, 14 Mar 2012 07:26:25 -0700
Message-ID: <1331735190-28773-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43720 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030522Ab2CNO0m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Mar 2012 10:26:42 -0400
Received: by iagz16 with SMTP id z16so2393644iag.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Mar 2012 07:26:42 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patch adds support power management for EXYNOS5250 SoCs
and incudes regarding cleanup.

NOTE: this can be applied on top of next/soc-exynos5250-arch
of linux-samsung.git cleanly.

[PATCH 1/5] ARM: EXYNOS: Remove GIC save & restore function
[PATCH 2/5] ARM: EXYNOS: Rename of function for pm.c
[PATCH 3/5] ARM: EXYNOS: Add PMU table for EXYNOS5250
[PATCH 4/5] ARM: EXYNOS: Add Clock register list for save and
[PATCH 5/5] ARM: EXYNOS: Support suspend and resume for EXYNOS5250
