From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [libdrm] improvements to userspace exynos component
Date: Tue,  3 Feb 2015 14:53:50 +0100
Message-ID: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45995 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751944AbbBCNyT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 08:54:19 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org

Hello,

here are some miscellaneous improvements (small features, bugfixes, spelling fixes, etc.) for the exynos component of libdrm. The general idea is to let userspace use the G2D engine functionality more 
efficiently.

If someone is interested in an application that actually makes use of this, the RetroArch frontend has a custom video backend:
https://github.com/libretro/RetroArch/blob/master/gfx/drivers/exynos_gfx.c


Please review and let me know what I can improve.

With best wishes,
Tobias
