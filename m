From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC] drm/exynos: improve pixel format handling
Date: Wed, 15 Apr 2015 17:01:54 +0200
Message-ID: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:56644 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755570AbbDOPCM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Apr 2015 11:02:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com

Hello,

this is an attempt to somewhat improve the handling for supported
pixel formats in the Exynos DRM. Currently DRM planes are always
created with XRGB8888, ARGB8888 and NV12 as supported formats,
even though the formats depend on the 'consumer' (mixer, FIMD,
video processor, etc.).

This series is based on the remaining patches of this series:
http://www.spinics.net/lists/linux-samsung-soc/msg43103.html

With best wishes,
Tobias
