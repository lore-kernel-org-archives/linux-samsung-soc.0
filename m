Return-Path: <SRS0=MXJZ=AS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC34C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 18:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38011206E2
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jul 2020 18:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H/h7YP57"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgGGSie (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jul 2020 14:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728487AbgGGSid (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jul 2020 14:38:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33007C08C5E1
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jul 2020 11:38:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o8so148423wmh.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jul 2020 11:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T7vFSEel4oLVA4XB/FO76KnP6lQuuSXwX+PPQ0MvZjk=;
        b=H/h7YP570rJupuu08vx/zw4SHtaazmkpho+3o5QDVzyBXCxkJyTAeTHLkTNpDX3Mye
         SQX5aSSAwbzBB0hnCmzWl+c4yDrW9c4mJ1A9nLKUBsPWP4VyXRKvI+zyj/TVb0ONGIQ3
         G0L6rKYjcKBTDf0jSd33b27rJqsB5JBk/TmQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T7vFSEel4oLVA4XB/FO76KnP6lQuuSXwX+PPQ0MvZjk=;
        b=FKFLtyH1anh3q0GWLCokvoBI+nGobvD9A1+jfnoU8WJTHz13v5kf0eyHT32mog7NtF
         HmgmpVE1ytNXywHmdqjHBe7uQndTdbHexqkO19jAiI5bibcEIBKmYYkA46cbFIadwYFR
         2uqWK1DMYtBSa+wuOY1Xw2o2B1/qlRlx4DJnnJQjuz0JAMRxITU3pEDy/vX/xOSBHlGF
         ybiMEY1mhGgIhZqRqsNoZympfClTnDSsTUx8LQIP0wzaXTnafogBJ26dHHTj0rRD5/pC
         QU2+yA7/JrcWp9+pKHW6LL3y9XHMHRt85F/p3IGKyXLSkYWwXQWVKEuykJwykdAx5kpA
         VTDg==
X-Gm-Message-State: AOAM533AA8SwJN//3CmtQQ5t38rzCb9/7c/0Hakas1tBryTzunjCCCCE
        sNrhxpfYZRMBywQ1M0TiAKp8AA==
X-Google-Smtp-Source: ABdhPJz/stuM1uyxTuicq0iVKv1yy10n9tHX5m/8lSbaZ5NDwtB8c6jG3ixvY/ivZtqrgyJZQ8RGLA==
X-Received: by 2002:a1c:16:: with SMTP id 22mr5357303wma.42.1594147111944;
        Tue, 07 Jul 2020 11:38:31 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id d132sm2140015wmd.35.2020.07.07.11.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 11:38:31 -0700 (PDT)
Date:   Tue, 7 Jul 2020 18:38:30 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     kyungmin.park@samsung.com, s.nawrocki@samsung.com,
        mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] media: exynos4-is: Remove unused struct member
 input_index
Message-ID: <20200707183830.GI2621465@chromium.org>
References: <20200426022650.10355-1-xc-racer2@live.ca>
 <BN6PR04MB0660C45D4EA577F9D5BD6434A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR04MB0660C45D4EA577F9D5BD6434A3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Apr 25, 2020 at 07:26:48PM -0700, Jonathan Bakker wrote:
> This is no longer used since the conversion to DT
> 
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/media/platform/exynos4-is/fimc-core.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
