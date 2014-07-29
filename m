From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/3] ARM: dts: Add TMU dt node and missing data for Exynos3250
Date: Tue, 29 Jul 2014 11:17:09 +0900
Message-ID: <1406600232-31033-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, kyungmin.park@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset add TMU (Thermal Management Unit) dt node and missing pinctrl
property of uart0/1. Also, this patchset remove duplcate 'interrupt-parent'
property for code clean.

Chanwoo Choi (3):
  ARM: dts: Add TMU dt node to monitor the temperature for Exynos3250
  ARM: dts: Remove duplicate 'interrput-parent' property for Exynos3250
  ARM: dts: Add missing pinctrl for uart0/1 for Exynos3250

 arch/arm/boot/dts/exynos3250.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

-- 
1.8.0
