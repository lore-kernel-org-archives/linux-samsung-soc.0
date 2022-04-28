Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA62C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Apr 2022 10:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbiD1KG6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Apr 2022 06:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbiD1KGV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 06:06:21 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8853DA6D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Apr 2022 02:53:26 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q23so6016857wra.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Apr 2022 02:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Xqi3tQeoc1NHno9yKWMqbw4r5YQdgiKDuSb9oAeYHa8=;
        b=yr78g+MaZhUlHS2UcXn1OUn3doItrjOKC8k1mxoul2Im7B+S6CbbzGMO5FxmG7VARk
         B7pvcw5TzrbXRgxGIldFIdVA3DM15i8d7f48li84BuKwof+K4h8jJJXwABUBE8A7xGtb
         PHzESRMgKjoDZjv0vMD1jD3NzpGFDK8sWlO8gM3Zl61C++rp56wfXLpnL7R26QTzraP+
         xDY4MZ+BEVBP+FqFoFt9LOkDZZ/wHZbau4yo+bq7fAq3+a2j4vhSIRNUvoAY1FLovv+2
         qrF0EIdo+7RzxS07iAAzFNw7fAD1AUoPYFNEmSDJfhq6UUKpFGVWzCbVEOzo0F9yGCUI
         p/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Xqi3tQeoc1NHno9yKWMqbw4r5YQdgiKDuSb9oAeYHa8=;
        b=ab2yBz3wQGidaAVXlwExxtUoIjRixaLViGMB+1wYcrpLL12TueWzp+bGwu4G2JEU0B
         8XyyCjpGWmTGZRqhBfE9Ve8Z4DgcW2Oq2FSQU5r8L+TQN231P9S1Ne6CyQ3cWT1RirZw
         e/E8hlcZQ1gu+QOS3TYLhX/DNb2+hVCz3yw5+PXRRSGV3LwwqECkmLroXpYS2kf4aD0p
         kTGRLsQkOK2lu+8CVlM8BFlNveA7hsTedp+ps65LXmEvrp7QvQLySIMAHaC2eytLKJkP
         PAi4LeTU0B5JeUyRgOJOne7rpVSvFM2ZpVNoI+v30v6zSPOnAH5UWI+RCIYa1z0raRHg
         1KDA==
X-Gm-Message-State: AOAM532jKoFfDP9oGD0P4OeJQz5NhCoflRFU0SEUhkzVuAq/oTSgwC86
        f2dH5i6O7EPzm5qKirDrCIKvOQ==
X-Google-Smtp-Source: ABdhPJww1dXap9RkiBq4VNLp6PdlAcDue9crNwyW2b35J8EzRhEJPe7hKCSwo+1hkrq+KUvXKsMcZg==
X-Received: by 2002:adf:f30a:0:b0:20a:e193:6836 with SMTP id i10-20020adff30a000000b0020ae1936836mr12101094wro.654.1651139605530;
        Thu, 28 Apr 2022 02:53:25 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id i15-20020adfaacf000000b0020aee621955sm3721870wrc.34.2022.04.28.02.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 02:53:25 -0700 (PDT)
Date:   Thu, 28 Apr 2022 10:53:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 06/10] dt-bindings: mfd: samsung,exynos5433-lpass: fix
 'dma-channels/requests' properties
Message-ID: <YmpkE0FgEhPNneg+@google.com>
References: <20220427155840.596535-1-krzysztof.kozlowski@linaro.org>
 <20220427155840.596535-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220427155840.596535-7-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 27 Apr 2022, Krzysztof Kozlowski wrote:

> pl330 DMA controller bindings documented 'dma-channels' and
> 'dma-requests' properties (without leading hash sign), so fix the DTS to
> match the bindings.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Fixes: e18183cefc8b ("mfd: Add DT bindings documentation for Samsung Exynos LPASS")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
