Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6E6C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 08:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343708AbiCHIIK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:08:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344793AbiCHIHz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 03:07:55 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF17C3EAA8
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 00:06:59 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 08BEE3F5F2
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646726818;
        bh=J/J3P1Rwx3zVYwDz0ov2BEZ66L38jQkTdS1TVg1pvPk=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:References:
         In-Reply-To:Content-Type;
        b=Zbw6e3ZSkd1Tya/8U6oQkawzHENhy2JijLLz/8wWG8XpdoCWvf4rOQmgZqJwUfGnc
         oak77kJMbcF+jybfUcw3GIJqOL7GvPrWGkDdPFKv9rFUxcGk1HFDdQQ/ivcgQE9KTG
         n+Z1kYnmKtwQO2kTSFLA+9VgzqvcQI0u4KpwDPpfWAsvIxK21f3DxbKjjgIHO+uSoo
         cTGxvT8TFisX2ZACPGLfYM0lVW5Rb87Ux94s9AdSbK+3SjTb/vui/6jyAtNmCDLECM
         a9Hx9k8fyDy9GewZXcPCjbDCOuf+o9e3Wo/Pq8662vZmIE/pqsOBCfPnZUfLvON8H5
         hWMCEzISU+udA==
Received: by mail-ej1-f69.google.com with SMTP id d7-20020a1709061f4700b006bbf73a7becso8238596ejk.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Mar 2022 00:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=J/J3P1Rwx3zVYwDz0ov2BEZ66L38jQkTdS1TVg1pvPk=;
        b=amPg/Z8APA3jo0lii6ex5BUJ8BPoL80QH0OvKEsNwsNJZJFO6B2TGb1YVCRH5A5809
         UnIC8fM/ecwAv+5CM/kRm01ND9DUag37bU8xaVRfuxAie8Kx3CllmoXSVZb0NaqJUQb5
         vnudllwfI4OSRiJnFoFxJtbV1fV5l+dO5NTRrLc0uMVYAi3nRSN4LBtWBDJNhSWFzypl
         /F0kuicI6cPMTELcXCFAdpECR7nCF6G+IzaplRcIMicqG4D7nPWtzavQsRteTi27W/IX
         0/FQIKEqRnYbVec+ATAZxxQf1PsMkWj8LKmAEx0Dzq/OeljTJc8ZFvgVigrRXhpoGuIQ
         dbAw==
X-Gm-Message-State: AOAM530KAt2sCSeXTWfgpoz3rZs/bRaBclEcuQL5uRnEVHEIBVE7gu3X
        Z4e78tNEzbUgNzlUyV2urVJGNx+mnCrMGnp/WgeGAybpbrwEAawYeOpfKWIFa4U4U1vbJVHGzOg
        1b2M7xl9JI6wtxp3Bqic2toD+AyJVrK4BPYd04LjYoeUBGWPj
X-Received: by 2002:a17:907:1611:b0:6da:81d0:89d3 with SMTP id hb17-20020a170907161100b006da81d089d3mr12231600ejc.306.1646726817564;
        Tue, 08 Mar 2022 00:06:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJVJ4uGvVXNIf5NiHNb7QI8hmdvsItXsGAUU9dQZV9iYIVWIdyluw+ECgstG2XC7Tc1HjDNQ==
X-Received: by 2002:a17:907:1611:b0:6da:81d0:89d3 with SMTP id hb17-20020a170907161100b006da81d089d3mr12231586ejc.306.1646726817311;
        Tue, 08 Mar 2022 00:06:57 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id l5-20020a170906644500b006ce6b73ffd2sm5559069ejn.84.2022.03.08.00.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 00:06:56 -0800 (PST)
Message-ID: <25caed0d-ec42-54f5-5b62-8159979dadb9@canonical.com>
Date:   Tue, 8 Mar 2022 09:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/7] tty: serial: samsung: constify
 s3c24xx_serial_drv_data
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
 <20220307080925.54131-2-krzysztof.kozlowski@canonical.com>
 <3eecfcea-8eeb-3ea2-566b-704c314af718@kernel.org>
 <cf34d431-22ba-ccaa-3622-a098b09a8bfe@canonical.com>
In-Reply-To: <cf34d431-22ba-ccaa-3622-a098b09a8bfe@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 09:40, Krzysztof Kozlowski wrote:
> On 07/03/2022 09:33, Jiri Slaby wrote:
>> On 07. 03. 22, 9:09, Krzysztof Kozlowski wrote:
>>> The driver data (struct s3c24xx_serial_drv_data) is only used to
>>> initialize the driver properly and is not modified.  Make it const.
>> ...
>>> @@ -2755,9 +2755,9 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
>>>   	},
>>>   	.fifosize = { 256, 64, 16, 16 },
>>>   };
>>> -#define S5PV210_SERIAL_DRV_DATA ((kernel_ulong_t)&s5pv210_serial_drv_data)
>>> +#define S5PV210_SERIAL_DRV_DATA (&s5pv210_serial_drv_data)
>>>   #else
>>> -#define S5PV210_SERIAL_DRV_DATA	(kernel_ulong_t)NULL
>>> +#define S5PV210_SERIAL_DRV_DATA	NULL
>>
>> Yet, I still don't see why the switch from ulong->ptr happens in this 
>> "constify it" patch?
> 
> All these defines S5PV210_SERIAL_DRV_DATA and so on are now const and
> are assigned to of_device_id.data (s3c24xx_uart_dt_match). Before, these
> were assigned with a cast:
> 
> static const struct of_device_id s3c24xx_uart_dt_match[] = {
> 	{ .compatible = "samsung,s5pv210-uart",
> 
> 	.data = (void *)S5PV210_SERIAL_DRV_DATA }
> 
> but since the actual data structure is const, I want to drop the cast.
> Casting const via (void *) might hide some possible issues, e.g. if
> of_device_id.data becomes actually non-const. There is no particular
> issue here, because of_device_id.data and S5PV210_SERIAL_DRV_DATA are
> const. But also because they are both const now, I want to drop the cast
> via void *.
> 
> When (void *) is dropped, the S5PV210_SERIAL_DRV_DATA cannot be
> kernel_ulong_t:
> 
> ../drivers/tty/serial/samsung_tty.c:2753:33: warning: initialization of
> ‘const void *’ from ‘long unsigned int’ makes pointer from integer
> without a cast [-Wint-conversion]
> 
>  2753 | #define S5PV210_SERIAL_DRV_DATA (kernel_ulong_t)NULL
> 

I will split the casts removal to separate patch. I hope this clarifies
a bit.


Best regards,
Krzysztof
