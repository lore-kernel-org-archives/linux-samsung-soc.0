Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFA5EE49AA
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Aug 2023 08:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjHSIgZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 19 Aug 2023 04:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjHSIgR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Aug 2023 04:36:17 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A24E1784A0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Aug 2023 01:36:14 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5257f2c0773so2123103a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Aug 2023 01:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692434173; x=1693038973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDBtWmYqzi/9lap98sdHnoiAOUS5fWqLSgUpQ5yHcg8=;
        b=V+9qdLiaFCVpY1Tkm+g3WJCnO8uHFCMIGwQrtu3UbD/XWMAsOhz0XSUdYqsC9f3xSE
         qLC4uFsqBGXKf/cLmfRoLDBqXoQ5awd0UZc4+YyYGFvj8ce6fD69eRijb4NmqXPmK3mz
         vgWA6Fsv4Qr1M83ci+w1hbCaDBeN+lcxxZ+u6hUXrLDgCIqKWchmy/ofXBjPtPbvJb9t
         jKwzsf3PRcK6zMTAF5newTIktNR9RHokbZLYjDoMai0U1GFa/oNyhApEhjuBvU/VSqM5
         3f7J6iHvizfaI2a7fBkxYlWR1v9Xamid89TTJuFX+Z1ptW9IWUE4hmEZb9SXR3smKB4w
         Rh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692434173; x=1693038973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDBtWmYqzi/9lap98sdHnoiAOUS5fWqLSgUpQ5yHcg8=;
        b=hR5g5iu8ZoCWPfFCFxRzVFQ8zn8T+KsGsZe9+hek43SknLtCCYnmaRsybGknKUzFFG
         OOplrH1SmjeX8gSwu9+2uAs+wMwLHRtBCxHNUUKNs/ky2BKRzfw5DsdrCqks6a5cqa54
         P6Wi6DXEdkqGrx//BxuoYl4lAtq4tXQ/lu6OFTgs2pSZQ9QdKMLkj5EN2jQIQo4U8iEw
         V+DrZidH3SxoJrupx4w+xWRwxfnh9OslNWcownot/M6M4/hrmzXRO9XleF/noWi6BkEW
         2XyEQ42roKpZ06vUDWo2DchHjY/W6IjHGoJL/HySQuDV9sMekOwN668x/l1D9lycJF92
         cIBg==
X-Gm-Message-State: AOJu0YyzvxRbucSzxgHbEkfyQU+ZfB6IbVUPvOSzNijEiXXdY4ldYpLH
        wd6SxKuILlDbjQcrixFkqQ8SCA==
X-Google-Smtp-Source: AGHT+IG9aSDFMBTYcEsiQxovHMkUD1SuVY1yIm8Qi0ivlYlrZ6iAac9z2z70JTra3Ik1+KkdydzjMw==
X-Received: by 2002:a17:906:ef90:b0:99b:f3f3:e412 with SMTP id ze16-20020a170906ef9000b0099bf3f3e412mr936414ejb.52.1692434172926;
        Sat, 19 Aug 2023 01:36:12 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id c6-20020a170906170600b0099e05fb8f95sm2319361eje.137.2023.08.19.01.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 01:36:12 -0700 (PDT)
Message-ID: <de962afe-719b-01cd-b9ee-1868c7da9105@linaro.org>
Date:   Sat, 19 Aug 2023 10:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 8/8] arm64: dts: exynos: Enable USB support on E850-96
 board
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
 <20230819031731.22618-9-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230819031731.22618-9-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/08/2023 05:17, Sam Protsenko wrote:
> The E850-96 board has a micro-USB socket and two USB 2.0 host sockets.
> The USB role (host or peripheral) is selected automatically depending on
> micro-USB cable attachment state:
>   - micro-USB cable is attached: USB device role
>   - micro-USB cable is detached: USB host role
> 
> USB can't act simultaneously as a device and a host, because Exynos850
> SoC has only one USB controller and there are no external USB
> controllers on the E850-96 board. So the USB switch chip (specifically
> TS3USB221A) connects SoC USB lines either to micro-USB connector or to
> USB hub chip (LAN9514), w.r.t. micro-USB cable attachment state.
> 
> When USB works in the host role, Ethernet capability becomes available
> too, as LAN9514 chip (providing USB hub) also enables Ethernet PHY and
> Ethernet MAC.
> 
> Dynamic role switching is done in gpio-usb-b-connector, using current
> micro-USB VBUS line level as a trigger:
>   - VBUS=high: SoC USB lines are wired to micro-USB socket
>   - VBUS=low: SoC USB lines are wired to USB hub chip
> 
> In order to make USB host functional when the board is booted with
> micro-USB cable disconnected, role-switch-default-mode = "host" is used.
> 
> One can look at E850-96 board schematics [1] to figure out how exactly
> all related USB hardware connections and lines reflect into
> corresponding device tree definitions.
> 
> As PMIC regulators are not implemented yet, we rely on USB LDOs being
> already enabled in the bootloader, and a dummy regulator is provided to
> "usbdrd" vdd nodes for now.
> 
> [1] https://www.96boards.org/documentation/consumer/e850-96b/hardware-docs/
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../boot/dts/exynos/exynos850-e850-96.dts     | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

This looks good. Please split the DTS patches from the patchset, so they
won't be applied by Greg. Anyway, I finished pulling for this cycle, so
this will have to wait till v6.6-rc1.

Best regards,
Krzysztof

