From: "Tobias Jakobi" <Liquid.Acid@gmx.net>
Subject: Aw: [PATCH 3/8] drm/exynos: remove struct *_win_data abstraction on
 planes
Date: Tue, 31 Mar 2015 17:53:13 +0200
Message-ID: <trinity-d2f9c441-f8d4-40a4-b51b-c450e5d9aff5-1427817193699@3capp-gmx-bs24>
References: <1427816827-14867-1-git-send-email-gustavo@padovan.org>,
 <1427816827-14867-4-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:56219 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750774AbbCaPxh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 11:53:37 -0400
In-Reply-To: <1427816827-14867-4-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hello,

I just wanted to point out that this doesn't apply to exynos-drm-fixes,=
 which was probably caused by Daniel's pitch patch here:
https://git.kernel.org/cgit/linux/kernel/git/daeinki/drm-exynos.git/com=
mit/?h=3Dexynos-drm-fixes&id=3D57aaaf373ede95ebaaf90695071f7b1f4a97795f

With best wishes,
Tobias


Gesendet:=C2=A0Dienstag, 31. M=C3=A4rz 2015 um 17:47 Uhr
Von:=C2=A0"Gustavo Padovan" <gustavo@padovan.org>
An:=C2=A0linux-samsung-soc@vger.kernel.org
Cc:=C2=A0dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.=
shim@samsung.com, "Gustavo Padovan" <gustavo.padovan@collabora.co.uk>
Betreff:=C2=A0[PATCH 3/8] drm/exynos: remove struct *_win_data abstract=
ion on planes
=46rom: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

struct {fimd,mixer,vidi}_win_data was just keeping the same data
as struct exynos_drm_plane thus get ride of it and use exynos_drm_plane
directly.

It changes how planes are created and remove .win_mode_set() callback
that was only filling all *_win_data structs.

v2: check for return of exynos_plane_init()

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

fixup! drm/exynos: remove struct *_win_data abstraction on planes
---
drivers/gpu/drm/exynos/exynos7_drm_decon.c | 166 ++++++++--------------
drivers/gpu/drm/exynos/exynos_drm_crtc.c | 9 +-
drivers/gpu/drm/exynos/exynos_drm_crtc.h | 1 +
drivers/gpu/drm/exynos/exynos_drm_drv.c | 14 --
drivers/gpu/drm/exynos/exynos_drm_drv.h | 5 +-
drivers/gpu/drm/exynos/exynos_drm_fimd.c | 184 ++++++++++--------------=
-
drivers/gpu/drm/exynos/exynos_drm_plane.c | 23 +---
drivers/gpu/drm/exynos/exynos_drm_plane.h | 6 +-
drivers/gpu/drm/exynos/exynos_drm_vidi.c | 125 +++++------------
drivers/gpu/drm/exynos/exynos_mixer.c | 214 ++++++++++-----------------=
--
10 files changed, 250 insertions(+), 497 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/d=
rm/exynos/exynos7_drm_decon.c
index 63f02e2..cd67037 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -28,6 +28,7 @@
#include <video/exynos7_decon.h>

#include "exynos_drm_crtc.h"
+#include "exynos_drm_plane.h"
#include "exynos_drm_drv.h"
#include "exynos_drm_fbdev.h"
#include "exynos_drm_iommu.h"
@@ -41,32 +42,16 @@

#define WINDOWS_NR 2

-struct decon_win_data {
- unsigned int ovl_x;
- unsigned int ovl_y;
- unsigned int offset_x;
- unsigned int offset_y;
- unsigned int ovl_width;
- unsigned int ovl_height;
- unsigned int fb_width;
- unsigned int fb_height;
- unsigned int bpp;
- unsigned int pixel_format;
- dma_addr_t dma_addr;
- bool enabled;
- bool resume;
-};
-
struct decon_context {
struct device *dev;
struct drm_device *drm_dev;
struct exynos_drm_crtc *crtc;
+ struct exynos_drm_plane planes[WINDOWS_NR];
struct clk *pclk;
struct clk *aclk;
struct clk *eclk;
struct clk *vclk;
void __iomem *regs;
- struct decon_win_data win_data[WINDOWS_NR];
unsigned int default_win;
unsigned long irq_flags;
bool i80_if;
@@ -296,59 +281,16 @@ static void decon_disable_vblank(struct exynos_dr=
m_crtc *crtc)
}
}

-static void decon_win_mode_set(struct exynos_drm_crtc *crtc,
- struct exynos_drm_plane *plane)
-{
- struct decon_context *ctx =3D crtc->ctx;
- struct decon_win_data *win_data;
- int win, padding;
-
- if (!plane) {
- DRM_ERROR("plane is NULL\n");
- return;
- }
-
- win =3D plane->zpos;
- if (win =3D=3D DEFAULT_ZPOS)
- win =3D ctx->default_win;
-
- if (win < 0 || win >=3D WINDOWS_NR)
- return;
-
-
- win_data =3D &ctx->win_data[win];
-
- padding =3D (plane->pitch / (plane->bpp >> 3)) - plane->fb_width;
- win_data->offset_x =3D plane->fb_x;
- win_data->offset_y =3D plane->fb_y;
- win_data->fb_width =3D plane->fb_width + padding;
- win_data->fb_height =3D plane->fb_height;
- win_data->ovl_x =3D plane->crtc_x;
- win_data->ovl_y =3D plane->crtc_y;
- win_data->ovl_width =3D plane->crtc_width;
- win_data->ovl_height =3D plane->crtc_height;
- win_data->dma_addr =3D plane->dma_addr[0];
- win_data->bpp =3D plane->bpp;
- win_data->pixel_format =3D plane->pixel_format;
-
- DRM_DEBUG_KMS("offset_x =3D %d, offset_y =3D %d\n",
- win_data->offset_x, win_data->offset_y);
- DRM_DEBUG_KMS("ovl_width =3D %d, ovl_height =3D %d\n",
- win_data->ovl_width, win_data->ovl_height);
- DRM_DEBUG_KMS("paddr =3D 0x%lx\n", (unsigned long)win_data->dma_addr)=
;
- DRM_DEBUG_KMS("fb_width =3D %d, crtc_width =3D %d\n",
- plane->fb_width, plane->crtc_width);
-}
-
static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned in=
t win)
{
- struct decon_win_data *win_data =3D &ctx->win_data[win];
+ struct exynos_drm_plane *plane =3D &ctx->planes[win];
unsigned long val;
+ int padding;

val =3D readl(ctx->regs + WINCON(win));
val &=3D ~WINCONx_BPPMODE_MASK;

- switch (win_data->pixel_format) {
+ switch (plane->pixel_format) {
case DRM_FORMAT_RGB565:
val |=3D WINCONx_BPPMODE_16BPP_565;
val |=3D WINCONx_BURSTLEN_16WORD;
@@ -397,7 +339,7 @@ static void decon_win_set_pixfmt(struct decon_conte=
xt *ctx, unsigned int win)
break;
}

- DRM_DEBUG_KMS("bpp =3D %d\n", win_data->bpp);
+ DRM_DEBUG_KMS("bpp =3D %d\n", plane->bpp);

/*
* In case of exynos, setting dma-burst to 16Word causes permanent
@@ -407,7 +349,8 @@ static void decon_win_set_pixfmt(struct decon_conte=
xt *ctx, unsigned int win)
* movement causes unstable DMA which results into iommu crash/tear.
*/

- if (win_data->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
+ padding =3D (plane->pitch / (plane->bpp >> 3)) - plane->fb_width;
+ if (plane->fb_width + padding < MIN_FB_WIDTH_FOR_16WORD_BURST) {
val &=3D ~WINCONx_BURSTLEN_MASK;
val |=3D WINCONx_BURSTLEN_8WORD;
}
@@ -453,8 +396,8 @@ static void decon_win_commit(struct exynos_drm_crtc=
 *crtc, int zpos)
{
struct decon_context *ctx =3D crtc->ctx;
struct drm_display_mode *mode =3D &crtc->base.mode;
- struct decon_win_data *win_data;
- int win =3D zpos;
+ struct exynos_drm_plane *plane;
+ int padding, win =3D zpos;
unsigned long val, alpha;
unsigned int last_x;
unsigned int last_y;
@@ -468,11 +411,11 @@ static void decon_win_commit(struct exynos_drm_cr=
tc *crtc, int zpos)
if (win < 0 || win >=3D WINDOWS_NR)
return;

- win_data =3D &ctx->win_data[win];
+ plane =3D &ctx->planes[win];

/* If suspended, enable this on resume */
if (ctx->suspended) {
- win_data->resume =3D true;
+ plane->resume =3D true;
return;
}

@@ -490,39 +433,41 @@ static void decon_win_commit(struct exynos_drm_cr=
tc *crtc, int zpos)
decon_shadow_protect_win(ctx, win, true);

/* buffer start address */
- val =3D (unsigned long)win_data->dma_addr;
+ val =3D (unsigned long)plane->dma_addr[0];
writel(val, ctx->regs + VIDW_BUF_START(win));

+ padding =3D (plane->pitch / (plane->bpp >> 3)) - plane->fb_width;
+
/* buffer size */
- writel(win_data->fb_width, ctx->regs + VIDW_WHOLE_X(win));
- writel(win_data->fb_height, ctx->regs + VIDW_WHOLE_Y(win));
+ writel(plane->fb_width + padding, ctx->regs + VIDW_WHOLE_X(win));
+ writel(plane->fb_height, ctx->regs + VIDW_WHOLE_Y(win));

/* offset from the start of the buffer to read */
- writel(win_data->offset_x, ctx->regs + VIDW_OFFSET_X(win));
- writel(win_data->offset_y, ctx->regs + VIDW_OFFSET_Y(win));
+ writel(plane->fb_x, ctx->regs + VIDW_OFFSET_X(win));
+ writel(plane->fb_y, ctx->regs + VIDW_OFFSET_Y(win));

DRM_DEBUG_KMS("start addr =3D 0x%lx\n",
- (unsigned long)win_data->dma_addr);
+ (unsigned long)val);
DRM_DEBUG_KMS("ovl_width =3D %d, ovl_height =3D %d\n",
- win_data->ovl_width, win_data->ovl_height);
+ plane->crtc_width, plane->crtc_height);

/*
* OSD position.
* In case the window layout goes of LCD layout, DECON fails.
*/
- if ((win_data->ovl_x + win_data->ovl_width) > mode->hdisplay)
- win_data->ovl_x =3D mode->hdisplay - win_data->ovl_width;
- if ((win_data->ovl_y + win_data->ovl_height) > mode->vdisplay)
- win_data->ovl_y =3D mode->vdisplay - win_data->ovl_height;
+ if ((plane->crtc_x + plane->crtc_width) > mode->hdisplay)
+ plane->crtc_x =3D mode->hdisplay - plane->crtc_width;
+ if ((plane->crtc_y + plane->crtc_height) > mode->vdisplay)
+ plane->crtc_y =3D mode->vdisplay - plane->crtc_height;

- val =3D VIDOSDxA_TOPLEFT_X(win_data->ovl_x) |
- VIDOSDxA_TOPLEFT_Y(win_data->ovl_y);
+ val =3D VIDOSDxA_TOPLEFT_X(plane->crtc_x) |
+ VIDOSDxA_TOPLEFT_Y(plane->crtc_y);
writel(val, ctx->regs + VIDOSD_A(win));

- last_x =3D win_data->ovl_x + win_data->ovl_width;
+ last_x =3D plane->crtc_x + plane->crtc_width;
if (last_x)
last_x--;
- last_y =3D win_data->ovl_y + win_data->ovl_height;
+ last_y =3D plane->crtc_y + plane->crtc_height;
if (last_y)
last_y--;

@@ -531,7 +476,7 @@ static void decon_win_commit(struct exynos_drm_crtc=
 *crtc, int zpos)
writel(val, ctx->regs + VIDOSD_B(win));

DRM_DEBUG_KMS("osd pos: tx =3D %d, ty =3D %d, bx =3D %d, by =3D %d\n",
- win_data->ovl_x, win_data->ovl_y, last_x, last_y);
+ plane->crtc_x, plane->crtc_y, last_x, last_y);

/* OSD alpha */
alpha =3D VIDOSDxC_ALPHA0_R_F(0x0) |
@@ -565,13 +510,13 @@ static void decon_win_commit(struct exynos_drm_cr=
tc *crtc, int zpos)
val |=3D DECON_UPDATE_STANDALONE_F;
writel(val, ctx->regs + DECON_UPDATE);

- win_data->enabled =3D true;
+ plane->enabled =3D true;
}

