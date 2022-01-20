Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E607C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jan 2022 07:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238399AbiATHjC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jan 2022 02:39:02 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:34484
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237923AbiATHjB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jan 2022 02:39:01 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B053240049
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jan 2022 07:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642664338;
        bh=0gpNGAIZUvaAFCEEngb7bqQ3pJf9wcbsyhNpAPF2548=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=XDgIUFlRZI/o9sDflzEk4Xrp6v/rMJxIRceDNP2yS/qTXe62maCGQOHc7uayKmt3P
         L9dOI2IBG7xLCxWxRenLYxQn7LpK5DOUYuHsb6+SdYMHY69xw4Sx9qLU9T7thoEvnO
         4z9MLT4F/3DHbQZmRHcwmh42RNOPyMyC3rBGwo14Mjeh5qRsThrk2RtnPYc1BFo6HX
         rYY0Ept8mXzHUzR+549UzWA38XBH/9EUatLrbKKwCcNJIYOxERncX7hpIgzh2EVS4X
         lIwsxO2HgsrFiCn4huZ3S3rxVsaNKzfGYxW0wd70va+VHAZJt1yw3vEswb8EkaeNZp
         TfQ5xumYxlgbw==
Received: by mail-ed1-f72.google.com with SMTP id t11-20020aa7d70b000000b004017521782dso5034854edq.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 23:38:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0gpNGAIZUvaAFCEEngb7bqQ3pJf9wcbsyhNpAPF2548=;
        b=Exyk6M6noHO1G5BFh0BoGiPqH3VVEZfCNtTJDJBn4o3F/7tEofLAiDr+NMX/LNzCYa
         8XHbKtFq//ONZTBQ4FPyTwJkeYh5VvNha1n5UIuM9yLfJDHETy86X05p/Rsj+WQrP92L
         HQGiWD7ym7xVENNpcdRqF/zB5r8T1J7agZAw5XfSRaYv3+huFwwagh5BVJfojLDrnVoz
         h/CZo7AS6/bFOgor19viK7Xo2rHg3X7tl7HsVrPRM3rincBnOSQk7JC5Ob6V+6ha2Se4
         FA+U5QBpN6Q8EGRNSfcW4Ww/CsLFHSNuBNZquLL6szfp4Smx2O0x5u3/p5/19BqH5Ypm
         rnCA==
X-Gm-Message-State: AOAM533v56X9t+pp7CeyUbgTbs1dQACSfmV0Z6WhkAQpt6pDN5FWX3J8
        OLX4t1hTNKRACnvHFPb/rUhWTkbh9rHsK1jMFKyz90S7xGF5JlGduFNwiVCjfJmSjh7ur+eh2lk
        Fh/Nw2aw5ac6lTDIc0Z0UOBwbFyHMASGlBL7HswteNu3GsUKL
X-Received: by 2002:a17:907:7254:: with SMTP id ds20mr15521198ejc.465.1642664338267;
        Wed, 19 Jan 2022 23:38:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKs2IK5wcPycxUw3JnhBFe57akhy4R0/FDvMPVQp5/0cA2GrReDFnA7GWJ6xzUOYSwTIiIdg==
X-Received: by 2002:a17:907:7254:: with SMTP id ds20mr15521189ejc.465.1642664338042;
        Wed, 19 Jan 2022 23:38:58 -0800 (PST)
Received: from [192.168.0.45] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c1sm628611ejs.29.2022.01.19.23.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 23:38:57 -0800 (PST)
Message-ID: <5d16420a-4852-ab29-59d0-b100feeb2862@canonical.com>
Date:   Thu, 20 Jan 2022 08:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 5/5] spi: s3c64xx: allow controller-data to be optional
Content-Language: en-US
To:     Andi Shyti <andi@etezian.org>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Balletbo i Serra <enric.balletbo@collabora.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh@kernel.org>
References: <20220119201005.13145-1-krzysztof.kozlowski@canonical.com>
 <20220119201005.13145-6-krzysztof.kozlowski@canonical.com>
 <Yeh6x6U3tA7y5gvF@jack.zhora.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <Yeh6x6U3tA7y5gvF@jack.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/01/2022 21:55, Andi Shyti wrote:
> Hi Krzysztof,
> 
> On Wed, Jan 19, 2022 at 09:10:05PM +0100, Krzysztof Kozlowski wrote:
>> The Samsung SoC SPI driver requires to provide controller-data node
>> for each of SPI peripheral device nodes.  Make this controller-data node
>> optional, so DTS could be simpler.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
>>  drivers/spi/spi-s3c64xx.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
>> index 8755cd85e83c..769d958a2f86 100644
>> --- a/drivers/spi/spi-s3c64xx.c
>> +++ b/drivers/spi/spi-s3c64xx.c
>> @@ -796,16 +796,14 @@ static struct s3c64xx_spi_csinfo *s3c64xx_get_slave_ctrldata(
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>  
>> -	data_np = of_get_child_by_name(slave_np, "controller-data");
>> -	if (!data_np) {
>> -		dev_err(&spi->dev, "child node 'controller-data' not found\n");
>> -		return ERR_PTR(-EINVAL);
>> -	}
>> -
>>  	cs = kzalloc(sizeof(*cs), GFP_KERNEL);
>> -	if (!cs) {
>> -		of_node_put(data_np);
>> +	if (!cs)
>>  		return ERR_PTR(-ENOMEM);
>> +
>> +	data_np = of_get_child_by_name(slave_np, "controller-data");
>> +	if (!data_np) {
>> +		dev_info(&spi->dev, "child node 'controller-data' not found, using defaults\n");
> 
> "not found" sounds like an error; I would just write something
> like "feedback delay set to '0' dfault", you also tell that the
> default value is '0'.

Sure, I will rewrite the message.


Best regards,
Krzysztof
