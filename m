From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH 5/5] drm/exynos: enable vsync interrupt while waiting for
 vblank
Date: Fri, 20 Jun 2014 20:21:07 +0530
Message-ID: <CAPdUM4OL93KZOcTLMySv_+LLHjdCGDG0X2hhb5NxV7zp1xpP+g@mail.gmail.com>
References: <1403091293-15058-1-git-send-email-rahul.sharma@samsung.com>
 <1403091293-15058-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1403091293-15058-6-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

On 18 June 2014 17:04, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> mixer_wait_for_vblank function expects that the upcoming
> vsync interrupt handler routine will clear the
> wait_vsync_event atomic variable.
>
> For this to happen, interrupts should be enabled and
> disabled properly.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 6f18581..7927f2e 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1019,6 +1019,8 @@ static void mixer_wait_for_vblank(struct exynos_drm_manager *mgr)
>         }
>         mutex_unlock(&mixer_ctx->mixer_mutex);
>
> +       mixer_enable_vblank(mgr);
> +
>         atomic_set(&mixer_ctx->wait_vsync_event, 1);
>
>         /*
> @@ -1029,6 +1031,8 @@ static void mixer_wait_for_vblank(struct exynos_drm_manager *mgr)
>                                 !atomic_read(&mixer_ctx->wait_vsync_event),
>                                 HZ/20))
>                 DRM_DEBUG_KMS("vblank wait timed out.\n");
> +
> +       mixer_disable_vblank(mgr);
>  }

I found issue with this patch. It is causing deadlock by bypassing
vblank refcounting
and manually disabling the Interrupt.

I switched to following and it is back on track.

drm_vblank_get(mgr->crtc->dev, mixer_ctx->pipe);
drm_vblank_put(mgr->crtc->dev, mixer_ctx->pipe);

I will include this change in next version.

Regards,
Rahul Sharma.

>
>  static void mixer_window_suspend(struct exynos_drm_manager *mgr)
> --
> 1.7.9.5
>
