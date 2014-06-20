From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V4 02/10] drm/panel: add prepare and unprepare routines
Date: Fri, 20 Jun 2014 13:37:10 +0530
Message-ID: <CAEC9eQPnSSaPn-9J32gmQaMuNXjaV6p7FayeL81iHaihQE-SUQ@mail.gmail.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
	<1402511228-18945-3-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f172.google.com ([209.85.128.172]:57097 "EHLO
	mail-ve0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934766AbaFTIHL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 04:07:11 -0400
In-Reply-To: <1402511228-18945-3-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>

ping.

On Wed, Jun 11, 2014 at 11:57 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Most of the panels need an init sequence as mentioned below:
>         -- poweron LCD unit/LCD_EN
>         -- start video data
>         -- poweron LED unit/BACKLIGHT_EN
> And, a de-init sequence as mentioned below:
>         -- poweroff LED unit/BACKLIGHT_EN
>         -- stop video data
>         -- poweroff LCD unit/LCD_EN
> With existing callbacks for drm panel, we cannot accomodate such panels,
> since only two callbacks, i.e "panel_enable" and panel_disable are supported.
>
> This patch adds:
>         -- "prepare" callback which can be called before
>         the actual video data is on, and then call the "enable"
>         callback after the video data is available.
>
>         -- "unprepare" callback which can be called after
>         the video data is off, and use "disable" callback
>         to do something before switching off the video data.
>
> Now, we can easily map the above scenario as shown below:
>         poweron LCD unit/LCD_EN = "prepare" callback
>         poweron LED unit/BACKLIGHT_EN = "enable" callback
>         poweroff LED unit/BACKLIGHT_EN = "disable" callback
>         poweroff LCD unit/LCD_EN = "unprepare" callback
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  include/drm/drm_panel.h |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index c2ab77a..9addc69 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -31,7 +31,9 @@ struct drm_device;
>  struct drm_panel;
>
>  struct drm_panel_funcs {
> +       int (*unprepare)(struct drm_panel *panel);
>         int (*disable)(struct drm_panel *panel);
> +       int (*prepare)(struct drm_panel *panel);
>         int (*enable)(struct drm_panel *panel);
>         int (*get_modes)(struct drm_panel *panel);
>  };
> @@ -46,6 +48,14 @@ struct drm_panel {
>         struct list_head list;
>  };
>
> +static inline int drm_panel_unprepare(struct drm_panel *panel)
> +{
> +       if (panel && panel->funcs && panel->funcs->unprepare)
> +               return panel->funcs->unprepare(panel);
> +
> +       return panel ? -ENOSYS : -EINVAL;
> +}
> +
>  static inline int drm_panel_disable(struct drm_panel *panel)
>  {
>         if (panel && panel->funcs && panel->funcs->disable)
> @@ -54,6 +64,14 @@ static inline int drm_panel_disable(struct drm_panel *panel)
>         return panel ? -ENOSYS : -EINVAL;
>  }
>
> +static inline int drm_panel_prepare(struct drm_panel *panel)
> +{
> +       if (panel && panel->funcs && panel->funcs->prepare)
> +               return panel->funcs->prepare(panel);
> +
> +       return panel ? -ENOSYS : -EINVAL;
> +}
> +
>  static inline int drm_panel_enable(struct drm_panel *panel)
>  {
>         if (panel && panel->funcs && panel->funcs->enable)
> --
> 1.7.9.5
>
