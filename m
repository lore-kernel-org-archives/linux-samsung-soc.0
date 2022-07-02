Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA0DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  2 Jul 2022 21:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbiGBVuY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 2 Jul 2022 17:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiGBVuW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 2 Jul 2022 17:50:22 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918E92603
        for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Jul 2022 14:50:21 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bx13so6655645ljb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 02 Jul 2022 14:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DsgRlOlQk9CwhHGV4ShnBQjDciUiTvVu2KrFtsUP2QE=;
        b=iHgIVjJ6tsmEQTaXwiUnbyprQ6kTlXSHFNFbP2VajQCV/JSloHmhlznAzHVP+LIksk
         kf4DWLS9WEbuQYkPzbQL8UJ02i25dGUxQcwwDGSjd4CyjnacI0+RT3lvgBxhgFea7xCN
         tzEM4P2v2PsBfoQii9r4HIcTknEgNU+aIUFDve19qhg7bF9NImKZ9a5kfpjaU2tNV4if
         84SqSpogm5hvr2tLQIBISeeh9I3i00LwOijlHRYulnhnwlLVnawP9oVXZZ8bFooJv7u6
         lImxJuTzH9ZMeUTSkVzU3yNKlkSi9JaCNY9LE/9R4tSjkhny8m1KCgdla1t4CNCjm3P2
         101w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DsgRlOlQk9CwhHGV4ShnBQjDciUiTvVu2KrFtsUP2QE=;
        b=BvnX6YpkMUQpTpHHPhvK1LAeHDCxL8NLfzDTY+Ibw/EioETapk3DaQ2ZzTzBdsr1Zv
         dKMegorWxs7fL+F1dthWx1pxOChozyyiCEPFXEiZFT5hsnDLZzahRC+rYae32lP3Ky5W
         nUipsRqrH/HoOj6HDRQK2qnZ46Sy+dqxB/6fso3yiOmuW52i1ncItlAXLt5Go8HTBtnR
         HZaVuIrvpNKSkuqAIJSsksS6XvbvwqssUFQhlW3BYedqEO9qyF9xKDBbKOF0mFR9F8wD
         J0wdue/vCb2hktL6Wh4zJvQ9fjUo+yKeVawswx7RISiUkNMsqFtMxfMniW/NAbOdLqJU
         TzAA==
X-Gm-Message-State: AJIora8uiv0R7mbiql+wR+FsJhd9+cW6nnhNkgNef9g0Z8yRGclxSmBj
        1hEG/tUHmU2uE+vZAYofC27+jLYQVYKoKae3rNu36A==
X-Google-Smtp-Source: AGRyM1vLXwqhz6BzpCK0xevUybI4ir5IKfjFa4+/fr/QmTio9FpicbapVRcLunnalpFIvKFmIcC0KUay7XBkKRfJ0Sg=
X-Received: by 2002:a2e:990:0:b0:25a:7c03:eb70 with SMTP id
 138-20020a2e0990000000b0025a7c03eb70mr12239290ljj.350.1656798619915; Sat, 02
 Jul 2022 14:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220120201958.2649-1-semen.protsenko@linaro.org>
 <20220120201958.2649-3-semen.protsenko@linaro.org> <a111932a-6685-2a9d-abce-87af26b121a4@canonical.com>
 <CGME20220121110911eucas1p28d11e1b04773e8174b9d65f011dc1977@eucas1p2.samsung.com>
 <CAPLW+4kKR+7hM-eZc8-v6Dzeaj+TPBRmCLDSVNEnfx2WmN2TJA@mail.gmail.com>
 <54b76143-dff3-8a19-7ab9-57fb80d59743@samsung.com> <CAPLW+4nxSDeGL-1hFzdDr3vYx+9ct8_YrXfVNgzwm1Gq2=Vh7A@mail.gmail.com>
 <47a0abcc-b3d6-a9a3-8d3a-5689bbf8767a@arm.com> <ec775e98-1164-1016-13c7-9247e751782a@samsung.com>
In-Reply-To: <ec775e98-1164-1016-13c7-9247e751782a@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Sun, 3 Jul 2022 00:50:08 +0300
Message-ID: <CAPLW+4=MG2HwySJwZe427aHVtykVA1KBWg6a5qFRnFrWbhb4=w@mail.gmail.com>
Subject: Re: [RFC 2/3] iommu/samsung: Introduce Exynos sysmmu-v8 driver
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Hyesoo Yu <hyesoo.yu@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Jinkyu Yang <jinkyu1.yang@samsung.com>,
        Alex <acnwigwe@google.com>, Carlos Llamas <cmllamas@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Erick Reyes <erickreyes@google.com>,
        "J . Avila" <elavila@google.com>, Jonglin Lee <jonglin@google.com>,
        Mark Salyzyn <salyzyn@google.com>,
        Thierry Strudel <tstrudel@google.com>,
        Will McVicker <willmcvicker@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 22 Jun 2022 at 12:57, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
