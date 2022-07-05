Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A017EC43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 09:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbiGEJLh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 05:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbiGEJLg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 05:11:36 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114A0BC26
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 02:11:35 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g11so4242188lfb.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 02:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xoXLyomzwo3Lwj63k81Ruggr0wPfwy/QQoRUjsCwTik=;
        b=fU4GQUxfWXCeAt5Q8kRISRcIyWHcYkLzHJiMFZYkD/vDmm+Gs/ZSVFC8/nqhDFiVob
         DX7O9UQZSN/TcKKuxVHFdwVXIu1McEctAq3htER3VmF2PSrlTlQvUevrrqF0mZWsP2dj
         vlbxc+lr1nAlmxdJrc52tKQIgDfLCycnak6jIS80BbiY6s9NEZ/LjbpTIIevVHtcU7X6
         RDrFjHuIL3Ql3K76VcrE9JLXJShPcB3U0uwKjDvSQyOw/f0j9MyyMw+E1xwP0fL1rbTv
         bwuCyLoZ+j+Q2gY+rgXudJJ1TsyWG+dhxBtA/Qx4xjgPFObRhOaJTuoH99DLlqkjBpv6
         f8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xoXLyomzwo3Lwj63k81Ruggr0wPfwy/QQoRUjsCwTik=;
        b=gr5Izp8JkxYwJEBpD6xVvVIdbFOvqk9KhcfbC1ALPDJ1AK5BTBifENlABtH9VpxEpZ
         o3nhAj+QJbGkTRS4rT9Nwng4siyqe71lbw56y/P4vfDNTf9Z3U9oMYbqfUYiJMIr4ZPV
         zA9df4RLGO+zMDZwMhtImG1tybRp0FxMkLppmJBWevInFjkDnEGIwHlNrXx8l1UiEfx6
         EIgCP2Na3axordPDXAAmQ+SIzEMT4VTkUf0+VhA3heV3Mf379qQDrnvj2UfbuFCf8ayD
         WE5TdPVuCP7txFeckOE/B4jhkBg5U+4QLuYFEWBIlHjJT2hK1fg2eAA0ZT2vsqbe2vBz
         9+Gg==
X-Gm-Message-State: AJIora/cZCAzMvRCwR3E+xvh49s2Le8xTIqaAlH2eLccv00bCYYWkL5y
        Ey/9QqbBlbEeKciUnvVyIfzwyw==
X-Google-Smtp-Source: AGRyM1urJV15GfRSSLuFbBhnl0sQn8ckib1kH2oEFjn3Q7swbMQ6VihmWz//NzlaHlgOXFhXH0suig==
X-Received: by 2002:ac2:495d:0:b0:47f:a2bc:762c with SMTP id o29-20020ac2495d000000b0047fa2bc762cmr20773552lfi.93.1657012293340;
        Tue, 05 Jul 2022 02:11:33 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a8-20020a2eb548000000b0025a97366430sm5285098ljn.68.2022.07.05.02.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:11:32 -0700 (PDT)
Message-ID: <bbb3b969-15f7-0ff6-caa7-2bcb79f7fab5@linaro.org>
Date:   Tue, 5 Jul 2022 11:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: exynosautov9: correct spi11 pin names
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>
Cc:     'Alim Akhtar' <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <CGME20220627010103epcas2p174bb652624219cadc106275abf51f83a@epcas2p1.samsung.com>
 <20220627005832.8709-1-chanho61.park@samsung.com>
 <000001d8904d$424fb0b0$c6ef1210$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000001d8904d$424fb0b0$c6ef1210$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/07/2022 10:57, Chanho Park wrote:
> Hi Krzysztof,
> 
> Please review below patch and pick it up in your tree.
> 

Trying to pick up, but it seems there is some DNS issue for DKIM
attestation affecting @samsung.com only...

Best regards,
Krzysztof
