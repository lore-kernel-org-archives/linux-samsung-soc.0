Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36970C83F12
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 28 Aug 2023 21:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjH1VFA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Aug 2023 17:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233417AbjH1VEl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 17:04:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CEE139
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Aug 2023 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693256631;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HWGAjWA2SZIgARlOfsf2TOxHPntdeHshE+ifQSu/y8U=;
        b=SJy7J7OO5NgCERnXV/0/R0fqYuRw7BCXluBJhF7R8Cv3Eudkt8kzf68fkDLvuWSFjMgYT2
        +Tnfn2mg2IPm2P+9ydYF9beTYpqNMzvQH85nKpjiV0JxIctRd/F5n6z2aosUVCjoFgqF49
        oDONxOsCnym5ahxTMQkzEkgG9gvkoF4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-j5kEoZ5EPkG-IZhktyBy5A-1; Mon, 28 Aug 2023 17:03:49 -0400
X-MC-Unique: j5kEoZ5EPkG-IZhktyBy5A-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-76efd8bf515so237756885a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Aug 2023 14:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693256629; x=1693861429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWGAjWA2SZIgARlOfsf2TOxHPntdeHshE+ifQSu/y8U=;
        b=Ws7yJ8FdH+McoMN07rhryjX5zztO0ugtz9G6aEa7bG8FGQlReA81zyTdsSQ+w6JTNg
         T/uGPj+wBWFtU129wcEZ5lNndy3DgoleFURx6QCmAtNPXkmt6nfz/9yAyrCryeNSLoAa
         n2gxgUuLO7eaFFa3wJ41v9dZ8YTAfj3XtH7zq/6q/oCPaSt65AhqjLxt3xkOEaC6abyl
         8XfIJojIHUvluoDAPLyrdD3XHZ7C2n7ObjMvu7Pvw1a2wonWkpG34124j3BnQI7u0BHz
         uRbUeU4X3eKdyTqMZ23YvACwy+IHuX8BiJPldiCo/YyatNDUDRUFJxDwXOTTe2gmKNb7
         HUoA==
X-Gm-Message-State: AOJu0YwAXo1N3oUCmLnC/OReAG/5U6X70JGfo8kQnYwiuAlSSWp4GNum
        FoQ3dMzrGZnU9TLGy3SX4v6NYQX5jtWhZSx2EiDJeR/VqciHPlc+iVcIqAHsw5uWWnL3kOuos8L
        oaxFSc8R3AXfynhUBZvD3vsKwqBUN5ww=
X-Received: by 2002:a05:620a:4043:b0:76d:a569:cca9 with SMTP id i3-20020a05620a404300b0076da569cca9mr1135632qko.16.1693256629214;
        Mon, 28 Aug 2023 14:03:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPzgbmIBwnSRpgIiayc8cNLu07wX9Qi7uegSYIbsuDejPaJeraN4CSa9e1P57NFTVOJ82DNQ==
X-Received: by 2002:a05:620a:4043:b0:76d:a569:cca9 with SMTP id i3-20020a05620a404300b0076da569cca9mr1135581qko.16.1693256628994;
        Mon, 28 Aug 2023 14:03:48 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id l19-20020ac87253000000b0041061a16791sm2555777qtp.67.2023.08.28.14.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:03:48 -0700 (PDT)
Date:   Mon, 28 Aug 2023 14:03:47 -0700
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
Subject: Re: [PATCH v7 18/24] iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <co5jqsviedblnyi7gkdkjuo6n3ai6o4qvzclvqfyrl6h7ugtdr@lkwojyyjq3qh>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <18-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:32PM -0300, Jason Gunthorpe wrote:
> This brings back the ops->detach_dev() code that commit
> 1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
> into an IDENTITY domain.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/mtk_iommu.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

