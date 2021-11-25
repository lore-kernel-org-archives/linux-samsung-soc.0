Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9084C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 25 Nov 2021 15:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbhKYPbh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 25 Nov 2021 10:31:37 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52036
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237206AbhKYP3d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Nov 2021 10:29:33 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F2BDC40742
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Nov 2021 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637853979;
        bh=amcl3GANIPe7PKb9EAnOXSQfzXD0HZLDodu/ulsFM2Y=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=r/jq9lxyTbNHbODkAYW7JeB/gtUJ2NCV8f2N/HuIhYuKHgXUt6RfCR7JZdhXSewJX
         GoOgPC1BRf3lwFgcR8SB0307h8+JTN3hSMFXvQmVQ5s4C+rJOvdzuYzUoEC1dYC738
         2+j1br7GIZfbv3607bk50FbYmgjIITEBz7Dn7JRIppzjsTtd2wtev3F7/weN8UEl1Y
         jMHsurGjfHw+FF4oDikJXeAJYMfVEKQI9ZDgJ6kBUb01Z4B/VEPGaz/dHM+q1Nt23P
         fV1vCPN0tYiOabUK8tic/RJZ0U4EVSRoVPxeu71cp51uk6rqIjR8B7gL9Dd4sDCrZ5
         d3+yriWyZt8hA==
Received: by mail-lf1-f71.google.com with SMTP id u20-20020a056512129400b0040373ffc60bso3343359lfs.15
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Nov 2021 07:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=amcl3GANIPe7PKb9EAnOXSQfzXD0HZLDodu/ulsFM2Y=;
        b=QNw6VsrvdaZkQl0BIgj2o9lZ8S7NPy3JVsm0bxE9y1YkcQbZpoBgNnbVjTWUwxg7ex
         YQyNDlvaof4iEcjY5o4Tgd0qQsBPrdlTi7WU5PrhQdUqol2p/i6md9Q9WmXKcWnBQ2D1
         eNrlTcU0ROVRNIY4p6AXzVyY16UDVsWmp4lw8HJG9C4Gvod9cL7UK6xvMpDTfrWtrt7v
         xQT/PQp3R0SuUkr3ap/fskmljVDo0QHRIcfyKRkbrPPEvzitbhGLqmD0Wl3+MiFg0r6M
         BU41QlvG4eDh2nbmrMtx2pf/7OijVCZI09A5jHUVytwSlaMOaBVFIcIcTgQJA3KjGWhn
         WSLQ==
X-Gm-Message-State: AOAM530MSrcRFbdSICzmJb6XfGvD8NU63JJBRE7xkuC7rrPVwKeKIIMm
        jgeETLIG1x/1qkTifJJuyTGKKydZaAE/i8HNYOm062IbFvLMFRdWVun9G/cQRa8BJz7oayC921/
        QU1mVXfpTY1RqpaCbqe/rkTB//I28vdPhEbBtXt0IpS7dwU6i
X-Received: by 2002:a05:6512:2292:: with SMTP id f18mr23946198lfu.18.1637853979366;
        Thu, 25 Nov 2021 07:26:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn1+RB7r3XOlGNO+ahbHGIswkd1Eeqf82NkcTdL785D/0mOk8ak+h7JW+P5FnFls+yKf4Cpg==
X-Received: by 2002:a05:6512:2292:: with SMTP id f18mr23946175lfu.18.1637853979173;
        Thu, 25 Nov 2021 07:26:19 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w16sm285015lfa.271.2021.11.25.07.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 07:26:17 -0800 (PST)
Message-ID: <3fec093a-df46-6096-3f66-891734a5f140@canonical.com>
Date:   Thu, 25 Nov 2021 16:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] dt-bindings: iio: adc: exynos-adc: Fix node name in
 example
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211125152154.162780-1-geert@linux-m68k.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125152154.162780-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/11/2021 16:21, Geert Uytterhoeven wrote:
> "make dt_binding_check":
> 
>     Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.example.dt.yaml: ncp15wb473: $nodename:0: 'ncp15wb473' does not match '^thermistor(.*)?$'
> 	    From schema: Documentation/devicetree/bindings/hwmon/ntc-thermistor.yaml
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
