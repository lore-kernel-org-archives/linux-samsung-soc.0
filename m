From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 06/14] media: platform: fix several typos
Date: Tue, 19 Feb 2019 16:31:37 +0000
Message-ID: <CA+V-a8sENpc5mHvRdZDuUJLFqxoyUvg_nhLVZPHma5BbvZBMSA@mail.gmail.com>
References: <f235ba60b2b7e5fba09d3c6b0d5dbbd8a86ea9b9.1550518128.git.mchehab+samsung@kernel.org>
 <362e90167292e8d0c03a8d0753cc26b89549d854.1550518128.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <362e90167292e8d0c03a8d0753cc26b89549d854.1550518128.git.mchehab+samsung@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michal Simek <michal.simek@xilinx.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Kukjin Kim <kgene@kernel.org>, Linux
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mauro,

On Mon, Feb 18, 2019 at 7:29 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Use codespell to fix lots of typos over frontends.
>
> Manually verified to avoid false-positives.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/media/platform/Kconfig                     |  2 +-
>  drivers/media/platform/atmel/atmel-isi.c           |  4 ++--
>  drivers/media/platform/coda/coda-jpeg.c            |  2 +-
>  drivers/media/platform/davinci/isif.c              |  4 ++--
>  drivers/media/platform/davinci/vpbe.c              |  2 +-
>  drivers/media/platform/davinci/vpif.c              |  2 +-
>  drivers/media/platform/davinci/vpif_display.c      |  4 ++--
>  .../media/platform/exynos4-is/fimc-is-command.h    |  2 +-
>  drivers/media/platform/exynos4-is/fimc-is-param.h  |  2 +-
>  drivers/media/platform/exynos4-is/media-dev.h      |  2 +-
>  drivers/media/platform/exynos4-is/mipi-csis.c      |  4 ++--
>  drivers/media/platform/marvell-ccic/mmp-driver.c   |  4 ++--
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h      |  6 +++---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  2 +-
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  4 ++--
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |  2 +-
>  .../media/platform/mtk-vcodec/vdec/vdec_h264_if.c  |  4 ++--
>  .../media/platform/mtk-vcodec/vdec/vdec_vp8_if.c   |  2 +-
>  drivers/media/platform/mtk-vcodec/vdec_drv_if.h    |  2 +-
>  drivers/media/platform/mtk-vcodec/vdec_vpu_if.h    |  2 +-
>  drivers/media/platform/omap/omap_vout.c            |  4 ++--
>  drivers/media/platform/omap/omap_voutdef.h         |  4 ++--
>  drivers/media/platform/omap3isp/isp.c              |  2 +-
>  drivers/media/platform/omap3isp/ispccdc.c          |  4 ++--
>  drivers/media/platform/omap3isp/ispcsi2.c          |  2 +-
>  drivers/media/platform/pxa_camera.c                |  2 +-
>  drivers/media/platform/qcom/venus/core.h           |  2 +-
>  drivers/media/platform/rcar-vin/rcar-dma.c         |  2 +-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c        |  4 ++--
>  drivers/media/platform/rockchip/rga/rga-hw.c       |  6 +++---
>  drivers/media/platform/s3c-camif/camif-core.h      |  2 +-
>  drivers/media/platform/s5p-jpeg/jpeg-core.h        |  4 ++--
>  drivers/media/platform/s5p-mfc/s5p_mfc_common.h    |  2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_ctrl.c      |  2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       |  2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c    |  2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_opr_v6.c    |  4 ++--
>  .../media/platform/sti/c8sectpfe/c8sectpfe-core.h  |  2 +-
>  drivers/media/platform/sti/delta/delta.h           |  2 +-
>  drivers/media/platform/sti/hva/hva-h264.c          |  2 +-
>  drivers/media/platform/stm32/stm32-dcmi.c          |  2 +-
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h |  2 +-
>  drivers/media/platform/ti-vpe/vpdma.c              | 14 +++++++-------
>  drivers/media/platform/ti-vpe/vpe.c                |  2 +-
>  drivers/media/platform/vsp1/vsp1_brx.c             |  4 ++--
>  drivers/media/platform/xilinx/xilinx-vip.c         |  2 +-
>  46 files changed, 70 insertions(+), 70 deletions(-)
>

For drivers/media/platform/davinci/*

Reviewed-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Regards,
Prabhakar
