Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A90EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 07:53:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED17260F56
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 07:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhKBH4C (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 03:56:02 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41598
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230451AbhKBH4B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 03:56:01 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2EF963F1B5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 07:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635839606;
        bh=4VeAqz3jSwIuxpiAMz+s1A17LIRDINxx7QefFsdrbvc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=dXLOIFMaXAXbTMRtdnrvPvHTBhT5jwubiU3Ji7+s7klvWbEsE1AlHCtdw8lbTTQpV
         CNbcrJ4ttJLlH0KmyGy7seQEBx/qQANlwbaazb9Vfp+zitt7kNEuEqHnMgOFY6D9S9
         Qs4nUdz+WpP8bJdpfZ1k13MtYHCyvJ5GB9hZGZ9uFigNc5BGzCXhr/agM40GxtniEr
         UhECjT0k4H4BCKaGUIklxvYD5ZpBDQWSjT4tGi3gsrIla72HusJdiQ/CN2dsFOHdTf
         QzxO927IZ/3RfyBxFLugzxieiNGJQUSVoTFTHxjr/XHfVXU7A62FO/wPFAq2YtJTyg
         VRKMyyYdsSnLg==
Received: by mail-lj1-f200.google.com with SMTP id y18-20020a2e7d12000000b00212b22bc3a4so6247844ljc.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Nov 2021 00:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4VeAqz3jSwIuxpiAMz+s1A17LIRDINxx7QefFsdrbvc=;
        b=3MnHoumNj0MR2817kG8LCKr/u/R4PfopW3fhfUdILY6+hMoq3quZPxP3VnEf/Q2Fq2
         DRSKXApuLGoiot5BMmPEIn/IQBP3apU14ZtLddzu2XzUD7liOpsrencvaeEkycCVTFI4
         g2EuiythCkidoBoN4/8LsAWWCHU+k5ia9ikKafqkv65/edEAxtM5xG5+zAs6gHk95z2W
         2mF7fJOhoBuEug8Iqj+77NI9jjsaaD5ZUcROEtaK/jX6wqXZwbTKF4JhpPufGQseMJCc
         1dH/PjApVv4Vpmk+xiCFO7y/A4zvtXOyJ3kpMxOoRb47PcO4hh+XWwm7O9vzgOaRC2hK
         Z5Mw==
X-Gm-Message-State: AOAM5319bKd0BIIrGkmogsJvSErZ0m4WmnQtNP3N3AHYdvuf1j2k8tsK
        +ZZEWQ1PmqTo3+dRC5PdyzYSLEDTFqML4ZD5gr70BN/3Z1q+k3ApJd58L+87U6cV7RtkKI1z/DS
        yuoWWThSW7q1ixHkOF/zuIsV4LPuijk9OF9X7bCNfkvUTPvJZ
X-Received: by 2002:a2e:391b:: with SMTP id g27mr37424590lja.126.1635839605405;
        Tue, 02 Nov 2021 00:53:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywtLecTXbvt/DmqUThsqiYEapd5wq5piKqf14nTC+WAQVrWN89kNfMyfjFoZlxRCLA8cq3fg==
X-Received: by 2002:a2e:391b:: with SMTP id g27mr37424575lja.126.1635839605264;
        Tue, 02 Nov 2021 00:53:25 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z17sm687463ljk.97.2021.11.02.00.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 00:53:24 -0700 (PDT)
Message-ID: <59b76525-079d-f672-5355-20d92ecd4d98@canonical.com>
Date:   Tue, 2 Nov 2021 08:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos/i9100: Fix BCM4330 Bluetooth
 reset polarity
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20211031234137.87070-1-paul@crapouillou.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031234137.87070-1-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/11/2021 00:41, Paul Cercueil wrote:
> The reset GPIO was marked active-high, which is against what's specified
> in the documentation. Mark the reset GPIO as active-low. With this
> change, Bluetooth can now be used on the i9100.
> 
> Fixes: 8620cc2f99b7 ("ARM: dts: exynos: Add devicetree file for the Galaxy S2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/arm/boot/dts/exynos4210-i9100.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Looks good, thanks. I'll take it after the merge window.


Best regards,
Krzysztof
