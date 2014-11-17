From: Paolo Pisati <p.pisati@gmail.com>
Subject: 3.19/for-next: peachpi: phy failures
Date: Mon, 17 Nov 2014 13:09:42 +0100
Message-ID: <20141117120942.GC9844@luxor.wired.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:39049 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751644AbaKQMJs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 07:09:48 -0500
Received: by mail-wi0-f179.google.com with SMTP id ex7so8828596wid.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Nov 2014 04:09:46 -0800 (PST)
Received: from gmail.com (2-230-238-136.ip204.fastwebnet.it. [2.230.238.136])
        by mx.google.com with ESMTPSA id mw7sm15002648wib.14.2014.11.17.04.09.45
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Mon, 17 Nov 2014 04:09:45 -0800 (PST)
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Today's 3.19/for-next regressed on usb (and display panel too) on my samsung
chromebook2 peach pi.

Blindly typing i was able to login and get a dmesg, and this is the relevant
part:

...
[    0.195049] exynos-dp-video-phy 10040728.video-phy: Failed to lookup PMU regmap
[    0.195304] exynos-mipi-video-phy 10040714.video-phy: can't request region for resource [mem 0x10040714-0x1004071f]
[    0.195327] exynos-mipi-video-phy: probe of 10040714.video-phy failed with error -16
[    0.195807] samsung-usb2-phy 12130000.phy: Failed to map PMU registers (via syscon)
[    0.195836] platform 12130000.phy: Driver samsung-usb2-phy requests probe deferral
[    0.196095] exynos5_usb3drd_phy 12100000.phy: Failed to lookup PMU regmap
[    0.196124] platform 12100000.phy: Driver exynos5_usb3drd_phy requests probe deferral
[    0.196196] exynos5_usb3drd_phy 12500000.phy: Failed to lookup PMU regmap
[    0.196222] platform 12500000.phy: Driver exynos5_usb3drd_phy requests probe deferral
...

the funny thing is that usb has always worked fine for me on 318rc4, plus adding
those patches:

d10d142 arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
92dcb9d drm/exynos: dp: Remove support for unused dptx-phy
ddda2b6 ARM: exynos_defconfig: Enable options for display panel support

i got the display to work too (albeit only for fb support, drm
wasn't working yet - that's why i was trying the for-next branch).

Any idea? Has anyone tested for-next on this chromebook?
-- 
bye,
p.
