From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC 3/4] drm: exynos: add IELCD post processor
Date: Fri, 21 Mar 2014 14:12:54 +0530
Message-ID: <CAK9yfHxQR_O2MdvHuKHHRsEg0k7CxVKD1wmLDRq0S3BrdAOMbw@mail.gmail.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
	<1395238975-24600-4-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:57392 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760255AbaCUImz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Mar 2014 04:42:55 -0400
Received: by mail-oa0-f43.google.com with SMTP id eb12so2199871oac.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Mar 2014 01:42:54 -0700 (PDT)
In-Reply-To: <1395238975-24600-4-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Ajay kumar <ajaynumb@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, marcheu@chromium.org, Shirish S <s.shirish@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

On 19 March 2014 19:52, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Add post processor ops for IELCD and their support functions.
> Expose an interface for the FIMD to register IELCD PP.
[snip]
> +
> +#define exynos_ielcd_readl(addr)       readl(ielcd->exynos_ielcd_base + addr)
> +#define exynos_ielcd_writel(addr, val) \

nit: The order of arguments could be retained same as writel (i.e.,
val, addr) for ease of
reading.

> +                               writel(val, ielcd->exynos_ielcd_base + addr)

> +#define IELCD_TIMEOUT_CNT      1000
> +
> +struct ielcd_context {
> +       void __iomem                    *exynos_ielcd_base;
> +       unsigned                vdisplay;
> +       unsigned                vsync_len;
> +       unsigned                vbpd;
> +       unsigned                vfpd;
> +       unsigned                hdisplay;
> +       unsigned                hsync_len;
> +       unsigned                hbpd;
> +       unsigned                hfpd;
> +       unsigned                vidcon0;
> +       unsigned                vidcon1;
> +};
> +
> +static int ielcd_logic_start(struct ielcd_context *ielcd)
> +{
> +       exynos_ielcd_writel(IELCD_AUXCON, IELCD_MAGIC_KEY);
> +
> +       return 0;
> +}

The return type could be made void.

