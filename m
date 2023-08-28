Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAD6C83F11
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 28 Aug 2023 20:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjH1U2Y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Aug 2023 16:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbjH1U2W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 16:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3725B195
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Aug 2023 13:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693254450;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UKJOgsnfF2FTgMzr7BpoixR3SpR6vuzOkPfvbf/VtFg=;
        b=BSL7MeidQvLgjmnXbgs3GQgzV2ClCCa0RnY+VmcbciUFUxnaPFGPgEoU7VxhlnnjiSsba/
        l+kE4QURtP9MTNNO7i6CpcRFgjedhJfms6Qvh67Vgxau06b0IM1+ye9Au0TZ0t3y/BMeym
        zy2juSBOhW+JzdeVZMN72nuubui/B2U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-4gBGmYP6O6yzBAMZC-OYEw-1; Mon, 28 Aug 2023 16:27:28 -0400
X-MC-Unique: 4gBGmYP6O6yzBAMZC-OYEw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6491907dba4so34047966d6.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Aug 2023 13:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693254448; x=1693859248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKJOgsnfF2FTgMzr7BpoixR3SpR6vuzOkPfvbf/VtFg=;
        b=i8V8bw1QD6G1GI3+3/1LMT2rX6ph7+CQ8lhG6CCPnrYGiswT8WDluPZ0SVobaYkFAk
         V7CmFykx2xhRDqxYkgIS+9mWVwf1QH2I0I6WlsW3wN6Ks2uTD10sc2T9lxh+/eQ1bQpO
         dS0oxbHeVTb9FoKj2st2DvZQlGxB278DRbpKHBc2DEoJ3IxL57uWnpQgUHy5fyqnFVXp
         Ii7GSIPI6FSR1CxtI1dbNN6TfKMuadLdba5JcFdJhtGOuW+m0ZWPnVs5aIWvLI56UeTc
         zo7Jeem3BBrNW7a/hUKLxnvqQV/YnvHNo8scYtFeyiW/ihxVGTJjF3V79U/n6AIRUszv
         SlMQ==
X-Gm-Message-State: AOJu0YzicgIv3/DYMRB1b2TKY532mFI9T60kv7YHu/6cgNfNa/RWNthw
        6okXEZqSsvQ5VQ2HOJ93ZVSXYaKwwaNblLneAE2nIo4JaTd1prh1LNzbISpj+PFhyP0rCx9rFA4
        z7Up7d58dsjNno1lunMvElf1Y79jHxXw=
X-Received: by 2002:a05:6214:1946:b0:64b:926a:e7fc with SMTP id q6-20020a056214194600b0064b926ae7fcmr1021324qvk.21.1693254448515;
        Mon, 28 Aug 2023 13:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqFPUIE0VD3pPuJr6SEA/sCAWUcKffhBaA+0iqWdlm0BRzVqkbCdfoX5jw79sJViEhNnh3nw==
X-Received: by 2002:a05:6214:1946:b0:64b:926a:e7fc with SMTP id q6-20020a056214194600b0064b926ae7fcmr1021306qvk.21.1693254448284;
        Mon, 28 Aug 2023 13:27:28 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id x10-20020a0ce24a000000b006263a9e7c63sm2767781qvl.104.2023.08.28.13.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:27:27 -0700 (PDT)
Date:   Mon, 28 Aug 2023 13:27:26 -0700
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
Subject: Re: [PATCH v7 12/24] iommu/tegra-smmu: Support DMA domains in tegra
Message-ID: <pqocyap65uirlogtdy6fw6gb5qc24zrk6r235krllqj3qrcv3f@4xcew7khwydt>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <12-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:26PM -0300, Jason Gunthorpe wrote:
> All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
> dma-iommu.c.
> 
> tegra is blocking dma-iommu usage, and also default_domain's, because it
> wants an identity translation. This is needed for some device quirk. The
> correct way to do this is to support IDENTITY domains and use
> ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
> devices.
> 
> Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
> everything so no behavior changes.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/tegra-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

