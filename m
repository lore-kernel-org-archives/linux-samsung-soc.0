Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88960C7EE22
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 May 2023 15:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235628AbjEIPJR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 May 2023 11:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234838AbjEIPJQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 May 2023 11:09:16 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2333540C4
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 May 2023 08:09:14 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94a34a14a54so1190459466b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 May 2023 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683644952; x=1686236952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tATEBdv4Th3DWwuFsgkk5JRRhiNVws60MF7WAh3f9OA=;
        b=LxlKoqbJvtHvqRAP+5d1Zc4WsW/fQEjxk4Zo0ePXLJUaoteB0UIVpaE6RxfEIyecVI
         yvWdL8Rmr43ob8WRJ6CnTRZBHflbusJfIe9zUouR4zrxZpJFsAWBcw2YR8C/ZSnS7KM3
         I4eze3ai0IetLTgahiZjJwzIPN/AbjDQQ/vAuAFTaxc3O+MnXNJB51gZh6X/OZ4NJVUJ
         pyqDbJR09sO+Omr/5aYLvqBXBcmRhKscfSXD6GDE0uSuxT+F9FK54O1vPBOeKHZ9NEVd
         UfLJN+eeIAEPbxNPB5yP29XfanRH82GEQD8ni5Tqpa5aIbwHt4xIY9bAJtQoAgXCS3c9
         szyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644952; x=1686236952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tATEBdv4Th3DWwuFsgkk5JRRhiNVws60MF7WAh3f9OA=;
        b=k73WhImVFgGeQImp1vzchsrc7voE/wgoKVyV2vGtYgr6SQziIfQAUVO0dVh5/zqbuf
         bwlyWy7ugtXJP3tFCgTFtfljS1BR6u7zON/lqCMgpgBgpGE0ToL5e+zGC4u4nVy51U3c
         DUvzdp79WYQY2B8d13jVl9xtbEhM/FatZPVTCnvIjQYeYgHCedzEYXUk91/tzqgY4oxo
         vNHwKvpHV8P8lChPuAaUHmLPYSd94K0zRI4XBcudpBXQ9rc0brvWxMuyV/+s1rnvosOw
         doEHQMrKyCPmJqMUwpS7S58lVJkDAh+tyIMJvMYofHrgKWUadbUmieu+aibVMVFRCdTN
         6vSA==
X-Gm-Message-State: AC+VfDyq16DBX20dAYm/X8xE8Jfx+vSB6aHxlNl5nCO40yJVWCEno2ik
        NJSkqcFN0bfPshSIv0pOIup5Brldta6mRIsCYSo=
X-Google-Smtp-Source: ACHHUZ5AUxnY+ofHq7XE1lfTol5XodnxYeU9cTipQ0TLkFDHErn5WJkRlbVeZNQgu6/IX557sedtLg==
X-Received: by 2002:a17:906:dac8:b0:94e:e97b:c65 with SMTP id xi8-20020a170906dac800b0094ee97b0c65mr11674604ejb.60.1683644952557;
        Tue, 09 May 2023 08:09:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id h8-20020a1709060f4800b009600ce4fb53sm1424179ejj.37.2023.05.09.08.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 08:09:10 -0700 (PDT)
Message-ID: <b5f58eb5-eefd-9dc1-91bb-67326be70f98@linaro.org>
Date:   Tue, 9 May 2023 17:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 62/89] i2c: s3c2410: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-63-u.kleine-koenig@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508205306.1474415-63-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/05/2023 22:52, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

