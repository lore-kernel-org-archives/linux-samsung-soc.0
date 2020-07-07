Return-Path: <SRS0=MXJZ=AS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D7EC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 18:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F63720708
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 18:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RZ9Fss7D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbgGGSh7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jul 2020 14:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgGGSh7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 14:37:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18364C08C5E1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jul 2020 11:37:59 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f18so141501wml.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jul 2020 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oLoc7XcLQBFweGrIZl963QXxR/Kuf/uGSt/aRtsqQXA=;
        b=RZ9Fss7DKBKwILhHXMQiVLBHaDpNXqgCERg4Ug14fAdONP0G6MQJBBJfrZe6h39rjo
         CEW9YkDp3qC7EIbbZ962ghmcUF7tOqtSTEqUp4XkhvbFkbzlQIRO9pnsC7xKDctd0G8q
         H+0lcYyOiMcg0DgIRLsOgtJyxqsy/1QqUA0u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oLoc7XcLQBFweGrIZl963QXxR/Kuf/uGSt/aRtsqQXA=;
        b=eTWSgvw0oeaq+PS/Z83jUsY1LiVaa+i0+DaX0XyH/MXlE5fyJ0IJGFI+zB3KehbjtE
         3JrFmapzT6Ctv8BXrRAAAZEVTRuKTc779auIRxOQmGWF5gYCT/ASBNK4EtOwqPbf9n0x
         v9i4JSKw6mELjPhP7+8ppHJya4IYCuCKaHCbovN8UbyeHVHfRdE7Wq7QWWSSUUj6305j
         JuepI4XGvZRavqzAeRFCYobIft/ggaH6M6Hhh3fm8cHJt4zO0MPnu8e0wXu9XGZYrae5
         RfAdvr+3qO6Ys+Ywvfb3zisLjhi1yYs/qPXoFJJXOhFDxi6lyTK92/0DUaS3P0NSBqj3
         VrlA==
X-Gm-Message-State: AOAM530v5sWhxLP3HFPm/6+SCoRWpT/QZpBFDRbzize13qCgmn/MROo8
        ZxhyrUYX+EI1kZnlXKyuOeU/4g==
X-Google-Smtp-Source: ABdhPJwTp5c+4PKMXHNlBDs5EyJmIu3hyAcO4wuFz0Eh5JtNDlZ7x+t1jLcMZPwjhFhde9Jltdhn5A==
X-Received: by 2002:a1c:a7ca:: with SMTP id q193mr5582199wme.69.1594147077882;
        Tue, 07 Jul 2020 11:37:57 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id f17sm2461364wme.14.2020.07.07.11.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:37:57 -0700 (PDT)
Date:   Tue, 7 Jul 2020 18:37:56 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] media: exynos4-is: Remove inh_sensor_ctrls
Message-ID: <20200707183756.GH2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660F4263807BBE9EF1DA26BA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660F4263807BBE9EF1DA26BA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Apr 25, 2020 at 07:26:47PM -0700, Jonathan Bakker wrote:
> This is a no-op as it is never set and is a remnant from non-DT days
> that can be safely removed.
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/fimc-capture.c | 13 +------------
>  drivers/media/platform/exynos4-is/fimc-core.h    |  3 ---
>  2 files changed, 1 insertion(+), 15 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
