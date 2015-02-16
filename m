From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [v2] libdrm: improvements to userspace exynos component
Date: Mon, 16 Feb 2015 14:46:30 +0100
Message-ID: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55392 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754955AbbBPNqz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Feb 2015 08:46:55 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org

Hello,

here are some miscellaneous improvements (small features, bugfixes, spelling fixes, etc.) for the exynos component of libdrm. The general idea is to let userspace use the G2D engine functionality more 
efficiently.

If someone is interested in an application that actually makes use of this, the RetroArch frontend has a custom video backend:
https://github.com/libretro/RetroArch/blob/master/gfx/drivers/exynos_gfx.c


Please review and let me know what I can improve.

v2:
- Mention value of G2D scaling normalization factor (02/15).
- Moved patch (04/15) description from commit message to source itself, like suggested by Joonyoung Shim.

With best wishes,
Tobias
