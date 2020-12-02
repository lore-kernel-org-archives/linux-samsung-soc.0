Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEE9C6369E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 20:03:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E083322260
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Dec 2020 20:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731210AbgLBUDg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Dec 2020 15:03:36 -0500
Received: from mail-ej1-f68.google.com ([209.85.218.68]:38358 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728727AbgLBUDg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 15:03:36 -0500
Received: by mail-ej1-f68.google.com with SMTP id a16so6285915ejj.5;
        Wed, 02 Dec 2020 12:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gjlzdsQdxsXzxqG6DJvmxHw+UJyuiMoRCuyYDA2+xk0=;
        b=Ghd/GZqfOp2iW49TyIErhxRDeb/EXEP095zjyAU7wTnA2/Xpap477sBWcv5cWcu5qL
         yMy03pZm+E7R3HmzLvsi+7dQpANmUkB9TinjXuaiGDE0k6dx5JwibYhYTkp2ZwRtRRZD
         GUMTzzMMWoA0hCT3WNOpuJclnrCKdRbA9S3gG91IhI19Up9XCOPKogFMHgHWtBeOGURO
         psyMM9kQM/58mvhdak07L2c6XY4DkymXNnZR9XiuBnZ09zOC8m9HlFGztIOQf1zyloEG
         pVcg8Pye3eSWQi07I2miXmtMKp44SO6AAxtlkhAUCQ5asfB8qnPrM9uW08uoPRFtveA/
         LjfA==
X-Gm-Message-State: AOAM533oRebmTpn7Xr8ccYPDJI/dsfhgrT1QSj5kqwntWIidepzA73yW
        ekcMWbvKgNIW7XUdRHRvSmxhPKUuvpU=
X-Google-Smtp-Source: ABdhPJwuWU94OcLvUXwn+jRK6vn3OtRrpWj5Uy1y6DoW6DC0AfeyctnUKppfBqu5X/9TjH873J0Bjw==
X-Received: by 2002:a17:907:6e9:: with SMTP id yh9mr1379758ejb.131.1606939374403;
        Wed, 02 Dec 2020 12:02:54 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id f7sm566575ejd.13.2020.12.02.12.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 12:02:53 -0800 (PST)
Date:   Wed, 2 Dec 2020 22:02:51 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: samsung: document SMDK2416 board
 binding
Message-ID: <20201202200251.GA128771@kozik-lap>
References: <20201117201106.128813-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201117201106.128813-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 09:11:03PM +0100, Krzysztof Kozlowski wrote:
> Add binding for the SMDK2416 board.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied.

Best regards,
Krzysztof

