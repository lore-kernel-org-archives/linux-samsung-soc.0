From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCH 0/2] Support for JPEG IP on Exynos542x
Date: Thu, 05 Mar 2015 12:56:34 +0100
Message-ID: <1425556596-3938-1-git-send-email-andrzej.p@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This short series adds support for JPEG IP on Exynos542x SoC.
The first patch adds necessary device tree nodes and the second
one does JPEG IP support proper. The JPEG IP on Exynos542x is
similar to what is on Exynos3250, there just slight differences.

Andrzej Pietrasiewicz (2):
  ARM: dts: exynos5420: add nodes for jpeg codec
  media: s5p-jpeg: add 5420 family support

 .../bindings/media/exynos-jpeg-codec.txt           |  2 +-
 arch/arm/boot/dts/exynos5420.dtsi                  | 18 ++++++
 drivers/media/platform/s5p-jpeg/jpeg-core.c        | 69 +++++++++++++++++-----
 drivers/media/platform/s5p-jpeg/jpeg-core.h        |  1 +
 4 files changed, 74 insertions(+), 16 deletions(-)

-- 
1.9.1
