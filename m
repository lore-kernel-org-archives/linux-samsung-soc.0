From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 1/3] videobuf2-dma-contig: user can specify GFP flags
Date: Thu, 10 Jan 2013 15:16:43 +0100
Message-ID: <1473740.JAvhXBIMat@avalon>
References: <1357822010-30419-1-git-send-email-federico.vaga@gmail.com>
 <1357822010-30419-2-git-send-email-federico.vaga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1357822010-30419-2-git-send-email-federico.vaga@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Federico Vaga <federico.vaga@gmail.com>
Cc: Kamil Debski <k.debski@samsung.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Javier Martin <javier.martin@vista-sil.linuxdriverproject.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Sachin Kamat <sachin.kamat@linaro.org>, Prabhakar Lad <prabhakar.lad@ti.com>, Hans Verkuil <hans.verkuil@cisco.com>, Sasha Levin <sasha.levin@oracle.com>, linux-media@vger.kernel.org, Tomasz Stanislawski <t.stanislaws@samsung.com>, Pawel Osciak <pawel@osciak.com>, davinci-linux-open-source@linux.davincidsp.com, Mauro Carvalho Chehab <mchehab@infradead.org>, Jeongtae Park <jtp.park@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>S
List-Id: linux-samsung-soc@vger.kernel.org

Hi Federico,

Thanks for the patch.

On Thursday 10 January 2013 13:46:48 Federico Vaga wrote:
> This is useful when you need to specify specific GFP flags during memory
> allocation (e.g. GFP_DMA).
> 
> Signed-off-by: Federico Vaga <federico.vaga@gmail.com>
> ---
>  drivers/media/platform/blackfin/bfin_capture.c           | 2 +-
>  drivers/media/platform/coda.c                            | 2 +-
>  drivers/media/platform/davinci/vpbe_display.c            | 2 +-
>  drivers/media/platform/davinci/vpif_capture.c            | 4 ++--
>  drivers/media/platform/davinci/vpif_display.c            | 2 +-
>  drivers/media/platform/exynos-gsc/gsc-core.c             | 2 +-
>  drivers/media/platform/m2m-deinterlace.c                 | 2 +-
>  drivers/media/platform/marvell-ccic/mcam-core.c          | 2 +-
>  drivers/media/platform/mx2_emmaprp.c                     | 2 +-
>  drivers/media/platform/s3c-camif/camif-core.c            | 2 +-
>  drivers/media/platform/s5p-fimc/fimc-core.c              | 2 +-
>  drivers/media/platform/s5p-fimc/fimc-lite.c              | 2 +-
>  drivers/media/platform/s5p-g2d/g2d.c                     | 2 +-
>  drivers/media/platform/s5p-jpeg/jpeg-core.c              | 2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc.c                 | 4 ++--
>  drivers/media/platform/s5p-tv/mixer_video.c              | 2 +-
>  drivers/media/platform/sh_veu.c                          | 2 +-
>  drivers/media/platform/soc_camera/atmel-isi.c            | 2 +-
>  drivers/media/platform/soc_camera/mx2_camera.c           | 2 +-
>  drivers/media/platform/soc_camera/mx3_camera.c           | 2 +-
>  drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c | 2 +-
>  drivers/media/v4l2-core/videobuf2-dma-contig.c           | 7 +++++--
>  drivers/staging/media/davinci_vpfe/vpfe_video.c          | 2 +-
>  drivers/staging/media/dt3155v4l/dt3155v4l.c              | 2 +-
>  include/media/videobuf2-dma-contig.h                     | 2 +-
>  25 file modificati, 31 inserzioni(+), 28 rimozioni(-)

[snip]

> diff --git a/drivers/media/v4l2-core/videobuf2-dma-contig.c
> b/drivers/media/v4l2-core/videobuf2-dma-contig.c index 10beaee..00f1b85
> 100644
> --- a/drivers/media/v4l2-core/videobuf2-dma-contig.c
> +++ b/drivers/media/v4l2-core/videobuf2-dma-contig.c
> @@ -23,6 +23,7 @@
> 
>  struct vb2_dc_conf {
>  	struct device		*dev;
> +	gfp_t				mem_flags;
>  };
> 
>  struct vb2_dc_buf {
> @@ -165,7 +166,8 @@ static void *vb2_dc_alloc(void *alloc_ctx, unsigned long
> size) /* align image size to PAGE_SIZE */
>  	size = PAGE_ALIGN(size);
> 
> -	buf->vaddr = dma_alloc_coherent(dev, size, &buf->dma_addr, GFP_KERNEL);
> +	buf->vaddr = dma_alloc_coherent(dev, size, &buf->dma_addr,
> +									GFP_KERNEL | conf->mem_flags);

The only purpose of this patch is to pass GFP_DMA (or GFP_DMA32) to the DMA 
coherent allocator. Wouldn't it be easier to just set the device coherent DMA 
mask (dev->coherent_dma_mask) instead ? The DMA allocator should then select 
the appropriate GFP_DMA flags.

>  	if (!buf->vaddr) {
>  		dev_err(dev, "dma_alloc_coherent of size %ld failed\n", size);
>  		kfree(buf);
> @@ -751,7 +753,7 @@ const struct vb2_mem_ops vb2_dma_contig_memops = {
>  };
>  EXPORT_SYMBOL_GPL(vb2_dma_contig_memops);
> 
> -void *vb2_dma_contig_init_ctx(struct device *dev)
> +void *vb2_dma_contig_init_ctx(struct device *dev, gfp_t mem_flags)
>  {
>  	struct vb2_dc_conf *conf;
> 
> @@ -760,6 +762,7 @@ void *vb2_dma_contig_init_ctx(struct device *dev)
>  		return ERR_PTR(-ENOMEM);
> 
>  	conf->dev = dev;
> +	conf->mem_flags = mem_flags;
> 
>  	return conf;
>  }

[snip]

> diff --git a/include/media/videobuf2-dma-contig.h
> b/include/media/videobuf2-dma-contig.h index 8197f87..8d5a5a3 100644
> --- a/include/media/videobuf2-dma-contig.h
> +++ b/include/media/videobuf2-dma-contig.h
> @@ -24,7 +24,7 @@ vb2_dma_contig_plane_dma_addr(struct vb2_buffer *vb,
> unsigned int plane_no) return *addr;
>  }
> 
> -void *vb2_dma_contig_init_ctx(struct device *dev);
> +void *vb2_dma_contig_init_ctx(struct device *dev, gfp_t mem_flags);
>  void vb2_dma_contig_cleanup_ctx(void *alloc_ctx);
> 
>  extern const struct vb2_mem_ops vb2_dma_contig_memops;

-- 
Regards,

Laurent Pinchart
