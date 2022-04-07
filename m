Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C72C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 07:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbiDGHcs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 03:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241802AbiDGHcr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:32:47 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4624F4ECF2
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:30:47 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id l7so3571875ejn.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 00:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vzjb8OyiiJYotEV8kvXDCXjnvHrz6uwgs9bvhbzeeU8=;
        b=yIFq6xd4Us4NfmlSY+xqeSRHONBiPyZLWbCarpHyPpReRoGd6kSu06rKWHp1jpqdoa
         zoGYlLLNT7zerPP9VWMVmqpxagQULEn7bTQs2EKcn5Wi0IExnueM52SIxDVTqTktUZAv
         AZQeKuRYrd/6m53+D2CQw3aOLWbMMMxfIh/Dd4+pbvcF8BSEk4h9pQZTAtpG1/5EubLf
         u/5dDUQOsdlqiFKhxH9o3qGMLCUIZkUgmsOkYlzLCbNQOI2BaV30HrWV2lMPE/8t69ZG
         wQPsn31BXGDT9t3DN/F3u0F9/5o1TPP1giyGa04SlfHT+Cre5agB3rkctxDP3ieizILF
         9CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vzjb8OyiiJYotEV8kvXDCXjnvHrz6uwgs9bvhbzeeU8=;
        b=dpmMqnEKWccPcDIJDxqzg+U1AaIS8U/ES6gGk9bYEXuNexBIcX7iDBCy7tToMcTXLt
         n7AWwMh+BSmSIje9sZrtZo9mganEseOBrBMh0GyHCV63iRshrYNba3dTVu0G8d3Zs7je
         PSmGr7fZuYJIlpq4WKeuW+0EhGJw+qmPeVotmvfK8eufyK6sgNS+sowugsI2C2JQ1C16
         OZxmNeAK2BHocM0MszhEoPx+IGcs8x9UGSmM9Q/BUucq/Pwx3aiI+/sQIIsydzIBHvuf
         so3vBp+kX/VJNn+kIc5GAfYZaD33/Rdg3HJUfnTMaOygWHfCng5X9GQ4rdx6SuBvzNV/
         WyKg==
X-Gm-Message-State: AOAM531nfE9b8NpSXiWBo8fVFqdhm3njb2tmShRqyotZCn+WPVcuPq+P
        12zEjxD/q+aQNWIJAQSXMbbHpQ==
X-Google-Smtp-Source: ABdhPJwIqsvcbUoRf0jzTstI6QI8oC/35Ywl3gLGRtqyMNt7EWPp/vRrxhy1pCRr0jaF/uXfo7s0qQ==
X-Received: by 2002:a17:907:2d89:b0:6df:b7d1:a365 with SMTP id gt9-20020a1709072d8900b006dfb7d1a365mr12892115ejc.386.1649316645845;
        Thu, 07 Apr 2022 00:30:45 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id t1-20020a170906178100b006e7edb2c0bdsm4704390eje.15.2022.04.07.00.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 00:30:45 -0700 (PDT)
Message-ID: <ad6605e5-a8e4-1906-43cf-eb2d4420dab8@linaro.org>
Date:   Thu, 7 Apr 2022 09:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 09/12] ARM: s3c: enable s3c24xx multiplatform support
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Hubert Feurstein <hubert.feurstein@contec.at>,
        Lukasz Majewski <lukma@denx.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
References: <20220405091750.3076973-1-arnd@kernel.org>
 <20220405091750.3076973-10-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220405091750.3076973-10-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/04/2022 11:17, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With the custom ISA I/O and the missing sparse-irq support
> out of the way, s3c24xx can now be built into the same
> kernel as all other ARM9 based platforms.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/Kconfig                  | 18 ------------------
>  arch/arm/mach-s3c/Kconfig.s3c24xx | 23 ++++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 19 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
