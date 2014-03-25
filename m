From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/3] DRM: Add LD9040 panel support
Date: Tue, 25 Mar 2014 13:10:33 +0100
Message-ID: <1395749436-24697-1-git-send-email-a.hajda@samsung.com>
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
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:ARM/SAMSUNG ARM A..." <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Thierry Reding <treding@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patchset adds LD9040 panel support with DT bindings.
It also adds support for this panel to Exynos4210-universal_c210 board.

Regards
Andrzej


Andrzej Hajda (3):
  panel/ld9040: add DT bindings
  drm/panel: add ld9040 driver
  ARM: dts: exynos4210-universal_c210: add proper panel node

 .../devicetree/bindings/panel/samsung,ld9040.txt   |  66 ++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |  71 +++-
 drivers/gpu/drm/panel/Kconfig                      |   6 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ld9040.c               | 377 +++++++++++++++++++++
 5 files changed, 504 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,ld9040.txt
 create mode 100644 drivers/gpu/drm/panel/panel-ld9040.c

-- 
1.8.3.2
