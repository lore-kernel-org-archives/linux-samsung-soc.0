Return-Path: <SRS0=MXJZ=AS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C7DC433E1
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 18:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78E412075B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 18:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JSXqRKqz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgGGSJV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jul 2020 14:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbgGGSJU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 14:09:20 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D22C08C5DC
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jul 2020 11:09:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a6so46228137wrm.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jul 2020 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0m2aoBIP5GJAb10zyANIdy2YC3UULtv1aWEwGmldE04=;
        b=JSXqRKqzNi8wby85ZOPYM8+WlbCbPrGifr8g3X3OVWXFVbASCxiEVbote2kigrv8wv
         JQD7OBWXUBKKot5/flogEoaBHkhPsvwOwkfD207E+UwGA7Miz0eMQoJ7zQzwhPL61Rre
         EuI9y+FhVrM1NKYullsJN25lGamvzcwlqp6z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0m2aoBIP5GJAb10zyANIdy2YC3UULtv1aWEwGmldE04=;
        b=CZGfrxWdt3ywpikcqLmB78oNVpo4iYBjVHQX4a3kROcZVu4Uathy/2lRBqbG04e7L/
         DkZia7hm4WLKihMahCN+LVn4fo9JnxS5bhYJYVgO7NJ7TIZgQUkNK1lNB58jdKdtXhkm
         Zuzh1X8Jmy4GRL2x3So+lzXmRLUUKZuT8QV4E6g5Sjv7/2+v02tCFmxJYzwUBv3H2Ph2
         V4dGQNZ5X01seRjeKS+jQ8Nw70F+ZFqfFxawSeI21ECdH3umGbKDYo/hQYHTlf2ybi4C
         bdJNkLwCPHL6t5rMg41nWJnvDJ6h/ViB6FREyVmhRomS4aXeiPVT9cZuVZOgBEHGQc4w
         2wzA==
X-Gm-Message-State: AOAM530MAESZsr0tQc7riz2LMiRAU+09E+AkeNUb1AudVGtNi9Knq42l
        bPYL8Py3HhjhOXR2CefykMAVLA==
X-Google-Smtp-Source: ABdhPJyQWxqFc1PHki3J/nn4kM+S8X1Xh3twrKQaB7PZs8HSIA+iXCuj+fKvvuYm4me4y3tj/6LZ2g==
X-Received: by 2002:a5d:664a:: with SMTP id f10mr54971954wrw.300.1594145359012;
        Tue, 07 Jul 2020 11:09:19 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id v12sm2026423wrt.31.2020.07.07.11.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:09:18 -0700 (PDT)
Date:   Tue, 7 Jul 2020 18:09:17 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] media: exynos4-is: Correct missing entity function
 initialization
Message-ID: <20200707180917.GD2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660E680A4F69E3037D87E70A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660E680A4F69E3037D87E70A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jonathan,

On Sat, Apr 25, 2020 at 07:26:43PM -0700, Jonathan Bakker wrote:
> Commit bae4500399c4 ("[media] exynos4-is: Add missing entity function
> initialization") tried to suppress the warnings such as
> 
> s5p-fimc-md camera: Entity type for entity FIMC.0 was not initialized!
> 
> However, this didn't work in all cases.  Correct this by calling the set
> function earlier.
> 
> Fixes: bae4500399c4 ("exynos4-is: Add missing entity function initialization")
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/fimc-capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> index 705f182330ca..86c233e2f2c9 100644
> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> @@ -1799,7 +1799,6 @@ static int fimc_register_capture_device(struct fimc_dev *fimc,
>  	vid_cap->wb_fmt.code = fmt->mbus_code;
>  
>  	vid_cap->vd_pad.flags = MEDIA_PAD_FL_SINK;
> -	vfd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;

Isn't vfd->entity above a different entity than sd->entity below? If so,
this line must stay.

>  	ret = media_entity_pads_init(&vfd->entity, 1, &vid_cap->vd_pad);
>  	if (ret)
>  		goto err_free_ctx;
> @@ -1898,6 +1897,7 @@ int fimc_initialize_capture_subdev(struct fimc_dev *fimc)
>  		return ret;
>  
>  	sd->entity.ops = &fimc_sd_media_ops;
> +	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;

My understanding is that this is the capture subdev and not the scaler.
Looking at the other drivers, MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER
could be the right function to use here.

Best regards,
Tomasz
