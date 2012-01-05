From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH V5 0/5] ARM: exynos: Add l2 retention mode cpuidle state
Date: Thu,  5 Jan 2012 09:55:20 +0530
Message-ID: <1325737525-12869-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44964 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757849Ab2AEE1N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 23:27:13 -0500
Received: by iaeh11 with SMTP id h11so277558iae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jan 2012 20:27:13 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, patches@linaro.org

Changes since V4:
*Rebased the patchset against for-next of samsung kernel tree.
*Added Tushar suggestion of putting a check if L2 cache dt node not found.
*Added Inder suggestion of removing the BUG_ON check in cpuidle driver.

Changes since V3:
*Implemented Russell feedback and moved sleep magic 4byte memory before 
s3c_cpu_resume to data section.

Changes since V2:
*Implemented the suggestion of MyungJoo Ham and used INFORM0/1
registers for resume for some board versions.
*Added back save/restore through CPU PM notifiers as suggested by 
Lorenzo Pieralisi. This is useful to restore vfp state.
*some patch modularization (s5p/exynos) and proper commit logs.  

Changes since V1:
*rebased the whole patch against 3.2-rc1 tree
*removed GIC save/restore in AFTR cpuidle state as it is external
to cpu powerdomain
*Added L2 setup code through device tree
*Removed only l2 save/restore registers in sleep

This Patch series adds support for AFTR mode cpuidle state based on
patch (http://www.spinics.net/lists/arm-kernel/msg132243.html) earlier
submitted by Jaecheol Lee <jc.lee@samsung.com>.

This patch uses CPU PM notifiers , common l2 save/restore and
new cpu_suspend/resume interfaces and is based on the tip of
for-next branch of samsung tree
(git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next)
since commit id 44ceab1ea847daa03d1d58a20c43a83e8b99a2f9.

Amit Daniel Kachhap (5):
  ARM: exynos: Add support AFTR mode on EXYNOS4210
  ARM: s5p: add L2 early resume code
  ARM: exynos: save L2 settings during bootup
  ARM: exynos: remove useless code to save/restore L2
  ARM: exynos: Enable l2 configuration through device tree

 arch/arm/mach-exynos/common.c           |   54 +++++++++---
 arch/arm/mach-exynos/cpuidle.c          |  149 ++++++++++++++++++++++++++++++-
 arch/arm/mach-exynos/include/mach/pmu.h |    2 +
 arch/arm/mach-exynos/pm.c               |   15 ---
 arch/arm/plat-s5p/sleep.S               |   44 ++++++++--
 5 files changed, 228 insertions(+), 36 deletions(-)
