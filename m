From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 0/3] drm/exynos: rotator: Add support for s5pv210
Date: Fri, 28 Dec 2018 16:19:01 +0100
Message-ID: <20181228151904.12079-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: inki.dae@samsung.com, krzk@kernel.org, airlied@linux.ie
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset adds support for s5pv210 soc, into 
Samsung DRM Rotator driver. Currently only NV12 and XRGB8888 formats
 are supported.

It was tested by using simple tool from 
https://www.spinics.net/lists/linux-samsung-soc/msg60498.html

Changes from v1:
  - fixed order of chipsets in documentation and removed ordering
    from it

Paweł Chmiel (3):
  drm/exynos: rotator: Add support for s5pv210
  dt-bindings: gpu: samsung-rotator: Document s5pv210 support
  ARM: dts: s5pv210: Add node for exynos-rotator

 .../bindings/gpu/samsung-rotator.txt          |  7 +++---
 arch/arm/boot/dts/s5pv210.dtsi                |  9 ++++++++
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 23 +++++++++++++++++++
 3 files changed, 36 insertions(+), 3 deletions(-)

-- 
2.17.1
