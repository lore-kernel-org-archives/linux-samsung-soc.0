Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C22C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 09:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BC7D611C0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Nov 2021 09:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbhKKJ7c (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Nov 2021 04:59:32 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50250
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232318AbhKKJ7b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 04:59:31 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3167B3F1B9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636624602;
        bh=0QmUn/+wubSYSmTQYVtEMAkMcA2QWp77KCs126H+Juc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UJGTaUvRlCS5snsZIq3WY58ktHK6uNJICPxgILPcnx0mBu1jgtPyGz+qRrzfpnxqJ
         sfrG+31r0rYfNdNtwGiZm0xIu8HI7alZrYQaArVNDRIVN34dzLBs6oxmEq0EILGr37
         48jGZzTph9tnpV22LaYvOI3lQE7hJzjNILOSf4B90yOCZVRBzl4zIj3BW7TqyC1yhh
         5xmYfWdA/EPFoLQ3RaKPud20Vmy8sdaklTlMQMPVUn2Y/IDSV/s2b+t+tO93fl9WPj
         9XOwJOauHGtkPkyPzr5Wo21q361wRDZxvjyCGYcuXN3khz6ourYrhtxpGLNxgH3Kw7
         vQDqNQnxAAbig==
Received: by mail-lf1-f69.google.com with SMTP id i1-20020a056512318100b003ffd4e89eb9so2471368lfe.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0QmUn/+wubSYSmTQYVtEMAkMcA2QWp77KCs126H+Juc=;
        b=8CNwBt7yp4CWoIbixekwudVddnQuwsy4XPJ9SC55RigVwdw404Ls/d9b+PZ4WN3NVA
         Mzb58cBfDE5veYJfg3sdyR+gAczXGtVUL7RE0JgdWsbk/eAzN7bFw8c5eWI3vXHW1Y0K
         LDJ859/OCQWGl0S5v4tA7ZWg+JD9QfPSI7re6ZCJt1xs0ktvOlig+qkNA3QPWnX1Mo5D
         K8nreL5qlEycq5urSUCnGyeDLfNQvYt2iYCwSMeUQn7SCXkK/MPWaiN/UQ/yStBquWV4
         Nn7TZIWV8qIwFpxDuLptdPquRV0ucCYWoz3fZPkFfrQVorPqvjaHTUAUU51FUoudLyeV
         zUVQ==
X-Gm-Message-State: AOAM533BbFPSH9PShjVNhruqqo5CVDMP/veeNYpWKxrMFHH7qDLPcGdL
        SYhhuMelKDGyeOK5u7loWsfef1naLACHO1dQJyUSxv0lz+TZ+OBWW/Fv5tgmniucAmr6J2aAWKV
        iI+/ljBgN3QZv+N4Dt8v1mn0k6IKEstNuZHf80WN4A0+UVorF
X-Received: by 2002:a05:6512:1506:: with SMTP id bq6mr5549700lfb.118.1636624601670;
        Thu, 11 Nov 2021 01:56:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUfUwcF2cAx8x/G3+7qqwx0dkmnl366M+/YmAriQ6UM5akc3pj67B9VmIgqFuG4BblwDqMLA==
X-Received: by 2002:a05:6512:1506:: with SMTP id bq6mr5549680lfb.118.1636624601513;
        Thu, 11 Nov 2021 01:56:41 -0800 (PST)
Received: from [192.168.0.27] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d23sm242723lfm.107.2021.11.11.01.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 01:56:41 -0800 (PST)
Message-ID: <16fbb472-4a82-1267-9971-db453ba009e3@canonical.com>
Date:   Thu, 11 Nov 2021 10:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] ARM: s3c: include header for prototype of
 s3c2410_modify_misccr
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20211111091123.50853-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a3MezegptR_-XPVm=RtOn4UYsb+TPEKjCGb-XRt9ke36A@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAK8P3a3MezegptR_-XPVm=RtOn4UYsb+TPEKjCGb-XRt9ke36A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/11/2021 10:46, Arnd Bergmann wrote:
> On Thu, Nov 11, 2021 at 10:11 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Include the header with prototype of s3c2410_modify_misccr to fix W=1
>> warning:
>>
>>   arch/arm/mach-s3c/gpio-samsung.c:1309:14: warning:
>>     no previous prototype for ‘s3c2410_modify_misccr’ [-Wmissing-prototypes]
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Thank you for fixing it,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> If you like, I can put it into the fixes branch of the soc tree directly,
> otherwise I expect you'll send it in a pull request later.

It's not a serious bug and was there since long time, so maybe let's
send it via regular pull request.


Best regards,
Krzysztof
