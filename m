Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E40CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 14:58:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347695AbiCHO7Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 09:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347709AbiCHO7P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 09:59:15 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA4E2FFE2
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 06:58:15 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A3B993F60B
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646751493;
        bh=QoI6gYCzEPHlnRf7hBS/jsKubxk4d8dg14EW9oX2Wl8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=tll8mZ+Fuhkt2A6pzQKfF7oaQb7EpiOT0Feg9ehEmAYWqFW2UaSdpvB5IxbivxeKV
         ownTYUFlWpuDs9yw0WWB0uQpKkTfequbK6wC+HJY7444XEwLWomPmc/v2iT6veKMlV
         PCXAwFBuDXMy1bmfHTLVmBsPHxe8u0ZM/pnC0cuOubgU5KdGfCl/MOQ8rKCbmbTGf1
         cEFenumUq8Yn0LDiQYEdVWeylYlgosIAGdkCu/FTcg4eKXWlFO+GsE0qElkFPKw8RC
         /fi6Rlb2qeg81SIrjgi3aiEANB9ok1llSVAuASN/K20/PQM78IMHweZstu7UBhzm6J
         MEb/pzrjpK35Q==
Received: by mail-ed1-f70.google.com with SMTP id n11-20020a50cc4b000000b00415e939bf9eso8580851edi.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Mar 2022 06:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QoI6gYCzEPHlnRf7hBS/jsKubxk4d8dg14EW9oX2Wl8=;
        b=r8D1T7ZFQbYtvd2KRxG2jYpxQrWqjxWWF9l43LP3xbQhXdHh5g67HQE09FRqiaDoXm
         nPXGTab03w9iKAZa9TcM1KqNGl5c/v610x5vSoB94odb6rCKwzMYy2ysBB6kcstxuCln
         Ir2xZA8nuTbTUF+JnS56CRDtRUWz6eBPIn4xEFV487+Q8RnupjVwDeWVMWgtB78i848s
         4tcPlnlB3XtesmtHdR/py/Hhducz15k/Jsu+RK+NMmj9k5akQ+lxdHqk5G23G5XNO2of
         8mVJmLLxyyT1bJC8Dv+RJnbPSYQqGGzOjHpHPwTwGuWCFlr7mYiy+mfx5EsE0QmBkdSX
         oz4w==
X-Gm-Message-State: AOAM532NA2jrIrwujOxWDXtx5uBa59Qq/LcezKGST2ytHfkZGgjeEqzO
        fwrwLdyUCFiCvCMquOEVOY94RM6fygiAOPCoIh3YfpoDTW+rk4w6lFr3xkoWMVFRisd90YYra1G
        BxA39KhI+yXf09PAxKfrLQGMv4gCe0F4rv/sVNnp4xMxqhgyY
X-Received: by 2002:a17:907:948b:b0:6d8:27f8:ab4a with SMTP id dm11-20020a170907948b00b006d827f8ab4amr13433139ejc.39.1646751492683;
        Tue, 08 Mar 2022 06:58:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7Fp2BFbe7EDlVkIH1yW95b4oxQsuzzjT0aFMP1UH/bjihagtZF0U3gD7nJpwi4v+0bIlKbA==
X-Received: by 2002:a17:907:948b:b0:6d8:27f8:ab4a with SMTP id dm11-20020a170907948b00b006d827f8ab4amr13433122ejc.39.1646751492471;
        Tue, 08 Mar 2022 06:58:12 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id gz20-20020a170907a05400b006d91b214235sm5977187ejc.185.2022.03.08.06.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 06:58:11 -0800 (PST)
Message-ID: <26658f45-ba1f-a633-ccd6-6f1d2f337341@canonical.com>
Date:   Tue, 8 Mar 2022 15:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/4] clocksource/drivers/exynos_mct: Enable building on
 ARTPEC
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        tglx@linutronix.de, daniel.lezcano@linaro.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        alim.akhtar@samsung.com, robh+dt@kernel.org
References: <20220308142410.3193729-1-vincent.whitchurch@axis.com>
 <20220308142410.3193729-5-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220308142410.3193729-5-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/03/2022 15:24, Vincent Whitchurch wrote:
> This timer block is used on ARTPEC-8.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
