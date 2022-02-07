Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95199C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Feb 2022 10:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234754AbiBGKY0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Feb 2022 05:24:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357410AbiBGKL6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 05:11:58 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47B1C0401CB
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 02:11:53 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id r7so9460196wmq.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Feb 2022 02:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=guHISOtMMO9Q0hH9tbWxwVMEC6CpTUnDrgqh7P8fsAo=;
        b=QyaiYp4jthHY0ZF6FxY8Mu0vf/UB7rbeZv6CwkI2gb5aev8fH0DUT3WLb7qkJARCXu
         eQmncuIRTLNMcqu0YHL6Ab6CNgdMrznVD75rgoHrn3kt/u3w9hn68ZEIAZWBawj/BKD9
         pZ3tQefFeBjg0R/4ucv147qVd7rc4hJ8fY9lzpJAr2ASghvUS6RFvhr9fJnMELEXkzMG
         NyuEYb/SJ7wiX5IKcRoBH31obVhiSixmubK+GMjJo8pwL89HuaVx5TqvGFlCLRjaabqE
         2xu8/BdwAr1BYlbjKP2lVJ0+a6AEGgfP/SLXNcqFMcL31DzfMsRAw+w+Uc0VymhDQ6mn
         XvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=guHISOtMMO9Q0hH9tbWxwVMEC6CpTUnDrgqh7P8fsAo=;
        b=g3pJ/unVZwiixjaHDmOdvrjZ/5SV5wgYyWCflxBgN/KC+q+L1femeKBUexSj+hnU1H
         ywJITmpubAwBqSOgPYo27AD0bn7dTsdkfdyR515RdQcM4UK1fL5omTdi6nOURHJGknxL
         zSW5k8EiR+2z9adYRxmjw5k8MJ9Rk4wu9vCT+CyDCYvo66gSdXi9vqZ6LeDfM5grWckv
         lqSCebIqLMxj9Kxd2cDMFTeTk9PuPGqfZIZMVqKeFbYNVe+9UhASYX5j32an/6hSqzLu
         cfXFXDn9b01kwBub4su0exmOA+5qOMcQq51TeGwVPssl90aL5YQD1Nk1CORNBN/ycmIw
         VX2A==
X-Gm-Message-State: AOAM530hua0iN14i9aEWSDZTSw9ON+bwrrTV7nNRytqEPQSiHhVeALfx
        womZcGko4jXv7aAN0N/m89iAWQ==
X-Google-Smtp-Source: ABdhPJy37cfI9ctBEfDiVSbCY7fy4ejXeLGzYhOD0a+pEgOKu0ccEi842Nj2bPmLvc3aD4m28muY8A==
X-Received: by 2002:a05:600c:154f:: with SMTP id f15mr10537627wmg.111.1644228712372;
        Mon, 07 Feb 2022 02:11:52 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id j2sm9155980wms.2.2022.02.07.02.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 02:11:51 -0800 (PST)
Date:   Mon, 7 Feb 2022 10:11:49 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 0/4] mfd/power/regulators: dt-bindings: max14577:
 convert to dtschema
Message-ID: <YgDwZUtc+Ac7ByWk@google.com>
References: <20220111174337.223320-1-krzysztof.kozlowski@canonical.com>
 <73bad620-97eb-a734-cbc8-6f001d04c18a@canonical.com>
 <YgDnlWKO6/BTxZh2@google.com>
 <68d1f184-bfc5-9d78-8c68-0c793b35adf4@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68d1f184-bfc5-9d78-8c68-0c793b35adf4@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 07 Feb 2022, Krzysztof Kozlowski wrote:

> On 07/02/2022 10:34, Lee Jones wrote:
> > On Sun, 06 Feb 2022, Krzysztof Kozlowski wrote:
> > 
> >> On 11/01/2022 18:43, Krzysztof Kozlowski wrote:
> >>> Hi,
> >>>
> >>> Changes since v1
> >>> ================
> >>> 1. MFD: Use absolute path to schemas
> >>> 2. Regulator: mention all allowed properties,
> >>>    additionalProperties=false, add min/max values for voltages and
> >>>    current, don't use patternProperties when not needed.
> >>>
> >>> Dependencies
> >>> ============
> >>> 1. DTS patch 1/4: nothing depends on it, sending here so Rob's automatic
> >>>    checker won't complain about DTS.
> >>>    I will take it via Samsung SoC tree.
> >>>
> >>> 2. Final MFD patch (4/4) depends on regulator and power, so the last
> >>>    patches (2+3+4) should go via same tree.
> >>>
> >> Dear Lee,
> >>
> >> This patchset was reviewed and there are no outstanding issues. Could
> >> you pick up patches 2-4 (skipping DTS patch) via MFD tree?
> > 
> > Nothing from Mark?
> 
> No, nothing. There is no other simultaneous work on these files, so I
> don't expect conflicts here. Important part is that I got review from Rob.
> 
> If lack of ack makes you hesitant, I can resend hoping it will help but
> it is a bit of pain.

No need.  I'll ping Mark privately to de-conflict.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
