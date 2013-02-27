From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v5 0/5] Add DRM FIMD DT support for Exynos4 DT Machines
Date: Wed, 27 Feb 2013 14:13:35 +0530
Message-ID: <1361954620-20614-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f53.google.com ([209.85.210.53]:63726 "EHLO
	mail-da0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754832Ab3B0Iny (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 03:43:54 -0500
Received: by mail-da0-f53.google.com with SMTP id n34so190235dal.40
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Feb 2013 00:43:53 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, sachin.kamat@linaro.org, joshi@samsung.com

This patch series adds support for DRM FIMD DT for Exynos4 DT Machines,
specifically for Exynos4412 SoC.

changes since v4:
	- moved the fimd binding documentation to Documentation/devicetree/bindings/video/
	as suggested by Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

	- added more fimd compatiblity strings in fimd documentation as
	discussed at  https://patchwork.kernel.org/patch/2144861/ with
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com> and
	Tomasz Figa <tomasz.figa@gmail.com>

	- modified compatible string for exynos4 fimd as "exynos4210-fimd"
	exynos5 fimd as "exynos5250-fimd" to stick to the rule that compatible
	value should be named after first specific SoC model in which this
	particular IP version was included as discussed at
	https://patchwork.kernel.org/patch/2144861/

	- documented more about the interrupt combiner and their order as 
	suggested by Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

changes since v3:
	- rebased on
	http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=shortlog;h=refs/heads/for-next-next

changes since v2:
	- added alias to 'fimd@11c00000' node
		(reported by: Rahul Sharma <r.sh.open@gmail.com>)
	- removed 'lcd0_data' node as there was already a similar node lcd_data24
		(reported by: Jingoo Han <jg1.han@samsung.com>
	- replaced spaces with tabs in display-timing node

changes since v1:
	- added new patch to add FIMD DT binding Documentation
	- removed patch enabling SAMSUNG_DEV_BACKLIGHT and SAMSUNG_DEV_PMW 
	for mach-exynos4 DT
	- added 'status' property to fimd DT node

Is based on branch "for-next-next"
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;a=shortlog;h=refs/heads/for-next-next

Sachin Kamat (1):
  ARM: dts: Add lcd pinctrl node entries for EXYNOS4412 SoC

Vikas Sajjan (4):
  ARM: dts: Add FIMD node to exynos4
  ARM: dts: Add FIMD node and display timing node to
    exynos4412-origen.dts
  ARM: dts: add FIMD AUXDATA node entry for exynos4 DT
  ARM: exynos: dts: Add FIMD DT binding Documentation

 .../devicetree/bindings/video/exynos-fimd.txt      |   46 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4.dtsi                     |    7 +++
 arch/arm/boot/dts/exynos4412-origen.dts            |   22 ++++++++++
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi          |   14 ++++++
 arch/arm/mach-exynos/mach-exynos4-dt.c             |    2 +
 5 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/exynos-fimd.txt

-- 
1.7.9.5
