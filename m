From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RFC PATCH 4/4] video: display: Add Samsung s6e8ax0 display panel
 driver
Date: Thu, 07 Feb 2013 11:18:53 +0100
Message-ID: <5696534.VWzXcuXKst@amdc1227>
References: <1359560343-31636-1-git-send-email-t.figa@samsung.com>
 <1359560343-31636-5-git-send-email-t.figa@samsung.com>
 <CAGm_ybj-oN6OtVr5EAcH5w=cRfkVphfrwHTer40wgas1venbBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:29862 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751849Ab3BGKS7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Feb 2013 05:18:59 -0500
In-reply-to: <CAGm_ybj-oN6OtVr5EAcH5w=cRfkVphfrwHTer40wgas1venbBQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <sajjan.linux@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, Daniel Vetter <daniel@ffwll.ch>, Marcus Lorentzon <marcus.xm.lorentzon@stericsson.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, rob@ti.com, tomi.valkeinen@ti.com, inki.dae@samsung.com, dh09.lee@samsung.com, ville.syrjala@intel.com, s.nawrocki@samsung.com, aditya.ps@samsung.com, sunil joshi <joshi@samsung.com>

On Thursday 07 of February 2013 15:04:30 Vikas Sajjan wrote:
> Hi Figa,
> 
> On Wed, Jan 30, 2013 at 9:09 PM, Tomasz Figa <t.figa@samsung.com> wrote:
> > This patch adds Common Display Framework driver for Samsung s6e8ax0
> > MIPI DSI display panel.
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > 
> >  drivers/video/display/Kconfig         |    3 +
> >  drivers/video/display/Makefile        |    1 +
> >  drivers/video/display/panel-s6e8ax0.c | 1027
> >  +++++++++++++++++++++++++++++++++ include/video/panel-s6e8ax0.h     
> >     |   41 ++
> >  4 files changed, 1072 insertions(+)
> >  create mode 100644 drivers/video/display/panel-s6e8ax0.c
> >  create mode 100644 include/video/panel-s6e8ax0.h
> > 
[snip]
> > +       lcd->ld = lcd_device_register("s6e8ax0", &pdev->dev, lcd,
> > +                       &s6e8ax0_lcd_ops);
> > +       if (IS_ERR(lcd->ld)) {
> > +               dev_err(&pdev->dev, "failed to register lcd ops.\n");
> > +               ret = PTR_ERR(lcd->ld);
> > +               goto err_lcd_register;
> > +       }
> > +
> > +       lcd->bd = backlight_device_register("s6e8ax0-bl", &pdev->dev,
> > lcd, +                       &s6e8ax0_backlight_ops, NULL);
> > +       if (IS_ERR(lcd->bd)) {
> > +               dev_err(&pdev->dev, "failed to register backlight
> > ops.\n"); +               ret = PTR_ERR(lcd->bd);
> > +               goto err_backlight_register;
> > +       }
> > +
> 
> I think we should try to remove the dependency with LCD framework and
> Backlight framework, and incorporate those functionality as par of
> CDF.
> you can refer to my similar patch "Make s6e8ax0 panel driver compliant
> with CDF" (
> http://comments.gmane.org/gmane.linux.drivers.video-input-infrastructur
> e/59187 ) which i had posted couple of weeks back, where I made an
> attempt to remove "lcd_ops" dependency.

Yes, I have written in the cover letter that those interfaces is just a 
hack to be able to control the display from userspace in current state of 
CDF.

I agree that CDF will have to be extended with backlight/brightness 
control. However currently CDF does not expose any interface to userspace.

Laurent, what's your opinion on this?

P.S. Tomasz is my first name.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
