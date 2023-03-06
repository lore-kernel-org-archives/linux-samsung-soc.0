Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A05DC6FD1A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 18:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjCFS6F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 13:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjCFS5p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 13:57:45 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9297A2FCD3
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 10:57:03 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id z11so6511380pfh.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 10:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678129023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q4VNX9AKs6J487z5M02xyDbugGpu1Iv9Ot4zxZx+KQg=;
        b=CsVOEvXR/4BB4ezbcg6KH410DS2OUmgWsXSl/XP5bdveHBaVCSle3aeixNKG96Ae2u
         66UlYlU26O1fF7l8y4oSxzpmzgg6mys5IZJa+Sofvba49h1iSYTiGHVJ40Pe1z/qCSfB
         i1sBK7p6wxoZe6Ep1rtVVz9iksTmobtXaKNQz7drLLHmySUsExrfucyhWamZT2gRKL66
         wbWvVONlCIEz9AlzzVpAAn6zyBcYZs12ROk7XeYDZuGrSR4Y/KxtXdUkx40TwIzD52Y+
         z5uFu3O+y2HCdDXU8NlSUVjNVrygS1QogcHRtDjU8KvWwvqftN7pmIBMv5lQp8lccSuv
         eNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4VNX9AKs6J487z5M02xyDbugGpu1Iv9Ot4zxZx+KQg=;
        b=Li6hIsQgUTev573bV1u9KsSUXmMeV3LEdSlc1h0jG45ndAFYeMtwOPf2f8qjHgHeFA
         SRB7+S9Zx9fU8pvNzJmpjRKpVxzIPzE/H0QaSQ9S9/1Z9e0axmdfXf9C0jDPArDlP3eF
         Bo6QFkirbwcxncFyRugu3U11CvvoKFl6G7Ykc++oNO3d4J7qLaAWfv1IS/Xon6HxSEwI
         +eUG59VLfKspQyT+QCRaZtjB8EcPjX6IRaDgammgGynu7xXZG9o0Bw25BQtsvRnyBcKq
         A8acYfnbmcOs8oNkTOPxKouVQXCg3hq/R68OfQPzY689SvtZV8L7c1oAk1z+oRSFwDoQ
         RWxg==
X-Gm-Message-State: AO0yUKXgTS1e56MS++akcxtlBF3Dbb5oOKzyT1BediXekTTRw4iTWkTg
        FXBKexqeSDg351V1wTb8bQP2N0y8mrb6JE5rkvozIw==
X-Google-Smtp-Source: AK7set/Lhx/WbXb2E0mYnBRxlPdYP05f5ap5IZriOV5UB84a2xl+6qQ8xbvpHHLekk0GSzD6e5RyV9FeaDhYecL2E0Y=
X-Received: by 2002:a62:f807:0:b0:5a9:d579:6902 with SMTP id
 d7-20020a62f807000000b005a9d5796902mr5019575pfh.0.1678129022821; Mon, 06 Mar
 2023 10:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20230223041938.22732-1-semen.protsenko@linaro.org>
 <20230223041938.22732-3-semen.protsenko@linaro.org> <f26c7ad2-a000-901e-d6d4-74c9ce1032cd@linaro.org>
In-Reply-To: <f26c7ad2-a000-901e-d6d4-74c9ce1032cd@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 6 Mar 2023 12:56:51 -0600
Message-ID: <CAPLW+4m=qpv4OnVuUTFOvFgeR60b40ChYRfPaxdd3fBm4dND6A@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] clk: samsung: Remove np argument from samsung_clk_init()
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Mar 2023 at 08:40, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/02/2023 05:19, Sam Protsenko wrote:
> > The code using `np' argument was removed from samsung_clk_init(). Remove
> > that leftover parameter as well.
> >
> > No functional change.
> >
> > Fixes: d5e136a21b20 ("clk: samsung: Register clk provider only after registering its all clocks")
>
> Fixes should come before any other patches, so backporting is
> easier/possible.
>

Noted, thanks.

> I assume there is no dependency here with patch 1/6, so I just reversed
> their order and applied.
>

Thanks, Krzysztof! Yeah, should be no dependency, everything looks clean to me.


>
> > Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>
>
> Best regards,
> Krzysztof
>
