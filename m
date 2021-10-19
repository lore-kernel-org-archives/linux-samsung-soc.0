Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD58AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C60C761212
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbhJSI0m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:26:42 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:49986
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234561AbhJSI0l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 04:26:41 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E13014074F
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634631868;
        bh=a51E5LbbeoBiM09ZZvVA6mvFSU1Efb43bjrujhxw6Ho=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=aFODDKnfHYTHCJ5yYsxJceYD2CRQstGW7ngg1KvchBrnYt55iWtOXAKHBwT98Np+c
         jrh+NPlrWo5ZP/OmsF4IMoudML30RuVSHp2S8kA+1IZpuWOBeBdixucmbFHqdYzOQX
         pJXXcYEGXLbg0TVgakNw6VyWae/6tWjpHfEDwwVAL4G+tN5iP+IPk4pqGvnKQGS6N4
         pOfjo4S8Z1o4Y+GGBAhya4jXSrTP4qPsL3GHyBCvIG6ZcO5fIdVhQ9YT4s4u6SdHVu
         sn3bRbMx6U9wIShoVaw+Og51iQ36KxCGmC5lN1dpGPRGn0XB9mXS7p0u9fA06S05X1
         yatjvm4gG20BQ==
Received: by mail-lf1-f71.google.com with SMTP id g10-20020a05651222ca00b003fda3f05c17so1126067lfu.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 01:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a51E5LbbeoBiM09ZZvVA6mvFSU1Efb43bjrujhxw6Ho=;
        b=ZtNy1EX5dzBrgnm2kXZm49FeKPZahe30YdeTNay6prRnag+aaikdeX1+BiuTB6OVot
         kIhTxAF8naeihDCo3APBOdvgHhw6dw9woi/vzrvRbrLACg1HVpRfwG4av5DO+THrMoSt
         NIIRiWWJ96z5UUzQDjVEFSUceEWScTL6lMQ0yz70HGU+fhbiIkcIxrswV3JBBZjlaMPK
         EOOPJPDycZnPS0QpKn4Am1tKl7BGn+wIGACGwuk+t/0C8b2g59aHBHrgzaGw7ILo/edu
         mYMheg5KF29w0wurZygC6KsU2FzG1maO/IBitJ0eepv7sjtM6oPkGaYmkdj51B6Fv1qd
         zwZQ==
X-Gm-Message-State: AOAM531GJReRV1AMriBC8W5JgYa+kBTH1uXelf/SGoqs2vF7hwJ0YBDZ
        WWO1e0f2j2jickf+Splf3YNKSa8PJMWxvsqFSENeBCEEolRSeaLZnOtHaRGdunagE5NaoIa1bXg
        7v/qgFu2Ajj/kpvH4znABR+5z6ir6tDIshB7rC+5XxU/5/cUW
X-Received: by 2002:a2e:86ce:: with SMTP id n14mr5463864ljj.325.1634631866405;
        Tue, 19 Oct 2021 01:24:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkLe6UN97XVnzFaFavdfVYyHa8Kvv+CJr9EKy/myTmY7y7LNLGdsYtwU56i+0jQwR7VPlYTw==
X-Received: by 2002:a2e:86ce:: with SMTP id n14mr5463842ljj.325.1634631866193;
        Tue, 19 Oct 2021 01:24:26 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y7sm1348443lfa.126.2021.10.19.01.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 01:24:25 -0700 (PDT)
Subject: Re: [PATCH v3 21/23] regulator: dt-bindings: update
 samsung,s2mpa01.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <9acc235dc4af794d18e1267371944a3955e1fb21.1634630486.git.mchehab+huawei@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <390833d2-25a5-72ae-4d05-c145d6f8507a@canonical.com>
Date:   Tue, 19 Oct 2021 10:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9acc235dc4af794d18e1267371944a3955e1fb21.1634630486.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/10/2021 10:04, Mauro Carvalho Chehab wrote:
> The file name: Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
> should be, instead: Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: a52afb0f54fa ("regulator: dt-bindings: samsung,s2mpa01: convert to dtschema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/
> 
>  .../devicetree/bindings/regulator/samsung,s2mpa01.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
> index 0627dec513da..0a564319f4b2 100644
> --- a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
> @@ -15,7 +15,7 @@ description: |
>  
>    The S2MPA01 provides buck and LDO regulators.
>  
> -  See also Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml for
> +  See also Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml for
>    additional information and example.
>  

Hi Mauro,

Thanks for the patch but it is incorrect. Old path is proper, just the
patch waits on merging.

For this one: NAK.

Best regards,
Krzysztof
