Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A597C6FD18
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Mar 2023 13:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbjC1NLt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Mar 2023 09:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232822AbjC1NLm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 09:11:42 -0400
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22714AF21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Mar 2023 06:11:29 -0700 (PDT)
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 9473F243A8A;
        Tue, 28 Mar 2023 15:11:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1680009087;
        bh=13IoeeKBxX5OphHp1aBskczjEEJjaf6OphClbTl0qEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kJ/0hol8mFQYexq6WrOXJ5SIL0aWzORVumsRQ8uO3umtxUd1ksihzgAkl6iw2ehP6
         Vte+ZXHAs8BdhFTzKTZzkXZJoahQx2hfUCauGOIk6L09Ua1HH5h1o2xHp4+u2tgKMe
         eBWtBIpsuJn2S+sW0D5gVODVlzl+prBXX+umGJqR9p6/bY8N7gTu7A9tjS4iPMsKpG
         NZGyx9pi4KXPiJMcM26Z3s7+AD/jLBeViGc0GV37mXBUMTtLsnVzNKR+5GAo2mJtUW
         CgHKcqZTUl13J4EJIGeGkImMMvrgisrN1bHrVCX2N9D6E9XozC3xQOxAs9uYp8dGlk
         5m1Qlem2jQ0wg==
Date:   Tue, 28 Mar 2023 15:11:26 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2] iommu/exynos: Fix set_platform_dma_ops() callback
Message-ID: <ZCLnfrGdyUEuEfO1@8bytes.org>
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
> Frankly speaking I would like to have a minimal fix (like my $subject 
> patch) applied to v6.3-rcX ASAP and then apply this identity domain 
> support on top of than for -next (6.4). I've checked and your proposed 
> patch works fine in my case, so You can send it as formal patch.
> 
> Joerg: is that okay for you?

Agreed, a minimal fix for 6.3 would be great.

Regards,

	Joerg
