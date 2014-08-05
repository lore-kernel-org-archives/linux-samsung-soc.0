From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 01/15] drm/panel: add prepare and unprepare routines
Date: Tue, 05 Aug 2014 11:00:06 +0200
Message-ID: <53E09D16.9090701@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com> <1406828534-10072-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:57820 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755609AbaHEJAe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Aug 2014 05:00:34 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1XEabd-0002w8-LV
	for linux-samsung-soc@vger.kernel.org; Tue, 05 Aug 2014 11:00:29 +0200
Received: from 217-67-201-162.itsa.net.pl ([217.67.201.162])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Aug 2014 11:00:29 +0200
Received: from a.hajda by 217-67-201-162.itsa.net.pl with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Aug 2014 11:00:29 +0200
In-Reply-To: <1406828534-10072-2-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org

Hi Ajay,

I am glad we have finally more fine-grained callbacks.
Just few nitpicks.

On 07/31/2014 07:42 PM, Ajay Kumar wrote:
> Most of the panels need an init sequence as mentioned below:
> 	-- poweron LCD unit/LCD_EN
> 	-- start video data
> 	-- poweron LED unit/BACKLIGHT_EN
> And, a de-init sequence as mentioned below:
> 	-- poweroff LED unit/BACKLIGHT_EN
> 	-- stop video data
> 	-- poweroff LCD unit/LCD_EN
> With existing callbacks for drm panel, we cannot accomodate such panels,
> since only two callbacks, i.e "panel_enable" and panel_disable are supported.
> 
> This patch adds:
> 	-- "prepare" callback which can be called before
> 	the actual video data is on, and then call the "enable"
> 	callback after the video data is available.
> 
> 	-- "unprepare" callback which can be called after
> 	the video data is off, and use "disable" callback
> 	to do something before switching off the video data.
> 
> Now, we can easily map the above scenario as shown below:
> 	poweron LCD unit/LCD_EN = "prepare" callback
> 	poweron LED unit/BACKLIGHT_EN = "enable" callback
> 	poweroff LED unit/BACKLIGHT_EN = "disable" callback
> 	poweroff LCD unit/LCD_EN = "unprepare" callback
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
> +	int (*unprepare)(struct drm_panel *panel);
>  	int (*disable)(struct drm_panel *panel);
> +	int (*prepare)(struct drm_panel *panel);
>  	int (*enable)(struct drm_panel *panel);
>  	int (*get_modes)(struct drm_panel *panel);
>  };
> @@ -46,6 +48,14 @@ struct drm_panel {
>  	struct list_head list;
>  };
>  
> +static inline int drm_panel_unprepare(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->unprepare)
> +		return panel->funcs->unprepare(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}

Wouldn't be better to return 0 in case there is no callback.
In such case we could avoid implementing ugly dummy callbacks in
each panel driver. This is true for all
prepare/unprepare/enable/disable callbacks.

Regards
Andrzej

> +
>  static inline int drm_panel_disable(struct drm_panel *panel)
>  {
>  	if (panel && panel->funcs && panel->funcs->disable)
> @@ -54,6 +64,14 @@ static inline int drm_panel_disable(struct drm_panel *panel)
>  	return panel ? -ENOSYS : -EINVAL;
>  }
>  
> +static inline int drm_panel_prepare(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->prepare)
> +		return panel->funcs->prepare(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +
>  static inline int drm_panel_enable(struct drm_panel *panel)
>  {
>  	if (panel && panel->funcs && panel->funcs->enable)
> 
