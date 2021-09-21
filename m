Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04834C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 21:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA53361211
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 21:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235323AbhIUVMg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Sep 2021 17:12:36 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:45965 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235287AbhIUVM0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 17:12:26 -0400
Received: by mail-oi1-f173.google.com with SMTP id v10so1070922oic.12;
        Tue, 21 Sep 2021 14:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jIz2G48SF2XThdMGQsfeQUy2tCLoDKrmydgjbV43nOk=;
        b=QpJ0ARP+wALZvRtftGIdnz/AqNsLle1AH8XngMUkV/iOQkorCyKU8RB0D2/9S7/LbK
         P5a52gpa0lWu3JrY5heZu+o9Rz2UXKzg8fPItGltX30IK/5Wscdq4PtqZXOh/+MpWQ55
         yA0TcpfD+W3SfmrAhj5J+S9NBB4kYIuOYjVu0UcVXl+YLYBviZKQCKDzk//VLKBR43xz
         bDbn4CGGqcXkBbCSZ3bQXoDAaJeM/v+cQk4JYy8X5JUWZK+cgJJK7qttjjhFQFWXc2hP
         avzAWoLUZ98KA9M89YpP1QUmF4BNat+1W1pzZ5pS3BwkZFP0aOK97kC8JDjFdsuWVMoZ
         7lrg==
X-Gm-Message-State: AOAM532oGVXmqOfiad3dzichOdsK4LwI31N86uMLEc5dM+mcf4fQVjpm
        xmBYRDsHvj98hs11SpckYg==
X-Google-Smtp-Source: ABdhPJzVxcUKtkEaMTuDtJmU/GqAZYe5OyjA58+NTxsyuCgjp7qZKhxVm2JNoJ6jbd2cdujwTNJ7/Q==
X-Received: by 2002:aca:eb83:: with SMTP id j125mr107354oih.47.1632258656807;
        Tue, 21 Sep 2021 14:10:56 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id s24sm35233oic.34.2021.09.21.14.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:10:56 -0700 (PDT)
Received: (nullmailer pid 3331030 invoked by uid 1000);
        Tue, 21 Sep 2021 21:10:55 -0000
Date:   Tue, 21 Sep 2021 16:10:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-clk@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
        Tom Gall <tom.gall@linaro.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
Message-ID: <YUpKX+0nZNTvLUgH@robh.at.kernel.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-5-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914155607.14122-5-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 14 Sep 2021 18:56:05 +0300, Sam Protsenko wrote:
> Clock controller driver is designed to have separate instances for each
> particular CMU. So clock IDs in this bindings header also start from 1
> for each CMU.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  include/dt-bindings/clock/exynos850.h | 72 +++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 include/dt-bindings/clock/exynos850.h
> 

Acked-by: Rob Herring <robh@kernel.org>
