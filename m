Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E421C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jan 2022 14:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355257AbiASOtJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jan 2022 09:49:09 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59428
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241974AbiASOtI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:49:08 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C354C4004F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642603746;
        bh=8N0tMQvK/ddTr0m3n20Yg1rH+YmkdkWObImqke9HUbc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=nfHL8U2YIPQQtG6kzjBYRr1mbExrnaUmdvgXFdzE65sXDT+PX6UV3v3Qj5LByMkHe
         ZVcocF+SMbtmZsrdkfEkJ4hK5jDy9RvEGtKCD3Ig9rAn6nXdRw9I59Vs5rnyH2VZwv
         qRqZngRybbh2jGx2b/DtL3GfAQiPAjnfv5zsl1NElhbRzfne6uJvfckpHVfJIeftUh
         KVbuy8kMN3mxqyv9nCOCeAcFS4M2fGxhXEwzhTkPP9YO0rat+Q1KIiIdF5mkrsg12A
         jUOCBzcLGWUMx+TTwtaQp20/ElT2x7hKh70FwgiriwZbZYt+xX0pOGOREe2Sks7EDY
         iOZGEIVT0xsYQ==
Received: by mail-ed1-f69.google.com with SMTP id j10-20020a05640211ca00b003ff0e234fdfso2785815edw.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8N0tMQvK/ddTr0m3n20Yg1rH+YmkdkWObImqke9HUbc=;
        b=IXP+wVfHP5KOlx0Idc/f1cr+5yqY7pFFWf8nh6VWkPskJF8LTlKLo4P2hX62lRcaL8
         KMz6j4sdPVDwbXkbYNNQ9w0a+7SRhD35J2sYtagc6DMipKy8OL2p99UlEKHhBNeoRDtG
         4f0SB/oGcCl7HYJDPXtF+/yHNeEfUreHPlsvK5d9XwBeZ5mBmMMSrD/Oak//ekMfkO4H
         GKW7W1eBP1RFBzznBxClPR3By43Ap9T5GiOkX89u2aaDAlg8yVr/KO/znfeFZiVAIHVt
         Mk2zxfy1MFsCV0Ksuc2q9jBW6QHU9I+PbxtLRDI/1PekrGXgf1Pz3sFZMHTgaIYNEcTR
         8mNQ==
X-Gm-Message-State: AOAM5313mhnoW66nyUQMubjDM61mkz9dB2qXcBshd/B7J2f4rbMF1cvy
        eikV5H75VnaNUjorg77KLLiAcf+i1kChk2DF4ClMgQbdECOoMXs8/ytApjyB/x00R5KazynC33F
        HbvPYhsk8/ZSi4geMU10unfS8aun/yZ7SNV9gZjfcoPJfxY6F
X-Received: by 2002:a05:6402:1104:: with SMTP id u4mr31400251edv.24.1642603746384;
        Wed, 19 Jan 2022 06:49:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywQgiQXDsmm4wHMKZQDucd4VQ0O8UGKnCspPk9GOsHIfBhx/X6dSHuH1QGHo5nePUGxuaCHQ==
X-Received: by 2002:a05:6402:1104:: with SMTP id u4mr31400233edv.24.1642603746228;
        Wed, 19 Jan 2022 06:49:06 -0800 (PST)
Received: from [192.168.0.45] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id d14sm1327637edu.57.2022.01.19.06.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 06:49:05 -0800 (PST)
Message-ID: <495d7eee-ab87-d330-119c-eaafa6c1dee7@canonical.com>
Date:   Wed, 19 Jan 2022 15:49:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4=vEYm6dGSCXtmiXUVe7FT6p=6Uk=MCvEsEgcdTz-R0NA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4=vEYm6dGSCXtmiXUVe7FT6p=6Uk=MCvEsEgcdTz-R0NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/01/2022 15:35, Sam Protsenko wrote:
> On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Hi,
>>
>> Second pull with DTS for ARM64, on top of previous pull.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> The following changes since commit 51b1a5729469cef57a3c97aa014aa6e1d2b8d864:
>>
>>   dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850 (2021-12-20 10:35:32 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.17-2
>>
>> for you to fetch changes up to a1828d772e0738c30a383a7d335aded2f2baf908:
>>
>>   arm64: dts: exynos: Add initial E850-96 board support (2021-12-22 12:31:13 +0100)
>>
>> ----------------------------------------------------------------
>> Samsung DTS ARM64 changes for v5.17, part two
>>
>> Add initial Exynos850 support and WinLink E850-96 board using it.
>>
>> ----------------------------------------------------------------
>> Sam Protsenko (2):
>>       arm64: dts: exynos: Add initial Exynos850 SoC support
>>       arm64: dts: exynos: Add initial E850-96 board support
>>
> 
> Hi Krzysztof,
> 
> Do you know if this series is going to land in v5.17? 

I don't know, did not check.

> The prediction
> (by phb-crystal-ball) is that MW closes on 23 Jan. I can see those
> patches in soc/for-next [1], but want to be sure those are scheduled
> for v5.17.

I don't get how can you be sure that they will be in v5.17. If they are
not going to be pulled - what can you do?


Best regards,
Krzysztof
