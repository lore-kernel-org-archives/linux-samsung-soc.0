Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7267C43461
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 22:31:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8358F613C8
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 22:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhEFWcF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 May 2021 18:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbhEFWcF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 May 2021 18:32:05 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D95C061763
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 May 2021 15:31:06 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z13so10081090lft.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2021 15:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=htNAnGunm2mFYSv2XzhlQsCDD0LeBwjAb0MYMtun6cM=;
        b=BORPcZuE9+rrQQNFUoJnt6f4FpTDIRpdNZeTdxMdbIECzBdY5oiwCD0JpZedlSNZ+7
         bix+fDrgKkNKxnNlizSFTjxEzgqSzLtT6D02CJDWAGt9oBFGQ4VHrgxc6tYB6CmAeE2+
         8YQ9a8BVm4oo8k7TJnGL+6WsOCsGhg6VQJj04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=htNAnGunm2mFYSv2XzhlQsCDD0LeBwjAb0MYMtun6cM=;
        b=e1hFMN1LPx+4nr8GHLlT2HpyVXUvC3N9SetikaWzaG+abqZL4++zhADmKC/RsvM6/y
         oebNdgyAQhG8Kt1EwYxq9Lknyb2/4GuFmbAVtaKQjotkM3Fs3nPww8impExaMvRBY51f
         zsxF28rQFOUNYcSpjBuotWsagi+u/5qCfMXvO1jmgk/Y6dBzxwWINKz3lBayEb4zN6lr
         bWH8Jq9B095wE3GheMt/MXn9M5DxyKa9QgDg9qiI5LfMLiplDm1t7dvWeog2ePRD/4JV
         dBBIKm274ea66IdATzqsLfYxeAoRtvHMjbbMXVwh1Ozj2UFaC6WotEvykL4vzs+TMLGd
         wqdQ==
X-Gm-Message-State: AOAM532ezsLpvmQboa6a17JeCVXXWxuXk3RPQpPGk6+XQp8azB0pxIH8
        GrES3KRGky/5ZtucNSbSB/hdTQPvniFjhcRF
X-Google-Smtp-Source: ABdhPJx/NjjytPGqrdB7ALpQ2D2UN1y3beEFQHQQ6lq6X+0v1w+skEFOdcQ7IGvC94wcmpu75nuqEQ==
X-Received: by 2002:a05:6512:61c:: with SMTP id b28mr4518188lfe.140.1620340263193;
        Thu, 06 May 2021 15:31:03 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id f18sm965402lft.98.2021.05.06.15.31.02
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 15:31:02 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id t11so10003581lfl.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2021 15:31:02 -0700 (PDT)
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr4272160lfg.40.1620340261797;
 Thu, 06 May 2021 15:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
In-Reply-To: <YJBHiRiCGzojk25U@phenom.ffwll.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 6 May 2021 15:30:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
Message-ID: <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

[ You had a really odd Reply-to on this one ]

On Mon, May 3, 2021 at 12:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Anyway here's a small pull for you to ponder, now that the big ones are
> all through.

Well, _now_ I'm all caught up. Knock wood. Anyway, time to look at it:

> Follow-up to my pull from last merge window: kvm and vfio lost their
> very unsafe use of follow_pfn, this appropriately marks up the very
> last user for some userptr-as-buffer use-cases in media. There was
> some resistance to outright removing it, maybe we can do this in a few
> releases.

Hmm. So this looks mostly ok to me, although I think the change to the
nommu case is pretty ridiculous.

On nommu, unsafe_follow_pfn() should just be a wrapper around
follow_pfn(). There's no races when you can't remap anything. No?

Do the two media cases even work on nommu?

Finally - did you intend fo this to be a real pull request? Because
the email read to me like "think about this and tell me what you
think" rather than "please pull"..

And I have now fulfilled that "think about and tell me" part ;)

              Linus
