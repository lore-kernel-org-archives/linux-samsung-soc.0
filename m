Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490A4C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:58:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbiCGI7X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiCGI7V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:59:21 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850551EC6D
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:58:27 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9EEA23F5F7
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646643505;
        bh=tXVanxy7+7Oc5O3WLbsohtPsqU2ukLOIpjIWEofC+MQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=bTxL4AF429f2wP4gWcvAgYtYQtrZPeR2edQBQSzrWBHyrBI4JTiqAR28Y53Ea+ZGi
         92rP5oOdK/GJmSVovU9tM3Grg4xduU+DyvvK7+ukC6bkNQgqe06g/gkVDf8Nu8nrjR
         nYztV8fYOg9TKVHVx6v3J4EvPxhS180ABnKHpgbkjcWipy+W+TRTbunfHyok8ZcQcj
         S29iOe8IdrLUkDURi78ixPq45nDMFXNtgjpW53DidhXqUQIcuUrvIzExKXeRraLS2h
         CP4iJU3r6xxQk2XeQm3E+M7nFmrIJ+XwsmLwtx7GUPTOEHKMTl04xDA0f/yqde1Qvs
         mCao3vG46KCug==
Received: by mail-ed1-f69.google.com with SMTP id bd4-20020a056402206400b004162b6d8618so2466927edb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tXVanxy7+7Oc5O3WLbsohtPsqU2ukLOIpjIWEofC+MQ=;
        b=j6+PAYQ5v2RxNXvNmZyaFGSAAmPuaZW4k+So+f82+V3U0TavJfeV7Er1tRLh2W7A3M
         Jl4+8UzndRRdRk928FfqVK9zP2D8JlKbHKREx2ZPj/TQqBwibRDDQPwaaPfSNkNubPet
         /uQkv4nGW7CgPKNgQ6yFDSZlRJNcE+zqZdtc3eMi9nm48DuyFyEIQDDqD/FiTLB+extB
         cCcs1xnNfT272Ako3BCukpTZDEeNQ5l9sqzObStJTuBagWvV9JODSF+C8C5G20BSJphP
         9dVQfoKkH7ytaXgWBspdvRnZXBZywWAOuEAUhCuqIHXUKCLNCinc+w/pxRUcGzQ5m7FR
         8MWg==
X-Gm-Message-State: AOAM533s7OPcxQhkP48H1OctYziMDiArbNJv3yRXwDy3vYVaQ/S2HiEn
        FXZX0zZkEWxnbWqQdOw/zqlbvd1+zsSH6tjSHVKmNHG4N6P2QF/f+dDGvjOuOW2V/ZH3GmKyLL6
        CFC+hHrOs8QjoDrTBAzH+X2/arjW3kEaWt9a1qIi518fcik+m
X-Received: by 2002:a05:6402:27cb:b0:412:124:e0db with SMTP id c11-20020a05640227cb00b004120124e0dbmr10188614ede.72.1646643505350;
        Mon, 07 Mar 2022 00:58:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3ZMJrDKrVAyAS7Dzh3dQbNGgwVfhPijtSj0p1tH4keGdzqgbfHCWsGgoYJFegl75f4/Ns8g==
X-Received: by 2002:a05:6402:27cb:b0:412:124:e0db with SMTP id c11-20020a05640227cb00b004120124e0dbmr10188597ede.72.1646643505198;
        Mon, 07 Mar 2022 00:58:25 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id fs6-20020a170907600600b006da8ec6e4a6sm4485847ejc.26.2022.03.07.00.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 00:58:24 -0800 (PST)
Message-ID: <3b4b5fd3-6642-baf4-2c21-930b70ab0d63@canonical.com>
Date:   Mon, 7 Mar 2022 09:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: serial: samsung: Add ARTPEC-8 UART
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        alim.akhtar@samsung.com
References: <20220307085053.1636475-1-vincent.whitchurch@axis.com>
 <20220307085053.1636475-2-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307085053.1636475-2-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 09:50, Vincent Whitchurch wrote:
> Add a compatible for the UART on the ARTPEC-8 SoC.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index 6aceba4a5f79..6f11f2c92f64 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -20,6 +20,7 @@ properties:
>      items:
>        - enum:
>            - apple,s5l-uart
> +          - axis,artpec8-uart
>            - samsung,s3c2410-uart
>            - samsung,s3c2412-uart
>            - samsung,s3c2440-uart

You need to define clocks - see the allOf part.

Best regards,
Krzysztof
