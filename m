Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF32ECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 14:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbiJXOeQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 10:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbiJXOdt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 10:33:49 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121F39AFFC
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 06:08:44 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id c23so5522701qtw.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2WxXBEhE9lmDiSCmtp6HlQFdsUIOok3Tbt3p22NXFQ=;
        b=pIjNTn/Fw5wWPAnx2/iV0f7mAvnR9IX0NCgHKJpazCJnQ1lUaI1x7+jTaz8VYmauFw
         9RqxCpRkKWJd0rFVRquaxty4jObK9YVXOa8B/ART4GgclBBJOiCLUvD6UkecvNvTkile
         Ql1kTwcznQdIkkerX139c4qhw/erTM55HQ9pbOj9I0/RwJtwvlh3lN+18e4GyNGwyzp3
         mH33QTClrMl467lrxdZ7cG5i9eC+l3SJ70c+d4lOhzQSMVlJMYEvZ6E1qskDNlYxbBRW
         tYGZ4Ht2h0l8C7iXxxoaMskAXr8pI/BeMKNAHkC1ZTdhH8k524eluQdJ0zLMClj5sVRK
         tYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2WxXBEhE9lmDiSCmtp6HlQFdsUIOok3Tbt3p22NXFQ=;
        b=F9aAAFi94v5I3lmWo4KMoDHOIY0mrjB/5yZdRkmsaI52p3x5HaGstXmFxlSHJ/jgg4
         yEf/La5j6nVlvNFQbltiEpKfOJehgUw2WDLwudmZG3HH3NO2NFZHg/5evA1gQOyEweZJ
         Nf6zkDTat9nBskC39CTDueH1FXae4DscNu0ourjGA2t/Wo0sRfjYqXk00jnWEchssns/
         LvznpM08plzDDXi+NYz6u5kfc3vM5l/0a1xx1ycZcTBV+MKwJUJO7MnCB6Kqpf79Mp+4
         4ZyOnGg+rSiXJMJi15zNqOY/CYtgZg6W8l+s2UctIaF5Yeepqbof/hb/crS+oPns/6Y9
         XUoQ==
X-Gm-Message-State: ACrzQf2Uh5RFEYChbea91E5BSu3JKb+ywd0/p9+tUfAWLWd+e3ym9wuY
        bxDIAgKQ/o1E38xj1CtozePi39pUl/X57A==
X-Google-Smtp-Source: AMsMyM6zKtB0VLD6JglF4BT8OXGL92tkP9rpSuRx3jzlARvuiFn8HIW3TcUaeoMq28LG3WQoVTOaKw==
X-Received: by 2002:a05:622a:15d1:b0:39c:f1da:fe0e with SMTP id d17-20020a05622a15d100b0039cf1dafe0emr27027912qty.662.1666616007083;
        Mon, 24 Oct 2022 05:53:27 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id y8-20020ac81288000000b00398a7c860c2sm12704392qti.4.2022.10.24.05.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:53:26 -0700 (PDT)
Message-ID: <78b09272-4184-b2d6-3849-a6e0e8a16255@linaro.org>
Date:   Mon, 24 Oct 2022 08:53:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 21/21] ASoC: samsung: remove unused drivers
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-21-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-21-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx SoC platform was completely removed, as were most of the
> s3c64xx based board files, leaving only the DT based machines as well
> as the MACH_WLF_CRAGG_6410 machine. All other board specific ASoC
> driver can can now be recycled.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

