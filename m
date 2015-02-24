From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [v3] libdrm: improvements to userspace exynos component
Date: Tue, 24 Feb 2015 15:20:38 +0100
Message-ID: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47878 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752212AbbBXOVW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 09:21:22 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org

Hello,

here are some miscellaneous improvements (small features, bugfixes, spelling fixes, etc.) for the exynos component of libdrm. The general idea is to let userspace use the G2D engine functionality more 
efficiently.

If someone is interested in an application that actually makes use of this, the RetroArch frontend has a custom video backend:
https://github.com/libretro/RetroArch/blob/master/gfx/drivers/exynos_gfx.c


Please review and let me know what I can improve.

v2:
- Mention value of G2D scaling normalization factor (02/15).
- Moved patch (04/15) description from commit message to source itself, like suggested by Joonyoung Shim.

v3:
I integrated the suggestions by Emil Velikov and added two additional patches to the series. One doing the header cleanup that Emil point out, another one just a trivial whitespace thing. I'm resending 
the whole series, since number of patches and order changed.


With best wishes,
Tobias
