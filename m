Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7D3ECAAD7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 26 Aug 2022 05:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244780AbiHZF5N (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 26 Aug 2022 01:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244816AbiHZF5L (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 01:57:11 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBADD0232
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Aug 2022 22:57:05 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m3so670603lfg.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Aug 2022 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=6sFMfV3sPsTsCOqDR27m1j2WQDafovgjMLOtMRdll3w=;
        b=zy9dPSpOq2Sj28WwDLganDetslFdIvQvfylapmHMXB07JSgEE8NWqqe3g/AF27qczb
         LooXFKefhbt53hzJ04EH+5H+Y/nWQyP7pb84uAyfNA8nJnb03Qkn6HJp9T/1kbOiD+gO
         /ov60IN4aCc+6Il/sfejXZJcGRNQLd34JmL53wRqhZHs8VSdG9Ls9p92aA/uft+bMP5f
         eyCJYtE0iCU1qRvRc8swVuPfZCsIwwglRF4O+I/e6Pc9h3mog6yPNq1gebVnPHV8KBWO
         4vrTWjoD89tTQ3ULzxxz1B8fphhCA8n38km/w75Z/0PTMogX5x+huO0+mu3sJTxcAgGa
         ATng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=6sFMfV3sPsTsCOqDR27m1j2WQDafovgjMLOtMRdll3w=;
        b=lurqdITYwkjuMTOjebNp84C69/QcMeVb5hhgMUFZjb5cw/d2Ub27fnDDKUdqBrJ8Gw
         Sk0hKYLQZQXIOJe0QBWiVzYRDlGt8dyCQpc12JnTQY6RshkZn8G31YQrw9ur5ERz72xS
         hJQwZsBkSQvzxLIxTfr/hKFSX6wq/3RqgDq6hx4U649VdXKU8oW3XVzNX0ini+kClo8N
         KPJsteAh7K3uq2XTrjfsPiNqUbl4oxRuhg3lPXzfXUQOEVmXLS2lzjojKrp3pbiYbMTu
         Nbi2hcNwpqCexep5mEr4TiYbhEVW8zyGlcrdbQZvZ4TZanyDWSwezGdwc9eTUI6O4xKS
         5rRg==
X-Gm-Message-State: ACgBeo0/q0Jg7o9ZORxUfcAyyZrs9Cw/BpSIScIZgjGIzKUr2LxFV8vT
        Dmmp0iVa+jvB+HL6AJNCwOOFVg==
X-Google-Smtp-Source: AA6agR65773YQ2l56e6A/aGdOiN59cNX1MQvGp4IdN8W3ZmzMmuXKxSGoBxPJ5uzfMwoCrB9KuDTqg==
X-Received: by 2002:a05:6512:13a4:b0:477:a28a:2280 with SMTP id p36-20020a05651213a400b00477a28a2280mr1855419lfa.689.1661493424094;
        Thu, 25 Aug 2022 22:57:04 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id f6-20020a056512360600b0049288e0bd61sm250856lfs.58.2022.08.25.22.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 22:57:03 -0700 (PDT)
Message-ID: <77d05dac-b4d3-e88f-ecd0-46b6e92fd637@linaro.org>
Date:   Fri, 26 Aug 2022 08:57:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] usb: reduce kernel log spam on driver registration
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Vladimir Zapolskiy <vz@mleia.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
References: <20220825170327.674446-1-ardb@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825170327.674446-1-ardb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/08/2022 20:03, Ard Biesheuvel wrote:
> Drivers are typically supposed to be quiet unless they are actually
> probed, but for some reason, USB host controllers seem to be exempt from
> this rule, and happily broadcast their existence into the kernel log at
> boot even if the hardware in question is nowhere to be found.
> 
> Let's fix that, and remove these pr_info() calls.
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/usb/host/ehci-atmel.c    | 1 -
>  drivers/usb/host/ehci-exynos.c   | 1 -
>  drivers/usb/host/ehci-fsl.c      | 2 --
>  drivers/usb/host/ehci-hcd.c      | 1 -
>  drivers/usb/host/ehci-npcm7xx.c  | 2 --
>  drivers/usb/host/ehci-omap.c     | 2 --
>  drivers/usb/host/ehci-orion.c    | 2 --
>  drivers/usb/host/ehci-pci.c      | 2 --
>  drivers/usb/host/ehci-platform.c | 2 --
>  drivers/usb/host/ehci-spear.c    | 2 --
>  drivers/usb/host/ehci-st.c       | 2 --
>  drivers/usb/host/fotg210-hcd.c   | 1 -
>  drivers/usb/host/ohci-at91.c     | 1 -
>  drivers/usb/host/ohci-da8xx.c    | 1 -
>  drivers/usb/host/ohci-exynos.c   | 1 -
>  drivers/usb/host/ohci-hcd.c      | 1 -
>  drivers/usb/host/ohci-nxp.c      | 2 --
>  drivers/usb/host/ohci-omap.c     | 2 --
>  drivers/usb/host/ohci-pci.c      | 2 --
>  drivers/usb/host/ohci-platform.c | 2 --
>  drivers/usb/host/ohci-pxa27x.c   | 2 --
>  drivers/usb/host/ohci-s3c2410.c  | 1 -
>  drivers/usb/host/ohci-spear.c    | 2 --
>  drivers/usb/host/ohci-st.c       | 2 --


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
