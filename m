Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A3AC43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jul 2022 16:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbiGLQVO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Jul 2022 12:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234236AbiGLQVN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Jul 2022 12:21:13 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBECCAF22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2022 09:21:11 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bn33so10438407ljb.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2022 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e+eczaOZHX4TeLEoVuGZvZlc3YvFcSUgKh0OSE0sknQ=;
        b=lhhk7gHDxF++IOnhQqIAX8/FBtvR6oMIoA0r5phxQR/M5KWtbVwj2k4EydEVtu/pIo
         4w9XiIHP2kJ7Y1eHZzAg0f2k89RXidZkf9B65KcvuI/kIPD9t7L+DnaCt8J3qlvWxGmn
         2qGYQNUUFSJUuXXCuU1xPAFs3gz+4JQgHwdPAA06qjYa75mq4n0ZurQNoxUfbPQoPR2h
         Vvl4uRdviZwYFMFsnwRtgRNP7CjW+XWWwnlhW8BWddEcI+LIkrs8ZlrE5ruTZps3US15
         u67OhpdDCmO7BrpVt7+ZICSqDCN3OcoqT8ApozWGNmd4iY12CJMhYRI1SMbUi2bahh/m
         qfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e+eczaOZHX4TeLEoVuGZvZlc3YvFcSUgKh0OSE0sknQ=;
        b=fo9fSEFWtgcFu1KjFhguh+QY/5T0SXo8mq2tZxjR8HU/cs1N7Yw7tukoUfJkLTZYEe
         0vuAdlxhX7xpccdnohxBC2uTMFseA7u6b41bb53e3MyJflZfyC9xUkGtPxHbW/u2t0Q2
         hbMDAfYdF8H28ou7ugJvjISygdfHpKHcJtxW8R7jjdSzIQMm+jS5qt2XoKF/npbezrCw
         NUqVnWzdf1V4sbDtzHmbySzR3K9mVn0EpYRXbSzep7LcV9VxTlnqLSp7YMLB0IWeTBOX
         RSuIGwfurvB2am/dSGYmf0RCC4Yjx8wENgRg0879jbe4ccvMpg9saDnVm+3FO3sqNOMf
         mWIg==
X-Gm-Message-State: AJIora9hcUa23cQvSDGuj3cxS+RM/Ki8kqfWXUs/D4fNzpOA+YPTpBte
        eUZgiuvzO454isjUytAUF510uQ==
X-Google-Smtp-Source: AGRyM1uy5fRThCPAxo7NecWcdrhI0zdxdkzkxnBuoPdolEFSHJ0KXlb0BgjGw3e9yXOCH9xpzIrJ2A==
X-Received: by 2002:a05:651c:1a0e:b0:25b:baac:f415 with SMTP id by14-20020a05651c1a0e00b0025bbaacf415mr13791659ljb.480.1657642870175;
        Tue, 12 Jul 2022 09:21:10 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512215300b004855224ead0sm2262352lfr.158.2022.07.12.09.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 09:21:09 -0700 (PDT)
Message-ID: <8fccb0fd-a7ea-dc2c-5604-eef3c93f0397@linaro.org>
Date:   Tue, 12 Jul 2022 18:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/7] iommu/exynos: Set correct dma mask for SysMMU v5+
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
 <20220710230603.13526-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710230603.13526-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/07/2022 01:05, Sam Protsenko wrote:
> SysMMU v5+ supports 36 bit physical address space. Set corresponding DMA
> mask to avoid falling back to SWTLBIO usage in dma_map_single() because
> of failed dma_capable() check.
> 
> The original code for this fix was suggested by Marek.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Co-developed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
