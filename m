From: Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] drm/exynos: fimd: fix buffer size calculation
Date: Mon, 13 Apr 2015 15:58:05 +0100
Message-ID: <1428937085.17459.2@mail.collabora.com>
References: <1428910167-14698-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0155642308=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1428910167-14698-1-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============0155642308==
Content-Type: multipart/alternative; boundary="=-KuuGgUhVOQKuVLGElSZF"

--=-KuuGgUhVOQKuVLGElSZF
Content-Type: text/plain; charset=utf-8; format=flowed

Hi Marek,

On Mon, 13 Apr, 2015 at 8:28 AM, Marek Szyprowski 
<m.szyprowski@samsung.com> wrote:
> Commit adacb228d72b9529f8de0769cc33414c3012054d ("drm: Exynos: Respect
> framebuffer pitch for FIMD/Mixer") changed the way of buffer size
> calcularion: it replaced fb_width by fb_pitch entry. fb_pitch however
> already contains '(win_data->bpp >> 3)' factor, so it should be 
> removed
> from final buffer size calculation formula. This patch fixes this 
> issue,
> solving possible IOMMU page fault caused by FIMD module accessing 
> memory
> outside of the given display buffer.

Yes, you're right; sorry about this. It slipped in during a rebase and 
I definitely should've caught it. This has already been fixed for -next 
in the commit Inki pointed out, but in the meantime it should 
definitely be applied to stable as a more minimal fix.

Thanks for catching this and providing the fix.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

> Signed-off by: Marek Szyprowski <m.szyprowski@samsung.com>
> CC: stable@vger.kernel.org  # v4.0+
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c 
> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 0e93ed792224..f29a13e0524c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -689,7 +689,7 @@ static void fimd_win_commit(struct 
> exynos_drm_crtc *crtc, unsigned int win)
>  	writel(val, ctx->regs + VIDWx_BUF_START(win, 0));
> 
>  	/* buffer end address */
> -	size = plane->pitch * plane->crtc_height * (plane->bpp >> 3);
> +	size = plane->pitch * plane->crtc_height;
>  	val = (unsigned long)(dma_addr + size);
>  	writel(val, ctx->regs + VIDWx_BUF_END(win, 0));
> 
> --
> 1.9.2
> 

--=-KuuGgUhVOQKuVLGElSZF
Content-Type: text/html; charset=utf-8

Hi Marek,<br><br>On Mon, 13 Apr, 2015 at 8:28 AM, Marek Szyprowski &lt;m.szyprowski@samsung.com&gt; wrote:<br>
<blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;">Commit adacb228d72b9529f8de0769cc33414c3012054d ("drm: Exynos: Respect
framebuffer pitch for FIMD/Mixer") changed the way of buffer size
calcularion: it replaced fb_width by fb_pitch entry. fb_pitch however
already contains '(win_data-&gt;bpp &gt;&gt; 3)' factor, so it should be removed
from final buffer size calculation formula. This patch fixes this issue,
solving possible IOMMU page fault caused by FIMD module accessing memory
outside of the given display buffer.</div></blockquote><div><br></div><div>Yes, you're right; sorry about this. It slipped in during a rebase and I definitely should've caught it. This has already been fixed for -next in the commit Inki pointed out, but in the meantime it should definitely be applied to stable as a more minimal fix.</div><div><br></div><div>Thanks for catching this and providing the fix.</div><div><br></div><div>Reviewed-by: Daniel Stone &lt;daniels@collabora.com&gt;</div><div><br></div><div>Cheers,</div><div>Daniel</div><br><blockquote type="cite"><div class="plaintext" style="white-space: pre-wrap;">Signed-off by: Marek Szyprowski &lt;<a href="mailto:m.szyprowski@samsung.com">m.szyprowski@samsung.com</a>&gt;
CC: <a href="mailto:stable@vger.kernel.org">stable@vger.kernel.org</a>  # v4.0+
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 0e93ed792224..f29a13e0524c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -689,7 +689,7 @@ static void fimd_win_commit(struct exynos_drm_crtc *crtc, unsigned int win)
 	writel(val, ctx-&gt;regs + VIDWx_BUF_START(win, 0));
 
 	/* buffer end address */
-	size = plane-&gt;pitch * plane-&gt;crtc_height * (plane-&gt;bpp &gt;&gt; 3);
+	size = plane-&gt;pitch * plane-&gt;crtc_height;
 	val = (unsigned long)(dma_addr + size);
 	writel(val, ctx-&gt;regs + VIDWx_BUF_END(win, 0));
 
<div>-- 
</div>1.9.2

</div></blockquote>
--=-KuuGgUhVOQKuVLGElSZF--


--===============0155642308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0155642308==--
