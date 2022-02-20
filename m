Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A7DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 20 Feb 2022 15:30:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244114AbiBTPaw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 20 Feb 2022 10:30:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244047AbiBTPav (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Feb 2022 10:30:51 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E744E39F
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 07:30:30 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 589363F1A1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 15:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645371028;
        bh=0TyD7EGKLL3BlY9zs+HWeNFWaAo9jkOgxrcgUltUF6Q=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=S5AtXRrTEEfLiTHDelEZQPIguPi4Hbd8RQricXkaLJZtFTYzUMfOKSahdtp/w1jnt
         /FU4cgpdLwdFRlrWqknvRlvTAOOdIF9yd05Ylw+u8oXD1Ip6u4+7ma2mQdfpffkA57
         6/8WdrsQzoierreN1WJLSn5dR/gZnb3nHc8drbLvthhoGbc1vlV5X1chtd4jMMmteM
         FpTyw+sQ7KE/uABednqpWFxCiVgh7fIv/X0WrmbKwu11mg0aY+pY9zLtPO/Bfwbpn7
         o1Smb+UV2NkivPeUxsPB2Dmlut8qZFTYIm7ZUMjbe+ZqOpA3udBzdt2p2XTbrdM6Sv
         DNza715u+JKrw==
Received: by mail-wm1-f72.google.com with SMTP id j39-20020a05600c1c2700b0037becd18addso3915112wms.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 07:30:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0TyD7EGKLL3BlY9zs+HWeNFWaAo9jkOgxrcgUltUF6Q=;
        b=XOo7Dg65Axr8Bmt9ACkgMLTNIMInYqZiboK0GMVC/qSWwsxCl/l/Kz3U7+95XjhAeN
         YOxzWWIAPBeKa0JVMvyc2QQv7b0AW71IFQufE4Er7MTdYcPNltMDvA5QcrJiSbqFabFd
         X8CDydN/lamZnAoge1CikEQMZgOITge5DxIepd/4EWEQCuX1B7HjGWMGlWitdxwwpG0D
         OQH7bikm1Q8F3gRXcJJNX/mOLGR2uHKCC/+w++s0TcPO5NHcKzULNLHji9FAvXXssKL3
         3C/tZDUj/6olvM5on9kim/OOkAdWbcMItRCftx/UryxcDD/15eKx+81V7gFTEIskiN+D
         oHqA==
X-Gm-Message-State: AOAM532eSr0pJcl4v5tp/AU2wjDnrBFelrcLcyH+ZtEwmpZTbwb2dbWW
        aqzcHFA6bv8fLGFRlOVKt+f/5s9i7brcgB4GxJDzQlgHq6jHngMQ92JdZz0E+SNoAsD5wk4Olmv
        xnrpBH1p35OezUr7IULKVwKQqu2Q9pnrM4HLicMkjvtni/jmM
X-Received: by 2002:adf:ec0b:0:b0:1e4:f1be:b62a with SMTP id x11-20020adfec0b000000b001e4f1beb62amr12833509wrn.487.1645371028065;
        Sun, 20 Feb 2022 07:30:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzHzkMbmxik+3fibQeIVBG/Vmh1HdIZY1hsgjXiawcx/ahWtDem1kIrHNzUh+h1ERXQu5uTg==
X-Received: by 2002:adf:ec0b:0:b0:1e4:f1be:b62a with SMTP id x11-20020adfec0b000000b001e4f1beb62amr12833491wrn.487.1645371027897;
        Sun, 20 Feb 2022 07:30:27 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id s7sm30427817wrw.71.2022.02.20.07.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 07:30:27 -0800 (PST)
Message-ID: <289ebc45-4070-920c-cba7-fa7120d2bf4a@canonical.com>
Date:   Sun, 20 Feb 2022 16:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] clocksource/drivers/exynos_mct: Remove mct
 interrupt index enum
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, pankaj.dubey@samsung.com,
        m.szyprowski@samsung.com
References: <CGME20220220132636epcas5p4f320ac6dff9621b75481bd71b1f33183@epcas5p4.samsung.com>
 <20220220133824.33837-1-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220220133824.33837-1-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/02/2022 14:38, Alim Akhtar wrote:
> MCT driver define an enum which list global and local timer's
> irq index. Most of them are not used but MCT_G0_IRQ and
> MCT_L0_IRQ and these two are at a fixed offset/index.
> Get rid of this enum and use a #define for the used irq index.
> 
> No functional changes expected.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> * Changes since v1:
> - Seperate out bumping up of max mct irq and local timer number
>   as commented by Krzysztof
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
