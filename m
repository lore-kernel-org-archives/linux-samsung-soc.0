From: Thibault Saunier <thibault.saunier@osg.samsung.com>
Subject: [PATCH v6 0/2] Fixes for colorspace logic in exynos-gsc and s5p-mfc drivers
Date: Wed,  1 Mar 2017 08:51:06 -0300
Message-ID: <20170301115108.14187-1-thibault.saunier@osg.samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Andi Shyti <andi.shyti@samsung.com>, linux-media@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thibault Saunier <thibault.saunier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Hans Verkuil <hans.verkuil@cisco.com>, Andrzej Hajda <a.hajda@samsung.com>, Jeongtae Park <jtp.park@sam>
List-Id: linux-samsung-soc@vger.kernel.org


Hello,

This patchset fixes a few issues on the colorspace logic for the exynos-gsc
and s5p-mfc drivers.

We now handle the colorspace in those drivers, and make sure to respect user setting if
possible.

We also now set the 'v4l2_pix_format:field' if userspace passed ANY, and
replicate users value on the capture side.

This is the sixth version of the patch serie.

Best regards,

Thibault Saunier

Changes in v6:
- Do not ever guess colorspace
- Pass user output field value to the capture as the device is not
  doing any deinterlacing and thus decoded content will still be
  interlaced on the output.

Changes in v5:
- Squash commit to always use output colorspace on the capture side
  inside this one
- Fix typo in commit message
- Just adapt the field and never error out.

Changes in v4:
- Reword commit message to better back our assumptions on specifications

Changes in v3:
- Do not check values in the g_fmt functions as Andrzej explained in previous review
- Added 'Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>'
- Do not check values in the g_fmt functions as Andrzej explained in previous review

Changes in v2:
- Fix a silly build error that slipped in while rebasing the patches

Thibault Saunier (2):
  [media] exynos-gsc: Use user configured colorspace if provided
  [media] s5p-mfc: Handle 'v4l2_pix_format:field' in try_fmt and g_fmt

 drivers/media/platform/exynos-gsc/gsc-core.c    | 9 ++++-----
 drivers/media/platform/exynos-gsc/gsc-core.h    | 1 +
 drivers/media/platform/s5p-mfc/s5p_mfc_common.h | 2 ++
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c    | 6 +++++-
 4 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.11.1
