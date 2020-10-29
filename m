Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3939BC55178
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 08:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDD772072E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 08:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VPOBx7Rv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgJ2I6g (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 29 Oct 2020 04:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgJ2I5w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Oct 2020 04:57:52 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37584C0613D2;
        Thu, 29 Oct 2020 01:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Gfwg35QlbYdT8sMF/4QDRdLm9wKg0f9JXc5PYsSGSGk=; b=VPOBx7RveF4A0G7LwHbYX+lN9B
        OZIUhbXa6ukgOTpcoRF/twjV7H3ZybiHXckp9BwPDMUCdwIRzdO7vEPLWXsUMWCa4MDwkJsodX2F+
        j1CyIYN+g0SFhTgPtI4+lx3P6SU4OZZ9qHU9sILCuLYt9QGnlaLKY3ZsKjPHGOtvaMopzvLtVqxpN
        YOlvTWV9711amkL+LN1wI+D2eJiUi/r8jkl9fqvMNIUdA1fzEpy56LDozGWvwkfM3X9I4g0GeSB/f
        cFkjTs/uwBl3LEkGG4wP7a2BhhqhRP/GXDn308SKGdrt8x5VG5z8Q5wWsQ0HNhWLHcY8nm7HxUjPH
        Z0R6mmQw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kY3kj-000702-L3; Thu, 29 Oct 2020 08:57:49 +0000
Date:   Thu, 29 Oct 2020 08:57:49 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 00/15] follow_pfn and other iomap races
Message-ID: <20201029085749.GB25658@infradead.org>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Maybe I'm missing something, but shouldn't follow_pfn be unexported
at the end of the series?
