Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9AEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Jun 2022 12:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbiFWMVf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbiFWMVe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Jun 2022 08:21:34 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EAC21C13C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2022 05:21:33 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id h23so40641974ejj.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jun 2022 05:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CF10f0ecvbdInB3GUcNTSF1y8JSwtBGEciNW4EE0dK8=;
        b=gaobzrSrpC2xdZDpleiXlNd2FBo6JR22uQbVkvpXYWYKegwMJRX7PeS5ODpj1VGlY3
         6xtpPUBemnAyYVKj2RJLiO2gngBiXqVNOpnw73OoOOEJutz1ztO1yZLvyPs4Q1H0de98
         0L5dcSkYjkqW4d6yKDRjIqji7NsI08pw7ZaVLftegLv7WcNrfZND1ShPARO22RpFZQv4
         VUI5Rrr3sHE8kV5/SVrim6kvUL2D0QOcsvzyVCFuyA/8PRkrg8+F85hlcErTOzzyoAZw
         3+lLBc1mx1UdY1GeLQ+5tdJ/7veyAGgtEYXzPisiFxVkGMKa5P5PzDqgUSdGXLKFcopp
         dNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CF10f0ecvbdInB3GUcNTSF1y8JSwtBGEciNW4EE0dK8=;
        b=TqM2ubdxVMEVCzR41agNPQc0gnwvRrp2EBC1Ut0HB+dDXfQCWmFmYNhItb9MXS3bHO
         VHERkkALPHQ02CTSwQmoTkxTMq4yHLoa6SOTE1x5UU/I1SlYu1GCvZXeCy1t3umJ5FH8
         haa55hL6kvlnkNbvkgI53QxdOJDC37eE8+IBxw0Ze+aMKEdBR+IvyEAG6ISyg8OFTqN0
         HEblqexKsJ3vPXMrIrql7M44yZ4lxA1KPVpUtTEGKeC6ElhTvXtebxSLAe34qtaTbEKB
         EZcLdwhwIo7TiuNkxffPG11AjYO+RONTeWNqqPm673oPNbEUmU3s80Cxged52Id0RZHM
         qUnA==
X-Gm-Message-State: AJIora9Dz4SEcuFeOlbhmM2lWMFpW9A9o/Xmut9yb279jnZweT2zq6YO
        kVVE5rnHcm2iTZmveNqJ0fYQG1iE0CDB6A==
X-Google-Smtp-Source: AGRyM1t2pNvOPxF7Q5oGostXduXnge+3FBXoXKQdcE70QOKBIqRxava7lid7GUXIOAiCUXIfV2jFDw==
X-Received: by 2002:a17:907:3e92:b0:711:d26c:f91 with SMTP id hs18-20020a1709073e9200b00711d26c0f91mr7643642ejc.283.1655986891856;
        Thu, 23 Jun 2022 05:21:31 -0700 (PDT)
Received: from [192.168.0.230] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a14-20020a170906368e00b00705f6dab05bsm10715789ejc.183.2022.06.23.05.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 05:21:31 -0700 (PDT)
Message-ID: <b45c6b1f-4e2f-ddec-f1e4-8e183d01ea9f@linaro.org>
Date:   Thu, 23 Jun 2022 14:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] iommu/exynos: Make driver independent of the system page
 size
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        iommu@lists.linux-foundation.org, linux-samsung-soc@vger.kernel.org
Cc:     Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
References: <CGME20220623093641eucas1p11732bf2c875960f7a2bb1d6fe053bc81@eucas1p1.samsung.com>
 <20220623093629.32178-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623093629.32178-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/06/2022 11:36, Marek Szyprowski wrote:
> PAGE_{SIZE,SHIFT} macros depend on the configured kernel's page size, but
> the driver expects values calculated as for 4KB pages. Fix this.
> 
> Reported-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Untested, because Exynos based boards I have doesn't boot with non-4KB
> page size for other reasons.
> ---
>  drivers/iommu/exynos-iommu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
