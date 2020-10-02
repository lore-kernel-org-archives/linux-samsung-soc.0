Return-Path: <SRS0=6p2y=DJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16470C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 06:10:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C619F206DD
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 06:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601619033;
	bh=I6Knx+Ogog7/r/UzOKphYL+YaQi3JaTyD2Ntod87fJo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=fm+wSaWK9fnR6iVxVtMB7V8Y7EGTTi5XHblnxqG13zXSiV892x2AnGz6joPPiTZCj
	 9QOUUpAfICuXXX2JD/1DExXdCgWNs7SZ3diJV9QnGqWmtWL3g+LR5RWkMGpceu8lzC
	 WPRZsueBNxpX1jOMzX5kdkCY7vakrVA5g2WIsHns=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgJBGKd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 2 Oct 2020 02:10:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:34154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbgJBGKd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 02:10:33 -0400
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F5F3206DD
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2020 06:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601619032;
        bh=I6Knx+Ogog7/r/UzOKphYL+YaQi3JaTyD2Ntod87fJo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yH3bGIQCW/wxHsQbQjU+9WHPECmxt0UbeRvjq2FE2PesKL3gR3c/E766aVeReylxM
         NgBL87VXlBGq0kp2P6rQftskIRFco0Q15cbP+YERWBgUTJs8wgy8CjACH6yleGvIIn
         xR1OTtweNxMEh1EU54TV1yUGJ36cPtvfRfZ7t0jc=
Received: by mail-ej1-f42.google.com with SMTP id i26so304191ejb.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Oct 2020 23:10:32 -0700 (PDT)
X-Gm-Message-State: AOAM533SCHZlqhiwtwYBBfYYPDloIRqq6hJMkSbqzRZ/RCsfY8R7asXM
        k+Pc0FniCrucAqvbCka5Hc5pB4L3DyyKXmh9yH4=
X-Google-Smtp-Source: ABdhPJzW14SvpLrmQkQeSS+laMBHOcnKWaNjEprUnMiYclOpoDAIHZqJGhG2l2rWlz0WtWcRAaO0OqiSiKEjGfYhwHc=
X-Received: by 2002:a17:906:82d1:: with SMTP id a17mr589555ejy.385.1601619030941;
 Thu, 01 Oct 2020 23:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df@eucas1p1.samsung.com>
 <20200911122236.16805-1-m.szyprowski@samsung.com> <20200920152738.GA7451@kozik-lap>
 <2414d856-0861-36a9-cd27-a684eb3447fb@samsung.com>
In-Reply-To: <2414d856-0861-36a9-cd27-a684eb3447fb@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 2 Oct 2020 08:10:18 +0200
X-Gmail-Original-Message-ID: <CAJKOXPesSZ8tWv=fJ6GheLBeUkDUjgcjQN-ZMEwEuWFERKthXg@mail.gmail.com>
Message-ID: <CAJKOXPesSZ8tWv=fJ6GheLBeUkDUjgcjQN-ZMEwEuWFERKthXg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos4412 bus OPP-tables
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 2 Oct 2020 at 08:00, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Krzysztof,
>
> On 20.09.2020 17:27, Krzysztof Kozlowski wrote:
> > On Fri, Sep 11, 2020 at 02:22:36PM +0200, Marek Szyprowski wrote:
> >> Commits 1019fe2c7280 ("ARM: dts: exynos: Adjust bus related OPPs to the
> >> values correct for Exynos5422 Odroids") and 9ff416cf45a0 ("ARM: dts:
> >> exynos: Disable frequency scaling for FSYS bus on Odroid XU3 family")
> >> revealed that 'opp-shared' property for the Exynos bus OPPs was used
> >> incorrectly, what had the side-effect of disabling frequency scaling for
> >> the second and latter buses sharing given OPP-table.
> >>
> >> Fix this by removing bogus 'opp-shared' properties from Exynos4412 bus
> >> OPP-tables. This restores frequency scaling for the following busses:
> >> C2C, RightBus, and MFC.
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>   arch/arm/boot/dts/exynos4412.dtsi | 6 ------
> >>   1 file changed, 6 deletions(-)
> >>
> > As discussed on IRC, I am waiting with these patches till you let me
> > know they're good.
>
> I got the information from Markus Reichl that this patch finally doesn't
> cause a regression. The issue he observed must be something else.
> Anyway, I would like to postpone this patch to the next release cycle to
> give it enough testing in linux-next.

Ok, thanks for letting me know.  I think postponing is a good idea.

Best regards,
Krzysztof
