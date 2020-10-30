Return-Path: <SRS0=Y9I5=EF=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C32C56201
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Oct 2020 07:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCC7D22228
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Oct 2020 07:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="R98yFfuA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgJ3Hue (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Oct 2020 03:50:34 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51795 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgJ3Hue (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:50:34 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201030074131euoutp01f159325a16f68b1c9d417d56b1851b2f~CtT0-tLMF1227612276euoutp01B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2020 07:41:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201030074131euoutp01f159325a16f68b1c9d417d56b1851b2f~CtT0-tLMF1227612276euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604043692;
        bh=XDGR6dKj73W1X+O2hoViONA9zRpX1Uo9ZrDI+gJiWcU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=R98yFfuAyip6VttOrTQJvBWBUT9Yu6d638gZAEqUOvmNj23zGCZL5OLS4jeKf1uVr
         HyfyeqHheQQfZigU2f2Q3m2NN63CNmtBb0hoDtt1hZgXqGk6LrZiWVOEw+8UsOKif2
         0sn92vrZIQdCH+RZmsPEeOE4f4x6Z6MZIyQdaRvI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201030074126eucas1p2ba5c28c4717b305ad248b49da23c5e2d~CtTwNw6mc2090620906eucas1p2e;
        Fri, 30 Oct 2020 07:41:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 12.FF.06456.6A3CB9F5; Fri, 30
        Oct 2020 07:41:26 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201030074126eucas1p2a8421b621aba14b104f5b0e5cf40a1c8~CtTv5qEYt2090620906eucas1p2d;
        Fri, 30 Oct 2020 07:41:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201030074126eusmtrp2ae3cd682ae00977f8c7943c47c93782f~CtTv5FL_n1449914499eusmtrp2R;
        Fri, 30 Oct 2020 07:41:26 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-3a-5f9bc3a6dcbf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A2.13.06017.6A3CB9F5; Fri, 30
        Oct 2020 07:41:26 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201030074126eusmtip1674faf3b14573191bfb1e50cdb13dc8a~CtTvgPv_c0497204972eusmtip1J;
        Fri, 30 Oct 2020 07:41:26 +0000 (GMT)
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
To:     Martin Juecker <martin.juecker@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <21eb4ba3-ec58-fba7-48cc-99e0c4024463@samsung.com>
Date:   Fri, 30 Oct 2020 08:41:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201029214030.GA72802@adroid>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djP87rLDs+ONzh5U9di/pFzrBb9j18z
        W5w/v4HdYsb5fUwWZ/5NZXFg9dg56y67x6ZVnWwenzfJBTBHcdmkpOZklqUW6dslcGVcvnCO
        veCKUMXmmwfYGhg/8nUxcnJICJhILN5ygBHEFhJYwSjx8LdDFyMXkP2FUaL3Tw8zhPOZUeLu
        6YNMMB1XGi+zQCSWM0rMa70EVfWeUWJzQxMbSJWwQKDE810fwTpEBMIkVkx6DWRzcDALhErs
        BlnBycEmYCjR9bYLrJxXwE5i4fPDYDaLgKrEj2WtLCC2qECSxN/Pf5ghagQlTs58wgIyhlNA
        R+LPx1iQMLOAvMT2t3OYIWxxiVtP5jOBnCMhMJldYvfsnewQR7sAHX2YBcIWlnh1fAtUXEbi
        /06Yhmag98+tZYdwehglLjfNYISospa4c+4XG8QDmhLrd+lDhB0lzrVuBAtLCPBJ3HgrCHEE
        n8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiXmCYxKs5B8NgvJO7OQvDMLYe8CRpZVjOKppcW5
        6anFhnmp5XrFibnFpXnpesn5uZsYgYnl9L/jn3Ywfr2UdIhRgINRiYfXQX52vBBrYllxZe4h
        RgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi
        4JRqYJx/vi/AY/nDz099HhwoblkbXHlH+emlbxUbYr1+dPy7tnHt6/1TxRO315m92v270Lkw
        6XZ8QK73DMOYlPQ7Vu/nJZnM2/Rhxd5dCosX/GxbybC6/ybftPc74l9+Lq+fn3Di8LSpEyOC
        D2ga/K3jnG3flr515npPq5e7Yhctv/j8q38gg1LOptlXlFiKMxINtZiLihMB4Klz3CgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7rLDs+ON1jxRdxi/pFzrBb9j18z
        W5w/v4HdYsb5fUwWZ/5NZXFg9dg56y67x6ZVnWwenzfJBTBH6dkU5ZeWpCpk5BeX2CpFG1oY
        6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GVcvnCOveCKUMXmmwfYGhg/8nUxcnJI
        CJhIXGm8zNLFyMUhJLCUUWLaydvsEAkZiZPTGlghbGGJP9e62CCK3jJKbN10GiwhLBAo8XzX
        RyYQW0QgTGJ/WycjiM0sECqxZPoFFhBbSKBeouNxK1icTcBQoustyCBODl4BO4mFzw+D2SwC
        qhI/lrWC1YsKJEm8vDCVCaJGUOLkzCdAcQ4OTgEdiT8fYyHGm0nM2/yQGcKWl9j+dg6ULS5x
        68l8pgmMQrOQdM9C0jILScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBMbStmM/
        t+xg7HoXfIhRgINRiYfXQX52vBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosP
        MZoC/TaRWUo0OR8Y53kl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODil
        GhiNzPtKLj7ae/lj8omzjpJLDroc5XtuunbCk7RPpwpOFOQ2Vx7y4pnp7d1euSNe8K76F7Zc
        i4x/S08eWdmz7I5oSodU5faFzfuuHnHJTP37fo/X6c4FfnkK8TozTWW492reP+E59eGJ4Ne6
        F2aXi3UwPtMU19gfM597fn9quEh+P2uqvm/xUX4lluKMREMt5qLiRADS6l6xuwIAAA==
