Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C8AC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 11:50:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7274120936
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 11:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="p2c21bKJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbgKELue (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 06:50:34 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47213 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730360AbgKELuc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 06:50:32 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201105115021euoutp0277388f68c816db853bf7d250f43bb037~Emky2UyJN0104901049euoutp02a
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 11:50:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201105115021euoutp0277388f68c816db853bf7d250f43bb037~Emky2UyJN0104901049euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604577021;
        bh=FvSTAw6d9kbyhdAicWbWR8jqchMAdlTjQxV1cjmwE6g=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=p2c21bKJMqkMqDJSQPSxW8tmLiMfoANfyWwO+jLDccSIOJzBpixWAX+GCb8k4JJhu
         WNE41wzo54mvxFYxwBoWjxXMrJt1PwQ76akrbCLn/MbY1eOmNk+zOOSV0oSELI+Bsb
         3emwMAALHJ9rhB+rR3Qwg/HeMMF8vbm7CALvsmXo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201105115016eucas1p1f51babf758a835d1e75168b42b152bfd~Emkt7mqFQ2968929689eucas1p1N;
        Thu,  5 Nov 2020 11:50:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id C3.CB.06318.8F6E3AF5; Thu,  5
        Nov 2020 11:50:16 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201105115015eucas1p2508f3f5aec7de700a8435097c845e371~Emktnusfw0490904909eucas1p2f;
        Thu,  5 Nov 2020 11:50:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201105115015eusmtrp2dfc0d36a28f95235947bf21399a88fb0~EmktnD3QP0662606626eusmtrp2H;
        Thu,  5 Nov 2020 11:50:15 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-78-5fa3e6f8ec37
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.CE.06017.7F6E3AF5; Thu,  5
        Nov 2020 11:50:15 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201105115015eusmtip13f5d05f1852e9e9527e149865c178310~EmktUSrJw1880618806eusmtip1m;
        Thu,  5 Nov 2020 11:50:15 +0000 (GMT)
Subject: Re: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note
 boards
To:     Martin Juecker <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, kgene@kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <2fe97134-7044-cd86-2728-8b6b648efe68@samsung.com>
Date:   Thu, 5 Nov 2020 12:50:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103103856.GA7770@adroid>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djPc7o/ni2ON9jymNti/pFzrBb9j18z
        W5w/v4HdYsb5fUwWZ/5NZXFg9dg56y67x6ZVnWwenzfJBTBHcdmkpOZklqUW6dslcGWcblnP
        VNAuVLHz6X+WBsYevi5GTg4JAROJvV/us3YxcnEICaxglLi8aA2U84VR4ueL58wQzmdGiRfr
        PrDAtOxet5sZxBYSWM4oseoOH0TRe0aJmxsfgyWEBQIlnu/6yARiiwjoSnT03mEDsZkFaiTO
        7dvCCGKzCRhKdL3tAopzcPAK2Eks2KIEEmYRUJHYMWEx2C5RgSSJv5//gI3kFRCUODnzCVic
        U0BbYvvDnYwQI+Ultr+dwwxhi0vcejKfCeQeCYHJ7BIdd56yQhztIvHp3QRGCFtY4tXxLewQ
        tozE/50wDc2MEg/PrWWHcHqAgdE0A6rDWuLOuV9glzILaEqs36UPEXaUuP7zMTtIWEKAT+LG
        W0GII/gkJm2bzgwR5pXoaBOCqFaTmHV8HdzagxcuMU9gVJqF5LVZSN6ZheSdWQh7FzCyrGIU
        Ty0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMLaf/Hf+6g3Hfn6RDjAIcjEo8vA4ci+OFWBPL
        iitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILU
        IpgsEwenVANjQ0Ig0w/ZS7JfNimcEIu1UOG/c+rk4UYjq5krl+QcW9UbdLR9rVxgb9KJpf/9
        w2W57gtkhf5rWDjRdG+YsKy8Y4Gu2GV+Rfso1zuSxRYShQ84+reUNnG7tHTu0LpUfevZsfvp
        guy75L6zr+i9wLvPYXVb0FmdLAGffT7aFbNNLb/I6mbk2CixFGckGmoxFxUnAgASMJhGKQMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7rfny2ONziz0NRi/pFzrBb9j18z
        W5w/v4HdYsb5fUwWZ/5NZXFg9dg56y67x6ZVnWwenzfJBTBH6dkU5ZeWpCpk5BeX2CpFG1oY
        6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GWcblnPVNAuVLHz6X+WBsYevi5GTg4J
        AROJ3et2M3cxcnEICSxllLg18xczREJG4uS0BlYIW1jiz7UuNoiit4wS2/beYwJJCAsESjzf
        9RHMFhHQlejovcMGYjML1EjsX/GHFaLhIZPEqm2zwRJsAoYSXW9BJnFw8ArYSSzYogQSZhFQ
        kdgxYTELiC0qkCTx8sJUsJm8AoISJ2c+AYtzCmhLbH+4kxFivpnEvM0PmSFseYntb+dA2eIS
        t57MZ5rAKDQLSfssJC2zkLTMQtKygJFlFaNIamlxbnpusZFecWJucWleul5yfu4mRmA0bTv2
        c8sOxq53wYcYBTgYlXh4HTgWxwuxJpYVV+YeYpTgYFYS4XU6ezpOiDclsbIqtSg/vqg0J7X4
        EKMp0HMTmaVEk/OBkZ5XEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNT
        qoGR7V9f2CfTilO8U6yuvTx7euNZvVuVBza85+TYqP6hv3emy9tF3VueTjXf8Pu3gaf1prTf
        vf9iPEvCA5I7fu34lCjYm7NUZ3k6R7GuqWpK6E7PRQWS/mcrVveyNhx7JxZdLpF2ZpXPi+eN
        XAnzC6IrL/1Ou7Sf6/nKFa2GawqsNi5O26OgUtaoxFKckWioxVxUnAgA461Z3LwCAAA=
