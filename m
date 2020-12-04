Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C236C4361A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 09:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA73522955
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 09:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387512AbgLDJOR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 04:14:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:44236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726471AbgLDJOQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 04:14:16 -0500
X-Gm-Message-State: AOAM530A9XbRcLs8bNvqvlMpPm1wYHeIv6xzSYbtDREbJdWwx+6cZbY7
        PMrSONXbYrJtI2FeRgV4gFaImCaFMTInSXxljvE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607073215;
        bh=5WtSlGb23+mbjhUPbJTZ80Wv7x5m/wrYGj2VEx0ukzo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VUa4wxyDYt3r+1GlYKGqfQN3XCuW6+SbwDyM106y0YFLQr87FO0BUpiqnuZZQ/61G
         nSXkkWWMfcjLCW7dgLcDQW9vsPPMftBvT4F+fqF5tZBPtjXO7/5VjzpVM2VuZNT5rU
         QcVvFviXNbpPGgiEJUiUDr9vb2U2j/ptG9XzzKPymloa9Lug3CwFaZf7gODZ5ONb2s
         OjGIS6aDQIvmmRfM256Ry1ne7rTKfM8VFEG244qlMdWuFGubffwkktp20t39dqGP0i
         NWDTXgcdshzprUyRyyljpbHFCNDKVQw/um/Jdk7mzQDKL1Kh6PH0JD7ADdzNx4LBZg
         PUFzJw4KWIe7A==
X-Google-Smtp-Source: ABdhPJz3chQLz40TpvGvgJerGH9E6SXtXIYBinIoPidHzLuCuhVrYP+NjqealiTMEzeZjAoU+u3xvxBYFXmufZwiIV0=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr2875729otc.305.1607073215030;
 Fri, 04 Dec 2020 01:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20201203225315.1477137-1-arnd@kernel.org> <20201204083653.GA5418@kozik-lap>
In-Reply-To: <20201204083653.GA5418@kozik-lap>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 4 Dec 2020 10:13:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Qh1by1pL8GfjqVK+dnydK8fS2qQ2+7uSZYtksb93fUg@mail.gmail.com>
Message-ID: <CAK8P3a3Qh1by1pL8GfjqVK+dnydK8fS2qQ2+7uSZYtksb93fUg@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: mark PM functions as __maybe_unused
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Dec 4, 2020 at 9:36 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, Dec 03, 2020 at 11:53:11PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
>
> I understand this happens with !PM builds. It would be good to mention
> this in commit msg. With commit msg improved:
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for taking a look.

I had meant to add a changelog text and failed to notice that this only
had the warning message and neither a Fixes tag nor a description when
I sent it out.

v2 coming.

         Arnd