static void decon_win_disable(struct exynos_drm_crtc *crtc, int zpos)
{
struct decon_context *ctx =3D crtc->ctx;
- struct decon_win_data *win_data;
+ struct exynos_drm_plane *plane;
int win =3D zpos;
u32 val;

@@ -581,11 +526,11 @@ static void decon_win_disable(struct exynos_drm_c=
rtc *crtc, int zpos)
if (win < 0 || win >=3D WINDOWS_NR)
return;

- win_data =3D &ctx->win_data[win];
+ plane =3D &ctx->planes[win];

if (ctx->suspended) {
/* do not resume this window*/
- win_data->resume =3D false;
+ plane->resume =3D false;
return;
}

@@ -604,42 +549,42 @@ static void decon_win_disable(struct exynos_drm_c=
rtc *crtc, int zpos)
val |=3D DECON_UPDATE_STANDALONE_F;
writel(val, ctx->regs + DECON_UPDATE);

- win_data->enabled =3D false;
+ plane->enabled =3D false;
}

static void decon_window_suspend(struct decon_context *ctx)
{
- struct decon_win_data *win_data;
+ struct exynos_drm_plane *plane;
int i;

for (i =3D 0; i < WINDOWS_NR; i++) {
- win_data =3D &ctx->win_data[i];
- win_data->resume =3D win_data->enabled;
- if (win_data->enabled)
+ plane =3D &ctx->planes[i];
+ plane->resume =3D plane->enabled;
+ if (plane->enabled)
decon_win_disable(ctx->crtc, i);
}
}

static void decon_window_resume(struct decon_context *ctx)
{
- struct decon_win_data *win_data;
+ struct exynos_drm_plane *plane;
int i;

for (i =3D 0; i < WINDOWS_NR; i++) {
- win_data =3D &ctx->win_data[i];
- win_data->enabled =3D win_data->resume;
- win_data->resume =3D false;
+ plane =3D &ctx->planes[i];
+ plane->enabled =3D plane->resume;
+ plane->resume =3D false;
}
}

