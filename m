Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D497C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Jun 2022 19:58:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbiFUT6D (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Jun 2022 15:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354161AbiFUT6C (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Jun 2022 15:58:02 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFB221B0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jun 2022 12:57:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w20so24115696lfa.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Jun 2022 12:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fsdYQTaklxVpMVnF74Fwow7BM/BoXJFQmtaeoDmy2hs=;
        b=FyH+MCcoAhSukHTzzC9zO3eoVyRq1qpXmRCZl6t55YnB32nSo6Oc1s/51247/QscRJ
         OQ7ZrAGwgwDDFmvRFt6ZDpMXEkkpevwi8l4tnEa05kRFZU0pP3I4ftUjfRnoohZo91gi
         X0feNSv3mFlUlza65awMWNw5ONu1MZmSj9eiKXjkkqr9BNLasgk35JY6RcLgpQSxH3Am
         KttX8hoSjULEyvg7mPEWhloR5KHTvC6lE+U4RewNuLg/dmVBiNfYbUTDzWdiMCVppDW1
         AkMApZQxG9NR4tM1dF9tgXjY7OFKi46cFP0eq9FDf4RyId+GLzioAja0FhXzDuGzprtL
         O6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsdYQTaklxVpMVnF74Fwow7BM/BoXJFQmtaeoDmy2hs=;
        b=LngGas2H4JsgAPgGxTWl1nvXA66UY4+c0ab3Qa7O4OcWIt2lMx3wybXT88vzr8+9f/
         fyqlC0pBi3LMO2j3mlmQSW5iunDJe+6+o+lv2E84jS1+R3aQJrLqVY5ekN5fo9aBpB6V
         TctrMZOgcibjT8zlbnuWxWoW7GHaxFoC9SFa5bBDvHaEycPUo9+fv9oCUrxt91kKxhRK
         QCrhPNKu/jTZUFQNcQxROLnxvpyQqNrP9DTjbyIveXk6AWqWRbcMGEZrufxJ82BVga3v
         CF5SbhxgYz0cd1Y2Lnxb1Izc+ZWjXxSLL0jfEf0ceyNFIFHAP62J4iru7n4gmPXI7u1P
         Nc/g==
X-Gm-Message-State: AJIora/GNSJ5JwdSUZt/s50ufItpA7VR9jKvyzCGvMCQ3rCwbFb35tAG
        Nc6a7uXmHPBzS/rDH2jxXgUrjjdrjngv1N3nUx/g6Q==
X-Google-Smtp-Source: AGRyM1tZti33hqtcfRWE9/wlPsix/FQKmBuC6bf9FCaquFQpjIj54ZeAiGqQxoPDRcXHWvdOZFxc6Xpd5l82usRX4h4=
X-Received: by 2002:a05:6512:1087:b0:479:4fb5:1cbb with SMTP id
 j7-20020a056512108700b004794fb51cbbmr17405991lfg.142.1655841476083; Tue, 21
 Jun 2022 12:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220120201958.2649-1-semen.protsenko@linaro.org>
 <20220120201958.2649-3-semen.protsenko@linaro.org> <a111932a-6685-2a9d-abce-87af26b121a4@canonical.com>
 <CGME20220121110911eucas1p28d11e1b04773e8174b9d65f011dc1977@eucas1p2.samsung.com>
 <CAPLW+4kKR+7hM-eZc8-v6Dzeaj+TPBRmCLDSVNEnfx2WmN2TJA@mail.gmail.com> <54b76143-dff3-8a19-7ab9-57fb80d59743@samsung.com>
In-Reply-To: <54b76143-dff3-8a19-7ab9-57fb80d59743@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 21 Jun 2022 22:57:44 +0300
Message-ID: <CAPLW+4nxSDeGL-1hFzdDr3vYx+9ct8_YrXfVNgzwm1Gq2=Vh7A@mail.gmail.com>
Subject: Re: [RFC 2/3] iommu/samsung: Introduce Exynos sysmmu-v8 driver
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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

Hi Marek,

On Fri, 21 Jan 2022 at 14:31, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

[snip]

>
> Well, for starting point the existing exynos-iommu driver is really
> enough. I've played a bit with newer Exyos SoCs some time ago. If I
> remember right, if you limit the iommu functionality to the essential
> things like mapping pages to IO-virtual space, the hardware differences
> between SYSMMU v5 (already supported by the exynos-iommu driver) and v7
> are just a matter of changing a one register during the initialization
> and different bits the page fault reason decoding. You must of course
> rely on the DMA-mapping framework and its implementation based on
> mainline DMA-IOMMU helpers. All the code for custom iommu group(s)
> handling or extended fault management are not needed for the initial
> version.
>

Thanks for the advice! Just implemented some testing driver, which
uses "Emulated Translation" registers available on SysMMU v7. That's
one way to verify the IOMMU driver with no actual users of it. It
works fine with vendor SysMMU driver I ported to mainline earlier, and
now I'm trying to use it with exynos-sysmmu driver (existing
upstream). If you're curious -- I can share the testing driver
somewhere on GitHub.

I believe the register you mentioned is PT_BASE one, so I used
REG_V7_FLPT_BASE_VM = 0x800C instead of REG_V5_PT_BASE_PFN. But I
didn't manage to get that far, unfortunately, as
exynos_iommu_domain_alloc() function fails in my case, with BUG_ON()
at this line:

    /* For mapping page table entries we rely on dma == phys */
    BUG_ON(handle != virt_to_phys(domain->pgtable));

One possible explanation for this BUG is that "dma-ranges" property is
not provided in DTS (which seems to be the case right now for all
users of "samsung,exynos-sysmmu" driver). Because of that the SWIOTLB
is used for dma_map_single() call (in exynos_iommu_domain_alloc()
function), which in turn leads to that BUG. At least that's what
happens in my case. The call chain looks like this:

    exynos_iommu_domain_alloc()
        v
    dma_map_single()
        v
    dma_map_single_attrs()
        v
    dma_map_page_attrs()
        v
    dma_direct_map_page()  // dma_capable() == false
        v
    swiotlb_map()
        v
    swiotlb_tbl_map_single()

And the last call of course always returns the address different than
the address for allocated pgtable. E.g. in my case I see this:

    handle = 0x00000000fbfff000
    virt_to_phys(domain->pgtable) = 0x0000000880d0c000

Do you know what might be the reason for that? I just wonder how the
SysMMU driver work for all existing Exynos platforms right now. I feel
I might be missing something, like some DMA option should be enabled
so that SWIOTLB is not used, or something like that. Please let me
know if you have any idea on possible cause. The vendor's SysMMU
driver is kinda different in that regard, as it doesn't use
dma_map_single(), so I don't see such issue there.

Thanks!
