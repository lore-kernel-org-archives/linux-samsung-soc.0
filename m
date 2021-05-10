Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE57C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 May 2021 18:13:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27C4F614A7
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 May 2021 18:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhEJSOo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 May 2021 14:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36227 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231449AbhEJSOm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 May 2021 14:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620670417;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7Wf8f/F8o0r8V5l27inB82r07nwwlRw1f5EgRtSutt0=;
        b=FRAIjV41EfpxRVqHMzXpKWRnznNiqLH/p+eQGfjEf/TmarK9d0DczzGrGdA6kT3lWOUaWR
        Ykba2h1oAxFZYTS3iCuRSAc6ttUQ/0fbNHnjHiYruzI69p7u/hRB6/7u+uMSjc8YxBZTrX
        uagwQVLlj2bUOJhL76wRlLON+WRP33s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-1bTP__ijM2GsUK1gUjYfbw-1; Mon, 10 May 2021 14:13:36 -0400
X-MC-Unique: 1bTP__ijM2GsUK1gUjYfbw-1
Received: by mail-wr1-f69.google.com with SMTP id h104-20020adf90710000b029010de8455a3aso7784284wrh.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 May 2021 11:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Wf8f/F8o0r8V5l27inB82r07nwwlRw1f5EgRtSutt0=;
        b=OfqWwTzEYRpcVYA79MI5m9nbTaUggM7Z3DaFNc6xFw6To/8FVWQ5BA0xF1K/yMlL0A
         sNw3QDMZZv/FxNHfo7sKb0oH3acOwUPvzql2mDvUas7PhKG2Hpaojb93wjeqPbJicuI5
         ahHSkk+iAouQnjm4wg2lIilT90IPm1FTRcLvByfXgRgGiUJUA/ao/xZGB5nksC3lwbRX
         8pp+C3SohbiQAxLi9kMd8/SxiiGf+JoWEa54BbPQlvRFiRTRWREXvE6XG4We/6Vxi5H9
         +tGt6Oh6b4n/AAq8B1rM7pCu/P1LY5utO26e54ZdDNJ1VMkobDjxThBz3fJpoGqwQ6Gh
         PPIg==
X-Gm-Message-State: AOAM532NjpmZg/GYPU6BEv4yBpiH2XrAjMpMo/nA5DhR422+nBBey3tK
        uAu8++TIB5dIzMhMQjpYfEN3/etOEZuE/tFOkwVkeRzISUjTn1ttM5ZpFy3pHY6GeNTSkGcuAYn
        qlpUT9+Mrq0aPQGm/fvbCRdwZPm0NEQ4bgsXjC6gdvXJWk9sZoBPYtHI4D8q6iX/NLR86zVy1Or
        b3t3mJL6M=
X-Received: by 2002:adf:fc11:: with SMTP id i17mr32538522wrr.368.1620670413645;
        Mon, 10 May 2021 11:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGvjeRTScdahfNDHcrMa8YC+8YvhVA4fNTrW6yB7yOb/uXjCn86kTNe8u7Q2MyqQ4FAIUnCg==
X-Received: by 2002:adf:fc11:: with SMTP id i17mr32538485wrr.368.1620670413383;
        Mon, 10 May 2021 11:13:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id j7sm20597281wmi.21.2021.05.10.11.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 11:13:32 -0700 (PDT)
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
To:     Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <20210510135031.GF2047089@ziepe.ca>
 <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
 <20210510153412.GG2047089@ziepe.ca> <YJlz+p787mK8tAh+@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dcdc8bea-ebe8-bbcb-b581-309d9acf1657@redhat.com>
Date:   Mon, 10 May 2021 20:13:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJlz+p787mK8tAh+@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/05/21 19:57, Sean Christopherson wrote:
> +Paolo
> 
> On Mon, May 10, 2021, Jason Gunthorpe wrote:
>> On Mon, May 10, 2021 at 04:55:39PM +0200, Daniel Vetter wrote:
>>
>>> yeah vfio is still broken for the case I care about. I think there's
>>> also some questions open still about whether kvm really uses
>>> mmu_notifier in all cases correctly,
>>
>> IIRC kvm doesn't either.
> 
> Yep, KVM on x86 has a non-trivial number of flows that don't properly hook into
> the mmu_notifier.  Paolo is working on fixing the problem, but I believe the
> rework won't be ready until 5.14.

Yeah, I like the way it's coming, but I'm at 20-ish patches and counting.

Paolo

