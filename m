Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE05C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 16 Jan 2021 08:26:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C51223A34
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 16 Jan 2021 08:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbhAPI0D (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 16 Jan 2021 03:26:03 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:35671 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbhAPI0D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 16 Jan 2021 03:26:03 -0500
Received: by mail-wr1-f50.google.com with SMTP id l12so6278110wry.2;
        Sat, 16 Jan 2021 00:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JmhbPurPSVD5VLpI5z4dGbmxDmWIlmfp4bwY/EK3sRU=;
        b=Z7KUBkVCsRtjqYndEDTCnX3ZeOhpt4gkmabu5HWgQYTZqrSRaA+xeGQ0ZoX1SutN9m
         +iJeW0m1pQPnEZHHFYQ/afqFzY0mFv6DZBdAwdnMcK7r1YqI394y2gMxI6VFzQOKMhvi
         uI1ivUi0vjmIk2M2Yb1xdrVFP2CMz4cNLfSKz/zwg4I03Smu/kD0Gyk3lGzauGqj+Etk
         JScqJzMcb7MGDNz1NXPHp41YOjiAb9NvMNWeJ34MYGs0f6DKgauOwbeGth8oUm4R7SVf
         XslUhKjWpIh55plg7g6jtjYrxD/GnvO/LFisTxb9nA2bvdsWd7QhkjK5Zc5l7dRb6JBu
         o4xQ==
X-Gm-Message-State: AOAM530T3xXJ38hA1yX0fdIgm9HNjTQWjvgfBkosXOLBd8h4x74u8ElN
        XxiwU7MUim5d87473dyRVu30mD+PeNE=
X-Google-Smtp-Source: ABdhPJxI2YMqAP9y5A0a0/6o3Xv5Uc+2dWotBogllirLtXXAr0FSq48bstOqvQS0EfcYsDa22lhKYQ==
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr16581493wrz.86.1610785521186;
        Sat, 16 Jan 2021 00:25:21 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id u205sm14962205wme.42.2021.01.16.00.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 00:25:20 -0800 (PST)
Date:   Sat, 16 Jan 2021 09:25:18 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] soc: samsung: pm_domains: Convert to regular platform
 driver
Message-ID: <20210116082518.GA2841@kozik-lap>
References: <CGME20210113110330eucas1p1e7efa719b5db55ccf3774450a8c1e452@eucas1p1.samsung.com>
 <20210113110320.13149-1-m.szyprowski@samsung.com>
 <CAGETcx9wJVnBAe6mKxfi9DC9YFf6DLzAyxBC8DxhQUqpfTDR3A@mail.gmail.com>
 <58e1cfb2-cd35-badf-0238-7c62122e2d05@samsung.com>
 <CAGETcx_Q_FvdL7ghC9Z7p9RcoBRYHeyTB1PRYk==HMv+NzJBzw@mail.gmail.com>
 <20210115151520.GA43049@kozik-lap>
 <CAGETcx_TE8M5x-iQTFvjjVQEVS7tzhPiy2sq7a1OWgjRpm9-Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAGETcx_TE8M5x-iQTFvjjVQEVS7tzhPiy2sq7a1OWgjRpm9-Ww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 15, 2021 at 01:11:36PM -0800, Saravana Kannan wrote:
> Hi Krzysztof,
> 
> When you pull this in, can you please add this tag too for completeness?
> 
> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")

I actually removed that commit SHA from the message because it's still
only in next. It might not be valid and I don't have a control whether
it will be changed or not.

Best regards,
Krzysztof

