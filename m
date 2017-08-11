From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] s5p-jpeg fixes for v4.14-rc1
Date: Fri, 11 Aug 2017 19:24:14 +0200
Message-ID: <2fc2475a-248f-0ea2-a180-30419e91275e@samsung.com>
References: <CGME20170811172417epcas1p4a5ab8343231f1434e7abbca962b3b08d@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
Content-language: en-GB
Sender: linux-media-owner@vger.kernel.org
To: LMML <linux-media@vger.kernel.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


Hi Mauro,

The following changes since commit ec0c3ec497cabbf3bfa03a9eb5edcc252190a4e0:

  media: ddbridge: split code into multiple files (2017-08-09 12:17:01 -0400)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git for-v4.14/media/next-2

for you to fetch changes up to a1c60f2c60228a6c0d31e95ae4e65e6afd4655df:

  s5p-jpeg: directly use parsed subsampling on exynos5433 (2017-08-11 19:13:06 +0200)

----------------------------------------------------------------
Andrzej Pietrasiewicz (5):
      s5p-jpeg: don't overwrite result's "size" member
      s5p-jpeg: set w/h when encoding
      s5p-jpeg: disable encoder/decoder in exynos4-like hardware after use
      s5p-jpeg: fix number of components macro
      s5p-jpeg: directly use parsed subsampling on exynos5433

Tony K Nadackal (2):
      s5p-jpeg: Fix crash in jpeg isr due to multiple interrupts.
      s5p-jpeg: Clear JPEG_CODEC_ON bits in sw reset function

 drivers/media/platform/s5p-jpeg/jpeg-core.c       | 18 ++++++++++++++----
 drivers/media/platform/s5p-jpeg/jpeg-core.h       |  1 +
 drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c |  9 ++++++++-
 drivers/media/platform/s5p-jpeg/jpeg-regs.h       |  2 +-
 4 files changed, 24 insertions(+), 6 deletions(-)

-- 
Regards,
Sylwester
