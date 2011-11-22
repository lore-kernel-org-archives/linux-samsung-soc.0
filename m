From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH V3 0/6] ARM: exynos: Add l2 retention mode cpuidle state
Date: Tue, 22 Nov 2011 15:05:26 +0530
Message-ID: <1321954532-18724-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:62921 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752591Ab1KVJhW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Nov 2011 04:37:22 -0500
Received: by iage36 with SMTP id e36so8467334iag.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Nov 2011 01:37:22 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, amit.kachhap@linaro.org, patches@linaro.org

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

Amit Daniel Kachhap (6):
  ARM: exynos: Add support AFTR mode on EXYNOS4210
  ARM: s5p: remove useless churn in sleep.S
  ARM: exynos: save L2 settings during bootup
  ARM: s5p: add L2 early resume code
  ARM: exynos: remove useless code to save/restore L2
  ARM: exynos: Enable l2 configuration through device tree

 arch/arm/mach-exynos/cpu.c              |   60 +++++++++---
 arch/arm/mach-exynos/cpuidle.c          |  152 ++++++++++++++++++++++++++++++-
 arch/arm/mach-exynos/include/mach/pmu.h |    2 +
 arch/arm/mach-exynos/pm.c               |   15 ---
 arch/arm/plat-s5p/sleep.S               |   32 ++++++-
 5 files changed, 226 insertions(+), 35 deletions(-)
