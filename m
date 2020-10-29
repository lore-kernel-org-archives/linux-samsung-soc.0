Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7B1C55179
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:28:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF08520838
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 09:28:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MqqqGoYf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgJ2J2E (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Oct 2020 05:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ2J2D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 05:28:03 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FCD5C0613CF;
        Thu, 29 Oct 2020 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=HMNKQsqBsKX9+0k6m5XFcNMbHKyJ5WQO76fwZYbzlHU=; b=MqqqGoYfwKrE3KISkpzbqHy/Ob
        uwVusthktdIZQSLnndLf88E75ofqEvbWgesgfeJfESvYr36PMyTzf8xDx9ObwIrnCaqC1jXHyrrEL
        6JMcnxyv9llSjA36fJwqh/119FIzHvvDdu2PPzJ/ZMlqjGtl3E4yTV495esSFXmAorzfgxzSVhEAn
        x3+Z9WX0MQlUP/mxT54fA+7vKmCUZkTIkr7rTMgMTNOUgOnrFxHfNf64sjDR+pkCAFSIrpqRRogAo
        ejWSe3+wxOeEr2U/JYm132fimQVhTTK3d0aumI3wRGQuZE24e5seUrCq9JzOrgmV3Q5iiH/rjO8Gu
        DV3kSWTQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kY4Dw-0000CZ-NJ; Thu, 29 Oct 2020 09:28:00 +0000
Date:   Thu, 29 Oct 2020 09:28:00 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v4 00/15] follow_pfn and other iomap races
Message-ID: <20201029092800.GA494@infradead.org>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201029085749.GB25658@infradead.org>
 <CAKMK7uEV7sQ48w1Dd=WCY1r6LrY+aEq3ASnouOebQoo=Zr=CTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEV7sQ48w1Dd=WCY1r6LrY+aEq3ASnouOebQoo=Zr=CTQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Oct 29, 2020 at 10:25:16AM +0100, Daniel Vetter wrote:
> On Thu, Oct 29, 2020 at 9:57 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > Maybe I'm missing something, but shouldn't follow_pfn be unexported
> > at the end of the series?
> 
> kvm is a legit user and modular afaict. But since you can't use this
> without an mmu_notifier anyway (or digging around in pagetable
> locking), maybe it should be EXPORT_SYMBOL_GPL now at least?

I think it should then take the notifier as an argument even if it isn't
diretly used as a safety check, and get a new name describing it.

EXPORT_SYMBOL_GPL is probably ok for now, but I'm drafting a new
EXPORT_SYMBOL_FOR_MODULE() which will export symbols that can only be
used by one specific module, with kvm being a prime user due to all
the odd exports it requires that aren't really the kernel interface by
any normal means.
