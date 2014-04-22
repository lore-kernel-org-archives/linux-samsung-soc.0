From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V2 3/9] drm/panel: Add driver for exynos_dp based panels
Date: Tue, 22 Apr 2014 20:07:51 +0530
Message-ID: <CAEC9eQPzaUDPBH7MRYz-NfQHays9tVk5x7PTnHN_zhD5EVS0pA@mail.gmail.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
	<1398119958-32005-4-git-send-email-ajaykumar.rs@samsung.com>
	<001b01cf5dfb$a4ab54e0$ee01fea0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:56815 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755198AbaDVOhw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 10:37:52 -0400
Received: by mail-ve0-f169.google.com with SMTP id pa12so10109726veb.28
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 07:37:51 -0700 (PDT)
In-Reply-To: <001b01cf5dfb$a4ab54e0$ee01fea0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi Jingoo,


On Tue, Apr 22, 2014 at 12:52 PM, Jingoo Han <jg1.han@samsung.com> wrote:
>
> On Tuesday, April 22, 2014 7:39 AM, Ajay Kumar wrote:
> >
> > This patch adds a simple driver to handle all the LCD and LED
> > powerup/down routines needed to support eDP/eDP-LVDS panels
> > supported on exynos boards.
> >
> > The LCD and LED units are usually powered up via regulators,
> > and almost on all boards, we will have a BL_EN pin to enable/
> > disable the backlight. Sometimes, we can have LCD_EN switches
> > as well. The routines in this driver can be used to control
> > panel power sequence on such boards.
> >
> > Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> > ---
> > Changes since V1:
> >       Added routine for post_disable, removed few unwanted headers.
> >       Refactored a lot of code.
> >
> >  .../devicetree/bindings/panel/exynos-dp-panel.txt  |   45 ++++
> >  drivers/gpu/drm/panel/Kconfig                      |    9 +
> >  drivers/gpu/drm/panel/Makefile                     |    1 +
> >  drivers/gpu/drm/panel/panel-exynos-dp.c            |  251 ++++++++++++++++++++
> >  4 files changed, 306 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> >  create mode 100644 drivers/gpu/drm/panel/panel-exynos-dp.c
> >
> > diff --git a/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> > b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> > new file mode 100644
> > index 0000000..3fbca54
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/panel/exynos-dp-panel.txt
> > @@ -0,0 +1,45 @@
> > +exynos_DP_panel/DP_to_LVDS_panel
>
> Please fix it as below.
>
> +Exynos DP panel/DP to LVDS panel
>
Ok.

> [....]
>
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> > index 4ec874d..ea9d5ac 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -30,4 +30,13 @@ config DRM_PANEL_S6E8AA0
> >       select DRM_MIPI_DSI
> >       select VIDEOMODE_HELPERS
> >
> > +config DRM_PANEL_EXYNOS_DP
> > +     tristate "support for DP panels"
>
> It looks very general. Please fix it as below.
>
> +       tristate "support for Exynos DP panels"
>
Ok.

> Best regards,
> Jingoo Han
>
> > +     depends on OF && DRM_PANEL && DRM_EXYNOS_DP
> > +     help
> > +       DRM panel driver for DP panels and LVDS connected via DP bridges
> > +       that need at most a regulator for LCD unit, a regulator for LED unit
> > +       and/or enable GPIOs for LCD or LED units. Delay values can also be
> > +       specified to support powerup and powerdown process.
> > +
>
> [.....]
>
>

Thanks and Regards,
Ajay Kumar
