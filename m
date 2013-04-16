From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/3] drm/exynos: Add device tree support for IPP driver
Date: Tue, 16 Apr 2013 19:31:23 +0200
Message-ID: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: inki.dae@samsung.com
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Inki,

This small patch series adds device tree support for the DRM FIMC driver.
The binding documentation can be found in -next at Documentation/devicetree/
bindings/media/samsung-fimc.txt.
It will make the driver dependent on OF. This patch series is needed in
3.10 to ensure simultaneous operation of the DRM FIMC and the camera ISP
on Exynos4x12.

Thanks,
Sylwester

Sylwester Nawrocki (3):
  drm/exynos: Remove redundant devm_kfree()
  drm/exynos: Rework fimc clocks handling
  drm/exynos: Add device tree support for fimc ipp driver

 drivers/gpu/drm/exynos/Kconfig           |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c |  263 ++++++++++++++++--------------
 drivers/gpu/drm/exynos/regs-fimc.h       |    7 +-
 3 files changed, 147 insertions(+), 125 deletions(-)

--
1.7.9.5
