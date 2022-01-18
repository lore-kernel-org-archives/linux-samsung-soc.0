Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24E1C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:34:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348063AbiARSeL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:34:11 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36430
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231373AbiARSeK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:34:10 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 587AB3F1DD
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 18:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642530849;
        bh=ys9fbFG6FrwU8wrOLNvr69yPd+OIURRywK4KztzYv+A=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=qX1PcpYi790PFv7e3DRfFvR1A2N0tIYtJ1YbcSUfHX32Gu8h8dUEGZibl8nbXPAaY
         ry/e0kKuHbYoftcfW/CP/FS6uVj34ia7KZHUhV/eOo8+Q0ud5y+XrPwAiAIs99lzBb
         7ycrApKtEh6SfNal0DXdPu9OK4wAwSAJwJPoF2ZlV/p8FDxMromx9+lMMKKlfctdPF
         W10xQCjoqcZO0rhW4tR2gTVl7+GgAG2wMCJ5fGa/0+BIa5nhMmLRUBfeZFWTe0PC2c
         2CbyEVbLtd0Q12yjbkFcppe5ce6Jtwi4Xd5yJ3J/w1TlCqspMDqh5mCjVFcvYpDYRD
         t22rnot7szsaw==
Received: by mail-ed1-f72.google.com with SMTP id o10-20020a056402438a00b00403212b6b1aso4729640edc.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ys9fbFG6FrwU8wrOLNvr69yPd+OIURRywK4KztzYv+A=;
        b=EhelceOEwV98eEByudO/Kq7+CindP6vz30mV/GnOQ9AKnkvUO0xdtAELY60CFynpkr
         CdjeZT2EnkV+RPl80fKqY1QnlQiAH9Qm5k6G1L7Tfzssiz0+mqhrvFWnNPjq82qxo4H8
         wmJu3F9ojD7jxwNwiRs7BeavGB+egQ+1Ogl9f5odPz0dPomaQraWcdKNeXcrrduWt7A/
         fC6lERPnGypfiW1wkycqx4zdIm7O0rTNHR6POjRyZIl13UJqzTpYZpLk3RRLkrrOQTzd
         fOB9beCFprdy26epfw/5YEn7TZpQWAJJxvOqZjd7uw5adaEbKpez0Kd1aPg2CL66TOwI
         JezA==
X-Gm-Message-State: AOAM531vjSoGkl0mV286p/7N2XcNk88hnr/IqDi17yDNY4wvhaHLIi0q
        qsDg/FuKEaJEVPYQWEk9wYtVUmB9moh880Udrk8ZSQkXfB5Kd4dud/Wn+jtqMBoN1W03YGGlSlU
        9yw8dnr6/0oI2jTOp/FfQjhBg39vgoh23F6PB5MSFXf/MkH2T
X-Received: by 2002:a17:906:f02:: with SMTP id z2mr22210688eji.499.1642530849085;
        Tue, 18 Jan 2022 10:34:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeXYDGBJEK7l/U57vJp7HToUWrta7Pd/0gP+bMho/GHw6BP3wds5zuz/OgfUqhy0vc56VI6Q==
X-Received: by 2002:a17:906:f02:: with SMTP id z2mr22210677eji.499.1642530848938;
        Tue, 18 Jan 2022 10:34:08 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 7sm5544523ejh.161.2022.01.18.10.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:34:08 -0800 (PST)
Message-ID: <d61c2cef-4f59-53ba-7135-b9acc2defeee@canonical.com>
Date:   Tue, 18 Jan 2022 19:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 05/16] clk: samsung: fsd: Add cmu_peric block clock
 information
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Aswani Reddy <aswani.reddy@samsung.com>,
        Niyas Ahmed S T <niyas.ahmed@samsung.com>,
        Chandrasekar R <rcsekar@samsung.com>,
        Jayati Sahu <jayati.sahu@samsung.com>,
        Sriranjani P <sriranjani.p@samsung.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150033epcas5p15b88d4f0c695fc515f20d8dffe15202e@epcas5p1.samsung.com>
 <20220118144851.69537-6-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-6-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add CMU_PERIC block clock information needed for various IPs
> functions found in this block.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Niyas Ahmed S T <niyas.ahmed@samsung.com>
> Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 405 ++++++++++++++++++++++++++++++++++
>  1 file changed, 405 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
