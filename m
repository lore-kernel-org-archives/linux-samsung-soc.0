Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B17C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:24:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67A0661372
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbhJSI0v (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:26:51 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35678
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230082AbhJSI0u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 04:26:50 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 692B93FFEE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634631877;
        bh=Swi6Ddj8Xbp80QnpAWQNLdENzfNBX7zxXSg0uNaLjZ4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=cCepZ2ALvBtLCAT3rf4ecpyPBaK0qnqF8X8A4aKwj3hC5XX2bgfMLNt1+LR/D7PzT
         ZsFAOeneKYSpuZKXuXIDU965fjBhfxTWLM4aZFzPswBIuCqIF1FKfaQ8trNLRa7kfH
         I2N4RpUVU/WLojDR2GffzcHnrz1Bd+581/iEYCu2OA5tuxwYIwHe/YljHCFZUyLC9J
         JY0b4tOVoiBIDRkZ5q2r/Ff87cL/h6LdpLch2f8/nJ5J+dfriAI0a4YjpC/rL+tpwA
         wyXB5w3GS0/JQh5EEQcbyliI+1U2s2zmyjQUJhThAbcWL3vernjSgsUbDPahACYPgy
         9poyU8hLddm5A==
Received: by mail-lj1-f199.google.com with SMTP id 136-20020a2e098e000000b002110b902242so587351ljj.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 01:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Swi6Ddj8Xbp80QnpAWQNLdENzfNBX7zxXSg0uNaLjZ4=;
        b=dKHuApxYAfn0hP3RdsDNkcG5HvgEkG7QhInCVoPFy7laPopxYL3rDFHtkSuwkCRcMD
         1aSrYbjiKRJI2rblEzoRpIhUTWuNF36sXRJRWc0Z4zuCHL+30fAT7M93QirhTDedyTbu
         cgB1osPvbimwHOfhCzWw4JdX7FXm2iECzON9zNj+Tg2ctVq9mV6ANAUuJ7lwizF6Be3w
         msLuFRdCzE2OWma2c6RS/+GJVf4Rcx4RRlXOhX3YVVojfJh8Vnl5Vz4sTV+JJUKoajO0
         j1Jfqal7xKBssFNTW7v6Rcn4mIPz6LRcJvvCuVZzxdxmupnxcBPacQJt0y+LfhO4eO1Z
         72oQ==
X-Gm-Message-State: AOAM532E3wbKc7DeFbIZ+aNaeLV1GWDxoju9j20NvgAIr3DQ+712mesm
        +MXa8nUA7G39O6qAjKs0lFWhmm7uLPCCQODyBzMUcfKx8PBMCTjRU6Bnj/qgeneO/PYB+pzTz8k
        1b2VJ1Vzfy/RnI+7MUBZoB4M73VdoRfBiLr0rYPqv17gpe341
X-Received: by 2002:a2e:9c92:: with SMTP id x18mr5094995lji.445.1634631876046;
        Tue, 19 Oct 2021 01:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/kAZBOxkypgv+WhYfxmIUQ9Io7rvWQf5Awb9V5Is54av5KHbiCRs1Zw9l65qYqDA79/DqWA==
X-Received: by 2002:a2e:9c92:: with SMTP id x18mr5094971lji.445.1634631875874;
        Tue, 19 Oct 2021 01:24:35 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b43sm822485ljr.17.2021.10.19.01.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:24:35 -0700 (PDT)
Subject: Re: [PATCH v3 22/23] regulator: dt-bindings: update
 samsung,s5m8767.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <63f3ac8bc958d65e4f31ad4a0060c21a7038cbde.1634630486.git.mchehab+huawei@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ac1445ce-8b60-c772-4c61-7cdfb8fe6ec6@canonical.com>
Date:   Tue, 19 Oct 2021 10:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <63f3ac8bc958d65e4f31ad4a0060c21a7038cbde.1634630486.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/10/2021 10:04, Mauro Carvalho Chehab wrote:
> The file name: Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> should be, instead: Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: fab58debc137 ("regulator: dt-bindings: samsung,s5m8767: convert to dtschema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/
> 
>  .../devicetree/bindings/regulator/samsung,s5m8767.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> index 80a63d47790a..4281f670c775 100644
> --- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> @@ -15,7 +15,7 @@ description: |
>  
>    The S5M8767 provides buck and LDO regulators.
>  
> -  See also Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml for
> +  See also Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml for
>    additional information and example.
>  
>  patternProperties:
> 


Hi Mauro,

Thanks for the patch but it is incorrect. Old path is proper, just the
patch waits on merging.

For this one: NAK.

Best regards,
Krzysztof
