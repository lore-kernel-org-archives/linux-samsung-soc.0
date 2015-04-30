From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC] drm/exynos: rework layer blending setup
Date: Thu, 30 Apr 2015 16:56:51 +0200
Message-ID: <1430405816-4183-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55916 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753012AbbD3O5M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Apr 2015 10:57:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com

Hello,

here's the rework of the layer blending setup that I discussed with Joonyoung in the past days. There's still 
some TODOs in the code, but more or less it does what it's supposed to do. What still bothers me a bit is that I 
currently call blending reconfig in mixer_cfg_layer(). It would be nice if this could be reduced to one call per 
"frame" (so with the last win_{commit,disable} call). Maybe atomic provides such an infrastructure?

With best wishes,
Tobias
