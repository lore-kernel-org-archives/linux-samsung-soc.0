From: Thibault Saunier <thibault.saunier@osg.samsung.com>
Subject: [PATCH v2 0/4] [media] Fixes for colorspace logic in exynos-gsc and
 s5p-mfc drivers
Date: Thu,  9 Feb 2017 17:04:16 -0300
Message-ID: <20170209200420.3046-1-thibault.saunier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Inki Dae <inki.dae@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thibault Saunier <thibault.saunier@osg.samsung.com>, linux-media@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Changes since v1:
  - Fix a silly build error that slipped in while rebasing the patches

Javier Martinez Canillas (1):
  [media] exynos-gsc: Use 576p instead 720p as a threshold for
    colorspaces

Thibault Saunier (3):
  [media] exynos-gsc: Respect userspace colorspace setting
  [media] s5p-mfc: Set colorspace in VIDIO_{G,TRY}_FMT
  [media] s5p-mfc: Always check and set 'v4l2_pix_format:field' field

 drivers/media/platform/exynos-gsc/gsc-core.c | 22 +++++++++++----
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c | 42 ++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 7 deletions(-)

-- 
2.11.1
