Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB981C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 15:07:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DAC26124B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Sep 2021 15:07:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238513AbhIPPIp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Sep 2021 11:08:45 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:43985 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbhIPPIo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 11:08:44 -0400
Received: by mail-io1-f42.google.com with SMTP id p80so1683427iod.10;
        Thu, 16 Sep 2021 08:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ukDh0m6xUg+LA/SFSsYJdFnswVIKLG98sv4W680v9Ro=;
        b=qcIjZg52YHj3y/cCVK+rTmZox3xerPL1D2Y7DSrjdGexxn0G66Nd7lDZbvSTJYckU8
         aKWXynZiTlyJ8l/KCpd9U5ChI8sQ9lggp46we15yxeG5b6C79G+kIiVFUjbwIgjTGdL1
         inePSUskRFTUK/1kDTo2CikvqL69ot2tGBMweonUgZ7dEN/edeckBLrzaIZviDJLnB+k
         NhjkyPaSqLVmkEVCq6Lw4QE8KoDsBF3fUp7lB47XljLfJB6wC5roEUD/tpel53DoJPe3
         QLy5FVWXOCjvNb2TpzNUQOv4xoF4SgQMH/NHmqCCAAThvR+SSpYz+J5wGzSm7I3MrUEL
         /xbA==
X-Gm-Message-State: AOAM532O9oMCkeOR7Te2UfPCE2C7gs0ziuus/wxaEhPTwTIoBnA5aLnd
        DgGZabWS++h+tqfLcfqw6g==
X-Google-Smtp-Source: ABdhPJyEmCh5JpDCnDKUruqK4ec1sLmjX/bKc5u/nUWiwRjhkrHJgwuVrMZah6JQkBV1pOLN1X1cbQ==
X-Received: by 2002:a05:6638:2589:: with SMTP id s9mr4778919jat.87.1631804843796;
        Thu, 16 Sep 2021 08:07:23 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net. [96.84.70.89])
        by smtp.gmail.com with ESMTPSA id i6sm1949907ilj.45.2021.09.16.08.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 08:07:23 -0700 (PDT)
Received: (nullmailer pid 1362925 invoked by uid 1000);
        Thu, 16 Sep 2021 15:07:22 -0000
Date:   Thu, 16 Sep 2021 10:07:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Mark Brown <broonie@kernel.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v12] dt-bindings: ufs: Add bindings for Samsung ufs host
Message-ID: <YUNdqnZ2kYefxFUC@robh.at.kernel.org>
References: <CGME20210915111909epcas2p345ed0a47b12d82d67ab28da1d9fd2eb8@epcas2p3.samsung.com>
 <20210915111844.42752-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915111844.42752-1-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 15 Sep 2021 20:18:44 +0900, Chanho Park wrote:
> From: Alim Akhtar <alim.akhtar@samsung.com>
> 
> This patch adds DT bindings for Samsung ufs hci
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
> Changes since v11
> * remove below warning by dt_binding_check
> ./Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml:26:6:
> [warning] wrong indentation: expected 6 but found 5 (indentation)
> 
> Changes since v10
> * Rebased on v5.14-rc2
> * removed Rob Herring earlier Reviewed-by tag
> 
> This patch was part of exynos ufs driver series, somehow
> this got missed to applied on the tree, sending again as a new
> patch v11, removing Rob's earlier Reviewed-by tag.
> 
>  .../bindings/ufs/samsung,exynos-ufs.yaml      | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
> 

Applied, thanks!


Sorry it fell thru the cracks, but it taking a year to notice is not 
great. If no one cares enough to notice, why are we applying any of it.

Rob
