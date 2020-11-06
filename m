Return-Path: <SRS0=C3hI=EM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B469AC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 20:45:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 498962151B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 20:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHzCBNfY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbgKFUpJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Nov 2020 15:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgKFUpI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 15:45:08 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D22C0613CF;
        Fri,  6 Nov 2020 12:45:08 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id w24so34882wmi.0;
        Fri, 06 Nov 2020 12:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+kHlg/AGwApi3ZxIuumsJtvX289YmFghT5WnO8YfCxo=;
        b=sHzCBNfYfqMZnWyLv1rL7Ocb4O/KQU0Pf6WkN9kCQ6ZTEzIiO82HCTH2P4CTEksPvM
         TKgMNVCoXWCTX+BymOXr1lqNWNnEz0tj0FA+/+7MKDL72wr+Ld5+9QR/4igL8wOzPhOG
         zsm+kDeG2IjQTK3Hn5wcj6AEPOJfhG/dJsIxDnITJOsbsqid8B3We1FAn+V8LC6LwTr2
         +nfz5EzrXa4C3yVBgBAZBew06gSb5XwMcgyH1Qu5SthQdjEAAE6lVbXOmimgZER3V819
         jzrNRt0XZB6NeJ8WKf2KRBv3nj6jQBH9IpF6AsrnNKoNE9gZ8Ubmktfr+rm6u277UdMi
         i0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+kHlg/AGwApi3ZxIuumsJtvX289YmFghT5WnO8YfCxo=;
        b=tB5/rMWhJt0SxfPNKY4pWAHj/rprFq3JYQvIEwSek5TEvCGnPXsHE6ZwgneL4cu22N
         mwrVA84J5TFKZqrsKSXn9esoxRH0cmadrt/aeTcgHhK3l/XD7oguahHc+u1BN7egjxiR
         LrONe63ADGiR6KX2ngn6y5FOgz6ReTOQat5N9KhPNpYJt9L43mr8F5YPk+t0bWNA9HI8
         qbV3EbyWwC5KuoVqOfMmEV6gjUBfumJmX8zQYUkoG7j8BlotBFNVnNHL90ROXBM85n5/
         4zPXwkigQgsQPb05tVHkML2uOZyTAuKuGT4/ElNn7rw/khZHnMWHYiZTW8JI5lwqh0xp
         DW2Q==
X-Gm-Message-State: AOAM5303F7nzxnPKI48rCZKiIarQOm7/PECX5KV/8KOmq3uBESs+n2sV
        tG2010r7u9gkcH5uKEeF32mNyQO/x5ZLmw==
X-Google-Smtp-Source: ABdhPJwZYGWa/0+kZR4UFPYprykEvnW3t8clXbFWCSyZGot/LyvsXLm3hF+ksj4tB1osUQsaThatyQ==
X-Received: by 2002:a1c:1906:: with SMTP id 6mr1359272wmz.87.1604695507196;
        Fri, 06 Nov 2020 12:45:07 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id c64sm3821472wmd.41.2020.11.06.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 12:45:06 -0800 (PST)
Date:   Fri, 6 Nov 2020 21:45:03 +0100
From:   Martin Juecker <martin.juecker@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: samsung: document bindings for p4note
 family boards
Message-ID: <20201106204503.GA4672@adroid>
References: <20201031175836.47745-1-martin.juecker@gmail.com>
 <20201031175836.47745-2-martin.juecker@gmail.com>
 <20201104200348.GA4038253@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104200348.GA4038253@bogus>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Nov 04, 2020 at 02:03:48PM -0600, Rob Herring wrote:
> On Sat, 31 Oct 2020 18:58:33 +0100, Martin Jücker wrote:
> > Document the GT-N8010/GT-N8013 device binding and the p4note common
> > binding that it is based on.
> > 
> > Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> > ---
> >  .../devicetree/bindings/arm/samsung/samsung-boards.yaml   | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 

I wasn't aware of this but it makes sense. I actually changed the board
compatible from samsung,n801x to samsung,n8010 - I guess that would
still be ok to add a reviewed-by in this case?

Cheers
Martin
