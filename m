From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] exynos-drm: Fix display manager failing to start without
 IOMMU problem
Date: Wed, 10 Aug 2016 13:41:55 -0400
Message-ID: <CABxcv=nWLjcNJM+R-KeeUgLt5FPV+uhhdWemjw=OU4mY+77FVA@mail.gmail.com>
References: <1470850251-9150-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1470850251-9150-1-git-send-email-shuahkh@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, Linux Kernel <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, InKi Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Shuah,

On Wed, Aug 10, 2016 at 1:30 PM, Shuah Khan <shuahkh@osg.samsung.com> wrote:
> Fix exynos_drm_gem_create_ioctl() attempts to allocate non-contiguous GEM
> memory without IOMMU. In this case, there is no point in attempting to
> allocate non-contiguous memory, only to return error during the next step
> from exynos_drm_framebuffer_init() which leads to display manager failing
> to start.
>
> Check if non-contiguous GEM memory is requested without IOMMU. If so,
> allocate contiguous GEM memory to help display manager start.
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 4c4cb0e..4719116 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -266,6 +266,20 @@ int exynos_drm_gem_create_ioctl(struct drm_device *dev, void *data,
>         struct exynos_drm_gem *exynos_gem;
>         int ret;
>
> +       /*
> +        * Check if non-contiguous GEM memory is requested without IOMMU.
> +        * If so, allocate contiguous GEM memory.
> +        *
> +        * There is no point in attempting to allocate non-contiguous memory,
> +        * only to return error from exynos_drm_framebuffer_init() which leads
> +        * to display manager failing to start.
> +       */
> +       if (!is_drm_iommu_supported(dev) &&
> +           (args->flags & EXYNOS_BO_NONCONTIG)) {
> +               args->flags &= ~EXYNOS_BO_NONCONTIG;
> +               args->flags |= EXYNOS_BO_CONTIG;
> +       }
> +

I'm not a DRM expert so I don't know if this is the correct way to
handle this. But the approach sounds sensible to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
Javier
