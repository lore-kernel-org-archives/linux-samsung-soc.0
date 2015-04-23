From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: drm/exynos: two small fixes (v2)
Date: Thu, 23 Apr 2015 14:12:24 +0200
Message-ID: <1429791146-4410-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:42199 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965508AbbDWMMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Apr 2015 08:12:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com

Hello,

I've modified the two patches in [1] so that they now apply to Inki's exynos-drm-next branch. The pixelformat one was rewritten, so that it doesn't rely on Gustavo's blending patch (which seems to need 
more discussion). The field cleanup patch was extended as Joonyoung suggested.

Since the patches changes considerably during that, I've dropped the rb tags (I'm not sure how this is handled?)

With best wishes,
Tobias


[1] http://www.spinics.net/lists/linux-samsung-soc/msg43702.html
