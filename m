From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH V2 2/9] drm/panel: add pre_enable and post_disable
 routines
Date: Wed, 23 Apr 2014 09:29:15 +0200
Message-ID: <20140423072915.GV10722@phenom.ffwll.local>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-3-git-send-email-ajaykumar.rs@samsung.com>
 <20140422081948.GA17275@ulmo>
 <CAEC9eQO8Kahh2YVO4nCjk2m+TzJNJ_iSkVRLe0NM_yqL9uPNaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:38168 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753858AbaDWH3U (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Apr 2014 03:29:20 -0400
Received: by mail-ee0-f44.google.com with SMTP id e49so414570eek.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Apr 2014 00:29:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAEC9eQO8Kahh2YVO4nCjk2m+TzJNJ_iSkVRLe0NM_yqL9uPNaw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay kumar <ajaynumb@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>

On Tue, Apr 22, 2014 at 08:06:19PM +0530, Ajay kumar wrote:
> Hi Thierry,
> 
> 
> On Tue, Apr 22, 2014 at 1:49 PM, Thierry Reding <thierry.reding@gmail.com>
> wrote:
> > On Tue, Apr 22, 2014 at 04:09:11AM +0530, Ajay Kumar wrote:
> >> Most of the panels need an init sequence as mentioned below:
> >>       -- poweron LCD unit/LCD_EN
> >>       -- start video data
> >>       -- poweron LED unit/BL_EN
> >> And, a de-init sequence as mentioned below:
> >>       -- poweroff LED unit/BL_EN
> >>       -- stop video data
> >>       -- poweroff LCD unit/LCD_EN
> >> With existing callbacks for drm panel, we cannot accomodate such panels,
> >> since only two callbacks, i.e "panel_enable" and panel_disable are
> supported.
> >>
> >> This patch adds:
> >>       -- "pre_enable" callback which can be called before
> >>       the actual video data is on, and then call the "enable"
> >>       callback after the video data is available.
> >>
> >>       -- "post_disable" callback which can be called after
> >>       the video data is off, and use "disable" callback
> >>       to do something before switching off the video data.
> >>
> >> Now, we can easily map the above scenario as shown below:
> >>       poweron LCD unit/LCD_EN = "pre_enable" callback
> >>       poweron LED unit/BL_EN = "enable" callback
> >>       poweroff LED unit/BL_EN = "disable" callback
> >>       poweroff LCD unit/LCD_EN = "post_disable" callback
> >
> > I don't like this. What happens when the next panel comes around that
> > has a yet slightly different requirement? Will we introduce a new
> > pre_pre_enable() and post_post_disable() function then?
> >
> As I have already explained, these 2 callbacks are sufficient enough to
> take care
> the power up/down sequence for LVDS and eDP panels. And, definitely having
> just 2 callbacks "enable" and "disable" is not at all sufficient.
> 
> I initially thought of using panel_simple_enable from panel-simple driver.
> But it doesn't go well with case wherein there are 2 regulators(one for LCD
> and one for LED)
> a BL_EN signal etc. And, often(Believe me, I have referred to both eDP
> panel datasheets
> and LVDS panel datasheets) proper powerup sequence for such panels is as
> mentioned below:
> 
> powerup:
> -- power up the supply (LCD_VCC).
> -- start video data.
> -- enable backlight.
> 
> powerdown
> -- disable backlight.
> -- stop video data.
> -- power off the supply (LCD VCC)
> 
> For the above cases, if I have to somehow fit in all the required settings,
> it breaks the sequence and I end up getting glitches during bootup/DPMS.
> 
> Also, when the drm_bridge can support pre_enable and post_disable, why not
> drm_panel provide that both should work in tandem?

Imo this makes sense, especially if we go through with the idea talked
about yesterday of creating a drm_bridge to wrap-up a drm_panel with
sufficient isolation between all components.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
