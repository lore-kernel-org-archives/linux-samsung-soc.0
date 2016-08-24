From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] Samsung media driver updates
Date: Wed, 24 Aug 2016 12:21:21 +0200
Message-ID: <c452c720-b789-0b35-3685-30785f6b4991@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: LMML <linux-media@vger.kernel.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mauro,

this includes Samsung SoC media driver fixes and cleanups for v4.9.

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git for-v4.9/media/next

for you to fetch changes up to ba0f105e7ca81a25b58a5e57ebe30fc51f116616:

  exynos4-is: fimc-is-i2c: don't print error when adding adapter fails
(2016-08-12 16:42:21 +0200)

----------------------------------------------------------------
Bhaktipriya Shridhar (1):
      s5p-mfc: Remove deprecated create_singlethread_workqueue

Javier Martinez Canillas (5):
      s5p-jpeg: set capablity bus_info as required by VIDIOC_QUERYCAP
      exynos4-is: Fix fimc_is_parse_sensor_config() nodes handling
      s5p-jpeg: only fill driver's name in capabilities driver field
      gsc-m2m: add device name sufix to bus_info capatiliby field
      gsc-m2m: improve v4l2_capability driver and card fields

Shuah Khan (6):
      media: Doc s5p-mfc add missing fields to s5p_mfc_dev structure definition
      media: s5p-mfc fix invalid memory access from s5p_mfc_release()
      media: s5p-mfc remove void function return statement
      media: s5p-mfc Fix misspelled error message and checkpatch errors
      media: s5p-mfc remove unnecessary error messages
      media: s5p-jpeg add missing blank lines after declarations

Wei Yongjun (1):
      s5p-mfc: remove redundant return value check of platform_get_resource()

Wolfram Sang (1):
      exynos4-is: fimc-is-i2c: don't print error when adding adapter fails

 drivers/media/platform/exynos-gsc/gsc-m2m.c     |  7 +++---
 drivers/media/platform/exynos4-is/fimc-is-i2c.c |  5 +---
 drivers/media/platform/exynos4-is/fimc-is.c     | 16 +++++++-----
 drivers/media/platform/s5p-jpeg/jpeg-core.c     | 20 ++++++++++-----
 drivers/media/platform/s5p-mfc/s5p_mfc.c        | 86
++++++++++++++++++++++++++++++++++++++++-------------------------
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h |  2 ++
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c    | 11 +++++----
 7 files changed, 90 insertions(+), 57 deletions(-)

-- 
Thanks,
Sylwester
