Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D30C636D6
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Feb 2023 10:59:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjBPK7K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjBPK7G (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 05:59:06 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31BE37B67
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 02:58:36 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id a10so2163453edu.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 02:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yei8ThvI1DB0prMx1DJC9Vbkm4whBS/JFNUI6to2Eac=;
        b=e8ayJaDeHMVROUGX98n51AQS93WuqGQnG5QqGC+MyiNJghIbI83JLUNzSbowWGprBm
         ts/gdhKxjgzrqv1R7+vD1+htQ/RWTtAlhA+/R5OuJbOzzLs7tb1O6j5KOExS5OWauGJV
         Ow4N6TBbfWNgdoUWypIFCLGp6HapPV+GHDIe7Cu4xI0jPyepav0nRt+Z+xhZsknaE99E
         XmtHnd7Asc8az5prDwB3JPT4uWnzUuSRZLzQnTMEps/3WfoZLoZfdvFR6KNC90YDjs00
         Xu05pVfMF1PQlHHQW1ccq4b587oVksGZVKtiD6lRJxUQtNfmyruqotAlnOt18fYp78Hd
         fAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yei8ThvI1DB0prMx1DJC9Vbkm4whBS/JFNUI6to2Eac=;
        b=fOlk+ovjny9zyDxmcmiRbY95fpdejDzr9CkcyPsPrX+3vs6/xG+X2pVziogvKaQm7w
         M9/JTOD2CcTrT5z2w2ePwfwYJx5rK6PetEqlS/MKX8SZo14tlGAO1HMfcF32itAzyL/B
         +nRnGx4Zh5pDc9mVC8bunWtbkhfz6V6YLDZJmVmylAr0QJk9mlfg9k2Zmvyqbkex3Uhd
         W9okFh44P4wW2kjXiDDCOkC+nv1Ar+rAgB+tMZaBCm7Tiz8XW1/LimMvoHlvXtihN045
         RHjevFgC97nXt0MkPqfHhR/e5jS2w1a1a2HORx7TsQJkiSIPBBFyHK/eoXfDfnoWPaaV
         g4GQ==
X-Gm-Message-State: AO0yUKWbRp9WamwPjdOwxZ0YPUy0/h/7JhiVRHBIMJ9gjlvZpCU/vmDx
        MtLalJsmMpNaab0RMhbsfok+zQ==
X-Google-Smtp-Source: AK7set96+1dYEvKZCx0zyJzU/+txtxZhg+Q8T4oRJyuGdXlhzrtykb8//QojwLmQSgi13Zqq8t6RXQ==
X-Received: by 2002:aa7:c656:0:b0:4aa:a5b3:15e6 with SMTP id z22-20020aa7c656000000b004aaa5b315e6mr5085672edr.0.1676545114365;
        Thu, 16 Feb 2023 02:58:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004acdf09027esm689428edi.4.2023.02.16.02.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:58:34 -0800 (PST)
Message-ID: <c316e930-6ecc-48a9-4ef5-505e2339e506@linaro.org>
Date:   Thu, 16 Feb 2023 11:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/16] PCI: samsung: Change macro names to exynos specific
Content-Language: en-US
To:     Shradha Todi <shradha.t@samsung.com>, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        jingoohan1@gmail.com, Sergey.Semin@baikalelectronics.ru,
        lukas.bulwahn@gmail.com, hongxing.zhu@nxp.com, tglx@linutronix.de,
        m.szyprowski@samsung.com, jh80.chung@samsung.co,
        pankaj.dubey@samsung.com
Cc:     linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214121333.1837-1-shradha.t@samsung.com>
 <CGME20230214121416epcas5p4de066199144cba18858e68f6d0ccb1c0@epcas5p4.samsung.com>
 <20230214121333.1837-4-shradha.t@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230214121333.1837-4-shradha.t@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/02/2023 13:13, Shradha Todi wrote:
> Since the macros being used in samsung file are for exynos
> only, renaming it to be more specific.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> Suggested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  drivers/pci/controller/dwc/pci-samsung.c | 116 +++++++++++------------
>  1 file changed, 58 insertions(+), 58 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

