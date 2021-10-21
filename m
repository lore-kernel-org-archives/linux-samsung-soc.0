Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22391C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 12:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4BB861362
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 12:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhJUM1u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 08:27:50 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52382
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229765AbhJUM1t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 08:27:49 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DCAD93FFFC
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634819132;
        bh=OEvgfMSIzLFlHfTd+aj6jAI5gittIjBiCSXpIdeWxOQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=dcgs/Q27JuYfxubj1DsCm0Zq8ZM094SNcLuRGarRFkhmsYghTjxRqwbY1GU9ZFTVx
         vFyO3z2vDYCL5UL7eHWMsdKWtJVO1M/BGTsVMcgJnCbkYFoTWDf11cmU8rWhcWZBRM
         phijdHgrfZf9fDR4oaNCByRDjlYohbvD020oGB1YrgjqwYcDumsoK/q1NkYDvbquun
         Q0M1XkLctwDWnT+bW0lQ+VwVuXVhRLp6myznJ9482XOV90kYO/Ldc7whwETP48hgov
         lKuwJi0IWx/PSBaIoUbRTdu/+7Jf+msYLV6qPeoIMFHUA5ekXSGQPxaxHNj7ihT/IB
         k17d9VzhhSCzg==
Received: by mail-lf1-f69.google.com with SMTP id z18-20020a0565120c1200b003fd76d7ca21so210677lfu.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 05:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OEvgfMSIzLFlHfTd+aj6jAI5gittIjBiCSXpIdeWxOQ=;
        b=I5Eje6SfcxDbnRHELzLYbPAh78WPLRRM+hyu3pY2qFdJACn+7VrzJl6tEdG3ofAcJN
         fFLnn3XAGakJrntkVfgftOuXnbXZSD+8WxK0RwHXNEhi2wH635JNHclh9p9KRl/nZqpv
         zksvOXJRXLN+Qlbt0jguG5DCe7B8YUC3dIKW7JFzfaB67pPNntCL0TIoYvogEJfJZJ5R
         b66nGjNbaugJAo3rB6/g/UY8m6jtMchACh24L00TtKrFWI5k+9KvZpt0EAXIdDnKf5mc
         eo1OM8ikEKFDRxhYwCPu65tfLj0EBRTRlHrqF2oUgIhQB5sYgWArVydR1x4Y6tfcta3M
         fEjw==
X-Gm-Message-State: AOAM531j+fSHPgRf4Sa06+qYCimC6mmCBqF0yZ7QnBRqWBy/hxiSPliP
        4EXYPHlgBW8qyU4Ngn/qxnUMRM6lsTgtdDNJ2HHaZS4fiwVeXB5e1nexJP1HnwCSMCCv9TGXx+T
        eZlBu0xYQqsQvxxzmxac5foqKjrT6oInUu6NKLkcO4H5imrLj
X-Received: by 2002:a05:651c:230e:: with SMTP id bi14mr5404512ljb.467.1634819132272;
        Thu, 21 Oct 2021 05:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0/8NcGHTrSWS0H6+LXQbRBX3Abg2xVQ13rASma1FIwjNQK3yxWARDRCPBIvJmD3bqslQp8Q==
X-Received: by 2002:a05:651c:230e:: with SMTP id bi14mr5404491ljb.467.1634819132086;
        Thu, 21 Oct 2021 05:25:32 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o15sm537797ljm.139.2021.10.21.05.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 05:25:31 -0700 (PDT)
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To:     Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>
References: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4f9141f6-a35f-e412-7a9e-a00a7c8376b2@canonical.com>
Date:   Thu, 21 Oct 2021 14:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2021 14:23, Arnd Bergmann wrote:
> On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Hi Arnd and Olof,
>>
>> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
>> August 2021 (v1, v2), resent in September and pinged two times.  They got some
>> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
>> unfortunately Palmer (RISC-V maintainer) did not respond here.
>>
>> The usual RISC-V patches go via Palmer to Linus and I am not planning to change
>> that, but I want to get these fixed.
>>
>> Could you grab these to soc tree?
> 
> Sure, I can add them to a separate branch in the soc tree, in case the
> riscv maintainers
> take them after all. I notice that you have only Cc'd Palmer, but not
> the other two
> maintainers or the RISC-V mainling list. Adding them here to maybe get their
> attention.

Yes, my bad. Thanks for cc-ing them.


Best regards,
Krzysztof
