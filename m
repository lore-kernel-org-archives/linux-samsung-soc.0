Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65287C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 26 Nov 2021 14:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353611AbhKZOVt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 26 Nov 2021 09:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353619AbhKZOTr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 09:19:47 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEF6C08EA7F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Nov 2021 05:32:21 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id t11so18788887ljh.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Nov 2021 05:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BihJj1qpi6FzzYvrNJZtab4h849IlijBgKxFTqdVcok=;
        b=lE+PYnpDr4XYfE0rLaRAQtWaz2Ks2mMu9n1rZVymx2rgHoJAITvz559plBVApGYtUZ
         5INIqFHDmCIP9B/+nDcxBK28yZiP6c8COBl7Aa0hcA5X5B3jL+HCF+3qHnaEquoLrwdz
         aMnCviANj/UutBT84isZSwj3tz8Yt4qD+Y2YOVWzf6D8AZL0xAr8lvG9Zn7JegsUqeU2
         5mn9kTy0lPf34z/6whn0mN3eQcxWdds2i+mORvr6lTpxL161CTeKsZVkyTA8WKy0G6IN
         tBGjA4e+W3F+K+thIQ7cHZRMFUNkf9qUb3Gpapa+HwOPMOXdnqeKS3cCoFqg6zJCgYUC
         532w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BihJj1qpi6FzzYvrNJZtab4h849IlijBgKxFTqdVcok=;
        b=TwC5bLKdLGvW1MMWE/Y17SsV7npVusZYMRUN6L1EUdOteVYg99mwq0juX8RqrbAQtL
         7XgMcSP84R3hLIwxhNfcfmhLuJioQIbRYzJrB+gkt0XuCo0R5naZ6o6vpaHY6/qrRqnC
         N1alcvEWykO8YmCI64VJJONsgOXl/Cvfy3ckt8HKgB9aRySMt8zUlluCZ07T5N0jYzqO
         SbqrOVB02EwglU300JMc757K/6/2EedP/5Mfo58YK9X8JLDdQGTEEMgyv/d478JVCBB0
         eTRt50Q4fsO37QmGp6OfMxPzXyN1UrBPO32JDQE3e5jRCxwAN9U3GCULeDhukiiBkojc
         LKDQ==
X-Gm-Message-State: AOAM531ccEspuct7BNfOws0liBocPao/s85lox9EPBdUMHf4yAez+dP2
        uem12/+PjhvNzJ3lfjm5ASLxKlGfAlzo4GfXemiMIQ==
X-Google-Smtp-Source: ABdhPJzywiDDQKC6yFc3WwKw4jiKbh02+WUllDWYJLGKGv2knX9b5u54YH9Xh2KPDV4cD5Ewh2BWBkykMbYrS9LL70c=
X-Received: by 2002:a2e:a22a:: with SMTP id i10mr31783402ljm.16.1637933539553;
 Fri, 26 Nov 2021 05:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20211124184603.3897245-1-john@metanate.com> <CAPDyKFr=ok3uKXS8bWtZPvyLOeA2cF_4Z2c7ROcoMfBF2G1uhA@mail.gmail.com>
In-Reply-To: <CAPDyKFr=ok3uKXS8bWtZPvyLOeA2cF_4Z2c7ROcoMfBF2G1uhA@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 26 Nov 2021 14:31:43 +0100
Message-ID: <CAPDyKFo8c51KR+1ju+WCp2xk7_uYKzS+_vBjWxnB7Y3zGYasFg@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: dw_mmc: start deprecating mshcN aliases
To:     John Keeping <john@metanate.com>
Cc:     linux-mmc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 24 Nov 2021 at 20:24, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 24 Nov 2021 at 19:46, John Keeping <john@metanate.com> wrote:
> >
> > This series is prompted by discussion on a previous patch set [1] but is
> > a totally different approach and only a partial solution.
> >
> > With these patches, the dependency on the mshcN alias is totally removed
> > from dw_mmc-hi3798cv200 and dw_mmc-rockchip and dw_mmc-exynos moves
> > towards being able to consider the mshcN aliases deprecated.
> >
> > I haven't changed dw_mci_hi6220_caps here, although it looks like it's
> > possible to apply MMC_CAP_CMD23 to all controllers there with no change
> > in behaviour as the final entry is SDIO for which CMD23 is not
> > applicable IIUC.  But I'm not familiar with that hardware and don't feel
> > confident making that change.
> >
> > [1] https://lore.kernel.org/all/20211116190244.1417591-1-john@metanate.com/
> >
> > John Keeping (4):
> >   mmc: dw_mmc: add common capabilities to replace caps
> >   mmc: dw_mmc: hi3798cv200: use common_caps
> >   mmc: dw_mmc: rockchip: use common_caps
> >   mmc: dw_mmc: exynos: use common_caps
> >
> >  drivers/mmc/host/dw_mmc-exynos.c      |  9 +++++----
> >  drivers/mmc/host/dw_mmc-hi3798cv200.c |  9 +--------
> >  drivers/mmc/host/dw_mmc-rockchip.c    | 11 +----------
> >  drivers/mmc/host/dw_mmc.c             |  3 +++
> >  drivers/mmc/host/dw_mmc.h             |  3 +++
> >  5 files changed, 13 insertions(+), 22 deletions(-)
> >
> > --
> > 2.34.0
> >
>
> This looks good to me, I intend to apply this later this week, unless
> objections of course.
>
> In the meantime, I will continue to look at what we can do to resolve
> the exynos/k3 issues around this.

Let's consider additional changes to be on top of this, as this is
certainly a nice step forward.

So, applied for next, thanks!

Kind regards
Uffe
