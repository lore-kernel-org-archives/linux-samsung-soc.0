From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v5] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Mon, 26 May 2014 12:29:59 +0530
Message-ID: <CAPdUM4MZOJASg2=LxGmX3ABFoytW1V5V0sieTb3HJwujY=gqtg@mail.gmail.com>
References: <1400845643-13644-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400845643-13644-1-git-send-email-rahul.sharma@samsung.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, sunil joshi <joshi@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Inki,

Please review this patch.

Regards,
Rahul Sharma

On 23 May 2014 17:17, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>
> Fimd probe is accessing fimd Registers without enabling the fimd
> gate clocks. If FIMD clocks are kept disabled in Uboot or disbaled
> during kernel boottime, the system hangs during boottime.
>
> This issue got surfaced when verifying with sysmmu enabled. Probe of
> fimd Sysmmu enables the master clock before accessing sysmmu regs and
> then disables. Later fimd probe tries to read the register without
> enabling the clock which is wrong and hangs the system.
>
> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> ---
> v5:
>         1) Added pm_runtime_get_sync to enable the Display power domain.
> v4:
>         1) Added clk_disable for prev clock when clk_enable fails.
> v3:
>         1) Added checks for clk_enable.
> v2:
>         Rebase.
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   35 +++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index bd30d0c..6a30415 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -898,18 +898,51 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  {
>         struct fimd_context *ctx = fimd_manager.ctx;
>         struct drm_device *drm_dev = data;
> -       int win;
> +       int win, ret;
>
>         fimd_mgr_initialize(&fimd_manager, drm_dev);
>         exynos_drm_crtc_create(&fimd_manager);
>         if (ctx->display)
>                 exynos_drm_create_enc_conn(drm_dev, ctx->display);
>
> +       ret = pm_runtime_get_sync(ctx->dev);
> +       if (ret) {
> +               dev_err(dev, "pm runtime get has failed.\n");
> +               return ret;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->bus_clk);
> +       if (ret) {
> +               dev_err(dev, "bus clock enable failed.\n");
> +               goto bus_clk_err;
> +       }
> +
> +       ret = clk_prepare_enable(ctx->lcd_clk);
> +       if (ret) {
> +               dev_err(dev, "lcd clock enable failed.\n");
> +               goto lcd_clk_err;
> +       }
> +
>         for (win = 0; win < WINDOWS_NR; win++)
>                 fimd_clear_win(ctx, win);
>
> +       clk_disable_unprepare(ctx->lcd_clk);
> +       clk_disable_unprepare(ctx->bus_clk);
> +
> +       ret = pm_runtime_put_sync(ctx->dev);
> +       if (ret) {
> +               dev_err(dev, "pm runtime put has failed.\n");
> +               goto pm_put_err;
> +       }
> +
>         return 0;
>
> +lcd_clk_err:
> +       clk_disable_unprepare(ctx->bus_clk);
> +bus_clk_err:
> +       pm_runtime_put_sync(ctx->dev);
> +pm_put_err:
> +       return ret;
>  }
>
>  static void fimd_unbind(struct device *dev, struct device *master,
> --
> 1.7.9.5
>
