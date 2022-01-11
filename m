Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB236C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 13:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbiAKNRO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 08:17:14 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48354
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240381AbiAKNRN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 08:17:13 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1A3D33F207
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641907026;
        bh=p6mppyZ+nRVFw8Ydj5pTS6ZQVVKxfU2Ane2whCQ9DMU=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=lCodXJHxFJkZIlCnOoFDD5342RYz7I9V7gXJ/kIcPssWu+mbs7Wu+DS4/saaRXL/0
         LQHBIG6eDMQ9HtQGVIUWaJGgDTC5XOcSDD/F2NGw77ZGZ+m2jrgsthf6tMbsQ4V3Gm
         8XA/cD/P7pfaTcyhEFozqHNwdfUuOjk4/unWOIhecwQY6bob9xlN17FpJ4wzRQnLq1
         RKWseH7+2AX5cbA0jHeqU1Th2cTF2IIwmHxF6MRMbHuzrigH+B9CjIAbIrWVGsxwVl
         6T/KTkimIKgFjFPWmDZo9r2Bwo+MC7gZ5Y7h5D6Du5Nv04oMp5JgWSz6oAdpZXuKuP
         9D4scD6hiu7SA==
Received: by mail-ed1-f71.google.com with SMTP id g2-20020a056402424200b003f8ee03207eso13293198edb.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 05:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p6mppyZ+nRVFw8Ydj5pTS6ZQVVKxfU2Ane2whCQ9DMU=;
        b=1gEpawQtQo/O4W2OqTj0nvBCz2bjPbpUvWvuP7OmO61W0OFLSLCMnplmyvD8qK0cle
         ztvJqSZRh6K1jcVEjzDyisFAMy+wiaP6n6xkFyMTe1eUcmm1LSbMmeCSWyKW3ff/ALfO
         VZiv2G4wGRZLkZa4rrtuG/J4gA7zGK1Fvrph1LTNE7mod5mRozrLZyT1mqSQkq6/FS7+
         Shze/qHKga5EUQ03NExNmy9e0AAf/Bqd86egCX9JyaarIER81yk60yh2WmtUS6UXOH4Y
         PVAKTTz8JJuZswCB8fKuTG1y7glbT4gbnTVZ8e2nXPaKzWN5wjW+iR4UYCK7Xf3MVzjW
         X+Qw==
X-Gm-Message-State: AOAM5316ezW8vX2miZNw8zzYSDps9TSNitkmo756bTmpMNsEYmHGBVBE
        V7Od53jS++aiKdBSygZMrrCHvl1JUphji4QE1o6zf14re7TBJAyiZto8bJY9CPDrxb7Ygk6FFBo
        PC7wbQ2kLiFSa7npWfzzEbrBrjjqavYzyr2mHJ267YTLD9Qrn
X-Received: by 2002:a17:906:5585:: with SMTP id y5mr3527891ejp.390.1641907025588;
        Tue, 11 Jan 2022 05:17:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+hoh2eS7S/sjXNLrekdX1PFgLfFM4Sh6dBUJxEf+onVQQ6I/vLIGR/vQV6TQ+Cwo9R5kTzA==
X-Received: by 2002:a17:906:5585:: with SMTP id y5mr3527880ejp.390.1641907025464;
        Tue, 11 Jan 2022 05:17:05 -0800 (PST)
Received: from [192.168.0.10] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id kw14sm3574187ejc.68.2022.01.11.05.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 05:17:05 -0800 (PST)
Message-ID: <07cd9a2a-9491-0eb0-1f00-7319f58a508a@canonical.com>
Date:   Tue, 11 Jan 2022 14:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: Exynos850 and ExynosAuto v9 pinctrl wakeup muxed interrupt
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Sam Protsenko' <semen.protsenko@linaro.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
        'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
        'Tomasz Figa' <tomasz.figa@gmail.com>
References: <3c0087a9-5c3b-d665-136e-6110a0482775@canonical.com>
 <CAPLW+4nrPKA66GrF4XukyHWHJ=wBycjyK3ZPLCofEFe-VJ9wWg@mail.gmail.com>
 <CGME20220107081617epcas2p402a132bdffaf1ec6f5517c311a60c7d3@epcas2p4.samsung.com>
 <06320ea8-9297-1e90-dafd-978f73c22fff@canonical.com>
 <000a01d805f7$591355d0$0b3a0170$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <000a01d805f7$591355d0$0b3a0170$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/01/2022 08:54, Chanho Park wrote:
>>
>> The error message is valid - correctly points to wrong configuration.
>> All pinctrl nodes should have one interrupt, if they have GPIOs capable of
>> interrupt as a function (usually 0xf as GPIO CON register). Why
>> pinctrl_aud does not have it? Maybe the function EXT_INT (0xf) is not
>> available for its pins?
> 
> Regarding pinctrl_aud, the interrupt number is not defined in interrupt source table because the line is not connected to CPU's GIC. It is directed to the GIC of dedicated audio subsystem which name is ABOX. So, we cannot handle the interrupt of pinctrl_aud even though GPBx_CON registers have EXT_INT(0xf) setting.

Thanks for checking. I will need to include this in the dtschema.


Best regards,
Krzysztof
