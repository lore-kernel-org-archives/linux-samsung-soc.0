From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: exynos-drm: display manager fails to start without IOMMU problem
Date: Mon, 17 Oct 2016 13:45:34 -0600
Message-ID: <2173cc13-7c77-1a38-501d-2c0f522ff5d5@osg.samsung.com>
References: <CGME20160810214111epcas1p4dd2a581353b550a1992fc7695e846da7@epcas1p4.samsung.com>
 <1470850251-9150-1-git-send-email-shuahkh@osg.samsung.com>
 <57ABB1ED.1080301@samsung.com> <57ABB31E.1070802@osg.samsung.com>
 <57AE0736.6020705@osg.samsung.com> <57AE0CCB.1010708@osg.samsung.com>
 <57B29925.4020600@samsung.com>
 <ce7a035c-f881-82ac-97f6-869442d1ed47@osg.samsung.com>
 <1b2c3b31-7127-af2f-18a2-f3a28567e28d@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:37533
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936484AbcJQTpr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Oct 2016 15:45:47 -0400
In-Reply-To: <1b2c3b31-7127-af2f-18a2-f3a28567e28d@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>

Restarting the thread with a different subject line:

I haven't given up on this yet. I am still seeing the following failure:

Additional debug messages I added:
[   15.287403] exynos_drm_gem_create_ioctl() 1
[   15.287419] exynos_drm_gem_create() flags 1

[   15.311511] [drm:exynos_drm_framebuffer_init] *ERROR* Non-contiguous GEM memory is not supported.

Additional debug message I added:
[   15.318981] [drm:exynos_user_fb_create] *ERROR* failed to initialize framebuffer

This is what happens:

1. exynos_drm_gem_create_ioctl() gets called with EXYNOS_BO_NONCONTIG request
2. exynos_drm_gem_create(0 goes ahead and creates the GEM buffers
3. exynos_user_fb_create() tries to associate GEM to fb and fails during
   check_fb_gem_memory_type()

At this point, there is no recovery and lightdm fails

xf86-video-armsoc/src/drmmode_exynos/drmmode_exynos.c assumes contiguous
allocations are not supported in some exynos drm versions: The following
commit introduced this change:

https://git.linaro.org/arm/xorg/driver/xf86-video-armsoc.git/commitdiff/3be1f6273441fe95dd442f44064387322e16b7e9

excerpts from the diff:-       if (create_gem->buf_type == ARMSOC_BO_SCANOUT)
-               create_exynos.flags = EXYNOS_BO_CONTIG;
-       else
-               create_exynos.flags = EXYNOS_BO_NONCONTIG;
+
+       /* Contiguous allocations are not supported in some exynos drm versions.
+        * When they are supported all allocations are effectively contiguous
+        * anyway, so for simplicity we always request non contiguous buffers.
+        */
+       create_exynos.flags = EXYNOS_BO_NONCONTIG;

There might have been logic on exynos_drm that forced Contig when it coudn't
support NONCONTIG. At least, that is what this comment suggests. This assumption
doesn't appear to be a good one and not sure if this change was made to fix a bug.

After the IOMMU support, this assumption is no longer true. Hence, with IOMMU
support, latest kernels have a mismatch with the installed xf86-video-armsoc

This is what I am running into. This leads to the following question:

1. How do we ensure exynos_drm kernel changes don't break user-space
   specifically xf86-video-armsoc
2. This seems to have gone undetected for a while. I see a change in
   exynos_drm_gem_dumb_create() that is probably addressing this type
   of breakage. Commit 122beea84bb90236b1ae545f08267af58591c21b adds
   handling for IOMMU NONCONTIG case.

Anyway, I am interested in getting the exynos_drm kernel side code
and xf86-video-armsoc in sync to resolve the issue.

Could you recommend a going forward plan?

I can submit a patch to xf86-video-armsoc. I am also looking ahead to
see if we can avoid such breaks in the future by keeping kernel and
xf86-video-armsoc in sync.

thanks,
-- Shuah
