From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [REVIEW PATCH 0/3] s5p-fimc driver updates
Date: Tue, 26 Mar 2013 17:06:03 +0100
Message-ID: <1364313966-18868-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: kyungmin.park@samsung.com, myungjoo.ham@samsung.com, dh09.lee@samsung.com, shaik.samsung@gmail.com, arun.kk@samsung.com, a.hajda@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch series contains mostly conversion of the video capture node
drivers to videobuf2 ioctl/fop helpers.

Sylwester Nawrocki (3):
  s5p-fimc: Use video entity for marking media pipeline as streaming
  s5p-fimc: Use vb2 ioctl/fop helpers in FIMC capture driver
  s5p-fimc: Use vb2 ioctl helpers in fimc-lite

 drivers/media/platform/s5p-fimc/fimc-capture.c |  178 +++++++-----------------
 drivers/media/platform/s5p-fimc/fimc-lite.c    |  177 +++++++----------------
 drivers/media/platform/s5p-fimc/fimc-m2m.c     |    9 +-
 3 files changed, 100 insertions(+), 264 deletions(-)

--
1.7.9.5
