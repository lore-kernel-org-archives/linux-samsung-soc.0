Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F02C43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Nov 2022 19:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbiKGT2R (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Nov 2022 14:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbiKGT2N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2022 14:28:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4E2286E7
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Nov 2022 11:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667849235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=patZqZFG+VP3DSfi5ljEiY21OGL00v17le5HXIzu3EI=;
        b=MjpZ0iLWffF3KHMejyx3ycZLjlR7Fe0Sjig2BoNU4yjhZzR+P9EF3rVDcsRPNEysnfW9JI
        inv2HWCpsvDkjZt3SwHULlS7xK7aMzaXNlf9KPXJJaSa4lSWT+q9AtZeS455461/QO3+tu
        O1awj4I3pnwu6ejFWoNUyiYSUgeuNr4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-ubeZ9eHGOVucnGfsP1aAUQ-1; Mon, 07 Nov 2022 14:27:13 -0500
X-MC-Unique: ubeZ9eHGOVucnGfsP1aAUQ-1
Received: by mail-wr1-f70.google.com with SMTP id t12-20020adfa2cc000000b0022adcbb248bso3136948wra.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Nov 2022 11:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=patZqZFG+VP3DSfi5ljEiY21OGL00v17le5HXIzu3EI=;
        b=m7pbonbV3776FAfB/SfvffW99FCGyDaqfYQbNdz2yuA3PV5zFYLoO4aJIgzkOTKvo6
         BzL/OYD3RwB853bqpR/si2KmS/kUeXpTIg+EvHUnOOpZMFPtx096AeLE9jqh0MdeAGX0
         hxH2LQGuYSPdHQb1G8AkfprsEFUi8hA+hh/RpvjheWrCWoe8Aytg+bsY1WRaOPjkGfgx
         Zy5hcpY3GbUum4A9BNo3MEHAFKSA/1CUZ+tUupYISlQ88vrVCh/nWisblH7hAM48jWfx
         76RB1OGqs+56cjtOus97AS0qqaOK4nl5xMg+BgK6WJGVnkTav4mIN3p9lJDvUsp2W5kI
         aMEw==
X-Gm-Message-State: ACrzQf1zzcE24LDwv7qRyTZY+ZD2V3be0fZ0d+/19CsNk5r1E9+TLYdj
        dSuvS7lcl8WUvkWYcTGDPqp4YdVhuelMVyhbqlcdJyY+waKjdE1eNS3yEBJ2RnZZgybZRd5ZJqb
        Tw78ErxIpwBxt6exdE5rrH3ESwxfalf4=
X-Received: by 2002:a5d:4487:0:b0:22e:3292:75ab with SMTP id j7-20020a5d4487000000b0022e329275abmr614289wrq.166.1667849232533;
        Mon, 07 Nov 2022 11:27:12 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7WA0QO9a9aE/aCsv95kc1/GI2mA1rxsv3w8NpMMhNZXKsgaEBfixEFS4BMiXoamohO6ncLKQ==
X-Received: by 2002:a5d:4487:0:b0:22e:3292:75ab with SMTP id j7-20020a5d4487000000b0022e329275abmr614274wrq.166.1667849232188;
        Mon, 07 Nov 2022 11:27:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:7800:3f13:77ac:9360:5e22? (p200300cbc70478003f1377ac93605e22.dip0.t-ipconnect.de. [2003:cb:c704:7800:3f13:77ac:9360:5e22])
        by smtp.gmail.com with ESMTPSA id t20-20020a05600c199400b003cf9bf5208esm10877851wmq.19.2022.11.07.11.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 11:27:11 -0800 (PST)
Message-ID: <c58fe356-62b5-bdec-92a7-6153a27e19b7@redhat.com>
Date:   Mon, 7 Nov 2022 20:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC 05/19] mm: add early FAULT_FLAG_WRITE consistency
 checks
To:     Nadav Amit <namit@vmware.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Hugh Dickins <hughd@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-6-david@redhat.com>
 <E1E8C21A-EAEB-4FA3-A9B9-1DFF81FCDA70@vmware.com>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <E1E8C21A-EAEB-4FA3-A9B9-1DFF81FCDA70@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07.11.22 20:03, Nadav Amit wrote:
> On Nov 7, 2022, at 8:17 AM, David Hildenbrand <david@redhat.com> wrote:
> 
>> !! External Email
>>
>> Let's catch abuse of FAULT_FLAG_WRITE early, such that we don't have to
>> care in all other handlers and might get "surprises" if we forget to do
>> so.
>>
>> Write faults without VM_MAYWRITE don't make any sense, and our
>> maybe_mkwrite() logic could have hidden such abuse for now.
>>
>> Write faults without VM_WRITE on something that is not a COW mapping is
>> similarly broken, and e.g., do_wp_page() could end up placing an
>> anonymous page into a shared mapping, which would be bad.
>>
>> This is a preparation for reliable R/O long-term pinning of pages in
>> private mappings, whereby we want to make sure that we will never break
>> COW in a read-only private mapping.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>> mm/memory.c | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index fe131273217a..826353da7b23 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -5159,6 +5159,14 @@ static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
>>                  */
>>                 if (!is_cow_mapping(vma->vm_flags))
>>                         *flags &= ~FAULT_FLAG_UNSHARE;
>> +       } else if (*flags & FAULT_FLAG_WRITE) {
>> +               /* Write faults on read-only mappings are impossible ... */
>> +               if (WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE)))
>> +                       return VM_FAULT_SIGSEGV;
>> +               /* ... and FOLL_FORCE only applies to COW mappings. */
>> +               if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE) &&
>> +                                !is_cow_mapping(vma->vm_flags)))
>> +                       return VM_FAULT_SIGSEGV;
> 
> Not sure about the WARN_*(). Seems as if it might trigger in benign even if
> rare scenarios, e.g., mprotect() racing with page-fault.
> 

We most certainly would want to catch any such broken/racy cases. There 
are no benign cases I could possibly think of.

Page faults need the mmap lock in read. mprotect() / VMA changes need 
the mmap lock in write. Whoever calls handle_mm_fault() is supposed to 
properly check VMA permissions.


-- 
Thanks,

David / dhildenb

