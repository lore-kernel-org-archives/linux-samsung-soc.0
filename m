Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECF9C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jul 2022 16:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbiGLQTP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Jul 2022 12:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234355AbiGLQTM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Jul 2022 12:19:12 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB205BE695
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2022 09:19:10 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a9so14767282lfk.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2022 09:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uJ9dVi90hK+YLTAhE7H/lF4J6uUbmiWH1N0eWZR3ZwA=;
        b=TTsXZieu32r3wAaawionSAU7zpQZb8eC0dCJ0JhkT+ecFFSbVnbKVkFmXYyw1029m2
         1GR6KJ4SPcmGBcdCugUqdzSuiNXVea9CTYsurcpyvnfKcrCP7dSeuna0fEgPg5N5WJpD
         hoPACOrCuHbt3ZcML4hZ20i24O19ZQr24EAH14GvGBlggtLW+lL1HkwjutpMHinCzuj5
         iN4Lls3rZp95yjTD9gF2Le10PFvVzjWghz8ngg9LNvxKb8q9hVejhorDbYGxej2kIjIs
         fgoS9+T0y/ecsMzfml0R8/b8EhS/ku/nwBqiBlm0Q7x2mdRB8R2ZT/bhEPUavPo1s4Td
         P02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uJ9dVi90hK+YLTAhE7H/lF4J6uUbmiWH1N0eWZR3ZwA=;
        b=uuOFPrDww42dLCetQKTYebjCM8hQFbRf0cglTb7yRHr1Ck7EG1sWzmmuqkt10M8jvj
         X2ubM6xUuvi0zZue1ozmIClmiRbnupqb3d3ydYVwLTFhBI+6pz+mTJ/tLnZYZhpNUtKs
         cD4pjpOAMq1HXUu4oYnWkfD9NZEvS93/uHc+Ag1uOgItFuPkxjnWprbkvD3dLSaJUjFA
         XiHdPKC/XNttsYjTBlJvKdpIaBSk9JFMnAQDC9TTN05VR38SWBQwlWNEnFbm0I9JOjLx
         lD/aUzbOEJBMPuyk4RK0Ccd5ns5gV/qST3y9Rc40UTlz6JF9YNefQpoKwTaxETI3/HzM
         qpGQ==
X-Gm-Message-State: AJIora/zhXZ9tJAZgBFUpzXF3XOxypIZbSuNe/BT2fUfiI1KcGWB/Pkn
        4LKxXGAQqse2WNNWcCpwJ77zAw==
X-Google-Smtp-Source: AGRyM1uGiF4reCluBJM1q38YblixcNGVUMf8QXzKeopoBX/HMPUAtrhZDOIADX//FSe4WDjod3mUAw==
X-Received: by 2002:a05:6512:682:b0:489:16b3:14e1 with SMTP id t2-20020a056512068200b0048916b314e1mr16035039lfe.132.1657642749316;
        Tue, 12 Jul 2022 09:19:09 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id k13-20020ac257cd000000b00489db767c89sm1552945lfo.271.2022.07.12.09.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 09:19:08 -0700 (PDT)
Message-ID: <257c64a7-db27-301c-f724-f8c771092466@linaro.org>
Date:   Tue, 12 Jul 2022 18:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/7] iommu/exynos: Reuse SysMMU constants for page size
 and order
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220710230603.13526-1-semen.protsenko@linaro.org>
 <20220710230603.13526-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710230603.13526-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/07/2022 01:05, Sam Protsenko wrote:
> Using SZ_4K in context of SysMMU driver is better than using PAGE_SIZE,
> as PAGE_SIZE might have different value on different platforms. Though
> it would be even better to use more specific constants, already existing
> in SysMMU driver. Make the code more strict by using SPAGE_ORDER and
> SPAGE_SIZE constants.
> 
> It also makes sense, as __sysmmu_tlb_invalidate_entry() also uses
> SPAGE_* constants for further calculations with num_inv param, so it's
> logical that num_inv should be previously calculated using also SPAGE_*
> values.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