static void decon_apply(struct decon_context *ctx)
{
- struct decon_win_data *win_data;
+ struct exynos_drm_plane *plane;
int i;

for (i =3D 0; i < WINDOWS_NR; i++) {
- win_data =3D &ctx->win_data[i];
- if (win_data->enabled)
+ plane =3D &ctx->planes[i];
+ if (plane->enabled)
decon_win_commit(ctx->crtc, i);
else
decon_win_disable(ctx->crtc, i);
@@ -779,7 +724,6 @@ static struct exynos_drm_crtc_ops decon_crtc_ops =3D=
 {
=2Eenable_vblank =3D decon_enable_vblank,
=2Edisable_vblank =3D decon_disable_vblank,
=2Ewait_for_vblank =3D decon_wait_for_vblank,
- .win_mode_set =3D decon_win_mode_set,
=2Ewin_commit =3D decon_win_commit,
=2Ewin_disable =3D decon_win_disable,
};
@@ -818,7 +762,9 @@ static int decon_bind(struct device *dev, struct de=
vice *master, void *data)
{
struct decon_context *ctx =3D dev_get_drvdata(dev);
struct drm_device *drm_dev =3D data;
- int ret;
+ struct exynos_drm_plane *exynos_plane;
+ enum drm_plane_type type;
+ int zpos, ret;

ret =3D decon_ctx_initialize(ctx, drm_dev);
if (ret) {
@@ -826,8 +772,18 @@ static int decon_bind(struct device *dev, struct d=
evice *master, void *data)
return ret;
}

- ctx->crtc =3D exynos_drm_crtc_create(drm_dev, ctx->pipe,
- EXYNOS_DISPLAY_TYPE_LCD,
+ for (zpos =3D 0; zpos < WINDOWS_NR; zpos++) {
+ type =3D (zpos =3D=3D ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
+ DRM_PLANE_TYPE_OVERLAY;
+ ret =3D exynos_plane_init(drm_dev, &ctx->planes[zpos],
+ 1 << ctx->pipe, type);
+ if (ret)
+ return ret;
+ }
+
+ exynos_plane =3D &ctx->planes[ctx->default_win];
+ ctx->crtc =3D exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
+ ctx->pipe, EXYNOS_DISPLAY_TYPE_LCD,
&decon_crtc_ops, ctx);
if (IS_ERR(ctx->crtc)) {
decon_ctx_remove(ctx);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm=
/exynos/exynos_drm_crtc.c
index 48ccab7..47dd2b0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -239,13 +239,13 @@ static struct drm_crtc_funcs exynos_crtc_funcs =3D=
 {
};

struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_d=
ev,
+ struct drm_plane *plane,
int pipe,
enum exynos_drm_output_type type,
struct exynos_drm_crtc_ops *ops,
void *ctx)
{
struct exynos_drm_crtc *exynos_crtc;
- struct drm_plane *plane;
struct exynos_drm_private *private =3D drm_dev->dev_private;
struct drm_crtc *crtc;
int ret;
@@ -262,12 +262,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(str=
uct drm_device *drm_dev,
exynos_crtc->type =3D type;
exynos_crtc->ops =3D ops;
exynos_crtc->ctx =3D ctx;
- plane =3D exynos_plane_init(drm_dev, 1 << pipe,
- DRM_PLANE_TYPE_PRIMARY);
- if (IS_ERR(plane)) {
- ret =3D PTR_ERR(plane);
- goto err_plane;
- }

crtc =3D &exynos_crtc->base;

@@ -284,7 +278,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(stru=
ct drm_device *drm_dev,

err_crtc:
plane->funcs->destroy(plane);
-err_plane:
kfree(exynos_crtc);
return ERR_PTR(ret);
}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm=
/exynos/exynos_drm_crtc.h
index 6258b80..e1fd2ef 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -18,6 +18,7 @@
#include "exynos_drm_drv.h"

struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_d=
ev,
+ struct drm_plane *plane,
int pipe,
enum exynos_drm_output_type type,
struct exynos_drm_crtc_ops *ops,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/=
exynos/exynos_drm_drv.c
index 90168d7..bb6e7f7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -55,7 +55,6 @@ static int exynos_drm_load(struct drm_device *dev, un=
signed long flags)
{
struct exynos_drm_private *private;
int ret;
- int nr;

private =3D kzalloc(sizeof(struct exynos_drm_private), GFP_KERNEL);
if (!private)
@@ -81,19 +80,6 @@ static int exynos_drm_load(struct drm_device *dev, u=
nsigned long flags)

exynos_drm_mode_config_init(dev);

- for (nr =3D 0; nr < MAX_PLANE; nr++) {
- struct drm_plane *plane;
- unsigned long possible_crtcs =3D (1 << MAX_CRTC) - 1;
-
- plane =3D exynos_plane_init(dev, possible_crtcs,
- DRM_PLANE_TYPE_OVERLAY);
- if (!IS_ERR(plane))
- continue;
-
- ret =3D PTR_ERR(plane);
- goto err_mode_config_cleanup;
- }
-
/* setup possible_clones. */
exynos_drm_encoder_setup(dev);

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/=
exynos/exynos_drm_drv.h
index 4e8f0b0..8a2f943 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -78,6 +78,7 @@ enum exynos_drm_output_type {
* @transparency: transparency on or off.
* @activated: activated or not.
* @enabled: enabled or not.
+ * @resume: to resume or not.
*
* this structure is common to exynos SoC and its contents would be copi=
ed
* to hardware specific overlay info.
@@ -112,6 +113,7 @@ struct exynos_drm_plane {
bool transparency:1;
bool activated:1;
bool enabled:1;
+ bool resume:1;
};

/*
@@ -172,7 +174,6 @@ struct exynos_drm_display {
* @disable_vblank: specific driver callback for disabling vblank interr=
upt.
* @wait_for_vblank: wait for vblank interrupt to make sure that
* hardware overlay is updated.
- * @win_mode_set: copy drm overlay info to hw specific overlay info.
* @win_commit: apply hardware specific overlay data to registers.
* @win_disable: disable hardware specific overlay.
* @te_handler: trigger to transfer video image at the tearing effect
@@ -188,8 +189,6 @@ struct exynos_drm_crtc_ops {
int (*enable_vblank)(struct exynos_drm_crtc *crtc);
void (*disable_vblank)(struct exynos_drm_crtc *crtc);
void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
- void (*win_mode_set)(struct exynos_drm_crtc *crtc,
- struct exynos_drm_plane *plane);
void (*win_commit)(struct exynos_drm_crtc *crtc, int zpos);
void (*win_disable)(struct exynos_drm_crtc *crtc, int zpos);
void (*te_handler)(struct exynos_drm_crtc *crtc);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm=
/exynos/exynos_drm_fimd.c
index 4c56fa7..b1e0170 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -31,6 +31,7 @@
#include "exynos_drm_drv.h"
#include "exynos_drm_fbdev.h"
#include "exynos_drm_crtc.h"
+#include "exynos_drm_plane.h"
#include "exynos_drm_iommu.h"

/*
@@ -143,31 +144,15 @@ static struct fimd_driver_data exynos5_fimd_drive=
r_data =3D {
=2Ehas_vtsel =3D 1,
};

-struct fimd_win_data {
- unsigned int offset_x;
- unsigned int offset_y;
- unsigned int ovl_width;
- unsigned int ovl_height;
- unsigned int fb_width;
- unsigned int fb_height;
- unsigned int bpp;
- unsigned int pixel_format;
- dma_addr_t dma_addr;
- unsigned int buf_offsize;
- unsigned int line_size; /* bytes */
- bool enabled;
- bool resume;
-};
-
struct fimd_context {
struct device *dev;
struct drm_device *drm_dev;
struct exynos_drm_crtc *crtc;
+ struct exynos_drm_plane planes[WINDOWS_NR];
struct clk *bus_clk;
struct clk *lcd_clk;
void __iomem *regs;
struct regmap *sysreg;
- struct fimd_win_data win_data[WINDOWS_NR];
unsigned int default_win;
unsigned long irq_flags;
u32 vidcon0;
@@ -509,58 +494,9 @@ static void fimd_disable_vblank(struct exynos_drm_=
crtc *crtc)
}
}

-static void fimd_win_mode_set(struct exynos_drm_crtc *crtc,
- struct exynos_drm_plane *plane)
-{
- struct fimd_context *ctx =3D crtc->ctx;
- struct fimd_win_data *win_data;
- int win;
- unsigned long offset;
-
- if (!plane) {
- DRM_ERROR("plane is NULL\n");
- return;
- }
-
- win =3D plane->zpos;
- if (win =3D=3D DEFAULT_ZPOS)
- win =3D ctx->default_win;
-
- if (win < 0 || win >=3D WINDOWS_NR)
- return;
-
- offset =3D plane->fb_x * (plane->bpp >> 3);
- offset +=3D plane->fb_y * plane->pitch;
-
- DRM_DEBUG_KMS("offset =3D 0x%lx, pitch =3D %x\n", offset, plane->pitc=
h);
-
- win_data =3D &ctx->win_data[win];
-
- win_data->offset_x =3D plane->crtc_x;
- win_data->offset_y =3D plane->crtc_y;
- win_data->ovl_width =3D plane->crtc_width;
- win_data->ovl_height =3D plane->crtc_height;
- win_data->fb_width =3D plane->fb_width;
- win_data->fb_height =3D plane->fb_height;
- win_data->dma_addr =3D plane->dma_addr[0] + offset;
- win_data->bpp =3D plane->bpp;
- win_data->pixel_format =3D plane->pixel_format;
- win_data->buf_offsize =3D (plane->fb_width - plane->crtc_width) *
- (plane->bpp >> 3);
- win_data->line_size =3D plane->crtc_width * (plane->bpp >> 3);
-
- DRM_DEBUG_KMS("offset_x =3D %d, offset_y =3D %d\n",
- win_data->offset_x, win_data->offset_y);
- DRM_DEBUG_KMS("ovl_width =3D %d, ovl_height =3D %d\n",
- win_data->ovl_width, win_data->ovl_height);
- DRM_DEBUG_KMS("paddr =3D 0x%lx\n", (unsigned long)win_data->dma_addr)=
;
- DRM_DEBUG_KMS("fb_width =3D %d, crtc_width =3D %d\n",
- plane->fb_width, plane->crtc_width);
-}
-
static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int =
win)
{
- struct fimd_win_data *win_data =3D &ctx->win_data[win];
+ struct exynos_drm_plane *plane =3D &ctx->planes[win];
unsigned long val;

val =3D WINCONx_ENWIN;
@@ -570,11 +506,11 @@ static void fimd_win_set_pixfmt(struct fimd_conte=
xt *ctx, unsigned int win)
* So the request format is ARGB8888 then change it to XRGB8888.
*/
if (ctx->driver_data->has_limited_fmt && !win) {
- if (win_data->pixel_format =3D=3D DRM_FORMAT_ARGB8888)
- win_data->pixel_format =3D DRM_FORMAT_XRGB8888;
+ if (plane->pixel_format =3D=3D DRM_FORMAT_ARGB8888)
+ plane->pixel_format =3D DRM_FORMAT_XRGB8888;
}

- switch (win_data->pixel_format) {
+ switch (plane->pixel_format) {
case DRM_FORMAT_C8:
val |=3D WINCON0_BPPMODE_8BPP_PALETTE;
val |=3D WINCONx_BURSTLEN_8WORD;
@@ -610,7 +546,7 @@ static void fimd_win_set_pixfmt(struct fimd_context=
 *ctx, unsigned int win)
break;
}

- DRM_DEBUG_KMS("bpp =3D %d\n", win_data->bpp);
+ DRM_DEBUG_KMS("bpp =3D %d\n", plane->bpp);

/*
* In case of exynos, setting dma-burst to 16Word causes permanent
@@ -620,7 +556,7 @@ static void fimd_win_set_pixfmt(struct fimd_context=
 *ctx, unsigned int win)
* movement causes unstable DMA which results into iommu crash/tear.
*/

- if (win_data->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
+ if (plane->fb_width < MIN_FB_WIDTH_FOR_16WORD_BURST) {
val &=3D ~WINCONx_BURSTLEN_MASK;
val |=3D WINCONx_BURSTLEN_4WORD;
}
@@ -689,11 +625,11 @@ static void fimd_shadow_protect_win(struct fimd_c=
ontext *ctx,
static void fimd_win_commit(struct exynos_drm_crtc *crtc, int zpos)
{
struct fimd_context *ctx =3D crtc->ctx;
- struct fimd_win_data *win_data;
+ struct exynos_drm_plane *plane;
int win =3D zpos;
- unsigned long val, size;
- unsigned int last_x;
- unsigned int last_y;
+ dma_addr_t dma_addr;
+ unsigned long val, size, offset;
+ unsigned int last_x, last_y, buf_offsize, line_size;

if (ctx->suspended)
return;
@@ -704,11 +640,11 @@ static void fimd_win_commit(struct exynos_drm_crt=
c *crtc, int zpos)
if (win < 0 || win >=3D WINDOWS_NR)
return;

- win_data =3D &ctx->win_data[win];
+ plane =3D &ctx->planes[win];

/* If suspended, enable this on resume */
if (ctx->suspended) {
- win_data->resume =3D true;
+ plane->resume =3D true;
return;
}

@@ -725,38 +661,45 @@ static void fimd_win_commit(struct exynos_drm_crt=
c *crtc, int zpos)
/* protect windows */
fimd_shadow_protect_win(ctx, win, true);

+
+ offset =3D plane->fb_x * (plane->bpp >> 3);
+ offset +=3D plane->fb_y * plane->pitch;
+
/* buffer start address */
- val =3D (unsigned long)win_data->dma_addr;
+ dma_addr =3D plane->dma_addr[0] + offset;
+ val =3D (unsigned long)dma_addr;
writel(val, ctx->regs + VIDWx_BUF_START(win, 0));

/* buffer end address */
- size =3D win_data->fb_width * win_data->ovl_height * (win_data->bpp >=
> 3);
- val =3D (unsigned long)(win_data->dma_addr + size);
+ size =3D plane->fb_width * plane->crtc_height * (plane->bpp >> 3);
+ val =3D (unsigned long)(dma_addr + size);
writel(val, ctx->regs + VIDWx_BUF_END(win, 0));

DRM_DEBUG_KMS("start addr =3D 0x%lx, end addr =3D 0x%lx, size =3D 0x%lx=
\n",
- (unsigned long)win_data->dma_addr, val, size);
+ (unsigned long)dma_addr, val, size);
DRM_DEBUG_KMS("ovl_width =3D %d, ovl_height =3D %d\n",
- win_data->ovl_width, win_data->ovl_height);
+ plane->crtc_width, plane->crtc_height);

/* buffer size */
- val =3D VIDW_BUF_SIZE_OFFSET(win_data->buf_offsize) |
- VIDW_BUF_SIZE_PAGEWIDTH(win_data->line_size) |
- VIDW_BUF_SIZE_OFFSET_E(win_data->buf_offsize) |
- VIDW_BUF_SIZE_PAGEWIDTH_E(win_data->line_size);
+ buf_offsize =3D (plane->fb_width - plane->crtc_width) * (plane->bpp >=
> 3);
+ line_size =3D plane->crtc_width * (plane->bpp >> 3);
+ val =3D VIDW_BUF_SIZE_OFFSET(buf_offsize) |
+ VIDW_BUF_SIZE_PAGEWIDTH(line_size) |
+ VIDW_BUF_SIZE_OFFSET_E(buf_offsize) |
+ VIDW_BUF_SIZE_PAGEWIDTH_E(line_size);
writel(val, ctx->regs + VIDWx_BUF_SIZE(win, 0));

/* OSD position */
- val =3D VIDOSDxA_TOPLEFT_X(win_data->offset_x) |
- VIDOSDxA_TOPLEFT_Y(win_data->offset_y) |
- VIDOSDxA_TOPLEFT_X_E(win_data->offset_x) |
- VIDOSDxA_TOPLEFT_Y_E(win_data->offset_y);
+ val =3D VIDOSDxA_TOPLEFT_X(plane->crtc_x) |
+ VIDOSDxA_TOPLEFT_Y(plane->crtc_y) |
+ VIDOSDxA_TOPLEFT_X_E(plane->crtc_x) |
+ VIDOSDxA_TOPLEFT_Y_E(plane->crtc_y);
writel(val, ctx->regs + VIDOSD_A(win));

- last_x =3D win_data->offset_x + win_data->ovl_width;
+ last_x =3D plane->crtc_x + plane->crtc_width;
if (last_x)
last_x--;
- last_y =3D win_data->offset_y + win_data->ovl_height;
+ last_y =3D plane->crtc_y + plane->crtc_height;
if (last_y)
last_y--;

@@ -766,14 +709,14 @@ static void fimd_win_commit(struct exynos_drm_crt=
c *crtc, int zpos)
writel(val, ctx->regs + VIDOSD_B(win));

DRM_DEBUG_KMS("osd pos: tx =3D %d, ty =3D %d, bx =3D %d, by =3D %d\n",
- win_data->offset_x, win_data->offset_y, last_x, last_y);
+ plane->crtc_x, plane->crtc_y, last_x, last_y);

/* OSD size */
if (win !=3D 3 && win !=3D 4) {
u32 offset =3D VIDOSD_D(win);
if (win =3D=3D 0)
offset =3D VIDOSD_C(win);
- val =3D win_data->ovl_width * win_data->ovl_height;
+ val =3D plane->crtc_width * plane->crtc_height;
writel(val, ctx->regs + offset);

DRM_DEBUG_KMS("osd size =3D 0x%x\n", (unsigned int)val);
@@ -793,7 +736,7 @@ static void fimd_win_commit(struct exynos_drm_crtc =
*crtc, int zpos)
/* Enable DMA channel and unprotect windows */
fimd_shadow_protect_win(ctx, win, false);

- win_data->enabled =3D true;
+ plane->enabled =3D true;

if (ctx->i80_if)
atomic_set(&ctx->win_updated, 1);
@@ -802,7 +745,7 @@ static void fimd_win_commit(struct exynos_drm_crtc =
*crtc, int zpos)
static void fimd_win_disable(struct exynos_drm_crtc *crtc, int zpos)
{
struct fimd_context *ctx =3D crtc->ctx;
- struct fimd_win_data *win_data;
+ struct exynos_drm_plane *plane;
int win =3D zpos;

if (win =3D=3D DEFAULT_ZPOS)
@@ -811,11 +754,11 @@ static void fimd_win_disable(struct exynos_drm_cr=
tc *crtc, int zpos)
if (win < 0 || win >=3D WINDOWS_NR)
return;

- win_data =3D &ctx->win_data[win];
+ plane =3D &ctx->planes[win];

if (ctx->suspended) {
/* do not resume this window*/
- win_data->resume =3D false;
+ plane->resume =3D false;
return;
}

@@ -830,42 +773,42 @@ static void fimd_win_disable(struct exynos_drm_cr=
tc *crtc, int zpos)
/* unprotect windows */
fimd_shadow_protect_win(ctx, win, false);

- win_data->enabled =3D false;
+ plane->enabled =3D false;
}

static void fimd_window_suspend(struct fimd_context *ctx)
{
- struct fimd_win_data *win_data;
+ struct exynos_drm_plane *plane;
int i;

for (i =3D 0; i < WINDOWS_NR; i++) {
- win_data =3D &ctx->win_data[i];
- win_data->resume =3D win_data->enabled;
- if (win_data->enabled)
+ plane =3D &ctx->planes[i];
+ plane->resume =3D plane->enabled;
+ if (plane->enabled)
fimd_win_disable(ctx->crtc, i);
}
}

static void fimd_window_resume(struct fimd_context *ctx)
{
- struct fimd_win_data *win_data;
+ struct exynos_drm_plane *plane;
int i;

for (i =3D 0; i < WINDOWS_NR; i++) {
- win_data =3D &ctx->win_data[i];
- win_data->enabled =3D win_data->resume;
- win_data->resume =3D false;
+ plane =3D &ctx->planes[i];
+ plane->enabled =3D plane->resume;
+ plane->resume =3D false;
}
}

static void fimd_apply(struct fimd_context *ctx)
{
- struct fimd_win_data *win_data;
+ struct exynos_drm_plane *plane;
int i;

for (i =3D 0; i < WINDOWS_NR; i++) {
- win_data =3D &ctx->win_data[i];
- if (win_data->enabled)
+ plane =3D &ctx->planes[i];
+ if (plane->enabled)
fimd_win_commit(ctx->crtc, i);
else
fimd_win_disable(ctx->crtc, i);
@@ -1022,7 +965,6 @@ static struct exynos_drm_crtc_ops fimd_crtc_ops =3D=
 {
=2Eenable_vblank =3D fimd_enable_vblank,
=2Edisable_vblank =3D fimd_disable_vblank,
=2Ewait_for_vblank =3D fimd_wait_for_vblank,
- .win_mode_set =3D fimd_win_mode_set,
=2Ewin_commit =3D fimd_win_commit,
=2Ewin_disable =3D fimd_win_disable,
=2Ete_handler =3D fimd_te_handler,
@@ -1067,7 +1009,9 @@ static int fimd_bind(struct device *dev, struct d=
evice *master, void *data)
{
struct fimd_context *ctx =3D dev_get_drvdata(dev);
struct drm_device *drm_dev =3D data;
- int ret;
+ struct exynos_drm_plane *exynos_plane;
+ enum drm_plane_type type;
+ int zpos, ret;

ret =3D fimd_ctx_initialize(ctx, drm_dev);
if (ret) {
@@ -1075,8 +1019,18 @@ static int fimd_bind(struct device *dev, struct =
device *master, void *data)
return ret;
}

- ctx->crtc =3D exynos_drm_crtc_create(drm_dev, ctx->pipe,
- EXYNOS_DISPLAY_TYPE_LCD,
+ for (zpos =3D 0; zpos < WINDOWS_NR; zpos++) {
+ type =3D (zpos =3D=3D ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
+ DRM_PLANE_TYPE_OVERLAY;
+ ret =3D exynos_plane_init(drm_dev, &ctx->planes[zpos],
+ 1 << ctx->pipe, type);
+ if (ret)
+ return ret;
+ }
+
+ exynos_plane =3D &ctx->planes[ctx->default_win];
+ ctx->crtc =3D exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
+ ctx->pipe, EXYNOS_DISPLAY_TYPE_LCD,
&fimd_crtc_ops, ctx);
if (IS_ERR(ctx->crtc)) {
fimd_ctx_remove(ctx);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/dr=
m/exynos/exynos_drm_plane.c
index a561687..4a7cfb7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -92,7 +92,6 @@ void exynos_plane_mode_set(struct drm_plane *plane, s=
truct drm_crtc *crtc,
uint32_t src_w, uint32_t src_h)
{
struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
- struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
unsigned int actual_w;
unsigned int actual_h;

@@ -139,9 +138,6 @@ void exynos_plane_mode_set(struct drm_plane *plane,=
 struct drm_crtc *crtc,
exynos_plane->crtc_width, exynos_plane->crtc_height);

plane->crtc =3D crtc;
-
- if (exynos_crtc->ops->win_mode_set)
- exynos_crtc->ops->win_mode_set(exynos_crtc, exynos_plane);
}

int
@@ -184,11 +180,8 @@ static int exynos_disable_plane(struct drm_plane *=
plane)

static void exynos_plane_destroy(struct drm_plane *plane)
{
- struct exynos_drm_plane *exynos_plane =3D to_exynos_plane(plane);
-
exynos_disable_plane(plane);
drm_plane_cleanup(plane);
- kfree(exynos_plane);
}

static int exynos_plane_set_property(struct drm_plane *plane,
@@ -233,24 +226,18 @@ static void exynos_plane_attach_zpos_property(str=
uct drm_plane *plane)
drm_object_attach_property(&plane->base, prop, 0);
}

-struct drm_plane *exynos_plane_init(struct drm_device *dev,
- unsigned long possible_crtcs,
- enum drm_plane_type type)
+int exynos_plane_init(struct drm_device *dev,
+ struct exynos_drm_plane *exynos_plane,
+ unsigned long possible_crtcs, enum drm_plane_type type)
{
- struct exynos_drm_plane *exynos_plane;
int err;

- exynos_plane =3D kzalloc(sizeof(struct exynos_drm_plane), GFP_KERNEL)=
;
- if (!exynos_plane)
- return ERR_PTR(-ENOMEM);
-
err =3D drm_universal_plane_init(dev, &exynos_plane->base, possible_crt=
cs,
&exynos_plane_funcs, formats,
ARRAY_SIZE(formats), type);
if (err) {
DRM_ERROR("failed to initialize plane\n");
- kfree(exynos_plane);
- return ERR_PTR(err);
+ return err;
}

if (type =3D=3D DRM_PLANE_TYPE_PRIMARY)
@@ -258,5 +245,5 @@ struct drm_plane *exynos_plane_init(struct drm_devi=
ce *dev,
else
exynos_plane_attach_zpos_property(&exynos_plane->base);

- return &exynos_plane->base;
+ return 0;
}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.h b/drivers/gpu/dr=
m/exynos/exynos_drm_plane.h
index 9d3c374..d8a3494 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.h
@@ -20,6 +20,6 @@ int exynos_update_plane(struct drm_plane *plane, stru=
ct drm_crtc *crtc,
unsigned int crtc_w, unsigned int crtc_h,
uint32_t src_x, uint32_t src_y,
uint32_t src_w, uint32_t src_h);
-struct drm_plane *exynos_plane_init(struct drm_device *dev,
- unsigned long possible_crtcs,
- enum drm_plane_type type);
+int exynos_plane_init(struct drm_device *dev,
+ struct exynos_drm_plane *exynos_plane,
+ unsigned long possible_crtcs, enum drm_plane_type type);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm=
/exynos/exynos_drm_vidi.c
index b886972..da5ee15 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -23,6 +23,7 @@

#include "exynos_drm_drv.h"
#include "exynos_drm_crtc.h"
+#include "exynos_drm_plane.h"
#include "exynos_drm_encoder.h"
#include "exynos_drm_vidi.h"

@@ -32,20 +33,6 @@
#define ctx_from_connector(c) container_of(c, struct vidi_context, \
connector)

-struct vidi_win_data {
- unsigned int offset_x;
- unsigned int offset_y;
- unsigned int ovl_width;
- unsigned int ovl_height;
- unsigned int fb_width;
- unsigned int fb_height;
- unsigned int bpp;
- dma_addr_t dma_addr;
- unsigned int buf_offsize;
- unsigned int line_size; /* bytes */
- bool enabled;
-};
-
struct vidi_context {
struct exynos_drm_display display;
struct platform_device *pdev;
@@ -53,7 +40,7 @@ struct vidi_context {
struct exynos_drm_crtc *crtc;
struct drm_encoder *encoder;
struct drm_connector connector;
- struct vidi_win_data win_data[WINDOWS_NR];
+ struct exynos_drm_plane planes[WINDOWS_NR];
struct edid *raw_edid;
unsigned int clkdiv;
unsigned int default_win;
@@ -97,19 +84,6 @@ static const char fake_edid_info[] =3D {
0x00, 0x00, 0x00, 0x06
};

-static void vidi_apply(struct vidi_context *ctx)
-{
- struct exynos_drm_crtc_ops *crtc_ops =3D ctx->crtc->ops;
- struct vidi_win_data *win_data;
- int i;
-
- for (i =3D 0; i < WINDOWS_NR; i++) {
- win_data =3D &ctx->win_data[i];
- if (win_data->enabled && (crtc_ops && crtc_ops->win_commit))
- crtc_ops->win_commit(ctx->crtc, i);
- }
-}
-
static int vidi_enable_vblank(struct exynos_drm_crtc *crtc)
{
struct vidi_context *ctx =3D crtc->ctx;
@@ -143,63 +117,10 @@ static void vidi_disable_vblank(struct exynos_drm=
_crtc *crtc)
ctx->vblank_on =3D false;
}

-static void vidi_win_mode_set(struct exynos_drm_crtc *crtc,
- struct exynos_drm_plane *plane)
-{
- struct vidi_context *ctx =3D crtc->ctx;
- struct vidi_win_data *win_data;
- int win;
- unsigned long offset;
-
- if (!plane) {
- DRM_ERROR("plane is NULL\n");
- return;
- }
-
- win =3D plane->zpos;
- if (win =3D=3D DEFAULT_ZPOS)
- win =3D ctx->default_win;
-
- if (win < 0 || win >=3D WINDOWS_NR)
- return;
-
- offset =3D plane->fb_x * (plane->bpp >> 3);
- offset +=3D plane->fb_y * plane->pitch;
-
- DRM_DEBUG_KMS("offset =3D 0x%lx, pitch =3D %x\n", offset, plane->pitc=
h);
-
- win_data =3D &ctx->win_data[win];
-
- win_data->offset_x =3D plane->crtc_x;
- win_data->offset_y =3D plane->crtc_y;
- win_data->ovl_width =3D plane->crtc_width;
- win_data->ovl_height =3D plane->crtc_height;
- win_data->fb_width =3D plane->fb_width;
- win_data->fb_height =3D plane->fb_height;
- win_data->dma_addr =3D plane->dma_addr[0] + offset;
- win_data->bpp =3D plane->bpp;
- win_data->buf_offsize =3D (plane->fb_width - plane->crtc_width) *
- (plane->bpp >> 3);
- win_data->line_size =3D plane->crtc_width * (plane->bpp >> 3);
-
- /*
- * some parts of win_data should be transferred to user side
- * through specific ioctl.
- */
-
- DRM_DEBUG_KMS("offset_x =3D %d, offset_y =3D %d\n",
- win_data->offset_x, win_data->offset_y);
- DRM_DEBUG_KMS("ovl_width =3D %d, ovl_height =3D %d\n",
- win_data->ovl_width, win_data->ovl_height);
- DRM_DEBUG_KMS("paddr =3D 0x%lx\n", (unsigned long)win_data->dma_addr)=
;
- DRM_DEBUG_KMS("fb_width =3D %d, crtc_width =3D %d\n",
- plane->fb_width, plane->crtc_width);
-}
-
static void vidi_win_commit(struct exynos_drm_crtc *crtc, int zpos)
{
struct vidi_context *ctx =3D crtc->ctx;
- struct vidi_win_data *win_data;
+ struct exynos_drm_plane *plane;
int win =3D zpos;

if (ctx->suspended)
@@ -211,11 +132,11 @@ static void vidi_win_commit(struct exynos_drm_crt=
c *crtc, int zpos)
if (win < 0 || win >=3D WINDOWS_NR)
return;

- win_data =3D &ctx->win_data[win];
+ plane =3D &ctx->planes[win];

- win_data->enabled =3D true;
+ plane->enabled =3D true;

- DRM_DEBUG_KMS("dma_addr =3D %pad\n", &win_data->dma_addr);
+ DRM_DEBUG_KMS("dma_addr =3D %pad\n", plane->dma_addr);

if (ctx->vblank_on)
schedule_work(&ctx->work);
@@ -224,7 +145,7 @@ static void vidi_win_commit(struct exynos_drm_crtc =
*crtc, int zpos)
static void vidi_win_disable(struct exynos_drm_crtc *crtc, int zpos)
{
struct vidi_context *ctx =3D crtc->ctx;
- struct vidi_win_data *win_data;
+ struct exynos_drm_plane *plane;
int win =3D zpos;

if (win =3D=3D DEFAULT_ZPOS)
@@ -233,14 +154,17 @@ static void vidi_win_disable(struct exynos_drm_cr=
tc *crtc, int zpos)
if (win < 0 || win >=3D WINDOWS_NR)
return;

- win_data =3D &ctx->win_data[win];
- win_data->enabled =3D false;
+ plane =3D &ctx->planes[win];
+ plane->enabled =3D false;

/* TODO. */
}

static int vidi_power_on(struct vidi_context *ctx, bool enable)
{
+ struct exynos_drm_plane *plane;
+ int i;
+
DRM_DEBUG_KMS("%s\n", __FILE__);

if (enable !=3D false && enable !=3D true)
@@ -253,7 +177,11 @@ static int vidi_power_on(struct vidi_context *ctx,=
 bool enable)
if (test_and_clear_bit(0, &ctx->irq_flags))
vidi_enable_vblank(ctx->crtc);

- vidi_apply(ctx);
+ for (i =3D 0; i < WINDOWS_NR; i++) {
+ plane =3D &ctx->planes[i];
+ if (plane->enabled)
+ vidi_win_commit(ctx->crtc, i);
+ }
} else {
ctx->suspended =3D true;
}
@@ -301,7 +229,6 @@ static struct exynos_drm_crtc_ops vidi_crtc_ops =3D=
 {
=2Edpms =3D vidi_dpms,
=2Eenable_vblank =3D vidi_enable_vblank,
=2Edisable_vblank =3D vidi_disable_vblank,
- .win_mode_set =3D vidi_win_mode_set,
=2Ewin_commit =3D vidi_win_commit,
=2Ewin_disable =3D vidi_win_disable,
};
@@ -543,12 +470,24 @@ static int vidi_bind(struct device *dev, struct d=
evice *master, void *data)
{
struct vidi_context *ctx =3D dev_get_drvdata(dev);
struct drm_device *drm_dev =3D data;
- int ret;
+ struct exynos_drm_plane *exynos_plane;
+ enum drm_plane_type type;
+ int zpos, ret;

vidi_ctx_initialize(ctx, drm_dev);

- ctx->crtc =3D exynos_drm_crtc_create(drm_dev, ctx->pipe,
- EXYNOS_DISPLAY_TYPE_VIDI,
+ for (zpos =3D 0; zpos < WINDOWS_NR; zpos++) {
+ type =3D (zpos =3D=3D ctx->default_win) ? DRM_PLANE_TYPE_PRIMARY :
+ DRM_PLANE_TYPE_OVERLAY;
+ ret =3D exynos_plane_init(drm_dev, &ctx->planes[zpos],
+ 1 << ctx->pipe, type);
+ if (ret)
+ return ret;
+ }
+
+ exynos_plane =3D &ctx->planes[ctx->default_win];
+ ctx->crtc =3D exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
+ ctx->pipe, EXYNOS_DISPLAY_TYPE_VIDI,
&vidi_crtc_ops, ctx);
if (IS_ERR(ctx->crtc)) {
DRM_ERROR("failed to create crtc.\n");
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/ex=
ynos/exynos_mixer.c
index 3518bc4..494d4cd 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -37,34 +37,13 @@

#include "exynos_drm_drv.h"
#include "exynos_drm_crtc.h"
+#include "exynos_drm_plane.h"
#include "exynos_drm_iommu.h"
#include "exynos_mixer.h"

#define MIXER_WIN_NR 3
#define MIXER_DEFAULT_WIN 0

-struct hdmi_win_data {
- dma_addr_t dma_addr;
- dma_addr_t chroma_dma_addr;
- uint32_t pixel_format;
- unsigned int bpp;
- unsigned int crtc_x;
- unsigned int crtc_y;
- unsigned int crtc_width;
- unsigned int crtc_height;
- unsigned int fb_x;
- unsigned int fb_y;
- unsigned int fb_width;
- unsigned int fb_height;
- unsigned int src_width;
- unsigned int src_height;
- unsigned int mode_width;
- unsigned int mode_height;
- unsigned int scan_flags;
- bool enabled;
- bool resume;
-};
-
struct mixer_resources {
int irq;
void __iomem *mixer_regs;
@@ -89,6 +68,7 @@ struct mixer_context {
struct device *dev;
struct drm_device *drm_dev;
struct exynos_drm_crtc *crtc;
+ struct exynos_drm_plane planes[MIXER_WIN_NR];
int pipe;
bool interlace;
bool powered;
@@ -98,7 +78,6 @@ struct mixer_context {

struct mutex mixer_mutex;
struct mixer_resources mixer_res;
- struct hdmi_win_data win_data[MIXER_WIN_NR];
enum mixer_version_id mxr_ver;
wait_queue_head_t wait_vsync_queue;
atomic_t wait_vsync_event;
@@ -402,7 +381,7 @@ static void vp_video_buffer(struct mixer_context *c=
tx, int win)
{
struct mixer_resources *res =3D &ctx->mixer_res;
unsigned long flags;
- struct hdmi_win_data *win_data;
+ struct exynos_drm_plane *plane;
unsigned int x_ratio, y_ratio;
unsigned int buf_num =3D 1;
dma_addr_t luma_addr[2], chroma_addr[2];
@@ -410,9 +389,9 @@ static void vp_video_buffer(struct mixer_context *c=
tx, int win)
bool crcb_mode =3D false;
u32 val;

- win_data =3D &ctx->win_data[win];
+ plane =3D &ctx->planes[win];

- switch (win_data->pixel_format) {
+ switch (plane->pixel_format) {
case DRM_FORMAT_NV12:
crcb_mode =3D false;
buf_num =3D 2;
@@ -420,35 +399,35 @@ static void vp_video_buffer(struct mixer_context =
*ctx, int win)
/* TODO: single buffer format NV12, NV21 */
default:
/* ignore pixel format at disable time */
- if (!win_data->dma_addr)
+ if (!plane->dma_addr[0])
break;

DRM_ERROR("pixel format for vp is wrong [%d].\n",
- win_data->pixel_format);
+ plane->pixel_format);
return;
}

/* scaling feature: (src << 16) / dst */
- x_ratio =3D (win_data->src_width << 16) / win_data->crtc_width;
- y_ratio =3D (win_data->src_height << 16) / win_data->crtc_height;
+ x_ratio =3D (plane->src_width << 16) / plane->crtc_width;
+ y_ratio =3D (plane->src_height << 16) / plane->crtc_height;

if (buf_num =3D=3D 2) {
- luma_addr[0] =3D win_data->dma_addr;
- chroma_addr[0] =3D win_data->chroma_dma_addr;
+ luma_addr[0] =3D plane->dma_addr[0];
+ chroma_addr[0] =3D plane->dma_addr[1];
} else {
- luma_addr[0] =3D win_data->dma_addr;
- chroma_addr[0] =3D win_data->dma_addr
- + (win_data->fb_width * win_data->fb_height);
+ luma_addr[0] =3D plane->dma_addr[0];
+ chroma_addr[0] =3D plane->dma_addr[0]
+ + (plane->fb_width * plane->fb_height);
}

- if (win_data->scan_flags & DRM_MODE_FLAG_INTERLACE) {
+ if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE) {
ctx->interlace =3D true;
if (tiled_mode) {
luma_addr[1] =3D luma_addr[0] + 0x40;
chroma_addr[1] =3D chroma_addr[0] + 0x40;
} else {
- luma_addr[1] =3D luma_addr[0] + win_data->fb_width;
- chroma_addr[1] =3D chroma_addr[0] + win_data->fb_width;
+ luma_addr[1] =3D luma_addr[0] + plane->fb_width;
+ chroma_addr[1] =3D chroma_addr[0] + plane->fb_width;
}
} else {
ctx->interlace =3D false;
@@ -469,26 +448,26 @@ static void vp_video_buffer(struct mixer_context =
*ctx, int win)
vp_reg_writemask(res, VP_MODE, val, VP_MODE_FMT_MASK);

/* setting size of input image */
- vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(win_data->fb_width) |
- VP_IMG_VSIZE(win_data->fb_height));
+ vp_reg_write(res, VP_IMG_SIZE_Y, VP_IMG_HSIZE(plane->fb_width) |
+ VP_IMG_VSIZE(plane->fb_height));
/* chroma height has to reduced by 2 to avoid chroma distorions */
- vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(win_data->fb_width) |
- VP_IMG_VSIZE(win_data->fb_height / 2));
+ vp_reg_write(res, VP_IMG_SIZE_C, VP_IMG_HSIZE(plane->fb_width) |
+ VP_IMG_VSIZE(plane->fb_height / 2));

- vp_reg_write(res, VP_SRC_WIDTH, win_data->src_width);
- vp_reg_write(res, VP_SRC_HEIGHT, win_data->src_height);
+ vp_reg_write(res, VP_SRC_WIDTH, plane->src_width);
+ vp_reg_write(res, VP_SRC_HEIGHT, plane->src_height);
vp_reg_write(res, VP_SRC_H_POSITION,
- VP_SRC_H_POSITION_VAL(win_data->fb_x));
- vp_reg_write(res, VP_SRC_V_POSITION, win_data->fb_y);
+ VP_SRC_H_POSITION_VAL(plane->fb_x));
+ vp_reg_write(res, VP_SRC_V_POSITION, plane->fb_y);

- vp_reg_write(res, VP_DST_WIDTH, win_data->crtc_width);
- vp_reg_write(res, VP_DST_H_POSITION, win_data->crtc_x);
+ vp_reg_write(res, VP_DST_WIDTH, plane->crtc_width);
+ vp_reg_write(res, VP_DST_H_POSITION, plane->crtc_x);
if (ctx->interlace) {
- vp_reg_write(res, VP_DST_HEIGHT, win_data->crtc_height / 2);
- vp_reg_write(res, VP_DST_V_POSITION, win_data->crtc_y / 2);
+ vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height / 2);
+ vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y / 2);
} else {
- vp_reg_write(res, VP_DST_HEIGHT, win_data->crtc_height);
- vp_reg_write(res, VP_DST_V_POSITION, win_data->crtc_y);
+ vp_reg_write(res, VP_DST_HEIGHT, plane->crtc_height);
+ vp_reg_write(res, VP_DST_V_POSITION, plane->crtc_y);
}

vp_reg_write(res, VP_H_RATIO, x_ratio);
@@ -502,8 +481,8 @@ static void vp_video_buffer(struct mixer_context *c=
tx, int win)
vp_reg_write(res, VP_TOP_C_PTR, chroma_addr[0]);
vp_reg_write(res, VP_BOT_C_PTR, chroma_addr[1]);

- mixer_cfg_scan(ctx, win_data->mode_height);
- mixer_cfg_rgb_fmt(ctx, win_data->mode_height);
+ mixer_cfg_scan(ctx, plane->mode_height);
+ mixer_cfg_rgb_fmt(ctx, plane->mode_height);
mixer_cfg_layer(ctx, win, true);
mixer_run(ctx);

@@ -524,21 +503,21 @@ static void mixer_graph_buffer(struct mixer_conte=
xt *ctx, int win)
{
struct mixer_resources *res =3D &ctx->mixer_res;
unsigned long flags;
- struct hdmi_win_data *win_data;
+ struct exynos_drm_plane *plane;
unsigned int x_ratio, y_ratio;
unsigned int src_x_offset, src_y_offset, dst_x_offset, dst_y_offset;
dma_addr_t dma_addr;
unsigned int fmt;
u32 val;

- win_data =3D &ctx->win_data[win];
+ plane =3D &ctx->planes[win];

#define RGB565 4
#define ARGB1555 5
#define ARGB4444 6
#define ARGB8888 7

- switch (win_data->bpp) {
+ switch (plane->bpp) {
case 16:
fmt =3D ARGB4444;
break;
@@ -553,17 +532,17 @@ static void mixer_graph_buffer(struct mixer_conte=
xt *ctx, int win)
x_ratio =3D 0;
y_ratio =3D 0;

- dst_x_offset =3D win_data->crtc_x;
- dst_y_offset =3D win_data->crtc_y;
+ dst_x_offset =3D plane->crtc_x;
+ dst_y_offset =3D plane->crtc_y;

/* converting dma address base and source offset */
- dma_addr =3D win_data->dma_addr
- + (win_data->fb_x * win_data->bpp >> 3)
- + (win_data->fb_y * win_data->fb_width * win_data->bpp >> 3);
+ dma_addr =3D plane->dma_addr[0]
+ + (plane->fb_x * plane->bpp >> 3)
+ + (plane->fb_y * plane->fb_width * plane->bpp >> 3);
src_x_offset =3D 0;
src_y_offset =3D 0;

- if (win_data->scan_flags & DRM_MODE_FLAG_INTERLACE)
+ if (plane->scan_flag & DRM_MODE_FLAG_INTERLACE)
ctx->interlace =3D true;
else
ctx->interlace =3D false;
@@ -576,18 +555,18 @@ static void mixer_graph_buffer(struct mixer_conte=
xt *ctx, int win)
MXR_GRP_CFG_FORMAT_VAL(fmt), MXR_GRP_CFG_FORMAT_MASK);

/* setup geometry */
- mixer_reg_write(res, MXR_GRAPHIC_SPAN(win), win_data->fb_width);
+ mixer_reg_write(res, MXR_GRAPHIC_SPAN(win), plane->fb_width);

/* setup display size */
if (ctx->mxr_ver =3D=3D MXR_VER_128_0_0_184 &&
win =3D=3D MIXER_DEFAULT_WIN) {
- val =3D MXR_MXR_RES_HEIGHT(win_data->mode_height);
- val |=3D MXR_MXR_RES_WIDTH(win_data->mode_width);
+ val =3D MXR_MXR_RES_HEIGHT(plane->mode_height);
+ val |=3D MXR_MXR_RES_WIDTH(plane->mode_width);
mixer_reg_write(res, MXR_RESOLUTION, val);
}

- val =3D MXR_GRP_WH_WIDTH(win_data->crtc_width);
- val |=3D MXR_GRP_WH_HEIGHT(win_data->crtc_height);
+ val =3D MXR_GRP_WH_WIDTH(plane->crtc_width);
+ val |=3D MXR_GRP_WH_HEIGHT(plane->crtc_height);
val |=3D MXR_GRP_WH_H_SCALE(x_ratio);
val |=3D MXR_GRP_WH_V_SCALE(y_ratio);
mixer_reg_write(res, MXR_GRAPHIC_WH(win), val);
@@ -605,8 +584,8 @@ static void mixer_graph_buffer(struct mixer_context=
 *ctx, int win)
/* set buffer address to mixer */
mixer_reg_write(res, MXR_GRAPHIC_BASE(win), dma_addr);

- mixer_cfg_scan(ctx, win_data->mode_height);
- mixer_cfg_rgb_fmt(ctx, win_data->mode_height);
+ mixer_cfg_scan(ctx, plane->mode_height);
+ mixer_cfg_rgb_fmt(ctx, plane->mode_height);
mixer_cfg_layer(ctx, win, true);

/* layer update mandatory for mixer 16.0.33.0 */
@@ -918,58 +897,6 @@ static void mixer_disable_vblank(struct exynos_drm=
_crtc *crtc)
mixer_reg_writemask(res, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
}

-static void mixer_win_mode_set(struct exynos_drm_crtc *crtc,
- struct exynos_drm_plane *plane)
-{
- struct mixer_context *mixer_ctx =3D crtc->ctx;
- struct hdmi_win_data *win_data;
- int win;
-
- if (!plane) {
- DRM_ERROR("plane is NULL\n");
- return;
- }
-
- DRM_DEBUG_KMS("set [%d]x[%d] at (%d,%d) to [%d]x[%d] at (%d,%d)\n",
- plane->fb_width, plane->fb_height,
- plane->fb_x, plane->fb_y,
- plane->crtc_width, plane->crtc_height,
- plane->crtc_x, plane->crtc_y);
-
- win =3D plane->zpos;
- if (win =3D=3D DEFAULT_ZPOS)
- win =3D MIXER_DEFAULT_WIN;
-
- if (win < 0 || win >=3D MIXER_WIN_NR) {
- DRM_ERROR("mixer window[%d] is wrong\n", win);
- return;
- }
-
- win_data =3D &mixer_ctx->win_data[win];
-
- win_data->dma_addr =3D plane->dma_addr[0];
- win_data->chroma_dma_addr =3D plane->dma_addr[1];
- win_data->pixel_format =3D plane->pixel_format;
- win_data->bpp =3D plane->bpp;
-
- win_data->crtc_x =3D plane->crtc_x;
- win_data->crtc_y =3D plane->crtc_y;
- win_data->crtc_width =3D plane->crtc_width;
- win_data->crtc_height =3D plane->crtc_height;
-
- win_data->fb_x =3D plane->fb_x;
- win_data->fb_y =3D plane->fb_y;
- win_data->fb_width =3D plane->fb_width;
- win_data->fb_height =3D plane->fb_height;
- win_data->src_width =3D plane->src_width;
- win_data->src_height =3D plane->src_height;
-
- win_data->mode_width =3D plane->mode_width;
- win_data->mode_height =3D plane->mode_height;
-
- win_data->scan_flags =3D plane->scan_flag;
-}
-
static void mixer_win_commit(struct exynos_drm_crtc *crtc, int zpos)
{
struct mixer_context *mixer_ctx =3D crtc->ctx;
@@ -989,7 +916,7 @@ static void mixer_win_commit(struct exynos_drm_crtc=
 *crtc, int zpos)
else
mixer_graph_buffer(mixer_ctx, win);

- mixer_ctx->win_data[win].enabled =3D true;
+ mixer_ctx->planes[win].enabled =3D true;
}

static void mixer_win_disable(struct exynos_drm_crtc *crtc, int zpos)
@@ -1004,7 +931,7 @@ static void mixer_win_disable(struct exynos_drm_cr=
tc *crtc, int zpos)
mutex_lock(&mixer_ctx->mixer_mutex);
if (!mixer_ctx->powered) {
mutex_unlock(&mixer_ctx->mixer_mutex);
- mixer_ctx->win_data[win].resume =3D false;
+ mixer_ctx->planes[win].resume =3D false;
return;
}
mutex_unlock(&mixer_ctx->mixer_mutex);
@@ -1017,7 +944,7 @@ static void mixer_win_disable(struct exynos_drm_cr=
tc *crtc, int zpos)
mixer_vsync_set_update(mixer_ctx, true);
spin_unlock_irqrestore(&res->reg_slock, flags);

- mixer_ctx->win_data[win].enabled =3D false;
+ mixer_ctx->planes[win].enabled =3D false;
}

static void mixer_wait_for_vblank(struct exynos_drm_crtc *crtc)
@@ -1054,12 +981,12 @@ static void mixer_wait_for_vblank(struct exynos_=
drm_crtc *crtc)

static void mixer_window_suspend(struct mixer_context *ctx)
{
- struct hdmi_win_data *win_data;
+ struct exynos_drm_plane *plane;
int i;

for (i =3D 0; i < MIXER_WIN_NR; i++) {
- win_data =3D &ctx->win_data[i];
- win_data->resume =3D win_data->enabled;
+ plane =3D &ctx->planes[i];
+ plane->resume =3D plane->enabled;
mixer_win_disable(ctx->crtc, i);
}
mixer_wait_for_vblank(ctx->crtc);
@@ -1067,14 +994,14 @@ static void mixer_window_suspend(struct mixer_co=
ntext *ctx)

static void mixer_window_resume(struct mixer_context *ctx)
{
- struct hdmi_win_data *win_data;
+ struct exynos_drm_plane *plane;
int i;

for (i =3D 0; i < MIXER_WIN_NR; i++) {
- win_data =3D &ctx->win_data[i];
- win_data->enabled =3D win_data->resume;
- win_data->resume =3D false;
- if (win_data->enabled)
+ plane =3D &ctx->planes[i];
+ plane->enabled =3D plane->resume;
+ plane->resume =3D false;
+ if (plane->enabled)
mixer_win_commit(ctx->crtc, i);
}
}
@@ -1186,7 +1113,6 @@ static struct exynos_drm_crtc_ops mixer_crtc_ops =
=3D {
=2Eenable_vblank =3D mixer_enable_vblank,
=2Edisable_vblank =3D mixer_disable_vblank,
=2Ewait_for_vblank =3D mixer_wait_for_vblank,
- .win_mode_set =3D mixer_win_mode_set,
=2Ewin_commit =3D mixer_win_commit,
=2Ewin_disable =3D mixer_win_disable,
};
@@ -1250,15 +1176,27 @@ static int mixer_bind(struct device *dev, struc=
t device *manager, void *data)
{
struct mixer_context *ctx =3D dev_get_drvdata(dev);
struct drm_device *drm_dev =3D data;
- int ret;
+ struct exynos_drm_plane *exynos_plane;
+ enum drm_plane_type type;
+ int zpos, ret;

ret =3D mixer_initialize(ctx, drm_dev);
if (ret)
return ret;

- ctx->crtc =3D exynos_drm_crtc_create(drm_dev, ctx->pipe,
- EXYNOS_DISPLAY_TYPE_HDMI,
- &mixer_crtc_ops, ctx);
+ for (zpos =3D 0; zpos < MIXER_WIN_NR; zpos++) {
+ type =3D (zpos =3D=3D MIXER_DEFAULT_WIN) ? DRM_PLANE_TYPE_PRIMARY :
+ DRM_PLANE_TYPE_OVERLAY;
+ ret =3D exynos_plane_init(drm_dev, &ctx->planes[zpos],
+ 1 << ctx->pipe, type);
+ if (ret)
+ return ret;
+ }
+
+ exynos_plane =3D &ctx->planes[MIXER_DEFAULT_WIN];
+ ctx->crtc =3D exynos_drm_crtc_create(drm_dev, &exynos_plane->base,
+ ctx->pipe, EXYNOS_DISPLAY_TYPE_HDMI,
+ &mixer_crtc_ops, ctx);
if (IS_ERR(ctx->crtc)) {
mixer_ctx_remove(ctx);
ret =3D PTR_ERR(ctx->crtc);
--
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-samsung=
-soc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at http://vger.kernel.org/majordomo-info.html
