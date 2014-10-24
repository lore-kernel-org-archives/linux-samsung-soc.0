From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/5] pinctrl: samsung: Data structure clean-up
Date: Fri, 24 Oct 2014 14:02:50 +0200
Message-ID: <CACRpkdbFB+o5VAtHUf97GAONmSFc_7wMuzPN8p_JDdiGW8vfLA@mail.gmail.com>
References: <1412275931-10807-1-git-send-email-tomasz.figa@gmail.com>
	<CACRpkdY1GjDEfRH=48e24m+UcKzdPhROJBKDertS+q+e0td03g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f42.google.com ([209.85.213.42]:55764 "EHLO
	mail-yh0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932343AbaJXMCv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 08:02:51 -0400
Received: by mail-yh0-f42.google.com with SMTP id t59so489800yho.15
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2014 05:02:50 -0700 (PDT)
In-Reply-To: <CACRpkdY1GjDEfRH=48e24m+UcKzdPhROJBKDertS+q+e0td03g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Wed, Oct 8, 2014 at 12:23 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Oct 2, 2014 at 8:52 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>
>> This series intends to clean up data structures used by pinctrl-samsung driver.
>> More specifically, it separates initial compile time constants from data used
>> at runtime, allowing unused variant data to be dropped and selected structures
>> constified to improve safety.
>
> Thanks!
>
> The patches missed the v3.18 merge window, but I have queued them up as
> the first thing to go into v3.19.

I wrote somewhere else that this exploded somehow.

I've merged Abhilash's patches so now this work needs to be rebased
on top of his stuf...


Yours,
Linus Walleij
