Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52364C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 15:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbiGEPnd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 11:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbiGEPn3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 11:43:29 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6927D26F9
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 08:43:27 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id c15so15076120ljr.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 08:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OuB7MAKhSmIm/m8EdDuaNR26xSu28x25kqPsH5I+hYc=;
        b=FowVvSFkDQgEiH92td3TKZ1rmVAqpNuFv3/zwst9W7djOLp0+zPsMDxEsGe6KnaTx9
         6EIHypwF+Z7L+RlbZQvXSmuidbKz580rcMt02c9ZewoTKjjHKlJ9DDTV+6ZWY9pRKC9w
         OXdC4g70ec1NqsYCyvBZ7YE0N/y5lfICdQJjETtsRRX6twA2zsn74t7apF1MSdF2Vgt8
         qCzDPmeL6l31WUpFIiRnZ0BDKtwhtDXr+smsCKI+cWh0LXnrLRgI6/SCTGJg7VzQXBN+
         YK+VFrk/Y95XQ6wpPQwfYweQUu607jZjvP39g6gZjzYVNEeEMwUgJAqcLgycnlT99qBL
         gT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OuB7MAKhSmIm/m8EdDuaNR26xSu28x25kqPsH5I+hYc=;
        b=0F0/WPmIyJmP9S9vt1N+t5OL0gEHCsWpn+JjFODg1GoqKCZVuQY7rtKDE7x39cK/yd
         NzGZmqt66/IhmgC/VOIbmSaJDrT0BRXL8aJeI7W+gTfsuPKsnoISDRSUUR1dw4JtsLyS
         NtHeWhcZ+L/lpT6tAAYzxTUVhynfp8D60p/Yzy6gnI4m1h1G1um6iu8BbYBqDnKgx5E5
         A18Tbnfan8Sb67Mr492CaPLf8JpVyNvf1YBHh5uBcrRvPeVVEG9AqBJUs+egjmbVvzgx
         ZAQQqJC01HP9eRcWL10Xg9V36dAOY5lhzJhYPBrCrUWhW0Mo6fTwOHacPe+Zp8FVcI3i
         EjDw==
X-Gm-Message-State: AJIora8olYobmZbIjtG3Y1pS0dk699iX6WxisZCzRBcGCqJaPNDOfYly
        uU4Atf+jZzQ2I1nhKuFkDcpT/A==
X-Google-Smtp-Source: AGRyM1vQQ5FSkKjbRJkOJeIKnxuG8GcyJkRO7uJHtCcAUMEyDW+cq168TZcMvQiSGXaBHhMvEoPIhw==
X-Received: by 2002:a05:651c:508:b0:25b:b0e4:8a0f with SMTP id o8-20020a05651c050800b0025bb0e48a0fmr20639827ljp.72.1657035805680;
        Tue, 05 Jul 2022 08:43:25 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u12-20020a2eb80c000000b0025d38d13eeesm275060ljo.98.2022.07.05.08.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 08:43:25 -0700 (PDT)
Message-ID: <49c46093-e43c-59cb-6df3-f3456e413e3b@linaro.org>
Date:   Tue, 5 Jul 2022 17:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/2] dt-bindings: hwinfo: group devices and add
 s5pv210-chipid
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
References: <20220703183449.12917-1-krzysztof.kozlowski@linaro.org>
 <CAMuHMdUnH0oRQg3i1VorZOmNSKKXRP91BiQEgBaV5W5ig+YH2A@mail.gmail.com>
 <20220705145108.GA2083998-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705145108.GA2083998-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/07/2022 16:51, Rob Herring wrote:
> On Mon, Jul 04, 2022 at 09:18:31AM +0200, Geert Uytterhoeven wrote:
>> Hi Krzysztof,
>>
>> On Sun, Jul 3, 2022 at 8:35 PM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>> As suggested by Rob [1], I organized a bit bindings for SoC devices having
>>> similar purpose - chip identification.
> 
> What's the base? It didn't apply for me.

The Renesas bits should go via Renesas tree. I'll split the series.


Best regards,
Krzysztof
