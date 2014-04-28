From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC v2 PATCH v3 10/14] drm/panel: add S6E3FA0 driver
Date: Mon, 28 Apr 2014 17:05:24 +0200
Message-ID: <1852265.JnliZKqXKk@avalon>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <5275422.8CoHT7g51N@avalon> <5355C4D7.7010109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5355C4D7.7010109@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, sachin.kamat@linaro.org, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi YoungJun,

On Tuesday 22 April 2014 10:24:39 YoungJun Cho wrote:
> On 04/22/2014 08:00 AM, Laurent Pinchart wrote:
> > Hi YoungJun,
> > 
> > Thank you for the patch.
> > 
> > On Monday 21 April 2014 21:28:37 YoungJun Cho wrote:
> >> This patch adds MIPI-DSI command mode based S6E3FA0 AMOLED LCD Panel
> >> driver.
> >> 
> >> Changelog v2:
> >> - Declares delay, size properties in probe routine instead of DT
> >> Changelog v3:
> >> - Moves CPU timings relevant properties from FIMD DT
> >> 
> >>    (commented by Laurent Pinchart, Andrzej Hajda)
> >> 
> >> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> >> Acked-by: Inki Dae <inki.dae@samsung.com>
> >> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> ---
> >> 
> >>   drivers/gpu/drm/panel/Kconfig         |    7 +
> >>   drivers/gpu/drm/panel/Makefile        |    1 +
> >>   drivers/gpu/drm/panel/panel-s6e3fa0.c |  569 ++++++++++++++++++++++++++
> >>   3 files changed, 577 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c
> > 
> > [snip]
> > 
> >> diff --git a/drivers/gpu/drm/panel/panel-s6e3fa0.c
> >> b/drivers/gpu/drm/panel/panel-s6e3fa0.c new file mode 100644
> >> index 0000000..1282678
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/panel/panel-s6e3fa0.c
> >> @@ -0,0 +1,569 @@
> > 
> > [snip]
> > 
> >> +static int s6e3fa0_get_modes(struct drm_panel *panel)
> >> +{
> >> +	struct drm_connector *connector = panel->connector;
> >> +	struct s6e3fa0 *ctx = panel_to_s6e3fa0(panel);
> >> +	struct drm_display_mode *mode;
> >> +
> >> +	mode = drm_mode_create(connector->dev);
> >> +	if (!mode) {
> >> +		DRM_ERROR("failed to create a new display mode\n");
> >> +		return 0;
> >> +	}
> >> +
> >> +	drm_display_mode_from_videomode(&ctx->vm, mode);
> >> +	mode->width_mm = ctx->width_mm;
> >> +	mode->height_mm = ctx->height_mm;
> >> +	connector->display_info.width_mm = mode->width_mm;
> >> +	connector->display_info.height_mm = mode->height_mm;
> >> +
> >> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> >> +	mode->private = (void *)&ctx->cpu_timings;
> > 
> > Wouldn't it make sense to create a new get_interface_params (or similar)
> > operation for drm_panel to query interface configuration parameters
> > instead of shoving it in the mode private field ?
> 
> You mean "new get_interface_params operation" is different from
> get_modes() ?
> 
> Till now, struct drm_display_mode and most of mode relevant APIs are
> only for video interface.
> And CPU interface also needs video mode configurations.
> 
> I have a plan to implement the CPU interface relevant APIs like video
> mode ones, but I think they should be used under current DRM mode APIs
> like fill_modes, get_modes and so on.
> So after that implementation, this private field will be replaced by
> new ones.
> 
> Could you explain it in more detail?

The idea is that the interface parameters (RD/WR signals timings in this case, 
but this could also include MIPI DSI lane configuration or any other kind of 
physical interface parameters) are distinct from the video modes.

Do you see a need to tie tie interface parameters with drm_display_mode ? Can 
they be mode-specific ? In any case I'd like not to use the private field of 
drm_display_mode. If we need to tie both information together then it should 
be done in a standard way.

-- 
Regards,

Laurent Pinchart
