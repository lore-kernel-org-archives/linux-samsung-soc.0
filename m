Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930B9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Jan 2022 20:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244049AbiAEUbm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Jan 2022 15:31:42 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55560
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244034AbiAEUbj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jan 2022 15:31:39 -0500
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5992A402A5
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Jan 2022 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641414698;
        bh=V4kULDmcSO9fvI4MXJMndJlczlOJyUZ0Dz0uloeZzoM=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=u9tvnpV1cyQG9gtZEV+OOJ8Grsggg+mX8ZXGy2EB+/q51HtZ9rnk1+NZDvU6fVJm9
         bzcOJanVviCXhahVlQZ1hSIoxXAFe8tuN9bIlPhLjHGCEEYAXNiL6exxb2OBIutJRc
         WfLIRwdig8FrdOI6YuJRBnWMKgPbE/2Q2MsJUxV4HgtVJVRkOhZEyarqun8FIIgYvp
         w2MO0RMY3iVujWz6/Cx9iHZu3aLxobtDKa4MA0PYhHBHHT3Gdc0rUOTDZ/pl2UX/o2
         gs567RlW0c2ofvPYfdgm8tr7ElNrrRIhjocIFXfmh87rY53Q5Y4n29fEJNtuFVFtOw
         ALKHGUwOI6mdQ==
Received: by mail-wr1-f71.google.com with SMTP id d6-20020adfa346000000b001a262748c6fso127737wrb.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Jan 2022 12:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=V4kULDmcSO9fvI4MXJMndJlczlOJyUZ0Dz0uloeZzoM=;
        b=HegPBRukP7I5fKFpriyqPWYwZVntNX/+hbradci4ditQkoxVqTd+Z5I5m7k0qH7pXK
         CFVG9TduLg7JiOIMYCR64mFVsTtC/gUMt/xWZTTtNw8wUw+lg6XRjyziiJUOsq/y6xMj
         rTBVKxWKLMF6bykUE3rhTxsc1mGtESLfxHg81eLNrOAVTpjjypHWScNQ/ZvIuGDq5lwy
         KAt/oJmAjorOhlGkVaZSod1pj/XR/61/wiR/ErsBNHdbnEX2h7Du0iTeRHkammjTMCuE
         G1WNs0QbV/17mN3ZjZ03WbstL5z+MmJXLMhSJ1kt24AmVzxFClD69NmjdYHGgbtJE1v0
         Dnpw==
X-Gm-Message-State: AOAM531WHzN5cCcW7zpTW6buoCkaDH2gJUPicETQT61mmWd2dNo6JBr8
        Or1XjevjoAG6fTvaDuwHLGCJ8lglZDNngnbo1/SlrsEJ9BqyUnKswjsNxS8PPgGbqqQUeQMVVud
        GdXe5DSXGfy+auUZ9DNJVfDN0XEA7XyVLR1ZzAC1f2HGbzmDG
X-Received: by 2002:adf:f8cb:: with SMTP id f11mr47726183wrq.700.1641414698086;
        Wed, 05 Jan 2022 12:31:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfycNJZSN3SIT7Pdqt18EECjlkeSLsfzV4kAhj6FeSMwg1AcBqMTk4rYmgxR4Fp+L98Z2zeA==
X-Received: by 2002:adf:f8cb:: with SMTP id f11mr47726180wrq.700.1641414697952;
        Wed, 05 Jan 2022 12:31:37 -0800 (PST)
Received: from [192.168.1.124] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f6sm4185158wmq.6.2022.01.05.12.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 12:31:37 -0800 (PST)
Message-ID: <9c4d825a-1f35-3e47-b91c-499525213343@canonical.com>
Date:   Wed, 5 Jan 2022 21:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 02/24] pinctrl: samsung: accept GPIO bank nodes with a
 suffix
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
 <20211231161930.256733-3-krzysztof.kozlowski@canonical.com>
 <CAPLW+4kVjswvcx7PjkBq_cPrmoi1_yJw9qGOO2tcRCDm27zKmA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4kVjswvcx7PjkBq_cPrmoi1_yJw9qGOO2tcRCDm27zKmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/01/2022 19:43, Sam Protsenko wrote:
> On Fri, 31 Dec 2021 at 18:20, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Existing dt-bindings expected that each GPIO/pin bank within pin
>> controller has its own node with name matching the bank (e.g. gpa0,
>> gpx2) and "gpio-controller" property.  The node name is then used for
>> matching between driver data and DTS.
>>
>> Newly introduced dtschema expects to have nodes ending with "-gpio-bank"
>> suffix, so rewrite bank-devicetree matching to look for old and new
>> style of naming.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  drivers/pinctrl/samsung/pinctrl-samsung.c | 57 ++++++++++++++++++-----
>>  1 file changed, 45 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
>> index f2864a7869b3..561853df8ef7 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
>> @@ -1011,13 +1011,56 @@ static void samsung_banks_of_node_put(struct samsung_pinctrl_drv_data *d)
>>                 of_node_put(bank->of_node);
>>  }
>>
>> +/*
>> + * Iterate over all driver pin banks to find one matching the name of node,
>> + * skipping optional "-gpio" node suffix. When found, assign node to the bank.
>> + */
>> +static void samsung_banks_of_node_get(struct device *dev,
>> +                                     struct samsung_pinctrl_drv_data *d,
>> +                                     struct device_node *node)
>> +{
>> +       const char *suffix = "-gpio-bank";
>> +       struct samsung_pin_bank *bank;
>> +       struct device_node *child;
>> +       /* Pin bank names are up to 4 characters */
>> +       char node_name[20];
>> +       unsigned int i;
>> +       size_t len;
>> +
>> +       bank = d->pin_banks;
>> +       for (i = 0; i < d->nr_banks; ++i, ++bank) {
>> +               strscpy(node_name, bank->name, sizeof(node_name));
>> +               len = strlcat(node_name, suffix, sizeof(node_name));
>> +               if (len == sizeof(sizeof(node_name))) {
> 
> Double sizeof is probably wrong?

Thanks, copy-paste error... it should be also "len >= sizeof".


Best regards,
Krzysztof
