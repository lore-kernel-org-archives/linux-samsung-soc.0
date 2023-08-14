Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D41DEB64DD
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Aug 2023 19:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjHNTld (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Aug 2023 15:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbjHNTlT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 15:41:19 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8019110F2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 12:41:18 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so42820855e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692042077; x=1692646877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UlkRphW99TUQjmsLQhZVnE2TXQQ32GbCiM/RRZT7IL0=;
        b=TZwIG9hlRrAaevAKoGITPcyiUCy9/dOP/RfJNRnD8rCEY64TEMkk1dqlPM88cKrDTL
         ueDj5TjLkeglROwOO1zYus7MaMO4aNSAJe/9LcPGePJ71h36Eouy0oy5szJLNsOVKtWJ
         2uYPscPayIA4YVZQkW+l93f+FkVSF6F5FFw7L9RJrNmi1hEgKtFi525ZzwIOMJROdXow
         Hgqe4mkM44ZGY7ug7OqQsg+DXxBVFHRzMjJysZHirpqG6dExNur+J23TX+dm6JeTkG0b
         mxekx1U6HHryASrvDDhOfQsgzxid0fa7ZTyGhqSID+mArig9aA5gyNtStjGA7wzYRl7I
         /DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692042077; x=1692646877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UlkRphW99TUQjmsLQhZVnE2TXQQ32GbCiM/RRZT7IL0=;
        b=Z50/7/7l4llEph+s7IOeKGzQVYcgsxLFr93faaE/hHgTL/JWCDi0DIOaBUuL+Cfhjh
         TFQf7JWBIm28M+sdcYBKOE2DA/gtuP7HO77db71/C4EqU0N2QNqu/kM3Sn4ALukvnyAD
         6iVA1niMwIOy4a+oKJjjD44zDIaO5uoWraANengQrJ2yQObWy1WZyACOajTUHZYV7pQI
         1eIGf3BYGMhuMEK7YqaDCugfxlr0hEz+jNQvuFMGf0G+gK4U+mLj+uVsu4g+egKadPXj
         FJ0clTt8FTeP61617BUKtg235z9Jv47MKujtkje6XrxgfSKy39bbvXxPBLUHTs5dtlC/
         cRUQ==
X-Gm-Message-State: AOJu0YwVEkrCIo/wPdPk4Ioue9WdTAqrow8/vlfJV00ntNlWTDoN2ta3
        uLODyUSSKyQ1P+mJA5qaDXFlYw==
X-Google-Smtp-Source: AGHT+IF5YrLzgnKux/XfX0ddvCVBGHZoDjc5aUCzOkanpW7tRsK6Gst2cYveMpl0sstGRpKdZK++WA==
X-Received: by 2002:a1c:7717:0:b0:3fb:dbd0:a7ea with SMTP id t23-20020a1c7717000000b003fbdbd0a7eamr8370041wmi.37.1692042076983;
        Mon, 14 Aug 2023 12:41:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id k13-20020a7bc40d000000b003fe1cb874afsm15043180wmi.18.2023.08.14.12.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 12:41:16 -0700 (PDT)
Message-ID: <1ada88be-45db-1f38-5e08-daf4b544bb6b@linaro.org>
Date:   Mon, 14 Aug 2023 21:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 4/4] arm64: dts: fsd: Add Ethernet support for PERIC
 Block of FSD SoC
Content-Language: en-US
To:     Sriranjani P <sriranjani.p@samsung.com>, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, richardcochran@gmail.com,
        alexandre.torgue@foss.st.com, joabreu@synopsys.com,
        mcoquelin.stm32@gmail.com, alim.akhtar@samsung.com,
        linux-fsd@tesla.com, pankaj.dubey@samsung.com,
        swathi.ks@samsung.com, ravi.patel@samsung.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jayati Sahu <jayati.sahu@samsung.com>
References: <20230814112539.70453-1-sriranjani.p@samsung.com>
 <CGME20230814112625epcas5p1e1d488a590bfc10d4e2a06dcff166037@epcas5p1.samsung.com>
 <20230814112539.70453-5-sriranjani.p@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814112539.70453-5-sriranjani.p@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/08/2023 13:25, Sriranjani P wrote:
> The FSD SoC contains two instances of Synopsys DWC QoS Ethernet IP, one in
> FSYS0 block and other in PERIC block.
> 
> Adds device tree node for Ethernet in PERIC Block and enables the same for
> FSD platform.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-evb.dts      |  9 ++++
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 56 ++++++++++++++++++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi         | 29 +++++++++++
>  3 files changed, 94 insertions(+)

Looks duplicated.

Best regards,
Krzysztof

