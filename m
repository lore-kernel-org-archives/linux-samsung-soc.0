Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8C5C05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 21:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbjAWVBL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 16:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbjAWVBJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 16:01:09 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DFE38665
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 13:00:39 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id h24so7448755qta.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 13:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXDL5RuH8txeRC32pIrNwcID1tphIyL0d4ewJC29Z2k=;
        b=Jp7IYY9SFAf0Bb7VotdhTUvYg7B6B0cvQHe4FKQX6C3QHoscsyLUJz0f2xvjeftLZV
         5JeCwh27TIPuUoaoS51XmkfP1mxlhfXH7KXMC3cYG2JDqJrsZ1XzsuVDrQXRoT+X+g9d
         tWq1eep+fLdZyB95A8ZGYK3YxzWMIP4hvefJ4GISVx72x5PiKeyZaMF7zDDElCerPNpD
         ZuWXabLdyaH+1E00GRrb2ydrVguomBAn0izjQDmw8IO1P4p1RWN3M77BUxuVVUbNHnp+
         PJ3VibU5aXiqbu3hIIsKZY5sgkajitLLCW9gvb6CAv9A0K0SMh/4/hI0iH20gFgIS0X2
         Ofgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXDL5RuH8txeRC32pIrNwcID1tphIyL0d4ewJC29Z2k=;
        b=GPV4t2xfgYodNhW0HLE0onl5gaaOHxbhiv3VZx9VWyNwxRYqXipVyzI6NC9shpL0mV
         BAFTjW0yOV7i7QvKaw7v1CH0kR2c7ZqJi5yg7B6HljKv6pOj2HqmtfeL5GZVrvlGQSMt
         AZipsNMXN2iyu0P02iJOX8AhJsicFGRf3GEELKd5+8q5mr6yLy2cQOFwgklfacDT2Xcw
         mOqkgCIIOzlfQyNJyMVZIDOzbk0EdGAMlJ5V0exhY2iMLpsXbuGB0o0NsjaI1U/Sg6lT
         pFmgSoy9N9wWpr/bO9vktKS91h0LNmhK8lDC2C91ueq3jHUcdKO1ZrNnZulKq8HUWtmO
         YnoQ==
X-Gm-Message-State: AFqh2kqOxNAv9vcylTNg/QKId1hSzlm7RGOXqcNhVzULBJ2DXGM2CSZD
        U9saR8iAcOuQ4HawXHnExV0oMQ==
X-Google-Smtp-Source: AMrXdXvk0lKk3hog7WDGIvJKXmhpeR0Oamsk2YOzXOrJOL5dD26wKyjUmFgat09PiP8CQ1mRLtE3MQ==
X-Received: by 2002:ac8:760b:0:b0:3ac:7f6b:ed11 with SMTP id t11-20020ac8760b000000b003ac7f6bed11mr35732463qtq.15.1674507629037;
        Mon, 23 Jan 2023 13:00:29 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-167-59-176.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.59.176])
        by smtp.gmail.com with ESMTPSA id r3-20020ac87943000000b003a82562c90fsm11274878qtt.62.2023.01.23.13.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 13:00:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1pK3vX-00GND6-C4;
        Mon, 23 Jan 2023 17:00:27 -0400
Date:   Mon, 23 Jan 2023 17:00:27 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        lim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu/exynos: add missing set_platform_dma_ops callback
Message-ID: <Y871a3elCP1gmPQi@ziepe.ca>
References: <CGME20230123093116eucas1p19b8fe8afc4b631debbdc5321c53009e9@eucas1p1.samsung.com>
 <20230123093102.12392-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123093102.12392-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jan 23, 2023 at 10:31:01AM +0100, Marek Szyprowski wrote:
> Add set_platform_dma_ops() required for proper driver operation on ARM
> 32bit arch after recent changes in the IOMMU framework (detach ops
> removal).

Thanks for looking into this!

Can you explain more about how this actually solves the problem in the
commit message? I don't get it.

> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 6fc58e89712f..c4955d045855 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -1346,8 +1346,10 @@ static void exynos_iommu_release_device(struct device *dev)
>  		struct iommu_group *group = iommu_group_get(dev);
>  
>  		if (group) {
> +#ifndef CONFIG_ARM
>  			WARN_ON(owner->domain !=
>  				iommu_group_default_domain(group));
> +#endif
>  			exynos_iommu_detach_device(owner->domain, dev);
>  			iommu_group_put(group);
>  		}
> @@ -1398,6 +1400,9 @@ static int exynos_iommu_of_xlate(struct device *dev,
>  static const struct iommu_ops exynos_iommu_ops = {
>  	.domain_alloc = exynos_iommu_domain_alloc,
>  	.device_group = generic_device_group,
> +#ifdef CONFIG_ARM
> +	.set_platform_dma_ops = exynos_iommu_release_device,
> +#endif

This is ugly, if you need a set_platform_dma_ops it should not be
called release... Release is supposed to be about putting the HW back
to some idle state because we are unplugging the struct device.

Jason
