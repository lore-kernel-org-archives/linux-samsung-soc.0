Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263F8C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Mar 2022 17:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236283AbiCIRCd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 9 Mar 2022 12:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236970AbiCIRBz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 12:01:55 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E633A1768C8
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Mar 2022 08:50:31 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5B8933F499
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Mar 2022 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646844630;
        bh=n3bsDkHLKbob4SpB/QLI8yY+wMazsO7AAgENM4v1TGo=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=J/HiKAU9CaZYOvJLxNrLIIC6LmqGO/kH628kKGOcfmjzXj2Iox2doHLJay+VxVgnc
         MnGrd9XTho9G24bvs4chQ75KhspVqz2tpf5r2DXln5Rptvy7O7XyunrowrwRs7Obem
         JMv8tzoOKP8ABxHWUXYemFjxZhT1TKNllPaZyMpiN625rgGvjnfqlP5W4NpADbIp6L
         80Y8vaSUeG2LfvkUDVf8NvB4z4PneSySoXSXLybBuH+vG2IKLO/c9HDHFvsk6fYUfm
         gTice2akRXr54FdX204DhRFnezfoJ9sjVzHBjss4Oy5bzCVMpzegl7MT4lm1K5sLFy
         lZyZ0u8mPVAgA==
Received: by mail-ej1-f70.google.com with SMTP id hr26-20020a1709073f9a00b006d6d1ee8cf8so1579921ejc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Mar 2022 08:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n3bsDkHLKbob4SpB/QLI8yY+wMazsO7AAgENM4v1TGo=;
        b=mHb2vXvXUmKJo1KQ2jMbTtso6SNVMtYUmRS7GZbEkEG6gOXQG/C9q2lTESYDNtoeqp
         T2G9lLUX2uW3fkxSiDS0yLlo6b1hjLMoSp6ngrLQHqKj1x1zKxBM0tQN8N9blAOC7mBw
         tILdokCH5xpR/nkL5QI8uMoZTa4tJBkOmXw8cxBBfsQlHjxDNw9m7CCDM2xEAF9HuZza
         +uJfmK9OTCzC1WbAWAe5RM9NxB9O2O0gD4WflsKmBVRaH2JXZH3xrkbtYDxkRn/73yOO
         AGOfPp4jBzg7w0zsqnes5YWk83H2brIV2UqggqyIC0oZYGG09OXXSrm7jDLGXwlkgJFY
         BpDg==
X-Gm-Message-State: AOAM533uWmE9Rae0tHwQA9IZMk2nc7NAmp0i19+a6tQ3w1+K4/IkerH3
        H7JdHKphsXKjONc52/2wP6Ibxia4x57iO0IaFBZKMDD1a1dju0MumpEpJe95zD+I2yYsezH77gt
        u2s1/Y2oHrYmkuixWAn9sW5hCqjGsPaCJ3Tkrw8qcL5qprBGn
X-Received: by 2002:a17:907:7205:b0:6db:706e:9453 with SMTP id dr5-20020a170907720500b006db706e9453mr639836ejc.406.1646844629563;
        Wed, 09 Mar 2022 08:50:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCxaTei6vOMnlujVwxaQYI8z9747SILBVem6r7T6w8d5qi1Y8LIsUHSSxKjRH2289mhNKSEw==
X-Received: by 2002:a17:907:7205:b0:6db:706e:9453 with SMTP id dr5-20020a170907720500b006db706e9453mr639816ejc.406.1646844629326;
        Wed, 09 Mar 2022 08:50:29 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id w15-20020a056402268f00b00416474fbb42sm1032819edd.19.2022.03.09.08.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 08:50:28 -0800 (PST)
Message-ID: <3eed8d0c-e009-2daa-ba66-899fe8f48a90@canonical.com>
Date:   Wed, 9 Mar 2022 17:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] phy: samsung: Fix missing of_node_put() in
 exynos_sata_phy_probe
Content-Language: en-US
To:     Miaoqian Lin <linmq006@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Girish K S <ks.giri@samsung.com>,
        Vasanth Ananthan <vasanth.a@samsung.com>,
        Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220309124856.32632-1-linmq006@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220309124856.32632-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/03/2022 13:48, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle() with refcount
> incremented. We should use of_node_put() on it when done.
> 
> Fixes: bcff4cba41bc ("PHY: Exynos: Add Exynos5250 SATA PHY driver")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/phy/samsung/phy-exynos5250-sata.c | 1 +
>  1 file changed, 1 insertion(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
