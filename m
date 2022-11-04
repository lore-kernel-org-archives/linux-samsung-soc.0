Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE81C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Nov 2022 13:46:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbiKDNqr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Nov 2022 09:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbiKDNqq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 09:46:46 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CFA2F03B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Nov 2022 06:46:44 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id k2so3043681qkk.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Nov 2022 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+14ZUWUEMyjcOtsdl5nm/jkKpjvcaDV8XzIujT67FME=;
        b=emY++djerGm0lszovpr9Vd21PpMd2jQrNZj5Bm5+El/7axZfaUPx03EX+joPBi3JOR
         foCSvuo2+ptDMX9jhhVzuudgBAmDweLlg0vEuBWdMmVWmMokkd2JN5gRIGxVQq7ggK8C
         jnV+/Oi7Tbw9v3aKFhHHrKIy87EUItUyHn+kk9JQldlzCggyf+LOyyLcVMgFPq0spEni
         zcFlzW9Uf45dlopko0F8ORhfvlN4NvZr2VQzxfYNFcNjsUwcbhEUJDj7iOYtQroJxAXf
         Rcj2tCwKxRoXPbotImvGB3JqSmPk6J5GZBSb7mFDcC4jTOK9cG4ICKytnRRZiJqY9k/S
         UlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+14ZUWUEMyjcOtsdl5nm/jkKpjvcaDV8XzIujT67FME=;
        b=V2staV4jaV/zEpoNuhYNIlDs/f2h/W9oym7114MfW0h+CDxYakawbNR7b0a3JOo+5n
         rb370z2jojxJeckg3usx4/69ZzBxC3Inoh9twmYUgLEiDHSHUN4CXXubYMVferSWrIXJ
         D1rpsF4jMrIrSzVWTYPyW429Dv05OtEsUqJOMhxRw/wpGKBexi0OenGBN6+OH+J2lkks
         rIFq8IFajnfyhsc8uKF5iOhDb8476NZQEzdKlCk7ZEr+xbekzEKA0pFq+iKQ/CPTnSOJ
         dG7MEJTO5SRQAh/DO058mzwNl46jvVwqIEYXOvv8ql5NGioAdSsVXtqDIuxFtQ/K1VMJ
         deGg==
X-Gm-Message-State: ACrzQf2zILTpy8oObwpvqGU+4Mhwy1mJ954TZWf/cksByfyW8XOaZxKA
        zXdbBbAmg/WoNTvdMUc38n5SEg==
X-Google-Smtp-Source: AMsMyM6DU+/lwsr/Q2kZzSsB9Lk0Dfgkv/qiMhXHBpS9JySuwMnyIwbnfcNc1Qkh1nbNtPUJFCjqtw==
X-Received: by 2002:a05:620a:1337:b0:6fa:2ab0:503e with SMTP id p23-20020a05620a133700b006fa2ab0503emr20386421qkj.348.1667569604039;
        Fri, 04 Nov 2022 06:46:44 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id f22-20020ac84996000000b0039953dcc480sm2463057qtq.88.2022.11.04.06.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:46:43 -0700 (PDT)
Message-ID: <15eb2870-90b2-05dd-5a24-eef9dab6b31f@linaro.org>
Date:   Fri, 4 Nov 2022 09:46:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/6] iommu/exynos: Fix retval on getting clocks in
 probe
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Daniel Mentz <danielmentz@google.com>,
        David Virag <virag.david003@gmail.com>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20221103195154.21495-1-semen.protsenko@linaro.org>
 <20221103195154.21495-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103195154.21495-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/11/2022 15:51, Sam Protsenko wrote:
> checkpatch reports next warning for clock getting code in probe
> function:
> 
>     WARNING: ENOSYS means 'invalid syscall nr' and nothing else
> 
> Replace it with -ENOINT to make checkpatch happy.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

