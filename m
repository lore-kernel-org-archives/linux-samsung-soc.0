Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A075C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1587675AbiAYRTJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:19:09 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55212
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344899AbiAYRPe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:15:34 -0500
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 04F503F4BC
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130725;
        bh=cRuWMxrPXr7Db37oGINTnI2Imc+mdGIhRauTmNnjcco=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=vQjFbGjhac+CubcLy+7v3K6AgCzO3DJBmUMIUjS2tIf7JfZIMK7NXpcP0RHJC279t
         WgVPuea6R1fSeGyPWmFUBbinufB7pZuvfJPZsCRizTcsJOgjDhgPIkjD9XhtRhK2+3
         Xn6k981ORyBBWRhO1X6WTyDLsKnCqC/moLSyQVBJYNVRJEKKKRUegI0bxfiAsKa7TM
         FW8zlu3VD5IZmK2bY1w9EpYxqTEyLeCrPJrvVgEkSkT370K3mXewHJt3ut4I7kOUZp
         hm/8FaX8LO+njvMTXJrf8WgB+ArjhD9kPcICcCZQrn+LMxg7cbNe2NVgwt2vdyKts8
         o/GErBKeSIrPQ==
Received: by mail-wr1-f72.google.com with SMTP id g6-20020adfbc86000000b001a2d62be244so3335359wrh.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cRuWMxrPXr7Db37oGINTnI2Imc+mdGIhRauTmNnjcco=;
        b=Q3+A5bTDdtVWtfxlY1NQxQbIpf1+L21FanfAUQBnvTC2V8Nn2gjdFIlT4DkUE1s/7r
         cGiZxzWts4uZy8VvvV3hzolwkyj8d0adPA3m08idsUhmtSpBDwCZy5Ez32kLOE/xuuoi
         yn9GI0jaqh79ZEFBRbpjasJgl452FAbOchjxVhRtdC5Khw1E3HSBHJ11hHyE5rQJRZeY
         MiwTj+6LDxucuTLjgX5Q2iJWhPws8Dbv/6RpaJXtsM6dUR4dxPEhLT6VwJxfPL4mdD9j
         Eul5p06KobUP310/L6g00DyZmD6ijEn2sy6nXWZmrrNpPAFwHoD3fh42zakAnSh3E4VL
         k3nQ==
X-Gm-Message-State: AOAM533kFrEHz4l8TW4KK5PZb89tlL55FTE8mu3oTtzLDoo5pP3gw9Vf
        JBT3zrjIRxGJBcqV7Xh+wFaM8uBRDlkjuny6afTUUlW+hP5PzlS6VsU4d4h1WE/OACfiK4AIz0T
        +Si2kB6TNbo/Ns6AoeFMWSCsLBCxanHmWRCCtTfZF4Px/F6iK
X-Received: by 2002:a5d:59ac:: with SMTP id p12mr1764853wrr.437.1643130724373;
        Tue, 25 Jan 2022 09:12:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyn63lsxsGyIy8w2Zle5UfHDf5Cg31gXP3K6sfp7qWzheNoBd+PgghdMtFEcamrKebOUlq3QQ==
X-Received: by 2002:a5d:59ac:: with SMTP id p12mr1764836wrr.437.1643130724154;
        Tue, 25 Jan 2022 09:12:04 -0800 (PST)
Received: from [192.168.0.59] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id u3sm7390429wrs.55.2022.01.25.09.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 09:12:03 -0800 (PST)
Message-ID: <d9682f16-13b7-b6dc-5afd-b2d319143de5@canonical.com>
Date:   Tue, 25 Jan 2022 18:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 00/16] Add support for Tesla Full Self-Driving (FSD)
 SoC
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        sboyd@kernel.org
References: <CGME20220124142850epcas5p2f82243b87386b3d49a9302c87e015d6b@epcas5p2.samsung.com>
 <20220124141644.71052-1-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220124141644.71052-1-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24/01/2022 15:16, Alim Akhtar wrote:
> Adds basic support for the Tesla Full Self-Driving (FSD)
> SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
> as well as several IPs.
> 
> Patches 1 to 9 provide support for the clock controller
> (which is designed similarly to Exynos SoCs).
> 
> The remaining changes provide pinmux support, initial device tree support.
> 
> - Changes since v4
> * fixed 'make dtbs_check' warnings on patch 14/16
> 
> - Changes since v3
> * Addressed Stefen's review comments on patch 14/16
> * Fixed kernel test robot warning on patch 04/16
> * rebsaed this series on Krzysztof's pinmux new binding schema work [1]
> 
> - Changes since v2
> * Addressed Krzysztof's and Stephen's review comments
> * Added Reviewed-by and Acked-by tags
> * Rebased on next-20220120
> 
> - Changes since v1
> * fixed make dt_binding_check error as pointed by Rob
> * Addressed Krzysztof's and Rob's review comments
> * Added Reviewed-by and Acked-by tags
> * Dropped SPI, MCT and ADC from this series (to be posted in small sets)
> 
> NOTE: These patches are based on Krzysztof's pinmux for-next branch
> commit 832ae134ccc1 ("pinctrl: samsung: add support for Exynos850 and ExynosAutov9 wake-ups") 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git/log/?h=for-next
> 
> 

Thanks, applied DTS/soc and pinctrl patches.

I expect Sylwester will pick up the clock ones. Otherwise please let me
know to pick it up as well.


Best regards,
Krzysztof
