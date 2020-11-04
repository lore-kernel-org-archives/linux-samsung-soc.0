Return-Path: <SRS0=OVUx=EK=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97E0C4741F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 20:03:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D53E2087D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Nov 2020 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604520231;
	bh=ZSG85ESCRSG2iqdQ9z9lFnGy6jkEtCIEv4bHzy/RbZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hmwuTAiehbMmaMGwepEj6PVDrKQHy0dMLEoqH+cslojVXGSKoYLuSqB+B0GlsWGkw
	 2t0NgLoH2ARicKoBzvHHdm1FNPBIEbkdiBPXemZk/VM+HHToGXx3wqnWOgf2aNdYLi
	 QmwwyQJyb+/XqtQP7qvBxVmaRnboN3teV9XN7FhA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731590AbgKDUDv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Nov 2020 15:03:51 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40017 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731531AbgKDUDu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 15:03:50 -0500
Received: by mail-ot1-f68.google.com with SMTP id 79so13036704otc.7;
        Wed, 04 Nov 2020 12:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JUQgQYNBfdSr9u9+0ymKrQdyAzk2HjKVNQuocc0Eq6k=;
        b=OzKrlXr5miD5m5O7ZHU8Ovs9bvxCAnKtSAl7C7Qr07jjnOi5fHbDfHZwEUM9eKU/oe
         RTBn2YTk8A4Bm4Mq1NVx5cY7hE9KOru08hpkw5sU3e4f0oSXvrWFC24yMz1E1brUTwHI
         NR0iUjXiLDEZXl0gBxbRXBg1CI7ZIvrZUxJkhZfbn8qa8taMu8KD2ELtxDlEbWNStzw1
         pE+uw7xEXUceCMs6f/F6C3IoByQTg79z7axr1a6lf08MRpK1Ags6+O6rZ6ctG/uv1DYY
         /OivxtQxXj9yP0VVJpZlrk1zTl2T3EouXiNKyhIDQOMm15lrTn9A/qbrwUuqf7ISNfSi
         tZZw==
X-Gm-Message-State: AOAM532q5bQShgIbUH+ZsQYMrTjxAIpbe0r97DoMsDYPJJ/VWXOwUg/z
        kesUOGmw8F0DzA1BnDLb8w==
X-Google-Smtp-Source: ABdhPJxMD9nvhhhhLvNMud2OO7ROHQe7ezwZWePR1KBI/3l+/y0+uWNDNvxF/By6g8MAcyrzyv5pTA==
X-Received: by 2002:a05:6830:1259:: with SMTP id s25mr10806430otp.66.1604520229815;
        Wed, 04 Nov 2020 12:03:49 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 8sm706667oii.45.2020.11.04.12.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 12:03:49 -0800 (PST)
Received: (nullmailer pid 4038462 invoked by uid 1000);
        Wed, 04 Nov 2020 20:03:48 -0000
Date:   Wed, 4 Nov 2020 14:03:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: samsung: document bindings for p4note
 family boards
Message-ID: <20201104200348.GA4038253@bogus>
References: <20201031175836.47745-1-martin.juecker@gmail.com>
 <20201031175836.47745-2-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201031175836.47745-2-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 31 Oct 2020 18:58:33 +0100, Martin Jücker wrote:
> Document the GT-N8010/GT-N8013 device binding and the p4note common
> binding that it is based on.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml   | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

