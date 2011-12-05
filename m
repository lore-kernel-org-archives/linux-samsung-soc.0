From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH V4 0/5] ARM: exynos: Add l2 retention mode cpuidle state
Date: Mon,  5 Dec 2011 16:36:07 +0530
Message-ID: <1323083172-14096-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:37083 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755836Ab1LELF6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Dec 2011 06:05:58 -0500
Received: by iakc1 with SMTP id c1so1947294iak.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Dec 2011 03:05:58 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, patches@linaro.org

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
for-next branch of samsung tree.
(git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next).

Amit Daniel Kachhap (5):
  ARM: exynos: Add support AFTR mode on EXYNOS4210
  ARM: exynos: save L2 settings during bootup
  ARM: s5p: add L2 early resume code
  ARM: exynos: remove useless code to save/restore L2
  ARM: exynos: Enable l2 configuration through device tree

 arch/arm/mach-exynos/cpu.c              |   60 +++++++++---
 arch/arm/mach-exynos/cpuidle.c          |  152 ++++++++++++++++++++++++++++++-
 arch/arm/mach-exynos/include/mach/pmu.h |    2 +
 arch/arm/mach-exynos/pm.c               |   15 ---
 arch/arm/plat-s5p/sleep.S               |   44 ++++++++-
 5 files changed, 233 insertions(+), 40 deletions(-)
