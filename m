From: Tarek Dakhran <t.dakhran@gmail.com>
Subject: [PATCH v1 0/1] fix DEBUG_LL on Cortex-A7.
Date: Sun, 17 May 2015 09:42:02 +0300
Message-ID: <1431844923-4654-1-git-send-email-t.dakhran@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene@kernel.org
Cc: linux@arm.linux.org.uk, k.kozlowski@samsung.com, t.dakhran@gmail.com, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

When system boots from Cortex-A7 addruart loads
wrong base UART address. This patch fixex problem.

Patch tested on Hardkernel Odroid-XU3 board
on linux kernel v4.0.

Tarek Dakhran (1):
  ARM: EXYNOS: fix DEBUG_LL on Cortex-A7.

 arch/arm/include/debug/exynos.S | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1
