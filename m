From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: libdrm/exynos: fix usage of removed ioctls
Date: Fri, 16 Jan 2015 23:57:32 +0100
Message-ID: <1421449054-2808-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:49755 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750983AbbAPW5n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jan 2015 17:57:43 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org

Hello,

these two patches are needed for the exynos component of libdrm to
properly work again. With the current stable 3.18.x the 'exynos_bo_map'
call is broken, making it impossible to get data from userspace into
a DRM buffer.

The patches were sent by Hyungwon Hwang some while ago, but the first
one was very much broken, so I fixed it up. I've put the changelog
into the commit message itself.

Please apply so that the exynos component is useable again.

With best wishes,
Tobias
