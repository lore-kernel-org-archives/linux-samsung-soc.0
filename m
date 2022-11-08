Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9B6C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Nov 2022 09:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233678AbiKHJaY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Nov 2022 04:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233540AbiKHJaW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 04:30:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CA011A02
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 01:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667899762;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G/IvXa3Gtc42ocSwbE6e2PTXEI1xHOCM/WDymiGQVjk=;
        b=EclQgB/BAXWPmHv1CQSriGjM01041EmwLWXrYJNK4SB8YG848WwPaT3gtRThNKwuxzmdw5
        WIGW9R+7AM/5gAAZRH/0L5G44XvsMJQpHiO/l6SjGpDw5LLZtlzG5p9K4gQknYqLCl5Jpf
        5BIWRtsM4d1QsnoJfX3bzespR7vjkbA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-5UCKFEviNsajfWX2ExYX4w-1; Tue, 08 Nov 2022 04:29:21 -0500
X-MC-Unique: 5UCKFEviNsajfWX2ExYX4w-1
Received: by mail-wm1-f69.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso6700327wmb.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Nov 2022 01:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/IvXa3Gtc42ocSwbE6e2PTXEI1xHOCM/WDymiGQVjk=;
        b=PeKK7zmuXp0KfZU2EIbJ5Cba4Rt1swHc4WBTYAZ9gnmibHi9VFTRsn3DMXLTGxs3za
         kNcrPrcxLXEkpwOcK2EmtK/pSPhxr2cb45bhpT3aZwG+P9Sl7Cw+PZgipQ452SPygqAD
         7v+u/V+PhGI1bhy3DbblSHVWQ4YcvbinMhPUnS6M+r+BYs12Ua7kAqztiLg+jmn+n7IF
         zsUkMDiGt5+3npCfWijjmZgKCIs8n7onw1Wr5QZIWtUBcbxAKN0M7V4rg1KXYC115m0T
         7QjUQs0gbQbT1zPf7ejX50R0MHScPtw5thsSIQpg1u1xgS/m8MsI1lVNpxohQk5xHEGZ
         Yzzg==
X-Gm-Message-State: ACrzQf3Ak0woOYgHxr1tuscFSIJ7NKMOebBufvvXQg5cz/PRU5hXX8LV
        dwXjkzJ/sHPi3B1udo9yV96FOgt8yt5F7jKX3ocAjSg3tOPZL6zDPtkAxUY3eus+CgIMchzm0KC
        dvJFJZKH+sVHEeCq60uxERJM9B7SJB8Q=
X-Received: by 2002:a1c:7418:0:b0:3cf:703a:4f0c with SMTP id p24-20020a1c7418000000b003cf703a4f0cmr31192081wmc.63.1667899760174;
        Tue, 08 Nov 2022 01:29:20 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5StZVkpugFYppLkRHp5xlGTjmqFOUyferk1nDQuYzjbb+gdKwEthZaHv8SGYCGJ8Geu++6Xg==
X-Received: by 2002:a1c:7418:0:b0:3cf:703a:4f0c with SMTP id p24-20020a1c7418000000b003cf703a4f0cmr31192042wmc.63.1667899759842;
        Tue, 08 Nov 2022 01:29:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:db00:6510:da8d:df40:abbb? (p200300cbc708db006510da8ddf40abbb.dip0.t-ipconnect.de. [2003:cb:c708:db00:6510:da8d:df40:abbb])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d420a000000b0023682011c1dsm9563940wrq.104.2022.11.08.01.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 01:29:19 -0800 (PST)
Message-ID: <ee9fceb8-f928-8754-d94f-54b662bb0c74@redhat.com>
Date:   Tue, 8 Nov 2022 10:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC 00/19] mm/gup: remove FOLL_FORCE usage from drivers
 (reliable R/O long-term pinning)
To:     Linus Torvalds <torvalds@linux-foundation.org>
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
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07.11.22 18:27, Linus Torvalds wrote:
> On Mon, Nov 7, 2022 at 8:18 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> So instead, make R/O long-term pinning work as expected, by breaking COW
>> in a COW mapping early, such that we can remove any FOLL_FORCE usage from
>> drivers.
> 
> Nothing makes me unhappy from a quick scan through these patches.
> 
> And I'd really love to just have this long saga ended, and FOLL_FORCE
> finally relegated to purely ptrace accesses.
> 
> So an enthusiastic Ack from me.

Thanks Linus! My hope is that we can remove it from all drivers and not 
have to leave it in for some corner cases; so far it looks promising.

-- 
Thanks,

David / dhildenb

