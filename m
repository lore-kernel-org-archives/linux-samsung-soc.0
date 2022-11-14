Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAE0C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Nov 2022 08:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236209AbiKNIIn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Nov 2022 03:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236231AbiKNIIi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 03:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C1B1A049
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Nov 2022 00:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668413260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sc3OD/33LVOTPB4+NFeZBiaw904aPGsKctdDvYBcdUs=;
        b=YR0p0aO6PVrPvwqwxzudxf94hsi3yofHzoRfbY8JbG01dVV0/scqVKqgh49jK6hpM+BYz4
        Co22oExnbEtoOLcVIInCtbDjyASnQyMNHVGa4yKKU//3r5EWGiz/oUDXZJlXzWZWvXL+Ar
        lYkkEN7lo3Q3NMUz9LEXiRWWu0hA3sE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-hM51ijWIPmuxmGY6ZcqZow-1; Mon, 14 Nov 2022 03:07:38 -0500
X-MC-Unique: hM51ijWIPmuxmGY6ZcqZow-1
Received: by mail-wr1-f70.google.com with SMTP id s11-20020adfbc0b000000b0023659af24a8so1743148wrg.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Nov 2022 00:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc3OD/33LVOTPB4+NFeZBiaw904aPGsKctdDvYBcdUs=;
        b=Vtv1NEVTSibR1DtadwKb/tpNLkhekJToC4QpGFdDNqSOXh/LeOlWa2p6mVSpMDapQX
         ihKCHPD61WPgTurjTM7srgm2FAL9Iw1XkpnKt0KuB/u6onED/WvmvFMPRPlDU4F0JODh
         kzKurCEsxa8HtVKgq7ov+jqLR/IB0+3RmmvcAQUt1ojsaxsMqzwFkqpwufRMTmq+qO7C
         Q2vQl5SIEX9NW1wVl7Uh0oDcJ27R7EfoIcTzqqNxh9thuTIfv+Ph1bZBVhHBRycz05Js
         AWUGiAF69Rn8jRA3fROeLHHXtejZ2OBx0nIkS1sUl+RSzigTmIPho+ii5rX/+Lg9evzK
         aXUg==
X-Gm-Message-State: ANoB5pmZOnodcGiR1dT1X8D1WOxn9P/cEjEOeIcffB9jscRn+XzlY3L6
        GbVLTWEVBfW9LzUlvau4TtRiHa+aqh+OUO00JBh1qaOcSIvY/nBXlkS/2XT9l1jsbG7gfl/c58s
        SEFdvHlKN7cHSgu1iHKBlu/Ep2LwIhF0=
X-Received: by 2002:a5d:4575:0:b0:236:6e4b:8c2 with SMTP id a21-20020a5d4575000000b002366e4b08c2mr6336353wrc.545.1668413257327;
        Mon, 14 Nov 2022 00:07:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7nVXgU/8Jv+xzckTpvD06sshk0g6lWh6ohMy1bXzH3vi7keYGWVfIARGixyNY+Rc8WvFWGhQ==
X-Received: by 2002:a5d:4575:0:b0:236:6e4b:8c2 with SMTP id a21-20020a5d4575000000b002366e4b08c2mr6336334wrc.545.1668413256954;
        Mon, 14 Nov 2022 00:07:36 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:d300:8765:6ef2:3111:de53? (p200300cbc703d30087656ef23111de53.dip0.t-ipconnect.de. [2003:cb:c703:d300:8765:6ef2:3111:de53])
        by smtp.gmail.com with ESMTPSA id g11-20020a5d540b000000b0022cdeba3f83sm8798705wrv.84.2022.11.14.00.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 00:07:36 -0800 (PST)
Message-ID: <f233f77b-a065-37aa-e2fb-5b92899dd13b@redhat.com>
Date:   Mon, 14 Nov 2022 09:07:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC 00/19] mm/gup: remove FOLL_FORCE usage from drivers
 (reliable R/O long-term pinning)
To:     Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
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
References: <20221107161740.144456-1-david@redhat.com>
 <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
 <Y3HaGbPcGfTxlLPZ@infradead.org>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y3HaGbPcGfTxlLPZ@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.11.22 07:03, Christoph Hellwig wrote:
> On Mon, Nov 07, 2022 at 09:27:23AM -0800, Linus Torvalds wrote:
>> And I'd really love to just have this long saga ended, and FOLL_FORCE
>> finally relegated to purely ptrace accesses.
> 
> At that point we should also rename it to FOLL_PTRACE to make that
> very clear, and also break anything in-flight accidentally readding it,
> which I'd otherwise expect to happen.

Good idea; I'll include a patch in v1.

-- 
Thanks,

David / dhildenb

