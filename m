Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A946C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 18:02:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5FAD610C7
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 18:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhJRSFC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 18 Oct 2021 14:05:02 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:39660 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhJRSFB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 14:05:01 -0400
Received: by mail-ot1-f54.google.com with SMTP id e59-20020a9d01c1000000b00552c91a99f7so857396ote.6;
        Mon, 18 Oct 2021 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ekwh8TBKcZzWO0G92IyrQXg0TBRFib0eeL94Dkztj58=;
        b=AIiEsZ9R3JHP6bzaAtS4am4Jswj+lmLOkA5CodOSoneeFIKq+nYY1J/mPxNKBVB4ei
         M2qyXp404S2ZVNDw7fgc1fEcAZvxbO/GRcFtd32BuvrzHtUJxsV4OzLRn6oIDnwyUEb1
         p3bLxbrCRdeKAEQozpSjKnOG3wzaru/5dd2DAXodgBKJ30BK/zXtTy32IvdAI1dw+ubg
         9Zt829fjD36QFAMsKDQeSZdKifu6cLa4x/Pml4ooRHkbY5HbRnAXsaD7DfiKca7aIx9T
         xmDNFjiee7+TApmQGuYrW7GJ2CL+ZKXrrkoxoMxoA2DfDdBLh5wbcAVEMFBtiFwbPSD0
         pLCg==
X-Gm-Message-State: AOAM532M9QI3nkReJKkRj6yX8qc2oamyIkykeaMVUE26eDxKgfQianpf
        xth/KcVm2mjnAN5sHqsHEA==
X-Google-Smtp-Source: ABdhPJzHlH+zszUbV8GDbZ+HPEN49U8e4xqnb9GVwQzoGSfcYQm+oUPquDgeOo//WQRrXrd/RzawsQ==
X-Received: by 2002:a05:6830:3114:: with SMTP id b20mr1097752ots.163.1634580170226;
        Mon, 18 Oct 2021 11:02:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id y12sm1570554otq.60.2021.10.18.11.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 11:02:49 -0700 (PDT)
Received: (nullmailer pid 2666118 invoked by uid 1000);
        Mon, 18 Oct 2021 18:02:48 -0000
Date:   Mon, 18 Oct 2021 13:02:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: add samsung,exynosautov9-sysreg
 compatible
Message-ID: <YW22yKUhpIoO/IEB@robh.at.kernel.org>
References: <20211012002314.38965-1-chanho61.park@samsung.com>
 <CGME20211012002533epcas2p182112e07ea081957a0e54fea46c66816@epcas2p1.samsung.com>
 <20211012002314.38965-2-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012002314.38965-2-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 12 Oct 2021 09:23:12 +0900, Chanho Park wrote:
> Add document Samsung's Exynos Auto v9 compatible for system registers.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
