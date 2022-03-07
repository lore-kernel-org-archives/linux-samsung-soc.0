Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4720BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbiCGIlX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbiCGIlX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:41:23 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6611925599
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:40:29 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 45E0F3F222
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646642428;
        bh=rO2I99jv/62SugdeMBeIu0gQLuVDL/KgowlHEXSt9XY=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=RnZRDYSOk6rS4+1PtoMtgc6GXoXaCKThFJpXB1z+I7ScPeeZdPRZBKJEhlf+4Ta99
         0kbCyBPH9sZxUQv066NHzmEW2vUrE82H/VEq6Z8wDe6snWdOu/p3h5kvmPC7q4eu4U
         ZFzELyG2ve0EnT1Xp6KV3kirWS7ymG+nlSyrGaJHWp0pAO8h1YksHeQkOF3pX0fMCN
         oT5VaN3Ersvg9286GWDhnOPBmFiFfRfT+ZZ0UQHBZbn5R7CYpumtJ7h3Pkn46ygBn3
         AOUNoVVAzarKX+MDUaYcN/U7RnztmqMtrnFdkRBCjFQQAmdaq+d6/Y/SYqSSHtSZ0x
         0XKbR8kDmE6lQ==
Received: by mail-ed1-f70.google.com with SMTP id r8-20020aa7d588000000b00416438ed9a2so1742255edq.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rO2I99jv/62SugdeMBeIu0gQLuVDL/KgowlHEXSt9XY=;
        b=i24rrkaMvlZqS11ySpfUAUgKn2YNC2moHMHzF6/1AXtaGMLum+04xWAhBByvjbAayN
         gMmWxr/4Q0GZi/TsL+ebB6LRa7YBAvjbzERhDEWi2oAmEwiRSQdjeuOenamybcAdvZwu
         pMlZgY5tmWeAz/iD08d6GHICft7O5QgDBF/KNJwb1PkXfz933mzngSdORfLVDPQH8gFw
         SUmG3FDgdmXi8rsHVLpVL7WOVi9HtZL1EMM7+vTLDfOGF5hitylg27rDQp5xMTOogjli
         7IpJLnDD5SW42NdYUiQ4xTeux9/eP6PfVQPutK1vCdfiiraXIxU2nUV2wbZLHv/kUnft
         DfEw==
X-Gm-Message-State: AOAM531Bh8xpuJ+d4KfyeXG2DqCouFxif/Q4gc5u9HWH8OYQaL2FJudy
        jwC4zn+vMQ6KADcRbw6d7mS+CKKjDVRq6uf9rTl6JL53Yx9rkwYJGc7IiylzPKaT6xz6Y3LmeCk
        lm08AnWBgyqRdsGJ/Iv1/6XfSJ+eSZTWkY40X8abRLhEWM8iQ
X-Received: by 2002:a50:9d47:0:b0:40f:9d3d:97b6 with SMTP id j7-20020a509d47000000b0040f9d3d97b6mr9926772edk.392.1646642427975;
        Mon, 07 Mar 2022 00:40:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyL6fmdV5iKJnJB72/p5jFwG1rLkPoi95bQHxRu8Lb8Q0NaduvA8lt+bMJzhT3Gi1R4kBrBjw==
X-Received: by 2002:a50:9d47:0:b0:40f:9d3d:97b6 with SMTP id j7-20020a509d47000000b0040f9d3d97b6mr9926760edk.392.1646642427802;
        Mon, 07 Mar 2022 00:40:27 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id ka6-20020a170907990600b006ce54c95e3csm4515902ejc.161.2022.03.07.00.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 00:40:27 -0800 (PST)
Message-ID: <cf34d431-22ba-ccaa-3622-a098b09a8bfe@canonical.com>
Date:   Mon, 7 Mar 2022 09:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/7] tty: serial: samsung: constify
 s3c24xx_serial_drv_data
Content-Language: en-US
To:     Jiri Slaby <jirislaby@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
 <20220307080925.54131-2-krzysztof.kozlowski@canonical.com>
 <3eecfcea-8eeb-3ea2-566b-704c314af718@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <3eecfcea-8eeb-3ea2-566b-704c314af718@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 09:33, Jiri Slaby wrote:
> On 07. 03. 22, 9:09, Krzysztof Kozlowski wrote:
>> The driver data (struct s3c24xx_serial_drv_data) is only used to
>> initialize the driver properly and is not modified.  Make it const.
> ...
>> @@ -2755,9 +2755,9 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
>>   	},
>>   	.fifosize = { 256, 64, 16, 16 },
>>   };
>> -#define S5PV210_SERIAL_DRV_DATA ((kernel_ulong_t)&s5pv210_serial_drv_data)
>> +#define S5PV210_SERIAL_DRV_DATA (&s5pv210_serial_drv_data)
>>   #else
>> -#define S5PV210_SERIAL_DRV_DATA	(kernel_ulong_t)NULL
>> +#define S5PV210_SERIAL_DRV_DATA	NULL
> 
> Yet, I still don't see why the switch from ulong->ptr happens in this 
> "constify it" patch?

All these defines S5PV210_SERIAL_DRV_DATA and so on are now const and
are assigned to of_device_id.data (s3c24xx_uart_dt_match). Before, these
were assigned with a cast:

static const struct of_device_id s3c24xx_uart_dt_match[] = {
	{ .compatible = "samsung,s5pv210-uart",

	.data = (void *)S5PV210_SERIAL_DRV_DATA }

but since the actual data structure is const, I want to drop the cast.
Casting const via (void *) might hide some possible issues, e.g. if
of_device_id.data becomes actually non-const. There is no particular
issue here, because of_device_id.data and S5PV210_SERIAL_DRV_DATA are
const. But also because they are both const now, I want to drop the cast
via void *.

When (void *) is dropped, the S5PV210_SERIAL_DRV_DATA cannot be
kernel_ulong_t:

../drivers/tty/serial/samsung_tty.c:2753:33: warning: initialization of
‘const void *’ from ‘long unsigned int’ makes pointer from integer
without a cast [-Wint-conversion]

 2753 | #define S5PV210_SERIAL_DRV_DATA (kernel_ulong_t)NULL



Best regards,
Krzysztof
