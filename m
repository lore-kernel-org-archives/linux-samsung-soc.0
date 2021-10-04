Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E83C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:50:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C578461401
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbhJDOvx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 10:51:53 -0400
Received: from mail-oo1-f52.google.com ([209.85.161.52]:43665 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235153AbhJDOvx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 10:51:53 -0400
Received: by mail-oo1-f52.google.com with SMTP id t17-20020a4ac891000000b002b612d6d5e9so4730685ooq.10;
        Mon, 04 Oct 2021 07:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U+Mb6i4jqc0BH9AVzQELvGnZO9UgrksO+BSiEwTlByk=;
        b=o6cKETiwLLQZAzAjHKSwboFPH/j2UkexPPmWavrh45gyLV16lcaVEqabhKjjKelEKz
         WA4d7+UiWXNmFQEA+YBJrQM6Uz4B4C3ysWv9xcif8xHekFgKc/0t+8KCsGHe9mA7d4Kj
         1aDT51P61mrQnWnu4J+aL+mTzu/CJUKu7Jl2om1U5ozrBWR+7k+UPvIbFoFCe+YCjR/c
         AB3lU4J+9epOoaCXK4eslrN6wMAIykaVXh7XT2faUMzdvEoR34vKuWSGDxCyWIDVpigI
         3RS+RQvlpBm/SZje4jn/HtfvQ1sDXLYrnqkskK3xCHpvCB7IB5yjSA9CbYf8oMG6Cxje
         HIPw==
X-Gm-Message-State: AOAM532zlBlp/Owl806YJhJMLTSNLhEOXX2b4eT8H1JXkPQQr1aSSkAk
        /pvFVnJOvRHHST4XvoKT+Q==
X-Google-Smtp-Source: ABdhPJwcbEfoPtEh0rovkWKFruuJLLJC0475QVhxdpBWK6Ykpf94uuILWwvKYHEy1//0HuvayOeXPg==
X-Received: by 2002:a4a:df0b:: with SMTP id i11mr9334532oou.30.1633359003717;
        Mon, 04 Oct 2021 07:50:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f37sm2492442otb.43.2021.10.04.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:50:03 -0700 (PDT)
Received: (nullmailer pid 1275925 invoked by uid 1000);
        Mon, 04 Oct 2021 14:50:01 -0000
Date:   Mon, 4 Oct 2021 09:50:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 10/10] dt-bindings: mfd: samsung,s5m8767: document
 buck and LDO supplies
Message-ID: <YVsUmXb2QuKA9Ggd@robh.at.kernel.org>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <20211001094106.52412-11-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001094106.52412-11-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 01 Oct 2021 11:41:06 +0200, Krzysztof Kozlowski wrote:
> Document the properties with regulator supplies for bucks and LDOs.  At
> least one board uses it (Exynos5250 Arndale).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
