Return-Path: <SRS0=MXJZ=AS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C6EC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 17:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02DAC20773
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 17:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FgAys2nN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgGGRe2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jul 2020 13:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbgGGRe2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 13:34:28 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7BFC08C5E1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jul 2020 10:34:25 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so34816024wrl.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jul 2020 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ITreFSF3QwB0kHeLsgLwmjRqxc7iMrP7mMrAbIuhNUU=;
        b=FgAys2nNA7C9G59JR2094Dn1BI10+vaU1RGrdY3HbiFXgeubNKu7Qi5fHE7DqvFI58
         V4VtDi210MNlIp2kmbfEU4Cr1JqcdQS/JhjfjNhghH8yQnqQgHZ65gMO8VZM/z/Szz+1
         eSKtRG5Dl18VIInxkT6IbeXAy26ssTJUNLU9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ITreFSF3QwB0kHeLsgLwmjRqxc7iMrP7mMrAbIuhNUU=;
        b=MN/7ZTxqO5Cb9FGdvFhrCq7QFlSKy92cZUxnA/myJKCM2m7rhomyO/XI7beKoCLy6d
         N+0iqZcWjehppcoKRNzIS8ADYMIbVls/ErwdRIamMxiP078rRh9Px/cHhHnE17HxYzsc
         K1WLWWCV7RHGubh8em4BNuE28WxBGjEYS7lLFLiKCFO1Bb/8HNecWjMcYYmXAC9VzRKL
         IgCsbhJAdB6ev8YYR4O5VlikSFBhDn6igEsrHBUJDSADbcjBpzulOj2PxRCQvTIZ0IUI
         sTNWLtSdRkyFoKtehKoFKcjKoD0kGDuuqV5/M1I9PPL/r/+/id/8CY1uBua0ot9UcRdm
         Wuew==
X-Gm-Message-State: AOAM531J+0/SHQ9RyF86UXd8/B4DUdGe6TMv0UqYGCokajmALrV53WGb
        vv1HWijdWgTf2UzUAme2tIVIwQ==
X-Google-Smtp-Source: ABdhPJwHYhg0CvN95fbCzB2YKA5y0Ej4SSs/h2hUyk34tRNvM1SJJ+fd0GK7wdywTV7GzQxoVx6gCA==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr53889112wrr.325.1594143264656;
        Tue, 07 Jul 2020 10:34:24 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id n16sm1860378wrq.39.2020.07.07.10.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 10:34:24 -0700 (PDT)
Date:   Tue, 7 Jul 2020 17:34:22 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 02/11] media: exynos4-is: Request syscon only if ISP
 writeback is present
Message-ID: <20200707173422.GB2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB066006C199A43996C0502B62A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB066006C199A43996C0502B62A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Apr 25, 2020 at 07:26:41PM -0700, Jonathan Bakker wrote:
> From: Tomasz Figa <tomasz.figa@gmail.com>
> 
> On FIMC variants which don't have writeback channel, there is no need to
> access system registers. This patch makes the driver request sysreg
> regmap conditionally depending on whether writeback is supported.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/fimc-core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
