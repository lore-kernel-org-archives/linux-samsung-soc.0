Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF6BC432BE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Aug 2021 07:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50F2660FE6
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Aug 2021 07:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240118AbhHZH51 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Aug 2021 03:57:27 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57260
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232223AbhHZH50 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Aug 2021 03:57:26 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 46A784075F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Aug 2021 07:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629964598;
        bh=JkuOywfaMdggVS4bli5HwaEPziu1ePITpUpnYUIyGCI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=JZ/aYNEN3I+KrcLLO2g/8yqjKqIzOIUQINZbyPasX71k4x5qrpkbQgDtETojvyZCe
         DiA40av9VLqttYIWcfvZDV0WipHZCvJCswQ3UM7H5F7Mvmfsw7dPrilM7XEPbYYB0t
         8NNqyJizTMsgcp5TupAtw7PnAORU7b8jon/IqgLFLfgN48RrnjPnR/Kz1003RN8p3F
         ZG7ACiFRGrKA440eQj3gyM8xx+TTICwGoIXtTPwGDZs9wN5jKrZwe2Ri92EIrApPBJ
         OTe38Nj6HsBNo37sYlwAAfoVUX8nPhvVu5azR6pTziEX7uK1W+Az3+ztw4Zwv8mrw4
         BasYgzScWkIVA==
Received: by mail-wm1-f70.google.com with SMTP id m33-20020a05600c3b2100b002e87a0542efso659435wms.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Aug 2021 00:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JkuOywfaMdggVS4bli5HwaEPziu1ePITpUpnYUIyGCI=;
        b=KNm6B0Cbuwm1A9ISnRfMMFQCFNQVMEgeUKIn2rmQ7vpjh3+bUzi273Op7j7mDB6nEc
         ItkLd2j1KaVYXrwMvQJnjH0f1NPw24+QsLpK/BVn5PqBdK7CS91XMMQuWxcJ0ukUtJgB
         5dfa2oNK08Y9FRhvQ/3T5Ti7Imk9gT2CGYMuIm6o6GNsinvdRCikzKPm5dQnfnkasGUV
         Lnw/dzHatNAIHCxdQqhcWG6Lwy27s+9/tio0SuwZBFT0bujlpLLlfQmz8hXySnmCFuVh
         umITC9r51ITAyge7fW+8Rcr/QCo2C8VwFPgUrVCSraaXp5jXwwK/ONodA1kOCbycCGbi
         vwEg==
X-Gm-Message-State: AOAM531DR4VxTZJ/LgJkTL3gHAhAw6pQtyTPVFUI0eHP7d7Y3xDSm86d
        xVpCRlaQCZ2KcWeSz4Ji+OOL5dawMCArBdz0BPOI89Y7qW23LG0xFCcYwI900V1L44TUZh+5JJl
        f51XNjdyz2AuWh8w7v8kAaGx/guY59Xk3XgseYM4zdc8tTsN7
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr2266787wru.315.1629964598061;
        Thu, 26 Aug 2021 00:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7z+KnpYY98pYyEqMF/A3NX8jxv23cu1YJnDvJUhoXHCtlFAZyyEs+2CZ1T1jeMVjcwD6U+g==
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr2266775wru.315.1629964597932;
        Thu, 26 Aug 2021 00:56:37 -0700 (PDT)
Received: from [192.168.0.103] ([79.98.113.122])
        by smtp.gmail.com with ESMTPSA id z19sm8834614wma.0.2021.08.26.00.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 00:56:37 -0700 (PDT)
Subject: Re: [PATCH v16 3/7] ARM: configs: Explicitly enable USB_XHCI_PLATFORM
 where needed
To:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Olivier Moysan <olivier.moysan@st.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        William Cohen <wcohen@redhat.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
References: <20210813195228.2003500-1-mka@chromium.org>
 <20210813125146.v16.3.I010d5725652b981ebbafba0b260190fe4b995a40@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d6f17e48-4cb5-d665-4770-a4cf0440f85b@canonical.com>
Date:   Thu, 26 Aug 2021 09:56:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813125146.v16.3.I010d5725652b981ebbafba0b260190fe4b995a40@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/08/2021 21:52, Matthias Kaehlcke wrote:
> The dependency of USB_DWC3 and USB_XHCI_MVEBU on USB_XHCI_PLATFORM
> is being changed from 'select' to 'depends on' by another patch.
> With that patch the defconfigs that enable one of these host
> controllers also need to select USB_XHCI_PLATFORM explicitly
> to keep the resulting config unchanged.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> 
> Changes in v16:
> - patch added to the series
> 
>  arch/arm/configs/exynos_defconfig    | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
