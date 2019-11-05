Return-Path: <SRS0=KVLS=Y5=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA5EC17498
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Nov 2019 14:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B94521929
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Nov 2019 14:41:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bBozmJV5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387763AbfKEOlk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Nov 2019 09:41:40 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44431 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbfKEOlk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 09:41:40 -0500
Received: by mail-lf1-f65.google.com with SMTP id v4so15319574lfd.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Nov 2019 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jBzTOxq85jxdofnlZM+XjruaJTIDQtuSsbh7qG9jKHg=;
        b=bBozmJV5Qw6b9lVapPQvukL2eua22QYk1tsW4G0355k0kjw9pURqm/uRwStnFEhLZR
         qC+5Ag8kIoG1xVD1hfQfSl7+po3u37+/b6N0zQAdCCEZWLhKMeOM3qvwZbD/y5ZPSoh6
         MTpvr6/VaUaAyoUz4Y8JccTmFEyS+gGu9TWdmB4keanawpHY4PkyNbC/Voz7M14+OnwZ
         TAYmCLZMTmHCvh1OlS+QhfLx88suOLdzkGHhH4anmzik178Ir6mYQkjWWe3B1jcu/+04
         a4brbdKi5sikiFVFPQq2Ib0/aLqGEoQrOSpOQwKU5qoOl+r+i4V2u+8HjMNE1sB13TOv
         FTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jBzTOxq85jxdofnlZM+XjruaJTIDQtuSsbh7qG9jKHg=;
        b=bcGO8xW9FvE5MR/Xxz8Vvy9nKgEXY3AzKoke7Mqf9hIj7+C/lu6u5kcCfvfGuP8gX6
         ByoLpGpTWPIwz+2IE3kUKF/XjtBWLL4nGMxee/zU/K6cFNyE+BpI4RTpw5dErO3KZMll
         e36NC9VCX2B4hfEccAlAluAQrvu00/Zf/bXjNqk2wqsDrLg/hbbzAAqqbdkkCML6BwGH
         YAOsI1Js6UYGlDxpugSpoTowANefVszaP2VhS4BjgaZzt1RmRO/GZJHLYf4zoFbm8RPW
         YI0JFVr+7oTUgnmObaw9alfsBe+rgu0eVmTpNqTqKumkY/0145ohngnlIDTn3QBSQlaG
         IHqA==
X-Gm-Message-State: APjAAAXIc+Pk1EOtxLq/Af4klBjsNaKWJdW9AADtAxTCtJSLgXTgdq+S
        m1PwNpPNIVFIGjDkbV3Toft0amY9rz7Gan9UldOLsg==
X-Google-Smtp-Source: APXvYqwfEk1h321csKMTRrt3DsgpCia8GUNn3QPeXjglwCRgaQ1riCiRrh9/anJdOd37y0N/igvpYMZJnznCmdaOJ5c=
X-Received: by 2002:a19:651b:: with SMTP id z27mr20715395lfb.117.1572964898491;
 Tue, 05 Nov 2019 06:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20191104175744.12041-1-krzk@kernel.org>
In-Reply-To: <20191104175744.12041-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 15:41:27 +0100
Message-ID: <CACRpkda6mtF=yjPMJReO50q1Xnys6i51zm2iJvHRidxZJCKU6w@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: Pull for v5.5
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 4, 2019 at 6:57 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
>
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.5
>
> for you to fetch changes up to a322b3377f4bac32aa25fb1acb9e7afbbbbd0137:
>
>   pinctrl: samsung: Fix device node refcount leaks in init code (2019-10-01 20:22:04 +0200)

Pulled into my pinctrl "devel" branch for v5.5, thanks!

Yours,
Linus Walleij
