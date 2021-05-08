Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3599C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  8 May 2021 16:47:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE54061424
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  8 May 2021 16:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhEHQsF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 8 May 2021 12:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhEHQsE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 8 May 2021 12:48:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E82C061574
        for <linux-samsung-soc@vger.kernel.org>; Sat,  8 May 2021 09:47:01 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2so17192628lft.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 May 2021 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RpBgi0AKlff8147OOEepLQzMBGFd2Jt9bavNArPpQME=;
        b=bypPdqFJPA5UGrC7VjMqIpDRd67/c4G9oxLzYlL8bqj5WHAW1G0t+zlQDg0DLILqA8
         K4pattodnxkJL9u3sPT5fbfMSAiz0Z1Bc3f1KBYDfpdNL36j/INuMqu9tRPTnyIKMJaK
         wTzy/qU2N01zcOpGy1Hz/2WG6ax9Mzy9on2bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RpBgi0AKlff8147OOEepLQzMBGFd2Jt9bavNArPpQME=;
        b=MEVhuZOC85uNo+vLZLlm35x08mM87s2evsN9D+HlmtY174aVEwaXeE08Rr0WAd8R7j
         GZs982sLGSCBmAUSXKqDtdIJMBeD7xk7iWsJOxrVT1dioOHbbLGGVHNFi6TbgRBjOa0c
         aTJzLFrhOUeHY/ea6HcSsC/1Dfs44VA6pGthddezfyhYNO8GQP5U4ATB6tPzmHDwj8Gk
         4VSlNkl0VqMcPhjhPt77AnKvR6kwh99pP/pAgfpzVLb3rY7npaveHkNOGowo8pL2hKr/
         3HNdxCDoMu+apWQNvYdcuc8KGUPsuRd4VnTR1ynQdmjezTLhjGoPrtRniKjKQnGGb+uW
         1B2A==
X-Gm-Message-State: AOAM532oNJldfedVNZkW1tzG2FK7e5WpSissph4KeuzAvcWLjRVkTEJ6
        1DoJOa9zyceFVfy/wbkPUzuw6ZOBAyluMuuyxB8=
X-Google-Smtp-Source: ABdhPJyZ9vbHYl/63/PPk6dAAYBxGepvZLgIUQXP6rVpMI7w0VcPa+FWxkRCBZwZkHxbe0G5lKojOQ==
X-Received: by 2002:a05:6512:78d:: with SMTP id x13mr10516015lfr.35.1620492419461;
        Sat, 08 May 2021 09:46:59 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id o16sm1656861lft.304.2021.05.08.09.46.57
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 May 2021 09:46:57 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id x2so17146802lff.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 May 2021 09:46:57 -0700 (PDT)
X-Received: by 2002:a19:7504:: with SMTP id y4mr10031878lfe.41.1620492417345;
 Sat, 08 May 2021 09:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <YJBHiRiCGzojk25U@phenom.ffwll.local> <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
In-Reply-To: <YJVijmznt1xnsCxc@phenom.ffwll.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 8 May 2021 09:46:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
Message-ID: <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
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

[ Daniel, please fix your broken email setup. You have this insane
"Reply-to" list that just duplicates all the participants. Very
broken, very annoying ]

On Fri, May 7, 2021 at 8:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> So personally I think the entire thing should just be thrown out, it's all
> levels of scary and we have zero-copy buffer sharing done properly with
> dma-buf since years in v4l.

So I've been looking at this more, and the more I look at it, the less
I like this series.

I think the proper fix is to just fix things.

For example, I'm looking at the v4l users of follow_pfn(), and I find
get_vaddr_frames(), which is just broken.

Fine, we know users are broken, but look at what appears to be the
main user of get_vaddr_frames(): vb2_dc_get_userptr().

What does that function do? Immediately after doing
get_vaddr_frames(), it tries to turn those pfn's into page pointers,
and then do sg_alloc_table_from_pages() on the end result.

Yes, yes, it also has that "ok, that failed, let's try to see if it's
some physically contiguous mapping" and do DMA directly to those
physical pages, but the point there is that that only happens when
they weren't normal pages to begin with.

So thew *fix* for at least that path is to

 (a) just use the regular pin_user_pages() for normal pages

 (b) perhaps keep the follow_pfn() case, but then limit it to that "no
page backing" and that physical pages case.

And honestly, the "struct frame_vector" thing already *has* support
for this, and the problem is simply that the v4l code has decided to
have the callers ask for pfn's rather than have the callers just ask
for a frame-vector that is either "pfn's with no paeg backing" _or_
"page list with proper page reference counting".

So this series of yours that just disables follow_pfn() actually seems
very wrong.

I think follow_pfn() is ok for the actual "this is not a 'struct page'
backed area", and disabling that case is wrong even going forward.

End result, I think the proper model is:

 - keep follow_pfn(), but limit it to the "not vm_normal_page()" case,
and return error for some real page mapping

 - make the get_vaddr_frames() first try "pin_user_pages()" (and
create a page array) and fall back to "follow_pfn()" if that fails (or
the other way around). Set the

IOW, get_vaddr_frames() would just do

        vec->got_ref = is_pages;
        vec->is_pfns = !is_pages;

and everything would just work out - the v4l code seems to already
have all the support for "it's a ofn array" vs "it's properly
refcounted pages".

So the only case we should disallow is the mixed case, that the v4l
code already seems to not be able to handle anyway (and honestly, it
looks like "got_ref/is_pfns" should be just one flag - they always
have to have the opposite values).

So I think this "unsafe_follow_pfn()" halfway step is actively wrong.
It doesn't move us forward. Quite the reverse. It just makes the
proper fix harder.

End result: not pulling it, unless somebody can explain to me in small
words why I'm wrong and have the mental capacity of a damaged rodent.

                Linus
