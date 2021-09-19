Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63790C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33D62610A8
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237221AbhISJOB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 19 Sep 2021 05:14:01 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36184
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237163AbhISJOB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Sep 2021 05:14:01 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B475D3F4BE
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 09:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632042752;
        bh=sH16gdLrHWXOXobGG3raIn2kbNCmRT/LznIMKcw31bw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=eG2FQpRAVOpoXH9ioF8kQeRxH19z6KXRBS9P8j0A9Q8GpB+HWLpuvSwXEXdL5uj8r
         1tq88K4wcCh4qaCTP2z49AI4a/aCHtzvWFussOCzPmc5gk0lKc+8g4RDE79iV+8LwN
         mNx7OToDXYsCG/nk/s63Fve3aVuM/IPcOx11qHMsUGYZmtEBSly5cbbVLuNIWzDa33
         uOPDHItwqbrVQPYP4Huue6i5xufb9SWdr3yLnIJofm3pNqiSZTwoYag1407JnOIzjq
         gaxyrFx0X40q317YWuZYeIo2ieiIiCqj1dWjDdYyJnkRwxToo9PNq3maskmt+TmsuE
         cwKpXFu29gGiA==
Received: by mail-ed1-f70.google.com with SMTP id z6-20020a50cd06000000b003d2c2e38f1fso13065374edi.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 02:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sH16gdLrHWXOXobGG3raIn2kbNCmRT/LznIMKcw31bw=;
        b=m9AMe6vOIwLl5bTeI/CvZYzELuBAcogSVR2JZk6FKxPQS2lgfamGzVu5+QiIWbJJw7
         bSkD5xhUVdMTUM2pBrqaJTQiYg6ujbIbhdg/xFChTYdNYvesPoARNm6BNaz4kPns4fFg
         kFNjpTQYfrLRHJN61L6v0KAq8YAmLNOmw7rd2+rHCKyud3Ul24o21c97hlqOv80P6Due
         LaC25s6iobb6j0OWYIiKPkQxY9m6xwqb0ZfhM4jn4JLi3+J3zRCeXDnQSDKg0hNvEHJB
         pQWe0DWKeTLmlpvJ3ys2awfibdmaJcq4qtQ0oHd+uJ8Fy2yE+g5+RBjbGiUpflh+O11W
         4PWQ==
X-Gm-Message-State: AOAM531pys3UKQiUbiTne7YJFBCyd48g/Ze7UCe6D8UA1UzJJ9fg1RbG
        7gnW0D2dVCrKOipEqcfmNU7YbLIYlMB4PYom4qMT8NAcuraa0nynUglOI69mtK2EqCEi2e9jvNQ
        XpMWrFUdJbj0uHSxxD5sgsQpjLJPRr42drrBXq48TYrfnGEJT
X-Received: by 2002:a05:6402:2da:: with SMTP id b26mr22832424edx.160.1632042752212;
        Sun, 19 Sep 2021 02:12:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJPw6szlew7WE8ANQlyxvpIHceWsvNPvDU+83PIb5STrJ3l0PBTrVKVL/zxJ4iRntpOF+uJw==
X-Received: by 2002:a05:6402:2da:: with SMTP id b26mr22832418edx.160.1632042752047;
        Sun, 19 Sep 2021 02:12:32 -0700 (PDT)
Received: from [192.168.2.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d22sm4665665ejk.5.2021.09.19.02.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Sep 2021 02:12:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] soc: export soc_device_to_device symbol
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
References: <20210917175134.252882-1-krzysztof.kozlowski@canonical.com>
 <20210917175134.252882-2-krzysztof.kozlowski@canonical.com>
 <YUWPAs7uyyN1qjEA@kroah.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e704f783-50d7-8295-a8e2-9df8a176174f@canonical.com>
Date:   Sun, 19 Sep 2021 11:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUWPAs7uyyN1qjEA@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/09/2021 09:02, Greg Kroah-Hartman wrote:
> On Fri, Sep 17, 2021 at 07:51:33PM +0200, Krzysztof Kozlowski wrote:
>> In case if soc-bus drivers are modules soc_device_to_device() has to be
>> exported.  Since it is trivial, export it as non-GPL.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  drivers/base/soc.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
>> index 0af5363a582c..ac8db303daa1 100644
>> --- a/drivers/base/soc.c
>> +++ b/drivers/base/soc.c
>> @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
>>  {
>>  	return &soc_dev->dev;
>>  }
>> +EXPORT_SYMBOL(soc_device_to_device);
> 
> I thought we were getting rid of the use of this function, why export it
> and not just fix it up instead?
> 
> Or am I confused about some other soc device abuse...

I was not aware of discussion about soc_device_to_device(). Thanks for
pointing out the issue. I googled a little and found previous talks:
https://lore.kernel.org/lkml/20191111052741.GB3176397@kroah.com/

I can easily get rid of soc_device_to_device() in my driver, so first
patch won't be needed.

Best regards,
Krzysztof
