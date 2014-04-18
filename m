From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/5] add super device node support
Date: Fri, 18 Apr 2014 15:41:05 +0900
Message-ID: <1397803270-5377-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch series adds super device node approach and relevant
dt bindings, and rebased on top of below patch series,
   http://www.spinics.net/lists/dri-devel/msg57673.html

Thanks,
Inki Dae

Inki Dae (5):
  drm/exynos: add super device support
  ARM: dts: exynos4210-universal: add super device node for exynos drm
  ARM: dts: exynos4210-trats: add super device node for exynos drm
  ARM: dts: exynos4412-trats2: add super device node for exynos drm
  exynos/drm: add DT bindings for super device node

 .../bindings/drm/exynos/samsung-exynos-drm.txt     |   32 ++++++
 arch/arm/boot/dts/exynos4210-trats.dts             |    5 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |    5 +
 arch/arm/boot/dts/exynos4412-trats2.dts            |    5 +
 drivers/gpu/drm/exynos/exynos_dp_core.c            |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |  119 ++++++++++----------
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    7 --
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    4 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |    4 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |    4 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |    4 +-
 11 files changed, 116 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/exynos/samsung-exynos-drm.txt

-- 
1.7.9.5
