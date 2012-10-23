From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 0/6] arm: exynos: add dt based support for exynos5 hdmi
Date: Tue, 23 Oct 2012 23:07:37 +0900
Message-ID: <021001cdb127$c1e28060$45a78120$%kim@samsung.com>
References: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56852 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932638Ab2JWOHk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 10:07:40 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC007YAN8JR4G0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:07:38 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCC007TWN8P94C0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 23:07:37 +0900 (KST)
In-reply-to: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com

Rahul Sharma wrote:
> 
> This patch set adds the DT based support for Samsung's Exynos5250. It adds
> device tree nodes for hdmi, mixer, hdmiphy and hdmiddc. The name of these
> devices are changed to the one matching with drivers. Exynos-drm and
> exynos
> hdmi-drm-commmon devices are removed from machine init code.
> 
> Exynos-drm and exynos hdmi-drm-commmon devices are removed from machine
> init code. Patch set which adds this code is posted to dri-devel list at
> http://comments.gmane.org/gmane.comp.video.dri.devel/75121.
> 
> This patchset is based on linux v3.6-rc6, branch v3.7-next/dt-samsung at
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
> v1:
> - dropped patch for hpd gpio initialisation from machine init.
> - dropped patch for platform device registration.
> - removed platform device registration from non-dt platforms.
> 
> v2:
> - removed version information from hdmi, mixer dt nodes.
> - added DT binding documentation for hdmi, mixer, hdmiphy and hdmiddc.
> 
> v3:
> - corrected indentations.
> - changed dt node names to name@address format.
> 
> v4:
> - added newline at end of device-tree binding document files.
> - removes macros for mixer, hdmi physical addresses.
> - removed @address from mixer and hdmi DT nodes.
> 
> Rahul Sharma (6):
>   dts: exynos: add device tree support for exynos5 hdmi
>   dts: exynos: add device tree support for exynos5 mixer
>   dts: exynos: add device tree support for exynos5 hdmiphy
>   dts: exynos: add device tree support for exynos5 hdmiddc
>   arm: exynos: add clocks for exynos5 hdmi
>   arm: exynos: removing exynos-drm device registration from non-dt
>     platforms
> 
>  .../devicetree/bindings/drm/exynos/hdmi.txt        |   22 +++++++++++++++
>  .../devicetree/bindings/drm/exynos/hdmiddc.txt     |   12 ++++++++
>  .../devicetree/bindings/drm/exynos/hdmiphy.txt     |   12 ++++++++
>  .../devicetree/bindings/drm/exynos/mixer.txt       |   15 ++++++++++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |   24
+++++++++++++++-
>  arch/arm/boot/dts/exynos5250.dtsi                  |   20 +++++++++++++
>  arch/arm/mach-exynos/Makefile                      |    1 -
>  arch/arm/mach-exynos/clock-exynos5.c               |   14 ++++++++-
>  arch/arm/mach-exynos/dev-drm.c                     |   29
--------------------
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 +++++
>  arch/arm/mach-exynos/mach-nuri.c                   |    3 --
>  arch/arm/mach-exynos/mach-origen.c                 |    3 --
>  arch/arm/mach-exynos/mach-smdk4x12.c               |    3 --
>  arch/arm/mach-exynos/mach-smdkv310.c               |    3 --
>  arch/arm/mach-exynos/mach-universal_c210.c         |    3 --
>  arch/arm/plat-samsung/include/plat/devs.h          |    2 -
>  16 files changed, 124 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/drm/exynos/hdmi.txt
>  create mode 100644
> Documentation/devicetree/bindings/drm/exynos/hdmiddc.txt
>  create mode 100644
> Documentation/devicetree/bindings/drm/exynos/hdmiphy.txt
>  create mode 100644 Documentation/devicetree/bindings/drm/exynos/mixer.txt
>  delete mode 100644 arch/arm/mach-exynos/dev-drm.c

Looks OK to me, will apply this whole series.

Inki, if you want to need a topic branch for this series, please let me
know. I will create it for you.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
