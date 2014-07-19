From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [exynos/g2d] enable g2d block on more SoCs
Date: Sat, 19 Jul 2014 22:53:02 +0200
Message-ID: <1405803183-6280-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:59070 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751191AbaGSVDo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jul 2014 17:03:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, inki.dae@samsung.com


Currently there is just a compatibility string for exynos5250, but
the G2D also works satisfactory on my exynos4412. Since the block
is the same (HW version 4.1), introduce exynos4212-g2d which can
be used for the G2D on the exynos4 series SoCs.
