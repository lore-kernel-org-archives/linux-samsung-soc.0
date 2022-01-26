Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E921C2BA4C
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Jan 2022 08:10:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238162AbiAZIKR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Jan 2022 03:10:17 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44936
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230207AbiAZIKQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 03:10:16 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 43AF13F1C4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jan 2022 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643184615;
        bh=DMOBbhpbxVYSRvBEVGGF1WPtdp5VA2Nvoeep49GDD7g=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=dFDmyZiXNv5aCkXI4MaLT3gY7kfN531g2c7Nt8+2YxkWQ8SHBu+1mLK0K8N0PMbzc
         9Psf4MI7bO5fuyt6LelejIkWBqXucb4+STQb/NPYdX0K6vtX4PNCqHI4iWeJPAxJQR
         qxZaZm4VW+6SZcLeHVepUxsjmP0IBlx1WPVT+HWgSPfygFZ8NE/rGvE2d0wZFuFKUh
         4ozZVPY4zVCCfA09KyJ+/Uu4miQYH18dVTVCSA/AugLF/c+nw9Ft5aAVlIGuOrspCZ
         CTp+66AtM7n8g3ka2DQs1OTNflvpdfwxl7zikInLpTbvLac29dtB7gF59coWADmqHH
         Y26f4mHefsktg==
Received: by mail-wm1-f69.google.com with SMTP id o194-20020a1ca5cb000000b00350b177fb22so1452140wme.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jan 2022 00:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DMOBbhpbxVYSRvBEVGGF1WPtdp5VA2Nvoeep49GDD7g=;
        b=DpICZvf0X570h+wCL8CcF8WJDDWBO7Ql7D1Kry/Z6ZZYAa9i8bwgyr6PUMeArDC7yl
         icZMzteAKdbai09Y+z3rK4RLjAn9aW7duljW78rXavF6r0SD9m5XfSywSuW2xAu4k3TZ
         iag7Xm1/k7cWSqJy8TmLobcEPinePI38GbsUG4QVll8A3IF8UOKOGBvmOGCqmjiM+3CJ
         Git+rYDXVbtGzQGORy3AD/JuW26cIxAUAd+M1hxpliygsEGEyjNRs909FilmhXV/cEcp
         8JT+a5VJqPd4cO9PVGX/NmLGQmRVZe2N9wpbQVNX78HR90VU0276/vWg+o/ydKVCEVWV
         OiBQ==
X-Gm-Message-State: AOAM53344206k54Nc+SExPX688d/tUsuBPXjjCXRs6DwlwAZ+uWsm+QX
        e4RPLDx74/chd3vxeyb4bfRF0Oxcml8PIZd3gYhUu0w8MdNFEfE5nYfONwJ0KaSWraqC0mtQbMy
        MGVld/YYiYmLzpM0OyZGZ6gU3uGNKKGRvG82kFphm6iuvFPz0
X-Received: by 2002:a5d:6210:: with SMTP id y16mr20242684wru.454.1643184614945;
        Wed, 26 Jan 2022 00:10:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnmI3G5A8EfcELI9u37UH1MZ8E80quDMGGBUUeCgGrHC65UI2ErBUkKdMwTg9U3hbsGtCuGw==
X-Received: by 2002:a5d:6210:: with SMTP id y16mr20242663wru.454.1643184614770;
        Wed, 26 Jan 2022 00:10:14 -0800 (PST)
Received: from [192.168.0.60] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id o5sm17575019wrc.30.2022.01.26.00.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 00:10:14 -0800 (PST)
Message-ID: <cabc3a91-807c-856b-5b74-03788781e2a0@canonical.com>
Date:   Wed, 26 Jan 2022 09:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/12] arm64: dts: exynos: add USB DWC3 supplies to
 Espresso board
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
 <20220123111644.25540-2-krzysztof.kozlowski@canonical.com>
 <CAGOxZ51zavNVpvUv0C17Cit+pdkERC70m5Ez3ELGpFh8tGDozQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAGOxZ51zavNVpvUv0C17Cit+pdkERC70m5Ez3ELGpFh8tGDozQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/01/2022 07:58, Alim Akhtar wrote:
> Hi Krzysztof
> 
> On Mon, Jan 24, 2022 at 1:34 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Add required voltage regulators for USB DWC3 block on Exynos7 Espresso
>> board.  Due to lack of schematics of Espresso board, the choice of
>> regulators is approximate.  What bindings call VDD10, for Exynos7 should
>> be actually called VDD09 (0.9 V).  Use regulators with a matching
>> voltage range based on vendor sources for Meizu Pro 5 M576 handset (also
>> with Exynos7420).
>>
> 
> I checked Espresso board schematic, it is 0.9V for the USB and supplied by LDO4
> 

Thanks for checking!


Best regards,
Krzysztof
