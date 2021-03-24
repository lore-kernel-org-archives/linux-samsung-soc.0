Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4BDC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Mar 2021 14:32:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEC00619FB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Mar 2021 14:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236297AbhCXObr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 24 Mar 2021 10:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27239 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236218AbhCXObM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 10:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616596269;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+jtHaYpG/XZInPp8hHHKOOdzU2YSMvIuIW7BEJkipo8=;
        b=KqHRh/Wf0nk6pudXDypiBEZdt2ZySsNSFvB0+AwMW8iM9l8er6jJchvGa+bZCd0Y4XgpGB
        YOgogUzZbiMSn1adlCNR5db37w7xTrG+n7Dan2O8Y3fIKmyi8mh+o+hy1BEkak80RzOvXO
        CPKR/pfnFsYMdXU0gbmkwypkjF3r3PU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-gkC4pNIEMeS2jfQT3cg42g-1; Wed, 24 Mar 2021 10:31:07 -0400
X-MC-Unique: gkC4pNIEMeS2jfQT3cg42g-1
Received: by mail-wm1-f72.google.com with SMTP id j15so554647wmq.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Mar 2021 07:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+jtHaYpG/XZInPp8hHHKOOdzU2YSMvIuIW7BEJkipo8=;
        b=H37THZ2jtFUXFS5tm9gqpnZGOhykn03LDD9s1J6byBEoUedfMLf2MW29teX0I294gJ
         kgnOtvtEmLoJWaSSd4EYEt6I2GtI8oZxuOdhYq6zQ5CbKalR/SBt0zIBsvXm7XCDSeTb
         FdnawERC6wVzMyvMlk1w7U1G9CMoYmXJMbp8Yi2xsi3xw14IAXljTguSj40fbKXIctQ8
         D27MZ2wy6z0V535xw8UvXxayawsZx7/WgIR9G4crR9ykPbFq7LUlqa/gKr25aMT3CWDz
         UhACWDF4jSEqfUYVmXq7HobOM3ZCLdtpL59o0iyasnPrlY/Id/O9QQDskd57//LOOk+n
         1DYQ==
X-Gm-Message-State: AOAM532EPhEYdol6ltclhlcPK0/ZggfNaW2qPJ5PTvE3VtZknmiVtkTG
        UOwHGUa/VZqh+NM9ZfH1HFYTM973HZa+OnJXrrdk6Z9je7Tw9u0YOSp0EDQZFOpPdsgXF9sKUaG
        f5ucQaA/c9wN5+Igg/8ywMvNBnoxiYU8=
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr3977878wrw.247.1616596266460;
        Wed, 24 Mar 2021 07:31:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIf+VryoTPSfwti+YSTkQ2E1C0/b6Xuw3ivYfNPK4a9PF7c1OO41KjvaTv9A51GLRMrRGgKA==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr3977856wrw.247.1616596266249;
        Wed, 24 Mar 2021 07:31:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id u8sm3366640wrr.42.2021.03.24.07.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 07:31:05 -0700 (PDT)
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
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
 <20210324125211.GA2356281@nvidia.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b1a46866-cbc7-4e7f-0e17-79fee57b32a0@redhat.com>
Date:   Wed, 24 Mar 2021 15:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210324125211.GA2356281@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24/03/21 13:52, Jason Gunthorpe wrote:
> I think this is the right thing to do.
> 
> Alex is working on fixing VFIO and while kvm is still racy using
> follow pte, I think they are working on it too?

Yeah, or at least we have a plan.

Paolo

