From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 0/1] drm/exynos: hack to support more HDMI resolutions
Date: Fri, 25 Aug 2017 16:10:04 +0200
Message-ID: <20170825141005.662-1-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:60867 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755659AbdHYOKP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 10:10:15 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, a.hajda@samsung.com, m.szyprowski@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

I was asked by a user of my kernel tree to try to upstream this. The patch is originally by Daniel who figured out this peculiar behaviour of the HDMI block.

Since this is clearly a hack, should it even be upstreamed?

Some more questions/thoughts:
- I know that it works for the HDMI block on the Exynos4412, but I guess it could also work for other Exynos SoCs. So this would require some testing by someone who has access to other boards.
- Currently the manipulation in hdmi_v14_mode_apply() is always active. Once we figure out for which hw the hack works, we could probably set a flag somewhere.
- Same goes for mixer_atomic_check() which now always accepts 1024x768 and 1280x1024. This should also depend on a flag (maybe some CRTC flag).

Feedback would be appreciated!

With best wishes,
Tobias

Daniel Drake (1):
  drm/exynos/hdmi: add 257px offset timing hack

 drivers/gpu/drm/exynos/exynos_hdmi.c  | 16 ++++++++++++----
 drivers/gpu/drm/exynos/exynos_mixer.c |  6 ++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.13.5
