Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3E1C6FD20
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Mar 2023 21:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjCXVG3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Mar 2023 17:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjCXVG2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Mar 2023 17:06:28 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EBE166E1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Mar 2023 14:06:27 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id fb38so2080840pfb.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Mar 2023 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1679691987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3jMFsLqE2caCT6wyf0tOHuQrRREBiql26buc6N3dwU=;
        b=NaOd/bOhXevXn7BU0AUSWcGzTiaQEgTZiLBckE8aRILv8H0EEgFK88JTMY9uSsryCz
         YwhV3WKJhRFOek1S17jHA+xGLCLf9Fjd8c8Zs1VZtHhMzG0fONO1LtFEkk6OP/NAhtUU
         s6c9D329VX15XjdmvPqDK/MdQciz2KiLP/ys/YFbYl1uy6y9wkZLSdq7dgzEibGFTVLW
         zzc9Yj52EFXno+ZaB30Qw2+2/devPSSf05rQR42LhFX1yB5EN3L0ABuGevGsIanj2FD7
         hqKhjyndjFQ+0xO+5TT/i4xJ3e0LMNR8vWOIbxQmlA+D3M78smUdfaRw0FemVN7G8wgt
         jR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679691987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3jMFsLqE2caCT6wyf0tOHuQrRREBiql26buc6N3dwU=;
        b=FOfd5lyBqTLIo1rwCzmUNXVKLvNEtFbynpyZ/V/ddISUHiabIwhW+pN7VcRX1qvg7/
         /kp3pMilCkNlhGQhcF2oKrwA5Oe0q8sgbbqG5ImgsJHQCv4tqn0MfSZy2MnJ34SdijSQ
         590KcLtGWXjXFUcbIVZL9oHCYbzYCCB5BW0T+IBR8THIkC34cqGVqLjr6Nep40FZe7z9
         HJd4eV8LShnA3Ajm2tLtOusK3RyBOCpaPO/UTdeiT1kE28JajDjsxKC/78IbdCAgOULs
         p8X3lnbCsM4IOqABi2A58fk3G/CGp1/5XDestkgBmkjOeM2I+yoew01adJEN3mTp0ftp
         BhKw==
X-Gm-Message-State: AAQBX9cSoEIp4VUKNUg4x02Xy91Xd2Aw/vLbntwCAyAIvOOFyTscg0J5
        692iGbmJyz5wh19PGwx9Z0FxjQ==
X-Google-Smtp-Source: AKy350a6Q05PHHwil+uUiCQcOPxMiVdbh3fzjkp59m9vWFn4bqqjx/c81Ya9jcJ0FKSHJxi/R49bOQ==
X-Received: by 2002:a62:1dd6:0:b0:625:efa4:4c01 with SMTP id d205-20020a621dd6000000b00625efa44c01mr4631218pfd.3.1679691986997;
        Fri, 24 Mar 2023 14:06:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id 8-20020aa79208000000b0062a3fb2a75csm4769735pfo.65.2023.03.24.14.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 14:06:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1pfocC-002SD2-PC;
        Fri, 24 Mar 2023 18:06:24 -0300
Date:   Fri, 24 Mar 2023 18:06:24 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2] iommu/exynos: Fix set_platform_dma_ops() callback
Message-ID: <ZB4Q0BFzNfz5du04@ziepe.ca>
References: <CGME20230315232523eucas1p2565ef5954e3b5b451803c6200c8bce32@eucas1p2.samsung.com>
 <20230315232514.1046589-1-m.szyprowski@samsung.com>
 <ZBnCD7Xc9WCM55ub@ziepe.ca>
 <da174ce4-b922-21d0-62da-b69798a51371@samsung.com>
 <ZBnef7g7GCxogPNz@ziepe.ca>
 <3ca0c680-d651-a2af-978e-fcb4a2057dd0@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ca0c680-d651-a2af-978e-fcb4a2057dd0@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Mar 24, 2023 at 09:59:27PM +0100, Marek Szyprowski wrote:
> Hi Jason,
> 
> On 21.03.2023 17:42, Jason Gunthorpe wrote:
> > On Tue, Mar 21, 2023 at 04:43:42PM +0100, Marek Szyprowski wrote:
> >> On 21.03.2023 15:41, Jason Gunthorpe wrote:
> >>> On Thu, Mar 16, 2023 at 12:25:14AM +0100, Marek Szyprowski wrote:
> >>>> There are some subtle differences between release_device() and
> >>>> set_platform_dma_ops() callbacks, so separate those two callbacks. Device
> >>>> links should be removed only in release_device(), because they were
> >>>> created in probe_device() on purpose and they are needed for proper
> >>>> Exynos IOMMU driver operation. While fixing this, remove the conditional
> >>>> code as it is not really needed.
> >>>>
> >>>> Reported-by: Jason Gunthorpe <jgg@ziepe.ca>
> >>>> Fixes: 189d496b48b1 ("iommu/exynos: Add missing set_platform_dma_ops callback")
> >>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>> ---
> >>>> v2:
> >>>> - keep set_platform_dma_ops only on ARM 32bit
> >>>>
> >>>> Some more background why set_platform_dma_ops is needed on ARM 32bit is
> >>>> available here:
> >>>> https://lore.kernel.org/all/9a12fcac-c347-5d81-acef-1124c50d0c37@arm.com/
> >>>> ---
> >>>>    drivers/iommu/exynos-iommu.c | 17 ++++++++++-------
> >>>>    1 file changed, 10 insertions(+), 7 deletions(-)
> >>> It seems OK, but do you know what state the device is left in after
> >>> exynos_iommu_detach_device ? Ie is it blocking or identity?
> >> identity
> > Can you do this cleanup like this instead?
> 
> Frankly speaking I would like to have a minimal fix (like my $subject 
> patch) applied to v6.3-rcX ASAP and then apply this identity domain 
> support on top of than for -next (6.4). I've checked and your proposed 
> patch works fine in my case, so You can send it as formal patch.

I thought this was a cosmetic fix, do you have an actual bug here? If
so we should split it as you say, but you should describe the actual
bug in the commit message.

Jason
