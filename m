From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCHv3 0/5] drm: exynos: update/fixes to HDMI driver
Date: Wed, 16 Apr 2014 17:12:53 +0200
Message-ID: <1397661178-6016-1-git-send-email-t.stanislaws@samsung.com>
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
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, pawel.moll@arm.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, rahul.sharma@samsung.com, m.chehab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi everyone,
This patchset adds 5 fixes/updates to EXYNOS DRM driver for
HDMI subsystem.

All comments are welcome.

Regards,
Tomasz Stanislawski

Changelog:

v3:
* remove usage of s5p_hdmi_platform_data
* return MODE_CLOCK_HIGH instead of MODE_CLOCK_BAD

v2:
* fix check with gpio_is_valid()
* use U32_MAX instead of ULONG_MAX to be 64-bit-friendly
* use hdmi_driver_data as hdmi's compatile data

v1:
* initial version

Tomasz Stanislawski (5):
  drm: exynos: hdmi: remove usage of struct s5p_hdmi_platform_data
  drm: exynos: hdmi: simplify extracting hpd-gpio from DT
  drm: exynos: mixer: fix using usleep() in atomic context
  drm: exynos: add compatibles for HDMI and Mixer chips and exynos4210
    SoC
  drm: exynos: hdmi: add support for pixel clock limitation

 .../devicetree/bindings/video/exynos_hdmi.txt      |    4 ++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   49 ++++++++++----------
 drivers/gpu/drm/exynos/exynos_mixer.c              |    5 +-
 3 files changed, 33 insertions(+), 25 deletions(-)

-- 
1.7.9.5
