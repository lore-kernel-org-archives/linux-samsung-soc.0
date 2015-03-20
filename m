From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: drm/exynos: add async G2D execution to libdrm
Date: Fri, 20 Mar 2015 23:25:43 +0100
Message-ID: <1426890348-12807-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:53611 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751415AbbCTWZz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Mar 2015 18:25:55 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, inki.dae@samsung.com

Hello,

this series exposes async execution of G2D command buffers to userspace. Also includes is a small performance analysis test, which can also be used to 
stress test the engine. The async operation is of course also tested.

Please review and let me know what I can improve.

With best wishes,
Tobias