X-CMS-MailID: 20201105115015eucas1p2508f3f5aec7de700a8435097c845e371
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201102212129eucas1p1957c9dd5d6c1ebf7c340271a5e501c5b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201102212129eucas1p1957c9dd5d6c1ebf7c340271a5e501c5b
References: <20201031175836.47745-1-martin.juecker@gmail.com>
        <20201031175836.47745-3-martin.juecker@gmail.com>
        <20201102191845.GA64695@kozik-lap>
        <CGME20201102212129eucas1p1957c9dd5d6c1ebf7c340271a5e501c5b@eucas1p1.samsung.com>
        <20201102212118.GA2366@adroid>
        <0af4946e-a573-ad5a-5558-de439d49434f@samsung.com>
        <20201103103856.GA7770@adroid>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On 03.11.2020 11:38, Martin Juecker wrote:
> On Tue, Nov 03, 2020 at 10:51:08AM +0100, Marek Szyprowski wrote:
>> Hi Martin,
>>
>> On 02.11.2020 22:21, Martin Juecker wrote:
>>>> ...
>>>>> +
>>>>> +&fimd {
>>>>> +	pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
>>>>> +	pinctrl-names = "default";
>>>>> +	status = "okay";
>>>>> +
>>>>> +	display-timings {
>>>>> +		timing0 {
>>>>> +			clock-frequency = <66666666>;
>>>>> +			hactive = <1280>;
>>>>> +			vactive = <800>;
>>>>> +			hfront-porch = <18>;
>>>>> +			hback-porch = <36>;
>>>>> +			hsync-len = <16>;
>>>>> +			vback-porch = <16>;
>>>>> +			vfront-porch = <4>;
>>>>> +			vsync-len = <3>;
>>>>> +			hsync-active = <1>;
>>>>> +		};
>>>>> +	};
>>>> What happened with Marek's comment about this?
>>>>
>>> Should have mentioned it in the introduction mail. I had a look at the
>>> simple panel driver and it's not enough for the display in the p4note. I
>>> asked Marek in IRC whether it's ok to have this in a separate patch set
>>> to have a fully working display and he agreed.
>> Yes, I agreed that the display can be added later in a separate patch.
>> However in such case I would simply remove the whole fimd node now.
>> Without a panel it is a bit useless imho. With a proper panel driver you
>> will also get rid of the timings subnode, so there is no point adding it
>> now.
>>
> Removing the fimd node (or the display timings) would break the DRM and
> display output though. The display is working but missing proper GPIO
> handling and the possibility to adjust brightness right now. As it is
> connected to the LCD power domain, it's still turning on and off as
> expected as it is setup by the bootloader. I know this isn't a great
> solution, but I'm already working on the LCD driver. Not sure when it
> will be done though.
>
> The display timings are read in exynos_drm_dpi.c in the exynos_dpi_probe
> method. As far as I understand, you can either provide the timings in
> the fimd node itself or in a connected panel.
>
> If this is not intended, I can of course remove the configuration.

If it works already then imho we can keep it for now and then adjust 
later when the proper panel driver is ready.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

