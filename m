From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/5] pinctrl: samsung: Data structure clean-up
Date: Wed, 8 Oct 2014 12:23:28 +0200
Message-ID: <CACRpkdY1GjDEfRH=48e24m+UcKzdPhROJBKDertS+q+e0td03g@mail.gmail.com>
References: <1412275931-10807-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:63863 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755474AbaJHKX3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Oct 2014 06:23:29 -0400
Received: by mail-ig0-f173.google.com with SMTP id h18so6767509igc.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Oct 2014 03:23:28 -0700 (PDT)
In-Reply-To: <1412275931-10807-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Thu, Oct 2, 2014 at 8:52 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> This series intends to clean up data structures used by pinctrl-samsung driver.
> More specifically, it separates initial compile time constants from data used
> at runtime, allowing unused variant data to be dropped and selected structures
> constified to improve safety.

Thanks!

The patches missed the v3.18 merge window, but I have queued them up as
the first thing to go into v3.19.

Now I need you to help me check the patch set from Abhilash so I know
what to do about that, whenever you have some time...

Yours,
Linus Walleij
