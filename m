Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BEBC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Nov 2022 17:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbiKGR1n (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Nov 2022 12:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbiKGR1n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 12:27:43 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E3F23BD7
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Nov 2022 09:27:42 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id u7so8542953qvn.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2022 09:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OtwMIMageNgEFgITDbP/X4AlmExFVOD7QsjK39jRkOs=;
        b=ZrBbGd0NE5W3bFjfpMfVEGchJiOqL5vKGUnJZWHQEDCz71oryF6CDiPscJkkJaNeeg
         /pKDfIl6hW5yw8tjgrcZSOwrloCrFqYb1/s9Bc1/cV94xFkaKkZwH1bCSgyaTCtOH5Nq
         2ijwSehO6aXkrD87GuWevIaaXGPhzXmGc/u0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtwMIMageNgEFgITDbP/X4AlmExFVOD7QsjK39jRkOs=;
        b=yf6pm1iMZYqH6EKiVBaawCLDYq5WPUW0Xmk+HA+Y13xsMT/NOrdOd1XtB51r1+XfUi
         YSQssXmdMptW2eoHGD6UcRuY35n7IK+BduThHo5QJAh7HQkD7E2JJpXba9S9Tqt/lvyN
         hEgq0rfxCHbb9qaW1WAZXUMMOtQ2HjBZY01YaR9MRMDq/U2Ranl6YPi6n6l4a6NB+uzF
         suuVz0l49wHzjcBaw9PU7TLKljLEi3LHhMeKmiZGciXGTZYH5nNe/q693WtUe9aErTzA
         CaMHOAm6KXKtGJ5zATBm8QvTFuPbXfiph+k3Iv+imAyJIvHcisntn/LQwDfvjnitl1zk
         m+SQ==
X-Gm-Message-State: ACrzQf1inTzrY0eSnReahxAvnTGh686juS4Lh7uks63HSnxaCaYHPCjf
        sQkxjZ5RwznSBqR2k5/0eN/4tYtm71vN0Q==
X-Google-Smtp-Source: AMsMyM7tS8sErPzwpvc4mgNHjM4SBDfiFK69FH6IpUNhkSKlTrkTZxfPkXYN2qM9Bzb358XZ+22s4w==
X-Received: by 2002:a05:6214:2484:b0:4bb:de5d:b6e4 with SMTP id gi4-20020a056214248400b004bbde5db6e4mr42337907qvb.126.1667842061308;
        Mon, 07 Nov 2022 09:27:41 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id q22-20020a05620a0d9600b006fafaac72a6sm680410qkl.84.2022.11.07.09.27.39
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:27:40 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id o70so14421532yba.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2022 09:27:39 -0800 (PST)
X-Received: by 2002:a05:6902:1352:b0:6bb:3f4b:9666 with SMTP id
 g18-20020a056902135200b006bb3f4b9666mr46634218ybu.101.1667842059236; Mon, 07
 Nov 2022 09:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com>
In-Reply-To: <20221107161740.144456-1-david@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 7 Nov 2022 09:27:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
Message-ID: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/19] mm/gup: remove FOLL_FORCE usage from drivers
 (reliable R/O long-term pinning)
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 7, 2022 at 8:18 AM David Hildenbrand <david@redhat.com> wrote:
>
> So instead, make R/O long-term pinning work as expected, by breaking COW
> in a COW mapping early, such that we can remove any FOLL_FORCE usage from
> drivers.

Nothing makes me unhappy from a quick scan through these patches.

And I'd really love to just have this long saga ended, and FOLL_FORCE
finally relegated to purely ptrace accesses.

So an enthusiastic Ack from me.

                   Linus
