Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B37C05027
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 12:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236668AbjAZMXA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 07:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjAZMW7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 07:22:59 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A5D14496
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 04:22:58 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id z5so1589261wrt.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 04:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9jCz8bwI5R+LQKVyG5YB8yhLEVXKjuwf/nVOd+B04Jw=;
        b=IbkRAASlFsaYc62Nt/6beskwtWXG2NfZ7awVSs47E9IGwdyP1x+OtreME+vVLF5X1M
         IdCYtdJZuM8vrss97L+UnsmcWBkxoPkETqkatwl3Aavg/ezq1ndECOchyS0Is/NJIlGN
         tEk0mvwSxPVVaQyB5dK/pQd5ffbckyxPIr8XcanOQcKTvEishFqB3SzECyCGHXiz4fDx
         IJRIG9eVxgmppOUb7LWV/QG1DL/07/Cxe4gKigXZzka9mn6TjOnI8StUsjEWkBVdN5mI
         PnjKiRAnKjjRJFOaU2n/9BGOy0wm1q3eZg9VO2P3RrkX2Q2hTcSYxpLSpXegvgEhPtsN
         +QBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jCz8bwI5R+LQKVyG5YB8yhLEVXKjuwf/nVOd+B04Jw=;
        b=J0WElb8XAUyupvAiJ6hf+BBS476uqwNZl7s/D8W7Zv/62Ba5dVAbqKw9Yn/gsoK79v
         HjZSkscxs3lybagqUq1+gBg2qJTsBOgcbC8CkMnmzAw/eJIeRp8Z7bk7UzxjC+Kg+ogl
         PAYG38dI/PTDsmURAo/LCtx4CU7bf9UgjZGLSdisqY4mZl7lfdAYsJJD6ZnNHHidUduK
         M8MudbNRWZsAZKGmVWus4KCDwTfBgKwADsIDshIY1NGBNnnLCB6RdkuuSY7sOTsL0ZRH
         4XXPcAh5qnTDNto5j94flaiuVth2CN4zGQud5Bg2883aDf04+OeeG0f7m+6x70BFOT64
         jixw==
X-Gm-Message-State: AFqh2kqa9ZFKICT/Xm6A0KfDGzGW3yQVxtAGlYCNrkXtZ5hKa3+DFZyH
        GvRQU9HHNSMPOa9a0ns7/arCrA==
X-Google-Smtp-Source: AMrXdXvuKEX1GUGVtQAv3Ko7/x0Bcn30b3FvII6BuHI99hRl10j2heoqamHq8cyNF9Vg7swYnAXoNA==
X-Received: by 2002:a5d:6202:0:b0:2bd:bb5f:6a9f with SMTP id y2-20020a5d6202000000b002bdbb5f6a9fmr29136888wru.67.1674735777007;
        Thu, 26 Jan 2023 04:22:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d5092000000b002bdd8f12effsm1196384wrt.30.2023.01.26.04.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 04:22:56 -0800 (PST)
Message-ID: <0807a4ab-c544-2695-67d4-df9a3b1de4cf@linaro.org>
Date:   Thu, 26 Jan 2023 13:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 0/6] ARM: dts: add mmc aliases for Exynos devices
To:     Henrik Grimler <henrik@grimler.se>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230126103828.481441-1-henrik@grimler.se>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126103828.481441-1-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/01/2023 11:38, Henrik Grimler wrote:
> It is convenient to have fixed mmcblk numbering of the eMMC and
> sdcard, and with these aliases all Exynos 4 and 5 devices (and
> probably Exynos 3, but I do not have one of those boards so cannot
> verify) will have the eMMC as mmc0 and sdcard as mmc2.
> 
> I also removed sdhc aliases, as they should not be needed after [1] as
> I understand it.
> 
> [1] https://lkml.kernel.org/lkml/20211124184603.3897245-1-john@metanate.com/

Marek sent the same in the past:
https://lore.kernel.org/all/?q=%22exynos%3A+Use+fixed+index+for+the+MMC+devices%22

The patches are fine for me except, that these actually do not belong to
DTSI. Aliases for board or user-exposable interfaces are actually board
specific and each board should customize the ones it uses.

Best regards,
Krzysztof

