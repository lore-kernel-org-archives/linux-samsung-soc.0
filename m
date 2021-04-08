Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF163C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 11:41:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83F8961155
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 11:41:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhDHLlR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 8 Apr 2021 07:41:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31290 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229921AbhDHLlQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 07:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617882065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s9XSwEEi1zJXTpbPUBOMu9HhV0dFlRjs6EwHYbE6+e4=;
        b=iUZ1fzyD/9JtmUQF2tDt3fQPioZ/XZoUMP4Zc7GlRpWEP0zcpVHCX658CroFFlybrgHB44
        3yceAsIUsG5TK54+ct8Ml8PNz3sgj0nUJp6eP1H6RSF37uWeRcFEftjpGxRZ66XWFBvgvm
        P2TsrWV1fnk8S3Hjf5bm5u0aG/ZU7Yk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-wIvXvqcbOgOjA-UyJdsthw-1; Thu, 08 Apr 2021 07:41:01 -0400
X-MC-Unique: wIvXvqcbOgOjA-UyJdsthw-1
Received: by mail-ej1-f70.google.com with SMTP id gj5so52698ejb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Apr 2021 04:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s9XSwEEi1zJXTpbPUBOMu9HhV0dFlRjs6EwHYbE6+e4=;
        b=ZyDtpKsoeU7NJl52MT7c63mm/dqKGXdwiCSlggdbAblBJL0UO3p1TG/k7O82x94eEw
         i9fIrjnLV+CWSSFZlmBjDEHWpYhj6mc+1I6qbtw84O99ilZXr2Exm+G0M9AHyK9djlpG
         0t3EHUvE5Srd2uSUSyBNSA/qPro6eSbpHFKGAjjV1cBfAa/+yoRjaKHE2CYL2LA8ORQg
         p2fFP45jWyWSPbOMrkCGMZGolezosg8BhT1O43bej2CXL+oQuxjFRYYD/ZWD9KgVW/ZS
         d3zovIoGkJXwqxwgtqbqvqSbqz9zLWdDEz/cvXrIgaVzQD0/OyHgasat1cr/bTODCvpv
         M0ew==
X-Gm-Message-State: AOAM532SN4uYqux91ysXnyTvQ/KeWUhSOroG7d2mxDH9VXziMEAEq2+N
        mQhI5s0C0uwLGpM0SpJBcVp2ctBbItFdcaBlDT0p6wYq4VEJ3U9rVM8OgzE9AEkO5PpHtpqGdKU
        wbeetscgwj1en5kPOWmbQ3pdKfea+miw=
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr10682026edx.273.1617882060783;
        Thu, 08 Apr 2021 04:41:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUNwVjPU6LZkoTiJz3z03af3SU7UKs6cSUJv0KPBteAvMvZy2H6osTmzxUIJoPNr0/d/3eYQ==
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr10682002edx.273.1617882060615;
        Thu, 08 Apr 2021 04:41:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id t1sm4680038eds.53.2021.04.08.04.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 04:41:00 -0700 (PDT)
To:     Jason Gunthorpe <jgg@nvidia.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        3pvd@google.com, Jann Horn <jannh@google.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
 <20210329133101.GA1168973@nvidia.com> <YG7VWWkvnv2IPEXt@phenom.ffwll.local>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
Message-ID: <5f956a46-da38-e72a-edaa-3b746a275f1e@redhat.com>
Date:   Thu, 8 Apr 2021 13:40:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YG7VWWkvnv2IPEXt@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/04/21 12:05, Daniel Vetter wrote:
> On Mon, Mar 29, 2021 at 10:31:01AM -0300, Jason Gunthorpe wrote:
>> On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
>>> Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
>>> follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
>>> follow_pte()")) have lost their callsites of follow_pfn(). All the
>>> other ones have been switched over to unsafe_follow_pfn because they
>>> cannot be fixed without breaking userspace api.
>>>
>>> Argueably the vfio code is still racy, but that's kinda a bigger
>>
>> vfio and kvm
> 
> Hm I thought kvm is non-racy due to the mmu notifier catch races?

No, but the plan is indeed to have some struct for each page that uses 
follow_pfn and update it from the MMU notifiers.

Paolo

>>
>>> picture. But since it does leak the pte beyond where it drops the pt
>>> lock, without anything else like an mmu notifier guaranteeing
>>> coherence, the problem is at least clearly visible in the vfio code.
>>> So good enough with me.
>>>
>>> I've decided to keep the explanation that after dropping the pt lock
>>> you must have an mmu notifier if you keep using the pte somehow by
>>> adjusting it and moving it into the kerneldoc for the new follow_pte()
>>> function.
>>>
>>> Cc: 3pvd@google.com
>>> Cc: Jann Horn <jannh@google.com>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>> Cc: Peter Xu <peterx@redhat.com>
>>> Cc: Alex Williamson <alex.williamson@redhat.com>
>>> Cc: linux-mm@kvack.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-samsung-soc@vger.kernel.org
>>> Cc: linux-media@vger.kernel.org
>>> Cc: kvm@vger.kernel.org
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> ---
>>>   include/linux/mm.h |  2 --
>>>   mm/memory.c        | 26 +++++---------------------
>>>   mm/nommu.c         | 13 +------------
>>>   3 files changed, 6 insertions(+), 35 deletions(-)
>>
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Thanks for your r-b tags, I'll add them.
> -Daniel
> 
>>
>> Jason
> 

