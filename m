Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEC2C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 07:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344540AbiCHHUU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 02:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344529AbiCHHUT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 02:20:19 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C3C3388C
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 23:19:23 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BF8733F7F0
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646723961;
        bh=g+9Wm5oRRjGP5tzhaSlJoZtPqoXXX/87ipaM5ZiCUrk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=oOJNBWHqB7z7ggO/jfAuxAfnhpEK9H0QNndfqe365WQOkaBIiaqR4DfUFs/uD4Feb
         SGa+sm75CeADDeR0QjaSWARulbeVzCn5rQ0nGUVXE6kWMHX3bez6qvoLzHANwgI0tY
         3RL/Baho6p0+7xSjj3uPg+ije6lgeMJJ354S1axhHrSPrfbf+wjvVVn3YeVoFQIuP2
         XEiGh8YvlRGG8dyTfY/1PtRMZTHtgpeswLgYmUy0rWLiQXPWnOV/s+Iriy8iPh6MGh
         /2O79XvOqQuprTw17SxSQksY7MnP8xL6kfN2kAnNf+zcjm9DTSVbnPElAfBTseDCJV
         2Zt0jWcfNMp2w==
Received: by mail-ej1-f70.google.com with SMTP id 13-20020a170906328d00b006982d0888a4so8118994ejw.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 23:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=g+9Wm5oRRjGP5tzhaSlJoZtPqoXXX/87ipaM5ZiCUrk=;
        b=fWYqsZJaVFPxEfGdPT8IkhCoStmXwI+g4rwvuCPkAAXNeionpwo018Nm34OftDoyqr
         qFPp0hsLidN+ARvDT8WusQqNoHWvy9ldCrcxOEWoCqCTKcJBK79A48XhYblqriZ5IhM/
         kba2tWZW3fTVank3Tig8qmGalDnIv7+s8+jZOSVrfAwIuYIUeDI0L81Ty/7qYn7mZuzl
         WB1hAUHp+QEiPHIhf/l6RClbV1TdJA5LrnZ99PmRj1t3auPC8wRQpoOCr1P3NcPZcJdw
         XhCy1wtr/+GQdCtolEwZB14rvbtaUcuhrRk/pzXGDZtJu8v04Ef99wACWx1najA2G2lH
         Wy7A==
X-Gm-Message-State: AOAM532fBLfK7H6bly3EzW99qbijP7GNLDozqbZoL2zkVWbFRYgAw5/R
        ArSEAJodcnf6TfJ8fyhu4FkU4YeJtIGiEWToyhAHYVQUMMklz7pX1Eg7KX6xL+eFHhMGcdSZOMI
        ZrRyvFJuR97ZnACMqFAUt3l+IEpJbA5tC/YtKeYXID+amsA4i
X-Received: by 2002:a05:6402:239b:b0:415:a36e:99c0 with SMTP id j27-20020a056402239b00b00415a36e99c0mr14642786eda.283.1646723961432;
        Mon, 07 Mar 2022 23:19:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUv5CjFK4sT0ujXvgJ9JrYlSDvoMpSLD55xAvEXQ28a3knkx1LSXXTnQXCyQkWQPQ2iGtZ/w==
X-Received: by 2002:a05:6402:239b:b0:415:a36e:99c0 with SMTP id j27-20020a056402239b00b00415a36e99c0mr14642777eda.283.1646723961273;
        Mon, 07 Mar 2022 23:19:21 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id v5-20020a50c405000000b004161123bf7asm5244507edf.67.2022.03.07.23.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 23:19:20 -0800 (PST)
Message-ID: <58418443-af3a-c799-624d-76fa1decc4a5@canonical.com>
Date:   Tue, 8 Mar 2022 08:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/7] tty: serial: samsung: simplify getting OF match
 data
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
 <20220307080925.54131-6-krzysztof.kozlowski@canonical.com>
 <CAHp75VdN3MDDEjEoLAudtRW5pgHvfgP7Zt9Hv8OOhfZbHN9hpA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAHp75VdN3MDDEjEoLAudtRW5pgHvfgP7Zt9Hv8OOhfZbHN9hpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 21:24, Andy Shevchenko wrote:
> On Mon, Mar 7, 2022 at 11:20 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Simplify the code with of_device_get_match_data().
> 
> You may get rid of ugly ifdeffery as well.
> 
> ...
> 
>>  static inline const struct s3c24xx_serial_drv_data *
>>  s3c24xx_get_driver_data(struct platform_device *pdev)
>>  {
>>  #ifdef CONFIG_OF
>> -       if (pdev->dev.of_node) {
>> -               const struct of_device_id *match;
>> -
>> -               match = of_match_node(s3c24xx_uart_dt_match, pdev->dev.of_node);
>> -               return (struct s3c24xx_serial_drv_data *)match->data;
>> -       }
> 
>> +       if (pdev->dev.of_node)
> 
> I believe it's never true when CONFIG_OF=n,

Right, I can use dev_of_node() helper for that purpose as well. Thanks!


Best regards,
Krzysztof
