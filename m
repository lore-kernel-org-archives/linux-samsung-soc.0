Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79616C4321E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Dec 2022 07:33:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbiLEHdp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Dec 2022 02:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbiLEHdo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 02:33:44 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49CF13D6B
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Dec 2022 23:33:42 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id s8so17180370lfc.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Dec 2022 23:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vKyvkeRamE9a3hWvsk2ihpAKYDCVRVxYyiAwylPFe8A=;
        b=LIKhtUFyXh0G/bghBM8oVR7yeeb5PKyfqo1/clecg5SD5xD+1TT3F0WFBAHDJDaQBH
         n0CK4GhDIB2CYYfcuYLAJ8nr5L5vrqYmAPQgk63FXei2LykNJkYmMMWbWjz7Q0kX7vos
         GERhXFSGxCv91XHcT5x5xhOKszlXTnrWDBT3kG1FgqGL3p93zbfERKbNj3zMHEoPtQ2A
         n91LV9CiX2paipVF1F+tKaSIkPSpSp+hMt5gCT8ZWclXhM9h+ryH4vhw5aAgJ+lWQ+1H
         4Ua4DzdBMBodlmaVl7JaSHhVOR69QKFryxHPeXuBu6k3fdRVhOYcGnYtopgi3Kxbt9my
         Ac5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vKyvkeRamE9a3hWvsk2ihpAKYDCVRVxYyiAwylPFe8A=;
        b=cPrTD+BprpeQlWtptdm5JI9gR/s5KySXVdStjtLbW2jZusVHrYk1E5kymKNSoCIfl8
         fOJfiNRcdtacw9XjCLUK+DH+Emf4iSN9eVD7zUblEH8NQ2StvC0nQ4R2C8zfjEIcl2tY
         JUc3HaxK11gOXtIP3WQi4PNWgzGQS+bDiRf3LHLBu2dUuAgYOnvnSJfvMy1/2vx/52qd
         3EhRBu6qjo2FJTdYE5NrdL5NBI4j2RQY4soSjsWcYUCb2/17yzRBAUvA+2V5oCR17rL+
         DSzWQ73zexNMXXDPDMuECAYFph1nZCUZf9Mv4YjZQ5cXrwS9NGMMLzPbPZhS9twj2ikj
         NVow==
X-Gm-Message-State: ANoB5pnB8DJfhaPqBwtjd6OByQGVS+CeP5xepwZ3bLXDdoBU7CNXY1gt
        UyJN/HCldVdTl5CDu/GnofpgnQ==
X-Google-Smtp-Source: AA0mqf5ikodifhglBYX/PfKt8BsPYKz7SE+18MCVYQBQHbRQFQs3Xt9PDn1r+0Ors1BkPLl4bYLNGQ==
X-Received: by 2002:ac2:46f7:0:b0:4b0:25f9:14f5 with SMTP id q23-20020ac246f7000000b004b025f914f5mr20568296lfo.506.1670225621140;
        Sun, 04 Dec 2022 23:33:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b0049ad2619becsm2028155lfr.131.2022.12.04.23.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 23:33:40 -0800 (PST)
Message-ID: <92df8e1d-eb7b-ec0b-264f-a1a090cececc@linaro.org>
Date:   Mon, 5 Dec 2022 08:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v1 2/2] usb: host: add xhci-exynos to support Exynos
 SOCs
Content-Language: en-US
To:     Jung Daehwan <dh10.jung@samsung.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
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
 <ec0ce90c-b165-d84f-340d-4973b65609b3@linux.intel.com>
 <f633b0f3-9fdb-8beb-7edf-7967c7c0c3d5@linaro.org>
 <20221205023413.GD54922@ubuntu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205023413.GD54922@ubuntu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/12/2022 03:34, Jung Daehwan wrote:

>>> Am I missing something here?
>>
>> Because it is not a driver for Exynos... it's a driver for wakelocks for
>> their specific Android use-cases which the manufacturer ships for their
>> Android devices. Due to Google GKI, they try to squeeze into upstream.
>> But this is huge misconception what should go to upstream and Samsung
>> does not want to keep discussing. They just send random patches and
>> disappear...
>>
>> Best regards,
>> Krzysztof
>>
>>
> 
> No. It's driver for Exynos. Currently It only has wakelocks but I will
> submit one by one. Please think as the first patch of exynos not
> squeezed.

That's not how upstream kernel development works... Your code has
nothing for Exynos. It's Android driver, not Exynos. If you say there is
something for Exynos it must be visible here. Wakelocks are not relevant
to Exynos, so after dropping them there would be empty stub in upstream
kernel which obviously cannot be accepted.

Best regards,
Krzysztof

