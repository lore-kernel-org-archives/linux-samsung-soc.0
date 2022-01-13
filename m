Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E86EC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jan 2022 12:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233465AbiAMMcB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jan 2022 07:32:01 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53664
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233396AbiAMMcA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 07:32:00 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9C8F040012
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 12:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642077119;
        bh=FS/F/TlvVCSdyoU7kWP8bufXKEAoLhbWFtD9KWwk3o4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=wVOU3am2ORQVz8wG6HMZI5BuJjmUdYY4GS9nXFn5TFz52sqTsPtoQtTVedgEceHnG
         afHP0AFJV0kbzbCjuiBNk6XvEB1/jdZRF8K6yH+PrSbFAM2NXBFjSb1cSn6autTMll
         75WUsBjOeEn27zVb4UAZW3FLUmzDT4luui1MsmCLsmqIyD+/uTmDQS0N7bkqtfQyGR
         SMLutnATCDrzsPNb4qGFBA8W8ro2ZTmhYqLFWDScQ2bf/x2VbuTuAiFJnij9muWkzM
         Slvl8QQedoJa6qB+TBhGrhrnYV2lb7cHWjJBQhLOfN9OVeKNvHUXMon/TINWmEA92v
         ZeVH1n6r9vrvg==
Received: by mail-wm1-f70.google.com with SMTP id bg32-20020a05600c3ca000b00349f2aca1beso3528554wmb.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 04:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FS/F/TlvVCSdyoU7kWP8bufXKEAoLhbWFtD9KWwk3o4=;
        b=D2hvXP/PWosmK6qFvepCAZSMKjKnHJKU8OhqHSlw1rr7+13VUJvNBUYZftD1tym/LK
         /KfFuk2tGRCtPwczwASqvcyuAToNLC8ZMsHp3YS1RYCyyvm/8PYE6Yk7Z7jDWZHQDCX+
         /b+ha4M87KCLEHN0gSGgd1s+vJL/C16ta0Bi0+c8D7RMlB/vz/v4KrfQVloFao447KI5
         FHlJ+5nOjIBXY0CHjIXq94lLmJ54V5jYtigt2xvr9rmSGvXyt8g6Acx0P9IT5Lzf09r2
         NnGO46GPkF9Irx3pJ3foFIvBY2qKkmY95V7bo82o1x1iRtFx4rZjcH2Nqc+72Nb9oyhl
         fh1A==
X-Gm-Message-State: AOAM530qB7zzGyDXI+KP+d1DO2obL3/Q6YwOMK781146nCSV89OZW44E
        NXfY46sZ7QHeEAuXL7y+y8iZBXqHwqfRxhL3XYfBPGg91z4Dj92DWLKQmzyXeKkQ24cIkvElaDh
        cuVAYay9g+MA41Um8T560Au+W2GhGACtwGrUk6Uu/IuavgKd8
X-Received: by 2002:a5d:420e:: with SMTP id n14mr3724228wrq.293.1642077119260;
        Thu, 13 Jan 2022 04:31:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQfIKQD3y1atrGTO3ll5AyBzkhE238ZBX+7qN6TR3TyZPEQWe0UjPAwheqscqdBIG0C76OOA==
X-Received: by 2002:a5d:420e:: with SMTP id n14mr3724211wrq.293.1642077119106;
        Thu, 13 Jan 2022 04:31:59 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id n7sm2398562wms.46.2022.01.13.04.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 04:31:58 -0800 (PST)
Message-ID: <d1a852e1-c4c2-b7c4-ddeb-7fbcfd9b4e58@canonical.com>
Date:   Thu, 13 Jan 2022 13:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 00/23] Add support for Tesla Full Self-Driving (FSD) SoC
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com
References: <CGME20220113122302epcas5p1d45c0714fe286f8f91d0f28c3fad86e4@epcas5p1.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-1-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch set adds basic support for the Tesla Full Self-Driving (FSD)
> SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
> as well as several IPs.
> 
> Patches 1 to 8 provide support for the clock controller
> (which is designed similarly to Exynos SoCs).
> 
> The remaining changes provide pinmux support, initial device tree support,
> and SPI, ADC, and MCT IP functionality.

Does FSD have some version number? The FDS, especially in compatibles,
looks quite generic, so what will happen if a newer SoC comes later? You
would have:
 - tesla,fsd-pinctrl
 - tesla,fsd-xxxx-pinctrl (where xxxx could be some new version)

This will be extra confusing, because fsd-pinctrl looks like the generic
one, while it is specific...

Best regards,
Krzysztof
