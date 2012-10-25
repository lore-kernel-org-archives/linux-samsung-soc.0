From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH v4 0/6] arm: exynos: add dt based support for exynos5 hdmi
Date: Thu, 25 Oct 2012 21:08:15 +0900
Message-ID: <03ec01cdb2a9$6a3d6cc0$3eb84640$%dae@samsung.com>
References: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
 <021001cdb127$c1e28060$45a78120$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28749 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751402Ab2JYMIS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Oct 2012 08:08:18 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCG00IOP71SJ100@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Oct 2012 21:08:17 +0900 (KST)
Received: from NOINKIDAE02 ([10.90.51.52])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCG00KKD71SDP90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 25 Oct 2012 21:08:16 +0900 (KST)
In-reply-to: <021001cdb127$c1e28060$45a78120$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com



> -----Original Message-----
> From: Kukjin Kim [mailto:kgene.kim@samsung.com]
> Sent: Tuesday, October 23, 2012 11:08 PM
> To: 'Rahul Sharma'; linux-samsung-soc@vger.kernel.org; devicetree-
> discuss@lists.ozlabs.org
> Cc: tomasz.figa@gmail.com; t.stanislaws@samsung.com;
> sw0312.kim@samsung.com; inki.dae@samsung.com; jy0922.shim@samsung.com;
> kyungmin.park@samsung.com; thomas.ab@samsung.com; prashanth.g@samsung.com;
> joshi@samsung.com; s.shirish@samsung.com; r.sh.open@gmail.com
> Subject: RE: [PATCH v4 0/6] arm: exynos: add dt based support for exynos5
> hdmi
> 
> Rahul Sharma wrote:
> >
> > This patch set adds the DT based support for Samsung's Exynos5250. It
> adds
> > device tree nodes for hdmi, mixer, hdmiphy and hdmiddc. The name of
> these
> > devices are changed to the one matching with drivers. Exynos-drm and
> > exynos
> > hdmi-drm-commmon devices are removed from machine init code.
> >
> > Exynos-drm and exynos hdmi-drm-commmon devices are removed from machine
> > init code. Patch set which adds this code is posted to dri-devel list at
> > http://comments.gmane.org/gmane.comp.video.dri.devel/75121.
> >
> > This patchset is based on linux v3.6-rc6, branch v3.7-next/dt-samsung at
> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> >
> > v1:
> > - dropped patch for hpd gpio initialisation from machine init.
> > - dropped patch for platform device registration.
> > - removed platform device registration from non-dt platforms.
> >
> > v2:
> > - removed version information from hdmi, mixer dt nodes.
> > - added DT binding documentation for hdmi, mixer, hdmiphy and hdmiddc.
> >
> > v3:
> > - corrected indentations.
> > - changed dt node names to name@address format.
> >
> > v4:
> > - added newline at end of device-tree binding document files.
> > - removes macros for mixer, hdmi physical addresses.
> > - removed @address from mixer and hdmi DT nodes.
> >
> > Rahul Sharma (6):
> >   dts: exynos: add device tree support for exynos5 hdmi
> >   dts: exynos: add device tree support for exynos5 mixer
> >   dts: exynos: add device tree support for exynos5 hdmiphy
> >   dts: exynos: add device tree support for exynos5 hdmiddc
> >   arm: exynos: add clocks for exynos5 hdmi
> >   arm: exynos: removing exynos-drm device registration from non-dt
> >     platforms
> >
> >  .../devicetree/bindings/drm/exynos/hdmi.txt        |   22
+++++++++++++++
> >  .../devicetree/bindings/drm/exynos/hdmiddc.txt     |   12 ++++++++
> >  .../devicetree/bindings/drm/exynos/hdmiphy.txt     |   12 ++++++++
> >  .../devicetree/bindings/drm/exynos/mixer.txt       |   15 ++++++++++
> >  arch/arm/boot/dts/exynos5250-smdk5250.dts          |   24
> +++++++++++++++-
> >  arch/arm/boot/dts/exynos5250.dtsi                  |   20 +++++++++++++
> >  arch/arm/mach-exynos/Makefile                      |    1 -
> >  arch/arm/mach-exynos/clock-exynos5.c               |   14 ++++++++-
> >  arch/arm/mach-exynos/dev-drm.c                     |   29
> --------------------
> >  arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 +++++
> >  arch/arm/mach-exynos/mach-nuri.c                   |    3 --
> >  arch/arm/mach-exynos/mach-origen.c                 |    3 --
> >  arch/arm/mach-exynos/mach-smdk4x12.c               |    3 --
> >  arch/arm/mach-exynos/mach-smdkv310.c               |    3 --
> >  arch/arm/mach-exynos/mach-universal_c210.c         |    3 --
> >  arch/arm/plat-samsung/include/plat/devs.h          |    2 -
> >  16 files changed, 124 insertions(+), 50 deletions(-)
> >  create mode 100644
> Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
> >  create mode 100644
> Documentation/devicetree/bindings/drm/exynos/mixer.txt
> >  delete mode 100644 arch/arm/mach-exynos/dev-drm.c
> 
> Looks OK to me, will apply this whole series.
> 
> Inki, if you want to need a topic branch for this series, please let me
> know. I will create it for you.
> 

Please merge them. After that, we will. So no need any topic branch. We had
already been tested with the above patch set and worked fine.

Thanks,
Inki Dae

> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
