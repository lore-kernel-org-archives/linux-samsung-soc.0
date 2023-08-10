Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D26C41513
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Aug 2023 06:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbjHJGVi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Aug 2023 02:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbjHJGVi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Aug 2023 02:21:38 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BFFE52
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Aug 2023 23:21:37 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52340d9187aso610759a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Aug 2023 23:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691648496; x=1692253296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KGBV5nb6p4yPHUwdCPzMc/o3J23+nmIfdlWDVvQhtE=;
        b=dtR16Eu+ffBLTlPzjZEiufh3uLvlptbLi+dN5pZd6XTR3dCgfkkUQms9MBcUi2sq3l
         BggBI51u1RVPYVVYimgaVugYO0pjmF+zF+UZKxBwGGZwLDFf+7kOtrpYU6gWr+Gm62mv
         0H+GJrXjuz9Eweo3UkytVDZKWG3kMvTXQ9IVi2hWDhG+58euJ1wpwg23iHsq7iNlcG2S
         mz0bVsf6pliUaDvm27zJd619eUm7+GIJIZBVrM8ookFl9M+mljn75xdBq090qkYHWvnc
         U2M2X0aUNcDCktqnoaKj79CAHsqNgssSpcDdqyMAnm4UNx1HYdAJjB4E6Sw2KifVUbiM
         Hs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691648496; x=1692253296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5KGBV5nb6p4yPHUwdCPzMc/o3J23+nmIfdlWDVvQhtE=;
        b=aVeQB3kosIPf3gD5QR3FGThJtQyklncWsbL7r8KfljO8W8j9vOpcBjxbCzVa835S+L
         EOiMDwdr15Tn5RQ54NLk6mf25vqOoP2S1gknAc3YpeYactwdow4nkWVrSdT4jnMqHKGf
         ioTI6Sp1qOwF33r8PpSfF0fpdb70mZ6Ba16LlqgBBY8mVRAB405unTd954nOq5Kd/wSv
         +4h1UsM2Eyp9JeiOXZKfolG8iWGivFqsGip5ACgT8RxCvZjZTt+hD4nYc9zQMZ1NZTdu
         Kx+ZQrOHRTnj5RtWED2nK92JD9bsMC1ZyRa2IxFTzTZ4C4pA8gKQ+zzDYLEBwIMBIPZb
         H/UA==
X-Gm-Message-State: AOJu0YwUMgo7ojaFHid+O/uXyM4hsiy1oW6ivzj4Hvc/u1/kDB0qtj5I
        1qVCXJwc5ud0vbRKotuRrEdL0g==
X-Google-Smtp-Source: AGHT+IGP2gOp/IwE3JkY3x07NPNLX11aABuD7Bquej0WMUPMvXxR5A87VXfKZVNYOdFGRa1TKYiPdg==
X-Received: by 2002:a05:6402:57:b0:523:3f1e:68c4 with SMTP id f23-20020a056402005700b005233f1e68c4mr1169796edu.34.1691648495834;
        Wed, 09 Aug 2023 23:21:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id t9-20020aa7d709000000b0051df54c6a27sm369321edq.56.2023.08.09.23.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 23:21:35 -0700 (PDT)
Message-ID: <a1545e38-62fc-b5a1-e4c2-9f32b28e40f1@linaro.org>
Date:   Thu, 10 Aug 2023 08:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] ARM: dts: exynos/i9100: Unconditionally enable LDO12
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20230808110341.57891-1-paul@crapouillou.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808110341.57891-1-paul@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/08/2023 13:03, Paul Cercueil wrote:
> The kernel hangs for a good 12 seconds without any info being printed to
> dmesg, very early in the boot process, if this regulator is not enabled.
> 
> Force-enable it to work around this issue, until we know more about the
> underlying problem.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Fixes: 8620cc2f99b7 ("ARM: dts: exynos: Add devicetree file for the Galaxy S2")
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  arch/arm/boot/dts/exynos4210-i9100.dts | 8 ++++++++

The path changed long time ago. Really, please do not work on some
outdated pmOS or whatever downstream drivers.

Best regards,
Krzysztof

