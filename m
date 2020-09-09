Return-Path: <SRS0=LGYT=CS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E6EC43461
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Sep 2020 07:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 616E321741
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Sep 2020 07:15:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFdh41Z5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgIIHPx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Sep 2020 03:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgIIHPw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 03:15:52 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70E0C061756
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2020 00:15:51 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q9so1216312wmj.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2020 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/JsVsp8FI1KMy1pkXT80pqpRR7DYsy44AH3/acP066U=;
        b=iFdh41Z5zYmKwG/W+rCcHcrRIP8Q3EONyrh6Wceurjj6y5s6aH6xcX/VYEv367+MRt
         m+OFy6jVhz2Y64Da0GYm1+CInnjVrdwdz3MHrS29V0u2hbQ0QzsoxfPPUQ+1jCqkW/rr
         je1GxlCIu4+34pFeirh3P9d3SQbO22e8vWAbMDAA8ZkT9M+UmKqFljAaOpSrTcFkS0TV
         MeBYCCn8ZAtSFTMlGIBDpvIHiKxmSAsoB/GJSkUEedGHdL5ZbQrKbJqhBQ0rqrhs3DeL
         QKxLelQIbPIQR8/aLBqcadR7iwxVVXEwI+KPqN4Cc+ITiI7ToN40UgTOuqj7pVVFJ3+/
         PidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/JsVsp8FI1KMy1pkXT80pqpRR7DYsy44AH3/acP066U=;
        b=PJSp9SyDvP2qcxAZNWdqQIm8WA+EK+BbWlVpUtD0i/mjXKY6Apno6s64PXDIqd/erZ
         EMObpgULnYWHWC7H/mWu1ok7NLPCCVs5tq0Bvc7GsCQ9m90cROXhBkjavQ/NNQbLHPIl
         UJFa7kElnpKbWHw+U2HarMziYcTCYCocdym0ol8QGuwT7KAQg/X3YdoULW9gBvKhaXM0
         8V9QXX7IizV4z7JaOIU5TAWkDaheqR5ECtF9Mzo0+Euqx08ScuDTBxv6T6b1OG2ygLq5
         3i7o+gyPGHhHa+GWJwvfZ4vkvMsgpJP3P9rBftpoH6+HZadugRoEOkVb+/usiO+S/RzC
         Ldww==
X-Gm-Message-State: AOAM533iaVMnrftWOX2V0lBCQL04Q81LQEd8pRzKLzSpmKSpp3SmUgqC
        upsU4h/VDJOvdTMnD2E/YxcYag==
X-Google-Smtp-Source: ABdhPJzFLKxycZi88TEpQo2dW2etwws5zrUtqeqmAWdb8R54+nsGrez/u+3tm/K2T6aQNSlzN72ZWw==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr2217549wmi.105.1599635749811;
        Wed, 09 Sep 2020 00:15:49 -0700 (PDT)
Received: from dell ([91.110.221.179])
        by smtp.gmail.com with ESMTPSA id x2sm1933582wrl.13.2020.09.09.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 00:15:49 -0700 (PDT)
Date:   Wed, 9 Sep 2020 08:15:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: syscon: Merge Samsung Exynos
 Sysreg bindings
Message-ID: <20200909071547.GZ4400@dell>
References: <20200902161452.28832-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200902161452.28832-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 02 Sep 2020, Krzysztof Kozlowski wrote:

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

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
