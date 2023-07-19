Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9E9C001DE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jul 2023 14:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjGSO0P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jul 2023 10:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjGSO0L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 10:26:11 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B7D10FC
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 07:26:09 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fdd14c1fbfso3006550e87.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689776768; x=1692368768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QYVunoFchPUC0OBXPo1j3FS+mazfA++aFluGXeilBDk=;
        b=ex9mlEDgIOJBoi8ZE5Gy9YUPQeUCRyk2JVGKFSKdodeYs/N/NtWwXC/vlNh6FO8dg5
         bT3XYgM30DXywlczVpCpuAXqh9u50yEYN81xkpDJSOW1dN4WyP4QVNlfZbqa5FJy6Ic5
         oaDAu4pTTv96rjmWvUDMCi2lwTXB7s+iciRxaCcQWQAOYr+FGa+2MxvtZh6qQz2CGuEL
         mDtJXY8o3skprV1mr7EbaM9fWdRyhSrhDExbBw6OKs1PoKBNZHdh0QXQMoyz2859AWZA
         Z2eDNNUeVJF4j5j98YSMGCm8kcMqiXqbDRZ61NbqWm4+JOIxpJPgNXCvf/GtdZoS2gM4
         uVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776768; x=1692368768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYVunoFchPUC0OBXPo1j3FS+mazfA++aFluGXeilBDk=;
        b=bv6w6BG43QYzKnWDEMqoQDyobPpb1sSlFVE+EN955Y4qF0+UiHWn/4WxMw5I+HWDGZ
         RC4nxaxEAemQha/0EfvlkK3cCt8DIyajQmFsP4KM3kW6wm1poud/yiyiABlbPE9W+EKH
         SsKYEAhvA6M//EGKvaMb1LSvvqOn6+q+fbf+W32yDp+usbzBQcZIUxS8HQfpzGjVrQHH
         /u5FUE4iqpQICXs7jMv8UpsUs/RNdbbwoXwkuJ2NIJaB/LKQZCgD5F6hqujSlIWOoJc5
         mUnYonqLSvgTVYwc5wC9HB0SnKaWyxztWZRxhyKXYswVu4u5vhiwcRDyKLG4ws2hilaN
         IflA==
X-Gm-Message-State: ABy/qLY+IIQEIQHVJXr290z8o/SeRDu+kGrQ8rmM4F0rhGbtlzYCh4Nn
        TlXh/1S0l+foqHEKYf0QecRkqA==
X-Google-Smtp-Source: APBJJlGi3BabRvugk7R6rQS2y8EhvImMu4QFhIo/YCnkmRrehmGmgHtJngmJ6AEMC2RjxVfWsQOH5g==
X-Received: by 2002:a19:914a:0:b0:4fb:89e2:fc27 with SMTP id y10-20020a19914a000000b004fb89e2fc27mr5864lfj.54.1689776768042;
        Wed, 19 Jul 2023 07:26:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id c15-20020aa7df0f000000b005219de74217sm2741339edy.43.2023.07.19.07.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 07:26:07 -0700 (PDT)
Message-ID: <6c5b594f-96af-8b7a-558c-0ce244634057@linaro.org>
Date:   Wed, 19 Jul 2023 16:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     dsterba@suse.cz
Cc:     Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Nishanth Menon <nm@ti.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
 <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
 <20230714135914.GI20457@twin.jikos.cz>
 <4963b85c-c0ff-92a1-e5d6-ca76f1882f93@linaro.org>
Content-Language: en-US
In-Reply-To: <4963b85c-c0ff-92a1-e5d6-ca76f1882f93@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/07/2023 09:51, Krzysztof Kozlowski wrote:
> On 14/07/2023 15:59, David Sterba wrote:
>> On Fri, Jul 14, 2023 at 10:47:24AM +0200, Krzysztof Kozlowski wrote:
>>> +Overview
>>> +--------
>>> +
>>> +SoC platforms or subarchitectures follow all the rules from
>>> +Documentation/process/maintainer-soc.rst.  However platforms referencing this
>>
>> Just a drive by comment, references to highly relevant documents should
>> be clickable, so :doc:`Documentation/process/maintainer-soc` , with
>> exceptions like if the document has been referenced already.
> 
> Is it needed though? The link is anyway detected by sphinx.

And it does not work:

maintainer-soc-clean-dts.rst:10: WARNING: unknown document:
Documentation/process/maintainer-soc

I also tried:
maintainer-soc-clean-dts.rst:10: WARNING: unknown document:
Documentation/process/maintainer-soc.rst


Best regards,
Krzysztof

