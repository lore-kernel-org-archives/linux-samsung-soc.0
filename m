From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/6] ARM: SAMSUNG: pm: Adjust for pinctrl- and DT-enabled platforms
Date: Fri, 17 May 2013 22:23:07 +0200
Message-ID: <4241187.TFCdy2kUT6@flatron>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com> <1368807872-2601-4-git-send-email-t.figa@samsung.com> <CAD=FV=XJ=_o+hVbD=pPqXxXo=1PZdeRWyn-xyfS+Jf5LYfe2dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:53036 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753749Ab3EQUXL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 16:23:11 -0400
Received: by mail-ee0-f53.google.com with SMTP id c1so2508826eek.40
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 13:23:09 -0700 (PDT)
In-Reply-To: <CAD=FV=XJ=_o+hVbD=pPqXxXo=1PZdeRWyn-xyfS+Jf5LYfe2dg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Friday 17 of May 2013 12:24:04 Doug Anderson wrote:
> Tomasz,
> 
> On Fri, May 17, 2013 at 9:24 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> > This patch makes legacy code on suspend/resume path being executed
> > conditionally, on non-DT platforms only, to fix suspend/resume of
> > DT-enabled systems, for which the code is inappropriate.
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > 
> >  arch/arm/plat-samsung/pm.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
> > index 53210ec..8ac2b2d 100644
> > --- a/arch/arm/plat-samsung/pm.c
> > +++ b/arch/arm/plat-samsung/pm.c
> > @@ -261,7 +261,8 @@ static int s3c_pm_enter(suspend_state_t state)
> > 
> >          * require a full power-cycle)
> >         
> >         */
> > 
> > -       if (!any_allowed(s3c_irqwake_intmask, s3c_irqwake_intallow) &&
> > +       if (!of_have_populated_dt() &&
> > +           !any_allowed(s3c_irqwake_intmask, s3c_irqwake_intallow) &&
> 
> I'd rather see you modify patch set #2 to provide some function to
> retrieve just the eint mask and then use it here.  Your patch removes
> this test and doesn't replace it with anything.  If you moved this
> test to pinctrl directly you'd lose the test against intallow.

Well, looking from the perspective of status before my patch, it just 
bypasses a test that is incorrect on DT-enabled platforms.

I agree that this test is rather reasonable to have, but it would require 
defining a new interface and moving all platforms to it, which for now 
would be a bit of overkill.

IMHO a separate series that sanitizes the whole PM handling in plat-
samsung, including a rework of this check to make it cover all platforms 
in a generic and multiplatform-friendly way. What do you think?

> ...or do you think this test is no longer useful for some reason?
> 
> >             !any_allowed(s3c_irqwake_eintmask, s3c_irqwake_eintallow))
> >             {
> >             
> >                 printk(KERN_ERR "%s: No wake-up sources!\n",
> >                 __func__);
> >                 printk(KERN_ERR "%s: Aborting sleep\n", __func__);
> > 
> > @@ -270,8 +271,11 @@ static int s3c_pm_enter(suspend_state_t state)
> > 
> >         /* save all necessary core registers not covered by the
> >         drivers */
> > 
> > -       samsung_pm_save_gpios();
> > -       samsung_pm_saved_gpios();
> > +       if (!of_have_populated_dt()) {
> > +               samsung_pm_save_gpios();
> > +               samsung_pm_saved_gpios();
> > +       }
> > +
> 
> Ah, the important part here is the "saved", not the "save"!  The
> "save" should get a NULL chip for all GPIOs and effectively be a
> no-op.
> 
> Skipping the "saved" is important of s3c64xx and s5p64x0 where the
> "saved" seems to transition things over to powerdown mode.  Hopefully
> a future patch of yours adds that back for those platforms in the
> pinmux world.  ...same for restore.

S3C64xx can be switched to power down pin configuration manually, but if 
you don't do it, it will activate it automatically after entering sleep 
mode.

> Summary: I've tested this on exynos5250-snow and it's reasonable but
> I'd love a response about the missing test before adding Reviewed-by.

Thanks.

Best regards,
Tomasz
