From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: add pinctrl support to Exynos5420
Date: Wed, 12 Jun 2013 23:38:07 +0200
Message-ID: <2022855.FJPYCTz0ZP@flatron>
References: <1371048688-9089-1-git-send-email-l.krishna@samsung.com> <CAD=FV=VhmCVzy-ahhhE-5ZF-cvXktchnAuaiRAG8A-KUj+azbw@mail.gmail.com> <CAD=FV=Un9=cm_Drhvgba9jnhGgh4ss2YBb+CFDTNMfUmaoVjFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:33573 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890Ab3FLViK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 17:38:10 -0400
Received: by mail-ea0-f179.google.com with SMTP id b15so6019290eae.38
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 14:38:09 -0700 (PDT)
In-Reply-To: <CAD=FV=Un9=cm_Drhvgba9jnhGgh4ss2YBb+CFDTNMfUmaoVjFA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Simon Glass <sjg@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, s.nawrocki@samsung.com

On Wednesday 12 of June 2013 14:35:30 Doug Anderson wrote:
> Tomasz,
> 
> On Wed, Jun 12, 2013 at 2:20 PM, Doug Anderson <dianders@chromium.org> 
wrote:
> > Tomasz,
> > 
> > On Wed, Jun 12, 2013 at 1:58 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> >>> +     pinctrl@13400000 {
> >>> +             gpy7: gpy7 {
> >>> +                     gpio-controller;
> >>> +                     #gpio-cells = <2>;
> >>> +
> >>> +                     interrupt-controller;
> >>> +                     #interrupt-cells = <2>;
> >> 
> >> According to patch 2/3, this bank doesn't support interrupts, as it's
> >> defined using EINTN macro. Which variant is correct?
> > 
> > As far as I know the GPY registers don't support interrupts, so this
> > should be removed.  Nice catch!
> 
> Argh.  I'm not sure what I was just searching before (I probably
> messed up and searched for gpy6 or something), but I just searched
> again and am now seeing that GPY7 actually does support interrupts,
> unlike all of the other gpy banks.

This or other way, one of the patches needs to be fixed. If this bank 
supports interrupts, the patch adding driver data needs to be adjusted to 
use the EINTG macro.

Best regards,
Tomasz