>
> On 22.06.2022 11:14, Robin Murphy wrote:
> > On 2022-06-21 20:57, Sam Protsenko wrote:
> >> Hi Marek,
> >>
> >> On Fri, 21 Jan 2022 at 14:31, Marek Szyprowski
> >> <m.szyprowski@samsung.com> wrote:
> >>
> >> [snip]
> >>
> >>>
> >>> Well, for starting point the existing exynos-iommu driver is really
> >>> enough. I've played a bit with newer Exyos SoCs some time ago. If I
> >>> remember right, if you limit the iommu functionality to the essential
> >>> things like mapping pages to IO-virtual space, the hardware differences
> >>> between SYSMMU v5 (already supported by the exynos-iommu driver) and v7
> >>> are just a matter of changing a one register during the initialization
> >>> and different bits the page fault reason decoding. You must of course
> >>> rely on the DMA-mapping framework and its implementation based on
> >>> mainline DMA-IOMMU helpers. All the code for custom iommu group(s)
> >>> handling or extended fault management are not needed for the initial
> >>> version.
> >>>
> >>
> >> Thanks for the advice! Just implemented some testing driver, which
> >> uses "Emulated Translation" registers available on SysMMU v7. That's
> >> one way to verify the IOMMU driver with no actual users of it. It
> >> works fine with vendor SysMMU driver I ported to mainline earlier, and
> >> now I'm trying to use it with exynos-sysmmu driver (existing
> >> upstream). If you're curious -- I can share the testing driver
> >> somewhere on GitHub.
> >>
> >> I believe the register you mentioned is PT_BASE one, so I used
> >> REG_V7_FLPT_BASE_VM = 0x800C instead of REG_V5_PT_BASE_PFN. But I
> >> didn't manage to get that far, unfortunately, as
> >> exynos_iommu_domain_alloc() function fails in my case, with BUG_ON()
> >> at this line:
> >>
> >>      /* For mapping page table entries we rely on dma == phys */
> >>      BUG_ON(handle != virt_to_phys(domain->pgtable));
> >>
> >> One possible explanation for this BUG is that "dma-ranges" property is
> >> not provided in DTS (which seems to be the case right now for all
> >> users of "samsung,exynos-sysmmu" driver). Because of that the SWIOTLB
> >> is used for dma_map_single() call (in exynos_iommu_domain_alloc()
> >> function), which in turn leads to that BUG. At least that's what
> >> happens in my case. The call chain looks like this:
> >>
> >>      exynos_iommu_domain_alloc()
> >>          v
> >>      dma_map_single()
> >>          v
> >>      dma_map_single_attrs()
> >>          v
> >>      dma_map_page_attrs()
> >>          v
> >>      dma_direct_map_page()  // dma_capable() == false
> >>          v
> >>      swiotlb_map()
> >>          v
> >>      swiotlb_tbl_map_single()
> >>
> >> And the last call of course always returns the address different than
> >> the address for allocated pgtable. E.g. in my case I see this:
> >>
> >>      handle = 0x00000000fbfff000
> >>      virt_to_phys(domain->pgtable) = 0x0000000880d0c000
> >>
> >> Do you know what might be the reason for that? I just wonder how the
> >> SysMMU driver work for all existing Exynos platforms right now. I feel
> >> I might be missing something, like some DMA option should be enabled
> >> so that SWIOTLB is not used, or something like that. Please let me
> >> know if you have any idea on possible cause. The vendor's SysMMU
> >> driver is kinda different in that regard, as it doesn't use
> >> dma_map_single(), so I don't see such issue there.
> >
> > If this SysMMU version is capable of addressing more than 32 bits,
> > then exynos_iommu_probe_device() should set its DMA masks appropriately.
>
> Well, Sam's question was about the Exynos SYSMMU own platform device,
> not the device for which Exynos SYSMMU manages the IO virtual address
> space.
>
> Simply add something like
>
> dma_set_mask(dev, DMA_BIT_MASK(36));
>

Yep, that one worked, thanks! Just submitted a patch, with a bit of
additions: [1].

[1] https://lkml.org/lkml/2022/7/2/269

> to the beginning of the exynos_sysmmu_probe(). This will disable SWIOTLB
> and switch to DMA-direct for the Exynos SYSMMU platform device.
>
>
> > (as a side note since I looked, the use of PAGE_SIZE/PAGE_SHIFT in the
> > driver looks wrong, since I can't imagine that the hardware knows
> > whether Linux is using 4KB, 16KB or 64KB and adjusts itself
> > accordingly...)
>
> Right, this has to be cleaned up. This driver was never used on systems
> with kernel configuration for non-4KB pages.
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
