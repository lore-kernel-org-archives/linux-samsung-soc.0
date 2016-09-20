From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: drm/exynos: probe deferral for sub drivers
Date: Wed, 21 Sep 2016 00:07:23 +0200
Message-ID: <57E1B31B.4000501@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:51118 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752126AbcITWHc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 18:07:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>

Hello,

I'm currently facing the following problem.

I want to use a devfreq device in one of the Exynos sub drivers, namely
the G2D sub driver. My current approach is to use
devfreq_get_devfreq_by_phandle() in g2d_probe(). But at the G2D probing
time the devfreq subsystem isn't initialized yet, and I get EPROBE_DEFER
back.

Now I simply let g2d_probe() fail with EPROBE_DEFER in that case.
Eventually devfreq is online and g2d_probe() runs successfully.

So far, so good. However some debugging shows that g2d_subdrv_probe(),
which does IOMMU setup and allocates the cmdlist, never happens in that
case.

I've looked at exynos_drm_load() which issues
exynos_drm_device_subdrv_probe() at some point, which apparantly only
probes those devices which are registered at that time. Hence, if the
G2D probe hasn't happened until then, the Exynos DRM won't ever see it.

That made me wonder how the driver makes sure that the sub drivers are
all readily probed in that situation. I see that a component_bind_all()
is issued prior to subdrv probing, but both the G2D and the IPP subdrv
don't have bind/unbind calls. I guess subdrv != subdrv, eh?

At present it appears that it's merely luck that the G2D is probed when
sub drivers are probed?

Anyway, probe deferral seems to work correctly with Exynos HDMI, so I
was wondering if there is some way to also make it work with the G2D?

Thanks in advance!

With best wishes,
Tobias
