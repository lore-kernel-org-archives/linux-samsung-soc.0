Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8613C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Sep 2021 03:42:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89A0F613D0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Sep 2021 03:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244029AbhI2DoX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 23:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242428AbhI2DoV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 23:44:21 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEB3C061746
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 20:42:41 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id e15so4864529lfr.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 20:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IuNTL9gPvpWYsW3AwxYryKONOf4+S+yGJL4QxUsihbA=;
        b=h7mvpzImaXE2WV7qwWKc2k5Jqj0LIXIZYtDyLIOOa7f0MYkXYYneJn5QWbqPgwBQxQ
         bSiclPOqlt57iy3gVD8Q6aXV0R3mZs0DU421XL+PEBe9/UyURCMtA4Ux2VfU9AjuLnuL
         dvu5KRMi2MZPbyVWgjqy7XGMiLfXKLHVOQCphKRcU7Ipe18W7J9z3+vFpTPPBhKWFTmA
         aDB1WUxmKCqha1Paw/WytXLKfSPjuU772NfZv7P3hzhteJ6iJdoVt8abA9dBiQbFEnLL
         LgFksSFjwAXKFOE0aYOBuX79a/qG7kTJsQvDZpmvm0CqetzfQXBXBg0vZ8lVKqL+xK+V
         9V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IuNTL9gPvpWYsW3AwxYryKONOf4+S+yGJL4QxUsihbA=;
        b=r2gCh3GbfY8TgXcXhq5RroOg6P5Qh5u/fD9WUwpXBWPsH8C/bp6j7VJFWCdwCYFdG3
         QHYFWgOE9XjXo48gNoI1ZLPWUXi5knJQM4EUDoZ+F6dcFcuGTTdjB8CYKvmo1vlfYjwi
         V7WOu6EmYrivebcJeej5t0fX4c/OjWSWD7/hrWgLVVKScVEiRw/tHA7zrtVf021UzIZU
         frwj8rvxxK0DZk9iUTad9/mBjZA6TQ54Te7tV+ykJjgEAT9xexnjpFYNRZFehbWqTSIW
         /k4MnE7fmHqC51M7a4MyL8lIvHcczbgWLcdjcmGukPCbK7dWAXozab4S21dgJ12/rsYN
         RHvg==
X-Gm-Message-State: AOAM530sSkV4ymp1wC+N1zwVOTKLlvZA7SsR4NEoXV1/VX74o4PfEjS+
        okPwR/oPYd259Ti45lX7QZmCM390NKkFutar/6lzig==
X-Google-Smtp-Source: ABdhPJwflCbRIz99ZM3n81OZD0bcobRt+9ytyfnyFvFexD+UThys3zwr5ilEDOM1PEC9Bhei1U3vyqJMMda+w4ALBr4=
X-Received: by 2002:a2e:83c5:: with SMTP id s5mr3615270ljh.515.1632886958477;
 Tue, 28 Sep 2021 20:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com> <20210928235635.1348330-3-willmcvicker@google.com>
In-Reply-To: <20210928235635.1348330-3-willmcvicker@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 28 Sep 2021 20:42:27 -0700
Message-ID: <CALAqxLUju1Bw0dDpi_oK6-eOiP6B2Xm1MV19G53WaRFm3Z_AWw@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] timekeeping: add API for getting timekeeping_suspended
To:     Will McVicker <willmcvicker@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Sep 28, 2021 at 4:56 PM Will McVicker <willmcvicker@google.com> wrote:
>
> This allows modules to access the value of timekeeping_suspended without
> giving them write access to the variable.
>

It's important to cover "the why" not "the what" in these commit
messages, so you might add a note as to what code will be the user of
this (the samsung/clk-pll.c code changed later in this series).

thanks
-john
