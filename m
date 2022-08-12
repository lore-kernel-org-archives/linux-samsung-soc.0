Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB15C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Aug 2022 09:54:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237546AbiHLJys (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 12 Aug 2022 05:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237207AbiHLJyX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 Aug 2022 05:54:23 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B042AB044
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Aug 2022 02:54:22 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id v10so436799ljh.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Aug 2022 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=KQyn0RodOS4Z7mbBmKSGk+3CQFuX7185+IAFDULFYP0=;
        b=dcsz4nm0oGvcqsjbArKZf7DZBrgiFTodubs9Q5huSVd0mOlW+WPVD3dDkgF1U+bJYU
         MxVA2yd3eYTDERH7J7yg6d00iBcYKitRED90zKLHawYjpdCOVcc+nFiPfd2Lu0OTncuX
         Wu1NCk9KB179SuHh734VldSCKuj1vcT6KixYnIdPFBBwkMAOL+jPkW4rG+xu0p/F21iS
         w7ZUsOVSA+GixrPfV+X83osnGxZRC8PnDi9K4KR2zpRXbAeoi/G7073jMt2YNe61ezyc
         kasbox8P1yPi8mlcRdtnJdFZdDITgCFFOFWwnVK5TeYq4hnwM2EQvJhAMsE9K2nfZgSG
         Q7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KQyn0RodOS4Z7mbBmKSGk+3CQFuX7185+IAFDULFYP0=;
        b=rEUrkFB56kGZV9Nz3+KCMGEgw2zbV3C2W7EVd1pTrz6ORFzuqKvK9aE5RwhNQsLS6B
         729sOSzQ+9I+ncBYmZIhL03eBrFEoWEUfWw5/mFqvuTpYx9P4L70XmVlvknEU52wqCQw
         cevTCrxQRgoD4BQavimatHqfnXN2cmSy1u6JHolSTDhxPtmaRtfHQr6Rh3sPQzSnX8v1
         +IXPHJNV80Yn2k8A6mVio9nGo0110e6ATNa/Hd+4RqY4lMI/jIJAOoG0MAkkOtmxDezJ
         gedoHqd37gApG8Z+CGricmydnmxtSHQIAEbz2XtjhduwkgSeU1LNvu48wXlJN1SfP43o
         pPFw==
X-Gm-Message-State: ACgBeo37oWXPjI4kNB+8B1YyQNNkYgpDnWIpretKXPO25p1C1BpI/Z5z
        9ChvE+6h+JLrVw1W1HMMmMFJoQ==
X-Google-Smtp-Source: AA6agR6p3V0W44ksExZdzwIE1+7JtpcHI6uB/he93FBDIY49ZArtZkgflUJI8528C/Vlyfd2QmpCHA==
X-Received: by 2002:a2e:321a:0:b0:25f:e93a:eb2f with SMTP id y26-20020a2e321a000000b0025fe93aeb2fmr890836ljy.493.1660298060648;
        Fri, 12 Aug 2022 02:54:20 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b0048b2915471bsm149266lfc.306.2022.08.12.02.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 02:54:20 -0700 (PDT)
Message-ID: <7beeeba5-35ec-7159-1313-6fc8d4f975af@linaro.org>
Date:   Fri, 12 Aug 2022 12:54:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 6/9] clk: samsung: exynos850: Implement CMU_IS domain
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220809113323.29965-1-semen.protsenko@linaro.org>
 <20220809113323.29965-7-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220809113323.29965-7-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/08/2022 14:33, Sam Protsenko wrote:
> CMU_IS clock domain provides clocks for IS IP-core (Image Signal
> Processing Subsystem). According to Exynos850 TRM, CMU_IS generates
> CSIS, IPP, ITP, VRA and GDC clocks for BLK_IS.
> 
> This patch adds next clocks:
>   - bus clocks in CMU_TOP needed for CMU_IS
>   - all internal CMU_IS clocks
>   - leaf clocks for IS IP-core, CSIS (Camera Serial Interface Slave),
>     D_TZPC (TrustZone Protection Controller), CSIS DMA, GDC (Geometric
>     Distortion Correction), IPP (Image Preprocessing Processing core),
>     ITP (Image Texture Processing core), MCSC (Multi-Channel Scaler),
>     VRA (Visual Recognition Accelerator), PPMU (Platform Performance
>     Monitoring Unit), SysMMU and SysReg
> 
> IS related gate clocks in CMU_TOP were marked as CLK_IS_CRITICAL,
> because:
>   1. All of those have to be enabled in order to read
>      /sys/kernel/debug/clk/clk_summary file

This sounds exactly like previous ISP clock hangs:
https://lore.kernel.org/all/20171011092515.1698-1-m.szyprowski@samsung.com/

It looks like missing power domain references and your CLK_IS_CRITICAL
is not correct. These are not critical clocks.

>   2. When some user driver (e.g. exynos-sysmmu) disables some derived
>      leaf clock, it can lead to CMU_TOP clocks disable, which then makes
>      the system hang. To prevent that, the CLK_IS_CRITICAL flag is used,
>      as CLK_IGNORE_UNUSED is not enough.

These are not critical clocks and usage of CLK_IS_CRITICAL is not
appropriate. This looks like the same has as with other ISP, so it
should be handled in similar way.

Best regards,
Krzysztof
