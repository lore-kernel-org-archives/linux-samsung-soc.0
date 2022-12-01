Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B13C43217
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Dec 2022 10:33:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiLAKdq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 1 Dec 2022 05:33:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbiLAKdX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Dec 2022 05:33:23 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125DC57B5D
        for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Dec 2022 02:33:04 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id l8so1344490ljh.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Dec 2022 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwrQbOBiKU75Cv/78jGn299AlgNFY94s/4aL2Jtvkug=;
        b=U2APtYn8ADfJPtXk2bBZ5QmzwpCuGGm0/sHSwMgkMZ8K1wnozc+9t4sJxA6mcz7fdk
         LVh8POmMC5P6w/O/nSl1+2J5iZOWSAaT29DCXdfhTLapHWmBO0gDwMwxtnYWvQideWqn
         NWTHIwNQHyZQQxrdxXKva0i1Br+OPhz1u5pfjPgyZLftALrVzuvA5yWuFcJmfhkdB80c
         08Va70e3GGxA2DIpKEnLhObXCiZk0e1R3sR1U3LFM378eyMgTlEcb3YYGQQ6OtkBkz8o
         aAgcEpgVoZCS4fL5lb6U6xnmYwUnbB50riHTvUWcyb5iEMv929kNm0pVz9i7Zm/DKCHS
         AZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwrQbOBiKU75Cv/78jGn299AlgNFY94s/4aL2Jtvkug=;
        b=zJjnP0SK5/DEpdEORX8p3Wj2P07z4XPmmpRQPZryaKu8z0FHKbvEvT6Zu7p3q9/t++
         +fOX0Swwri1u2F4D8dMbgBAKg6y5z5nDbYwXGfVu8lgRmR1mhVE4KnmgW5iE2rmSwLSN
         0941oMNbgWprWB51NrxPB48kW87qOE7g+dbNFuHYHdFTxSZxoUe0f/M+FlZFuqN+Ippq
         eNTFJEJ5uD7oPHA5Pk43HO1ZsC6MfRL2z9rI7+QgMkCk8AHyH8EHalYwnL6Sqgu7CY2y
         EBvDyytqbyCfKv1fUGul157FvBbvcTVwFSBaUgox1/U44pLs24oouay1dOyKs4VdXAqf
         G6zQ==
X-Gm-Message-State: ANoB5pmJCnRubF6xi58IC3F4CfYFxf9fgDDyGZilo3mkNWkRfJZoBhDZ
        ssBjJ3TsqD4jRO9vH5K047buww==
X-Google-Smtp-Source: AA0mqf4un9UBXikeqgMV0WRJT2NbBA+SqC0tiaRYqi1zzzkW5X1ace3hDaZ0+z+IqFfmFyQAeFvOrg==
X-Received: by 2002:a2e:a263:0:b0:276:be89:5616 with SMTP id k3-20020a2ea263000000b00276be895616mr13844272ljm.347.1669890782423;
        Thu, 01 Dec 2022 02:33:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p21-20020a2eba15000000b002796fb63dbdsm356393lja.13.2022.12.01.02.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:33:02 -0800 (PST)
Message-ID: <d00b6f5e-0966-3ab8-d559-b0f9e843845c@linaro.org>
Date:   Thu, 1 Dec 2022 11:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v1 2/2] usb: host: add xhci-exynos to support Exynos
 SOCs
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daehwan Jung <dh10.jung@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Colin Ian King <colin.i.king@gmail.com>,
        Artur Bujdoso <artur.bujdoso@gmail.com>,
        Juergen Gross <jgross@suse.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, sc.suh@samsung.com,
        taehyun.cho@samsung.com, jh0801.jung@samsung.com,
        eomji.oh@samsung.com
References: <1669860811-171746-1-git-send-email-dh10.jung@samsung.com>
 <CGME20221201021942epcas2p2429ed37e1f6146b6e1a5bef23141b3f7@epcas2p2.samsung.com>
 <1669860811-171746-3-git-send-email-dh10.jung@samsung.com>
 <Y4hgnxGMEuizJumr@kroah.com>
 <c524cba6-4438-461a-ab05-9325fe09f832@app.fastmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c524cba6-4438-461a-ab05-9325fe09f832@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/12/2022 10:01, Arnd Bergmann wrote:
> On Thu, Dec 1, 2022, at 09:06, Greg Kroah-Hartman wrote:
>> On Thu, Dec 01, 2022 at 11:13:31AM +0900, Daehwan Jung wrote:
>>> This driver works with xhci platform driver. It needs to override
>>> functions of xhci_plat_hc_driver. Wakelocks are used for sleep/wakeup
>>> scenario of system.
>>
>> So this means that no other platform xhci driver can be supported in the
>> same system at the same time.
>>
>> Which kind of makes sense as that's not anything a normal system would
>> have, BUT it feels very odd.  This whole idea of "override the platform
>> driver" feels fragile, why not make these just real platform drivers and
>> have the xhci platform code be a library that the other ones can use?
>> That way you have more control overall, right?
> 
> Agreed, having another layer here (hcd -> xhci -> xhcd_platform ->
> xhcd_exynos) would fit perfectly well into how other SoC specific
> drivers are abstracted. This could potentially also help reduce
> the amount of code duplication between other soc specific variants
> (mtk, tegra, mvebu, ...) that are all platform drivers but don't
> share code with xhci-plat.c.
> 
> Alternatively, it seems that all of the xhci-exynos support could
> just be part of the generic xhci-platform driver: as far as I can
> tell, none of the added code is exynos specific at all, instead it
> is a generic xhci that is using the wakeup_source framework.

There is nothing here Exynos SoC related, it's only for the purpose of
using wakelocks. We do not use wakelocks in other drivers, so I wonder
what makes this one so special... It does not look like generic approach
to the problem (which is BTW not really described in commit).

Best regards,
Krzysztof

