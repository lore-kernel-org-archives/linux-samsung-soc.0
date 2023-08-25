Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48CEEE49B3
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Aug 2023 21:51:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjHYVuj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Aug 2023 17:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbjHYVuc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 17:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96EB26AF
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Aug 2023 14:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693000189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jDIH1s5AgxOERqalZWlNYkaKtZibmqZdBdpJvN3/v8U=;
        b=NaGrv5xDzRiKSyY4xaYCPr3Tue4R0zPn7TSaDR+PKYKYedRZ8K5Orw2QntNF2BwfUWNu/V
        T/NIwXNiZj0D98fmOCpKqJ2StaZNjlQ0DBY9NRjrlD2EeThYSEPmvBCkmORFmLMznOfwWD
        9mFdI3l+jNfi59Mte2ERLe9sbAJdux0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-y60IqwyvPPW8iGIv4wfF9Q-1; Fri, 25 Aug 2023 17:49:47 -0400
X-MC-Unique: y60IqwyvPPW8iGIv4wfF9Q-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-58c8b2d6784so20205037b3.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Aug 2023 14:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000187; x=1693604987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDIH1s5AgxOERqalZWlNYkaKtZibmqZdBdpJvN3/v8U=;
        b=UsvWZ/Uw+TFjMX6+x4Q+c1nLCMTJn6dfEsq/TPetS87h7y5aqDwCkJHZrjfwVhiY8/
         Q3JEtnXa4HeDdMGpRfeQ7K2ymqtPFTIAIHLjxh9Fk1NIPaduOq237I5lolqcgFbvuKsU
         LUMgMrgO8Q7d9dC1lgNMexeUI2zE21SDiK1JL+vM9r3p+f67vUafPI/vGtZagTH57Gx9
         QxkcHcR9lGLZivplULKSY0bVgcXBguwyj14LpHC87ZJ5u8ipHqNIvXGbRGqOUfFgLQm4
         MSECwAAKRc9+bqLgc7VweQherXE40mNLC80oDQssGQPnA/1hkD6jbeEXe5yYjDKKCz8g
         uFJA==
X-Gm-Message-State: AOJu0YyRzMqn2/w5znqjDTz5SJ5yrHlgp6IazL/Yb5EAJqXSpnGzoPKt
        88O/iczXc8RbNUX6z4mXqlyEJYr3+1pQggUZNfEaZuRWjtnOft+ViioTy21ITw8B31vtH56miSD
        acceMhCl3SnHLpyLtnjl0cpvYc3bQQXs=
X-Received: by 2002:a25:d8d6:0:b0:d78:3047:62c6 with SMTP id p205-20020a25d8d6000000b00d78304762c6mr3495328ybg.21.1693000187282;
        Fri, 25 Aug 2023 14:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgZnJ6x3Khmaw73UVVO8ipGtpfGFEkJnwrK/gjpvrarbZH5j/AtFZ9PMl7lOmV6YAsTBEFgw==
X-Received: by 2002:a25:d8d6:0:b0:d78:3047:62c6 with SMTP id p205-20020a25d8d6000000b00d78304762c6mr3495280ybg.21.1693000186913;
        Fri, 25 Aug 2023 14:49:46 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id ki6-20020a05622a770600b0040ff0e520besm770523qtb.35.2023.08.25.14.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:49:46 -0700 (PDT)
Date:   Fri, 25 Aug 2023 14:49:07 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 06/24] iommu/tegra-gart: Remove tegra-gart
Message-ID: <stzz6hsyx25u5bbkgwftde2jdtjxgb5ghofwfymv2ny4vfbpch@nuli2d2mthaq>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <6-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:20PM -0300, Jason Gunthorpe wrote:
> Thierry says this is not used anymore, and doesn't think it makes sense as
> an iommu driver. The HW it supports is about 10 years old now and newer HW
> uses different IOMMU drivers.
> 
> As this is the only driver with a GART approach, and it doesn't really
> meet the driver expectations from the IOMMU core, let's just remove it
> so we don't have to think about how to make it fit in.
> 
> It has a number of identified problems:
>  - The assignment of iommu_groups doesn't match the HW behavior
> 
>  - It claims to have an UNMANAGED domain but it is really an IDENTITY
>    domain with a translation aperture. This is inconsistent with the core
>    expectation for security sensitive operations
> 
>  - It doesn't implement a SW page table under struct iommu_domain so
>    * It can't accept a map until the domain is attached
>    * It forgets about all maps after the domain is detached
>    * It doesn't clear the HW of maps once the domain is detached
>      (made worse by having the wrong groups)
> 
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

