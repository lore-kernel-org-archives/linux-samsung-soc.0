Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC69C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 11:38:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E79B611B0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 11:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhJTLkZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Oct 2021 07:40:25 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35596
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230145AbhJTLkZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 07:40:25 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 45CCE3FE01
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2021 11:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634729889;
        bh=1bxWxV6xahA2c9N9IIfRQwFpQ4gEUEegrCc5ZiAPUwg=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NVWl9BTpCHq2QHQ20Dv01XymvPqXZ/cVcb6/41FC8s8eaz0tyyTB+sOs8jvGouc3i
         4n7042tQr9ogd3hJTGn91bFyrUdSS6xRxdRNAhzC6dgXPuJZjxaejA0SudxUVWmr47
         IrJVIc+LevmV4B5UgX8RuhDZ5eLDbMN9jUt7NadinjkPxZnwvd/h8/PajoZ/zJmHrR
         jNulg0Q7CwehqkFp/RjwBthIhc2Buzjy9s1PBbNa7/bBpAMvPMYQdgPNVxAw5pjUkd
         a8vdDt9i3Is+0Yy8LVk0OUcPZ81+ZCcRrNCsCXkKICIMDWaOYVEg5Pc9o1W0rbqIAV
         u+D2RLf4hrZSg==
Received: by mail-lj1-f200.google.com with SMTP id w15-20020a05651c102f00b00210e84abb08so1732429ljm.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2021 04:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1bxWxV6xahA2c9N9IIfRQwFpQ4gEUEegrCc5ZiAPUwg=;
        b=rfTcsbqvWNcQUCJbMu0YXiBmVeYR6NFKpi0NxZfVy13SrxNEROwbmGJL3xq1Pdv4sT
         iRDDdb1FTolggEy7KEBc1HL3ZFPM0NXM/5K2RzL51qsSCehFEv7aAytQzds6Fz6gJQ/h
         Aj22Jtu3XZiffLW/31Qo09Cp2izWQgGrsYRlM0C92NHZXLQ3TkfTKXEvsyLxAhpCjcqR
         YYfIETqzwqW8v5fYUCXr2XQl/dZ7exLlyQVvla7MN1kP6ba3nA+MzQ6djcm/DQgWzglQ
         TPoZsm32jia3z+/ljL651y3+qTQMMpG1nOCP+33kqYwluFWsqxjvY57EgEJWgGEDBzSz
         tzJA==
X-Gm-Message-State: AOAM531LuTQgVmyWxp3tF4AUnf+k3cIs0yiXtBofnMdquq7458uH1GFS
        uJBeWbQTToAy65qIXX106fn2j6ef0yp9rRFhv2O6xSAjKWbvoZjssVczytcjGRbk5FW3CvygqsY
        HCm3AHsIKawFyxSfnI0kg/qsLq1DPzBB4Ly4//3AKnpfiR1LH
X-Received: by 2002:a05:6512:2117:: with SMTP id q23mr11447295lfr.657.1634729888646;
        Wed, 20 Oct 2021 04:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN5uO9eigZSlgvdW58qAxX9R47x6QiEM9Oi0qiFSPAgUh8dkl1qA3pzN/lXMiIs5LhqKNZHw==
X-Received: by 2002:a05:6512:2117:: with SMTP id q23mr11447272lfr.657.1634729888424;
        Wed, 20 Oct 2021 04:38:08 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p8sm194267ljo.41.2021.10.20.04.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 04:38:07 -0700 (PDT)
Subject: Re: [PATCH v2] crypto: s5p-sss - Add error handling in
 s5p_aes_probe()
To:     Tang Bin <tangbin@cmss.chinamobile.com>, vz@mleia.com,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc:     linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20211020110624.47696-1-tangbin@cmss.chinamobile.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ff261b7b-47a2-0cd8-8dcd-91f18998a482@canonical.com>
Date:   Wed, 20 Oct 2021 13:38:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020110624.47696-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/10/2021 13:06, Tang Bin wrote:
> The function s5p_aes_probe() does not perform sufficient error
> checking after executing platform_get_resource(), thus fix it.
> 
> Fixes: c2afad6c6105 ("crypto: s5p-sss - Add HASH support for Exynos")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> Changes from v1
>  - add fixed title
> ---
>  drivers/crypto/s5p-sss.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

You still missed the cc-stable tag. I pasted it last time.
Cc: <stable@vger.kernel.org>

Best regards,
Krzysztof
