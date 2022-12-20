Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E00C10F1E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Dec 2022 17:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbiLTRSG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Dec 2022 12:18:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbiLTRSD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Dec 2022 12:18:03 -0500
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940A6BDB;
        Tue, 20 Dec 2022 09:18:02 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id v15-20020a9d69cf000000b006709b5a534aso7527331oto.11;
        Tue, 20 Dec 2022 09:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhPmfmriI4gnYtUc8MK4KlmDwOUzaaV0pXd8CWxInDU=;
        b=t9ZWoL/ntC9mLjWeLMOtxzLIL5DJSgB6tpMtW964zM8wCBWoFnp+VickaTDVwthV22
         IQHBoSDqKv9Acbv3MptXnFvcZAqzluVGm0OLXxEPhp5wHRc+BcDvY01TBr10kZiwekK/
         O6M3U5Qd6tFs/+rzv+tRKL8Q/NrLrxz89K7FC90sW3qwUbjEMooSU8Q0XN/HdNcIiBDH
         Cs516DkDZFqD2Xeg2tvzHjItB8KNuHHFZ+EOFY5vbINAo6kJbLGQLr4pU61HoT1XdNte
         VKI6dJHU+n3tvHldFNqJlfQeEgkq4IKYRZ490ibJek+/p5bni82owe4JTbXLBeUWei3N
         m4Uw==
X-Gm-Message-State: ANoB5pkMgGtRzZSB9lKsMmkp2bEitzwUWtHgK7VCOE5Aj94b0NTcc+ZW
        Ca9clwSN3zBHh4y6HTnLk8ifBnUXyA==
X-Google-Smtp-Source: AA0mqf5fJ7demUXGoedVzT/puZMis0xg7jSeNYFusNqcbX9zIlREnxiaj/kD3jRMUO8trPY7K1OkXg==
X-Received: by 2002:a9d:6a96:0:b0:670:6fee:c847 with SMTP id l22-20020a9d6a96000000b006706feec847mr22942919otq.34.1671556681793;
        Tue, 20 Dec 2022 09:18:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v19-20020a056830141300b0067083710028sm5819110otp.36.2022.12.20.09.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 09:18:01 -0800 (PST)
Received: (nullmailer pid 767395 invoked by uid 1000);
        Tue, 20 Dec 2022 17:18:00 -0000
Date:   Tue, 20 Dec 2022 11:18:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sriranjani P <sriranjani.p@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org, sathya@samsung.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, ravi.patel@samsung.com,
        pankaj.dubey@samsung.com, linux-kernel@vger.kernel.org,
        alim.akhtar@samsung.com, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v3 3/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynosautov9
Message-ID: <167155667989.767333.9822843529402787729.robh@kernel.org>
References: <20221214044342.49766-1-sriranjani.p@samsung.com>
 <20221214044342.49766-4-sriranjani.p@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214044342.49766-4-sriranjani.p@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Wed, 14 Dec 2022 10:13:41 +0530, Sriranjani P wrote:
> Exynosautov9 has several different SYSREGs, so use dedicated compatibles
> for them and deprecate usage of generic Exynosautov9 compatible alone.
> 
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> ---
>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml      | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
