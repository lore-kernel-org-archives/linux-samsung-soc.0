Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9313AC05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:38:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbjAWPiT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:38:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbjAWPiR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:38:17 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E687A20047
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:38:14 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id j17so9372838wms.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fGEa7pia/vjFjDOTPETCQ2V9Ir9MaJJODSdKTEO+fM=;
        b=C7i+aByjflUQRwyoqonJtGDwQtJAjnW5nQyslS4wEtv/erfjBha/wFh8sCc86PyI2h
         3m06BkuOUIGbws+uxEKADu5tvoK6FZapkR9GyaWbxIYIx+wIMDfwZqlqDe6mIvuYcdvU
         oLiSQi/MiIuJubSiIwFUdM9Y8apXYQ3p80XsvuNrcoqADoJlStG43XunxvDk4K+1o2Fe
         G6cxOXoaLx0LBb5MD5IJtZBBG34qpB4OxeFnrvfN9p7tBlH+IgODPWlf7VL2PNLm82Zp
         u5ZHMj/ITc7eziHLgj4pTnmDDOiEAFWlzlj9U2tB1TA20SVvpkb6oYWJiGqTxaf9+mCf
         U4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fGEa7pia/vjFjDOTPETCQ2V9Ir9MaJJODSdKTEO+fM=;
        b=hwiQ4mj7J7rTZMkhC8W1X1dce6QU84uve3GmLfQYwPOSDy5XDCF6Wpm4NB+X+9RQnr
         +IDGd4JGBW1B3+4DtldcHQZjBYTUP/EwzeR4hhhbQFSH/yizhoPUVNehzpFVRNOAwAoZ
         AAqi8l1y6qP8OquttvoOaHsW4M90POY7SF5Z4Jzvm/p70pOjUbOQfidG92SPyr+ai5+6
         5Nj6knFSWbV8jVW0aJkwulBIhYdrZonLavPED3c1TagukgazypPCwO/38/8OwN4UWGTj
         hcihlkl/RxcqElW8zD7schZbTDjvpzoVtCzfBYSOY4Iz+Oi2+nCH6oCAh/85f+d+MU+t
         wySg==
X-Gm-Message-State: AFqh2koSIo8LS5gMuNn4BE9SPUUWwm5zY7Ds8hlpMH34gTCSM42YfoNv
        N/YLd9crRcSRHTZ+aJ/aGbgcLw==
X-Google-Smtp-Source: AMrXdXt9PUKswvYKFpgGGZCt3zs+1orNLPpP5m8QoLlwhrfwhzx7XCSGw3gCQehVYX+vHWyZjKZh/w==
X-Received: by 2002:a05:600c:3d8d:b0:3d2:bca5:10a2 with SMTP id bi13-20020a05600c3d8d00b003d2bca510a2mr24167140wmb.22.1674488293482;
        Mon, 23 Jan 2023 07:38:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x15-20020a05600c188f00b003db122d5ac2sm10494913wmp.15.2023.01.23.07.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:38:13 -0800 (PST)
Message-ID: <88f64463-51e6-aee4-c542-a3cff5406405@linaro.org>
Date:   Mon, 23 Jan 2023 16:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFT 05/11] ARM: dts: exynos: add ports in HDMI bridge in
 Exynos4412 Midas
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
 <20230120155404.323386-6-krzysztof.kozlowski@linaro.org>
 <Y86pA6xo9EttJJ6g@L14.lan>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y86pA6xo9EttJJ6g@L14.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/01/2023 16:34, Henrik Grimler wrote:
> Hi,
> 
> I see you have already merged this, but FWIW HDMI works as well as
> before on exynos4412-i9300, so:
> 
> Tested-by: Henrik Grimler <henrik@grimler.se>

Great, thanks! I'll add your tag.

> 
> Longer explanation: HDMI output only works on i9300 if MHL cable is
> attached before device boots, so probably bootloader sets up some
> settings that the sii9234 driver does not handle (correctly) if cable
> is hot plugged.

Best regards,
Krzysztof

