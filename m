From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v5] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Mon, 26 May 2014 15:41:19 +0800
Message-ID: <CAGS+omB642X9XtC6CdmgSFiAUr0ChgJKjVwseMj0TeD09oRq6Q@mail.gmail.com>
References: <1400845643-13644-1-git-send-email-rahul.sharma@samsung.com>
 <CAPdUM4MZOJASg2=LxGmX3ABFoytW1V5V0sieTb3HJwujY=gqtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPdUM4MZOJASg2=LxGmX3ABFoytW1V5V0sieTb3HJwujY=gqtg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, May 26, 2014 at 2:59 PM, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>
> Hi Inki,
>
> Please review this patch.
>
> Regards,
> Rahul Sharma
>
> On 23 May 2014 17:17, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> > From: Rahul Sharma <Rahul.Sharma@samsung.com>
> >
> > Fimd probe is accessing fimd Registers without enabling the fimd
> > gate clocks. If FIMD clocks are kept disabled in Uboot or disbaled
> > during kernel boottime, the system hangs during boottime.
> >
> > This issue got surfaced when verifying with sysmmu enabled. Probe of
> > fimd Sysmmu enables the master clock before accessing sysmmu regs and
> > then disables. Later fimd probe tries to read the register without
> > enabling the clock which is wrong and hangs the system.
> >
> > Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
> > ---
> > v5:
> >         1) Added pm_runtime_get_sync to enable the Display power domain.
> > v4:
> >         1) Added clk_disable for prev clock when clk_enable fails.
> > v3:
> >         1) Added checks for clk_enable.
> > v2:
> >         Rebase.
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   35 +++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > index bd30d0c..6a30415 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -898,18 +898,51 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
> >  {
> >         struct fimd_context *ctx = fimd_manager.ctx;
> >         struct drm_device *drm_dev = data;
> > -       int win;
> > +       int win, ret;
> >
> >         fimd_mgr_initialize(&fimd_manager, drm_dev);
> >         exynos_drm_crtc_create(&fimd_manager);
> >         if (ctx->display)
> >                 exynos_drm_create_enc_conn(drm_dev, ctx->display);
> >
> > +       ret = pm_runtime_get_sync(ctx->dev);
> > +       if (ret) {
> > +               dev_err(dev, "pm runtime get has failed.\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = clk_prepare_enable(ctx->bus_clk);
> > +       if (ret) {
> > +               dev_err(dev, "bus clock enable failed.\n");
> > +               goto bus_clk_err;
> > +       }
> > +
> > +       ret = clk_prepare_enable(ctx->lcd_clk);

Hi Rahul,

Can you explain why exactly we are "clearing windows" here in probe(), anyway?

IIUC, bus_clk is the clock that enables FIMD register access, and
lcd_clk clocks the scan out engine.
Therefore, if we only need to read/write some registers, we only need
the bus_clk, not lcd_clk, right?

However, fimd_clear_win() actually clears per-window registers.
Writes to per-window registers typically do not take effect until the
next vblank.
Therefore we do would need to enable lcd_clk to ensure that these
changes take effect.
Furthermore, to ensure the window clear completes during probe(), we
would also need to synchronously wait for the next vblank here - but
only if FIMD scanout is actually enabled already, otherwise there will
never be a next scanout, so we must check for that first.
Lastly, waiting around for a vblank could take a while.  Doing so in
probe() is not very friendly to boot up time, so the waiting should
probably be moved out of the main probe() thread into some sort of
asynchronous handler, which could then signal back when the clear is
complete.

Do you agree, or am I missing something?

Thanks,
-djk

>
> > +       if (ret) {
> > +               dev_err(dev, "lcd clock enable failed.\n");
> > +               goto lcd_clk_err;
> > +       }
> > +
> >         for (win = 0; win < WINDOWS_NR; win++)
> >                 fimd_clear_win(ctx, win);
> >
> > +       clk_disable_unprepare(ctx->lcd_clk);
> > +       clk_disable_unprepare(ctx->bus_clk);
> > +
> > +       ret = pm_runtime_put_sync(ctx->dev);
> > +       if (ret) {
> > +               dev_err(dev, "pm runtime put has failed.\n");
> > +               goto pm_put_err;
> > +       }
> > +
> >         return 0;
> >
> > +lcd_clk_err:
> > +       clk_disable_unprepare(ctx->bus_clk);
> > +bus_clk_err:
> > +       pm_runtime_put_sync(ctx->dev);
> > +pm_put_err:
> > +       return ret;
> >  }
> >
> >  static void fimd_unbind(struct device *dev, struct device *master,
> > --
> > 1.7.9.5
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