X-CMS-MailID: 20201030074126eucas1p2a8421b621aba14b104f5b0e5cf40a1c8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201029214038eucas1p28c6a8ff78a7d1ec26648bccb950031b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201029214038eucas1p28c6a8ff78a7d1ec26648bccb950031b3
References: <CGME20201029214038eucas1p28c6a8ff78a7d1ec26648bccb950031b3@eucas1p2.samsung.com>
        <20201029214030.GA72802@adroid>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Martin,

On 29.10.2020 22:40, Martin Juecker wrote:
> On Tue, Oct 27, 2020 at 09:17:51AM +0100, Krzysztof Kozlowski wrote:
>> On Tue, Oct 27, 2020 at 12:27:09AM +0100, Martin Juecker wrote:
>>>>> +
>>>>> +	max77686: max77686_pmic@9 {
>>>>> +		compatible = "maxim,max77686";
>>>>> +		interrupt-parent = <&gpx0>;
>>>>> +		interrupts = <7 IRQ_TYPE_NONE>;
>>>>> +		pinctrl-0 = <&max77686_irq>;
>>>>> +		pinctrl-names = "default";
>>>>> +		reg = <0x09>;
>>>>> +		#clock-cells = <1>;
>>>>> +
>>>>> +		voltage-regulators {
>>>> Just "regulators" and no empty line after this.
>>>>
>>>> You should define all regulators here. If some are unknown, keep the
>>>> min-max the same as in driver.
>>>>
>>> I used the driver to read all the voltages, it also reads values for
>>> the LDOs that are not defined in the DT, so I have values for all of
>>> them setup by the bootloader. What I don't know is their name and what
>>> they are used for. Interestingly apart from two LDOs, the voltages did
>>> match exactly with those from the midas DT, so it could be very
>>> similar. The two non-matching were only off by 0.1V. How should I go
>>> about this?
>> Actually, let's skip the constraints (min-max) for unknown regulators.
>> Just add the entries with generic names, like:
>> arch/arm/boot/dts/exynos5410-odroidxu.dts
>>
>> I would not put here min-max constraints from bootloader because pretty
>> often it has only an initial setup for specific frequency - just to make
>> it booting.
>>
>> If you have the constraints (min-max, always on) from vendor sources,
>> you could add them.
>>
>> Best regards,
>> Krzysztof
> As all the missing regulators are not defined in the vendor sources, I
> have no constraints to work with.
>
> What I noticed when all the LDOs are defined, the device reboot
> behaviour is different. Instead of the usual 1-2 seconds for screen off
> and on again, it's now more like 10 seconds.

Then it looks that some regulators get turned off too early and shutdown 
sequence encounters timeout. You can try to find which regulator is 
responsible for that by adding 'always-on' property to those regulators 
and doing the reboot test. Once found you may either keep it as always 
on, or check in if its consumers are properly defined.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

