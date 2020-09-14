Return-Path: <SRS0=fOmg=CX=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5383BC2BBD1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:25:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11D1520E65
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Sep 2020 20:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600115103;
	bh=sUpQmxDrb/xQf1mS9UlusLhaZBCxj2IZKaAP1bv3fYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kBHRD0QZohPDfHufZNCZKy0EwiTWZrHxGPJfpTt/aXJMP5JHXZVvYWm+YkGPuz9YA
	 jqkkyKMxISxXn6Vc3ZD0zWB+lp86SwISAIGUI8fuGWFLCZl5gSrQozTO3CeMd4bqEA
	 ke3LTpZ7a/wZyiRcJEiIRWqpjFKq5UByyqihfDrk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgINUZB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Sep 2020 16:25:01 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37662 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgINUY7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 16:24:59 -0400
Received: by mail-io1-f66.google.com with SMTP id y13so1584083iow.4;
        Mon, 14 Sep 2020 13:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nUDjp8j5wWOQqg15UHuAS/Y7Onv8wU4rYO/koTwtI4A=;
        b=GhKKVzAPLNSxOhYln6mbO/Gvm3xoer4APg8OFt7jufIZMk1v+YszVZWdXiIeyJxROp
         WYeaKf0GwohifsVAfutFFmgzGEIi6A7YYhkkpQfsiLfe/atiqytUx8GHXyUvaDjFD6rD
         KXAZVtyo73dLMPmLSDpKnsBg5DfogAv7BW+2kyNR4ft2mKgrYQt8bNJxKN8dk1bnJ3BQ
         jjWuPei1LBmoxjpEx/ifI5ca7Ri3wIz4jIN5feFhfcz7rpEIpI3atRu7h/1ikq14EmcV
         y5pkf2l0zeqB24PYkMbn9K7UyKQTM4j95vOL7ej/+Fy6fnO5f4QlHGcsTdFuoWVQ9Kxz
         EM7A==
X-Gm-Message-State: AOAM532dLiskovqZWGDqaCeAqb5PoE7i7uXBUNFxn6YhV87isozJ8HJw
        W96NWUbaZ9X1pkB3qfkWfQ==
X-Google-Smtp-Source: ABdhPJw8kDQwpVmCVH7WPZG7bhrAujc8CaMp2ORC3JbM+ClS0LfR9qNa+cx7SKRyXaPz0RRolRqv2A==
X-Received: by 2002:a05:6602:1602:: with SMTP id x2mr12808391iow.22.1600115098647;
        Mon, 14 Sep 2020 13:24:58 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k11sm6580242iof.40.2020.09.14.13.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 13:24:58 -0700 (PDT)
Received: (nullmailer pid 181213 invoked by uid 1000);
        Mon, 14 Sep 2020 20:24:55 -0000
Date:   Mon, 14 Sep 2020 14:24:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>,
        linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: syscon: Merge Samsung Exynos
 Sysreg bindings
Message-ID: <20200914202455.GA181160@bogus>
References: <20200902161452.28832-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902161452.28832-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 02 Sep 2020 18:14:51 +0200, Krzysztof Kozlowski wrote:
> The Samsung Exynos System Registers (Sysreg) bindings are quite simple -
> just additional compatible to the syscon.  They do not have any value so
> merge them into generic MFD syscon bindings.
> 
> Suggested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  .../bindings/arm/samsung/sysreg.yaml          | 45 -------------------
>  .../devicetree/bindings/mfd/syscon.yaml       |  2 +
>  2 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/samsung/sysreg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
