From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH RESEND 0/2] Add regulator-haptic device tree
Date: Wed, 07 Jan 2015 23:01:51 +0900
Message-ID: <1420639313-897-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch series adds regulator-haptic device tree in rinato and monk boards.

The regulator-haptic has haptic motor and it is controlled by
voltage of regulator via force feedback framework.

Jaewon Kim (2):
  ARM: dts: exynos3250-rinato: Add regulator-haptic node for haptics
  ARM: dts: exynos3250-monk: Add regulator-haptic node for haptics

 arch/arm/boot/dts/exynos3250-monk.dts   |    7 +++++++
 arch/arm/boot/dts/exynos3250-rinato.dts |    7 +++++++
 2 files changed, 14 insertions(+)

-- 
1.7.9.5
