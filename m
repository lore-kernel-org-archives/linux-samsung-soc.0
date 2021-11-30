Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D851C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Nov 2021 20:04:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343584AbhK3UH1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 Nov 2021 15:07:27 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35188
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240034AbhK3UH0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 15:07:26 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 736F13F1F7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2021 20:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638302645;
        bh=fw6PzsUlrYkA4VQaJdC32HD2E/40nvvVW3E5iBZZ8sw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=D44YIkTxWqwQifW6mQtA3mvIIotwVBf3/L//41gQAcpFO0gO0e2lLKcdGf80Io0I+
         A4tObL84HgkB60VEFTEuN0FEOc6B45mHHW6u4QXVzz6T17kHupyGoFKxLpqtQ4wb4N
         GLoC9cea1lioI4q/5W53oGwln5Wsba84ZEY1d9rIQVQbBCP+LsylGxvQ60OUO3qKMf
         3/6XXSzoFGnidY3yzcza60RSoa2p+xA5OJLE8Yppb/LJjAMeCTS7/WZfnoSpSuqBCm
         WbaCjjtljH/UWjeZIm0jJfBwVoOd/K8ieR7bc5iUMcHRIMCZsNmJzjYLxcL41u62lu
         i3sZrPOLkCEBA==
Received: by mail-lj1-f198.google.com with SMTP id y11-20020a2e978b000000b00218df7f76feso7969858lji.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2021 12:04:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fw6PzsUlrYkA4VQaJdC32HD2E/40nvvVW3E5iBZZ8sw=;
        b=EdU0nZiMizBKjR+RS/62pJwgADeZFqUN/geNniBC+MhZrnP623Y2OtdRUSjU5Q8+oa
         sfhAimqeIXVHi2sSR/oCkDzEK2b3fK9vlOQgVxiCVCt9oHjg17FwTzAukFcgIePZWhOT
         I06A+V8TuC8yrDB6C0FkNiHhckBdrZUtDKmVQVxaTxf8q5rmoN/FPQuPxeKZEON/vGNW
         tm4mFBd7GkHB/PmyT8ozaFh/ZlA9L56iQu0CK2h9tS3shZfkEV4Rmt/QXpgHcUAKPB/U
         uKPLgvzFy6ejeD1mmcCbBPFSUOgqzIss5FAOf8dnU7rK6odQEBxjdNomAtGLxWpK5dVE
         l2vg==
X-Gm-Message-State: AOAM533wrdVPacLCzM3krY2+x2NdD02p8TN7PhTMibLsaY3TFe55rshi
        mSOtiv8xsAMKMmf/BcAmI1jEdMhEjmH9esoOT7X3ZZPJCcxzD3RLAXkSSe8oz/Ubg4QItig9n4U
        stQrBdRgH4YnX9niNMGIXBi9B2ZmxF5uZucMfAhPBqa9kMF/o
X-Received: by 2002:a05:6512:1313:: with SMTP id x19mr1315896lfu.279.1638302642882;
        Tue, 30 Nov 2021 12:04:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFLghjinwu+ez5oEJYvHxibl/oZqNQ9vjDrtAMuAhvpEiBodlkvDGbx0fxE9dNxNZ4Hjs+pg==
X-Received: by 2002:a05:6512:1313:: with SMTP id x19mr1315862lfu.279.1638302642618;
        Tue, 30 Nov 2021 12:04:02 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v17sm1816842lfd.287.2021.11.30.12.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 12:04:02 -0800 (PST)
Message-ID: <4b5bebb0-ed74-8132-1e6b-cb7cbc21439c@canonical.com>
Date:   Tue, 30 Nov 2021 21:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 RESEND 1/5] dt-bindings: soc: samsung: Add Exynos USI
 bindings
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chanho Park <chanho61.park@samsung.com>,
        linux-serial@vger.kernel.org,
        Youngmin Nam <youngmin.nam@samsung.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        David Virag <virag.david003@gmail.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20211130111325.29328-1-semen.protsenko@linaro.org>
 <20211130111325.29328-2-semen.protsenko@linaro.org>
 <1638294184.179325.2713642.nullmailer@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1638294184.179325.2713642.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/11/2021 18:43, Rob Herring wrote:
> On Tue, 30 Nov 2021 13:13:21 +0200, Sam Protsenko wrote:
>> Add constants for choosing USIv2 configuration mode in device tree.
>> Those are further used in USI driver to figure out which value to write
>> into SW_CONF register. Also document USIv2 IP-core bindings.
>>
>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
>> Changes in v2:
>>   - Combined dt-bindings doc and dt-bindings header patches
>>   - Added i2c node to example in bindings doc
>>   - Added mentioning of shared internal circuits
>>   - Added USI_V2_NONE value to bindings header
>>
>>  .../bindings/soc/samsung/exynos-usi.yaml      | 135 ++++++++++++++++++
>>  include/dt-bindings/soc/samsung,exynos-usi.h  |  17 +++
>>  2 files changed, 152 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>>  create mode 100644 include/dt-bindings/soc/samsung,exynos-usi.h
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/soc/samsung/exynos-usi.example.dts:35.39-42.15: Warning (unique_unit_address): /example-0/usi@138200c0/serial@13820000: duplicate unit-address (also used in node /example-0/usi@138200c0/i2c@13820000)

Rob,

The checker complains about two nodes with same unit-address, even
though the node name is different. Does it mean that our idea of
embedding two children in USI and having enabled only one (used one) is
wrong?

  usi0: usi@138200c0 {
    // enabled device/child
    serial@13820000 {
      status = "okay";
    };

    // disabled device, keep for reference and for boards which
    // would like to use it
    i2c@13820000 {
      status = "disabled";
    };
  };


Best regards,
Krzysztof