> +
> +static int exynos_ielcd_hw_trigger_check(struct ielcd_context *ielcd)
> +{
> +       unsigned int cfg;
> +       unsigned int count = 0;
> +
> +       cfg = exynos_ielcd_readl(IELCD_TRIGCON);
> +       cfg &= ~(SWTRGCMD_W0BUF | TRGMODE_W0BUF);
> +       cfg |= (SWTRGCMD_W0BUF | TRGMODE_W0BUF);
> +       exynos_ielcd_writel(IELCD_TRIGCON, cfg);
> +
> +       do {
> +               cfg = exynos_ielcd_readl(IELCD_SHADOWCON);
> +               cfg |= IELCD_W0_SW_SHADOW_UPTRIG;
> +               exynos_ielcd_writel(IELCD_SHADOWCON, cfg);
> +
> +               cfg = exynos_ielcd_readl(IELCD_VIDCON0);
> +               cfg |= IELCD_SW_SHADOW_UPTRIG;
> +               exynos_ielcd_writel(IELCD_VIDCON0, cfg);
> +
> +               count++;
> +               if (count > IELCD_TIMEOUT_CNT) {

The 2 lines could be combined as:
                    if (++count > IELCD_TIMEOUT_CNT) {

> +                       DRM_ERROR("ielcd start fail\n");
> +                       return -EBUSY;
> +               }
> +               udelay(10);
> +       } while (exynos_ielcd_readl(IELCD_WINCON0) & IELCD_TRGSTATUS);

Also this check could be moved inside the loop and break if 0 whereas this could
while (1) here.

> +
> +       return 0;
> +}
> +
> +static int exynos_ielcd_display_on(struct ielcd_context *ielcd)
> +{
> +       unsigned int cfg;
> +
> +       cfg = exynos_ielcd_readl(IELCD_VIDCON0);
> +       cfg |= (VIDCON0_ENVID | VIDCON0_ENVID_F);
> +       exynos_ielcd_writel(IELCD_VIDCON0, cfg);
> +
> +       return exynos_ielcd_hw_trigger_check(ielcd);
> +}
> +
> +int exynos_ielcd_display_off(void *pp_ctx)
> +{
> +       struct ielcd_context *ielcd = pp_ctx;
> +       unsigned int cfg, ielcd_count = 0;
> +       int ret = 0;

initialization not needed.

> +
> +       cfg = exynos_ielcd_readl(IELCD_VIDCON0);
> +       cfg &= ~(VIDCON0_ENVID | VIDCON0_ENVID_F);
> +
> +       exynos_ielcd_writel(IELCD_VIDCON0, cfg);
> +
> +       do {
> +               if (++ielcd_count > IELCD_TIMEOUT_CNT) {
> +                       DRM_ERROR("ielcd off TIMEDOUT\n");
> +                       ret = -ETIMEDOUT;
> +                       break;
> +               }
> +
> +               if (!(exynos_ielcd_readl(IELCD_VIDCON1) &
> +                                               VIDCON1_LINECNT_MASK)) {
> +                       ret = 0;
> +                       break;
> +               }
> +               udelay(200);
> +       } while (1);
> +
> +       return ret;
> +}
> +
> +static void exynos_ielcd_config_rgb(struct ielcd_context *ielcd)
> +{
> +       unsigned int cfg;
> +
> +       cfg = exynos_ielcd_readl(IELCD_VIDCON0);
> +       cfg &= ~(VIDCON0_VIDOUT_MASK | VIDCON0_VCLK_MASK);
> +       cfg |= VIDCON0_VIDOUT_RGB;
> +       cfg |= VIDCON0_VCLK_NORMAL;
> +
> +       exynos_ielcd_writel(IELCD_VIDCON0, cfg);
> +}
> +
> +int exynos_ielcd_power_on(void *pp_ctx)
> +{
> +       struct ielcd_context *ielcd = pp_ctx;
> +       unsigned int cfg;
> +       int ret = 0;
> +
> +       ielcd_logic_start(ielcd);
> +       ielcd_set_polarity(ielcd);
> +
> +       ielcd_set_lcd_size(ielcd);
> +       ielcd_set_timing(ielcd);
> +
> +       /* window0 setting , fixed */
> +       cfg = WINCONx_ENLOCAL | WINCON0_BPPMODE_24BPP_888 | WINCONx_ENWIN;
> +       exynos_ielcd_writel(IELCD_WINCON0, cfg);
> +
> +       exynos_ielcd_config_rgb(ielcd);
> +
> +       ret = exynos_ielcd_display_on(ielcd);
> +       if (ret) {
> +               DRM_ERROR("IELCD failed to start\n");
> +               return ret;
> +       }
> +
> +       return 0;

The above block could be simplified as:
               ret = exynos_ielcd_display_on(ielcd);
               if (ret)
                      DRM_ERROR(...);

               return ret;
> +}
> +
> +static void exynos_ielcd_mode_set(void *pp_ctx,
> +                               const struct drm_display_mode *in_mode)
> +{
> +       struct ielcd_context *ielcd = pp_ctx;
> +
> +       ielcd->vdisplay = in_mode->crtc_vdisplay;
> +       ielcd->vsync_len = in_mode->crtc_vsync_end - in_mode->crtc_vsync_start;
> +       ielcd->vbpd = in_mode->crtc_vtotal - in_mode->crtc_vsync_end;
> +       ielcd->vfpd = in_mode->crtc_vsync_start - in_mode->crtc_vdisplay;
> +
> +       ielcd->hdisplay = in_mode->crtc_hdisplay;
> +       ielcd->hsync_len = in_mode->crtc_hsync_end - in_mode->crtc_hsync_start;
> +       ielcd->hbpd = in_mode->crtc_htotal - in_mode->crtc_hsync_end;
> +       ielcd->hfpd = in_mode->crtc_hsync_start - in_mode->crtc_hdisplay;
> +}
> +
> +static struct exynos_fimd_pp_ops ielcd_ops = {
> +       .power_on =     exynos_ielcd_power_on,
> +       .power_off =    exynos_ielcd_display_off,
> +       .mode_set =     exynos_ielcd_mode_set,
> +};
> +
> +static struct exynos_fimd_pp ielcd_pp = {
> +       .ops =          &ielcd_ops,
> +};
> +
> +int exynos_ielcd_init(struct device *dev, struct exynos_fimd_pp **pp)
> +{
> +       struct device_node *ielcd_np;
> +       struct ielcd_context *ielcd;
> +       u32 addr[2];
> +       int ret = 0;
> +
> +       ielcd = kzalloc(sizeof(struct ielcd_context), GFP_KERNEL);
> +       if (!ielcd) {
> +               DRM_ERROR("failed to allocate ielcd\n");
> +               ret = -ENOMEM;
> +               goto error0;

return directly from here and delete the label.

-- 
With warm regards,
Sachin
