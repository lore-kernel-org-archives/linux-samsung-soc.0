From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] ARM: dts: add pinctrl support to Exynos5420
Date: Wed, 12 Jun 2013 14:35:30 -0700
Message-ID: <CAD=FV=Un9=cm_Drhvgba9jnhGgh4ss2YBb+CFDTNMfUmaoVjFA@mail.gmail.com>
References: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
	<1371048688-9089-2-git-send-email-l.krishna@samsung.com>
	<1531737.EaJZJjF9GR@flatron>
	<CAD=FV=VhmCVzy-ahhhE-5ZF-cvXktchnAuaiRAG8A-KUj+azbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:64349 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890Ab3FLVfc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 17:35:32 -0400
Received: by mail-la0-f41.google.com with SMTP id fn20so8406909lab.14
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 14:35:30 -0700 (PDT)
In-Reply-To: <CAD=FV=VhmCVzy-ahhhE-5ZF-cvXktchnAuaiRAG8A-KUj+azbw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Simon Glass <sjg@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, s.nawrocki@samsung.com

Tomasz,

On Wed, Jun 12, 2013 at 2:20 PM, Doug Anderson <dianders@chromium.org> wrote:
> Tomasz,
>
> On Wed, Jun 12, 2013 at 1:58 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>> +     pinctrl@13400000 {
>>> +             gpy7: gpy7 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>
>> According to patch 2/3, this bank doesn't support interrupts, as it's
>> defined using EINTN macro. Which variant is correct?
>
> As far as I know the GPY registers don't support interrupts, so this
> should be removed.  Nice catch!

Argh.  I'm not sure what I was just searching before (I probably
messed up and searched for gpy6 or something), but I just searched
again and am now seeing that GPY7 actually does support interrupts,
unlike all of the other gpy banks.

-Doug
