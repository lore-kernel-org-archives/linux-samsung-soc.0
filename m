Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A91BC001DE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 16 Jul 2023 17:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjGPRiz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 16 Jul 2023 13:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjGPRiy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Jul 2023 13:38:54 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EE5E5E
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 10:38:52 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e29ede885so5331548a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jul 2023 10:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689529131; x=1692121131;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dnj2dm4vAkRY2ym0OVHyApOFbv82RoBY1nhPV64txIc=;
        b=ca2vSsFEY38zKN0EbYp6domY97w81vz0hIi07dVBT5hifthGJze3JUOsxydAMxe/hA
         C1la7xfOBPKT1xW/R3iK/TBh08wi1ABM7XnCU1B2b9WwuqojVljCidbsz6JDVMr0fqD2
         UdqEbS3rKKCuBoev+pjjB61sb43U0J/+71OuK7GUb3iZdJ/mZ0wMGZ3yd+VM9Ic+/NTZ
         88PlyGo9190saQM4NW3HtsnTNPamtSWJGnRHA0SiLfRGdhx2gUXHwtYM7MduxZrKWRTU
         qLVZ2kUWC5Tvi3Y1ymPafOEJeCPyowC+lW9Zgkgh3JxI1FZhvD1ZF8nV3NBE2Qj7QVVO
         mrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689529131; x=1692121131;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dnj2dm4vAkRY2ym0OVHyApOFbv82RoBY1nhPV64txIc=;
        b=RhJwi5YQEYuJVF1l0S3+hy0Hfur1GcP/eKdvC0m1csFA8cpyd5UgDJMZVCKsh6NfZF
         iORbYmNEMR3NvkL6wKDNT19LJoTs6dwoWeDG0F6WoDMW7ICC+RQHJVG0VtXtowwhiOIq
         16EmgedUNq2vII9woltNWU/fELt8RBwIBagFW+2qnRwzCgIUur0Kx9+Cry5EmrrA52bP
         NdEV6mZjYrghLEnSX5I4GTTRpicBNwNhgwO+XJT7byt+Wo0UCjGFs8RpllVctfP12o5p
         bFM86U002Efm2xHf4StlvDmu+SdgM5VxXCiVwsP2LdE34tg/WvqMYfvpe+SZ/Ebz5y2M
         nrEA==
X-Gm-Message-State: ABy/qLYnAl2BcxJqwPKpG+2xf/Wj5oKZ1M9G7rFo+MJkTvL66anOo3zV
        mZAdF3aNRkW5hjsEQt8JITEpjA==
X-Google-Smtp-Source: APBJJlESRlu42cRoBqDewXcLEuNc4SOEf32yD7ybhMHPRpitvwU2E7d+YPl8NrMEY+pgx94+m5nxuA==
X-Received: by 2002:a50:ff13:0:b0:521:7577:d34 with SMTP id a19-20020a50ff13000000b0052175770d34mr4690734edu.0.1689529131025;
        Sun, 16 Jul 2023 10:38:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id p3-20020a056402074300b0051bec856cb4sm8721685edy.50.2023.07.16.10.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 10:38:50 -0700 (PDT)
Message-ID: <4a627f7f-05c8-cbb1-1c21-e121729de1bc@linaro.org>
Date:   Sun, 16 Jul 2023 19:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ARM: dts: samsung: s3c6410-mini6410: correct ethernet
 reg addresses (split)
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Conor Dooley' <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CGME20230713152937epcas5p483e95ece242b0dc2c9a1ada1ba328117@epcas5p4.samsung.com>
 <20230713152926.82884-1-krzysztof.kozlowski@linaro.org>
 <020501d9b63d$b8e29e60$2aa7db20$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <020501d9b63d$b8e29e60$2aa7db20$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/07/2023 12:26, Alim Akhtar wrote:
> Hello Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, July 13, 2023 8:59 PM
>> To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Alim Akhtar
>> <alim.akhtar@samsung.com>; Rob Herring <robh+dt@kernel.org>; Conor
>> Dooley <conor+dt@kernel.org>; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Subject: [PATCH 1/2] ARM: dts: samsung: s3c6410-mini6410: correct ethernet
>> reg addresses (split)
>>
>> The davicom,dm9000 Ethernet Controller accepts two reg addresses.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> Do you need to add fixes: to send to previous stable releases?
> In any case:


The format was actually working, but indeed it makes sense to backport
it. I'll add it when applying.

Best regards,
Krzysztof

