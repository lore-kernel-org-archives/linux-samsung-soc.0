Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6962C00A89
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 16:22:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 769DE2222B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 16:22:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FaLpe9gx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgKBQWu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 11:22:50 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38175 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgKBQWt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 11:22:49 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201102162238euoutp020a322c36962f692a1d3faf712ea88eca~DvWrI7gRI1741817418euoutp02F
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2020 16:22:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201102162238euoutp020a322c36962f692a1d3faf712ea88eca~DvWrI7gRI1741817418euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604334158;
        bh=Bgg3uuMxFaQqcy+bWukxkeEsZN+mUG0FeeQiozXgDTA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=FaLpe9gxSTe/MAAS9E7K6qTzFyrnopv7fLjj53AiVzxpA+ljB5Hh/mk2yaqSMwUsd
         hyMuPGmkMUUYBh/LKe2fPlj6wAfoCS8AhMeN5ckWTgGyjibuCL5ZFuZ2VbbRDYiOiW
         NELDQmW+tXlhgsHpYkKx2eS+ZklyrHZry20Td9Vc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201102162228eucas1p268bed6f69c9345e9b372692d01b12502~DvWhh_gIz2271222712eucas1p2U;
        Mon,  2 Nov 2020 16:22:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CD.AB.06456.44230AF5; Mon,  2
        Nov 2020 16:22:28 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201102162227eucas1p11317000bee8117a3319cdfde281b3ebf~DvWhGKXXF1324913249eucas1p1_;
        Mon,  2 Nov 2020 16:22:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201102162227eusmtrp1f5a7423b42ca5d55a8e00fd77035afb6~DvWhFdv6-2105521055eusmtrp1Y;
        Mon,  2 Nov 2020 16:22:27 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-10-5fa0324481a0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 39.F7.06314.34230AF5; Mon,  2
        Nov 2020 16:22:27 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201102162227eusmtip206c5570a4c27dc457d985fe34998c6f2~DvWgjgkXI0500405004eusmtip2X;
        Mon,  2 Nov 2020 16:22:27 +0000 (GMT)
Subject: Re: [PATCH v2] ARM: dts: exynos: Add a placeholder for a MAC
 address
To:     Anand Moon <linux.amoon@gmail.com>,
        =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <5ecd2e6d-6aaf-bff5-c000-2c56086ed95b@samsung.com>
Date:   Mon, 2 Nov 2020 17:22:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CANAwSgSvH+q21Tj9NijPa87ju+1LOJ07-is1Sucx1y5ggT6zCA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djPc7ouRgviDZa28VpsnLGe1WL+kXOs
        Fv2PXzNbnD+/gd3i5qEVjBabHl9jtbi8aw6bxYzz+5gs1m28xW7RuvcIuwOXx85Zd9k9Nq3q
        ZPPYvKTeo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDLu3Kwt6BOt+HV5BXMD40f+LkZODgkB
        E4nfzXeYQWwhgRWMEj/npXYxcgHZXxgl3n7rZodwPjNK9DyaDlTFAdZx9IQ9RMNyoKLZ6RA1
        7xkltjV+ZAVJCAv4S2xsu8oEYosIJEucfb8EbBCzwB0mia7Xu1hAEmwChhJdb7vYQGxeATuJ
        Q+9mg53BIqAi0XBgLtggUYEkib+f/zBD1AhKnJz5BKyXUyBQ4vzbZWBxZgF5ieats6FscYlb
        T+YzgSyTEDjGLrFp83JGiD9dJM5fXsEEYQtLvDq+hR3ClpE4PbmHBaKhmVHi4bm17BBOD6PE
        5aYZUN3WEnfO/WID+Z9ZQFNi/S59iLCjRPvVLayQYOGTuPFWEOIIPolJ22ChxSvR0SYEUa0m
        Mev4Ori1By9cYp7AqDQLyWuzkLwzC8k7sxD2LmBkWcUonlpanJueWmyYl1quV5yYW1yal66X
        nJ+7iRGYnE7/O/5pB+PXS0mHGAU4GJV4eA8Iz48XYk0sK67MPcQowcGsJMLrdPZ0nBBvSmJl
        VWpRfnxRaU5q8SFGaQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2My/vqL33//0xXgqOo
        dNMHQ+FNXDHbp7C/lJ29ib9WlD1XdbNar81rr1VHJx97GzbPJmcvJ+ulaSyBpaZ/N9zOT5pn
        vElkrZ7R4pPWp+W/GSpGftr1I7fd6XWpefc8Y678JbKJUap7V/zaZnbp1gu+0JkNxt3/hUrO
        +N0LUE399lo19rdQU89jJZbijERDLeai4kQAkfMDKEoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7rORgviDY490bfYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrNt4i92ide8Rdgcuj52z7rJ7bFrV
        yeaxeUm9R9+WVYwenzfJBbBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp
        29mkpOZklqUW6dsl6GXcuVlb0Cda8evyCuYGxo/8XYwcHBICJhJHT9h3MXJxCAksZZR4Ous2
        cxcjJ1BcRuLktAZWCFtY4s+1LjaIoreMEj9WzwNLCAv4Svy5tIcNxBYRSJZofv2LFaSIWeAe
        k8T15U0sEB0dTBJPpnWyg1SxCRhKdL3tAuvgFbCTOPRuNtg6FgEViYYDc8GmigokSby8MJUJ
        okZQ4uTMJywgNqdAoMT5t8vA6pkFzCTmbX4IZctLNG+dDWWLS9x6Mp9pAqPQLCTts5C0zELS
        MgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5mxiBEbnt2M/NOxgvbQw+xCjAwajEw3tA
        eH68EGtiWXFl7iFGCQ5mJRFep7On44R4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5gs8kri
        DU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MMZ9/1R4n+M549qGjBVe
        2gU7dL59rswxeHi24KfQy9xEjYLl2mYvvTYziVre1/I0dDm1gbPNJIa99UVwiGWKnbzbmdSD
        +wUy4v6++Fx8T+HXI++Juyb5snlcmu/ezu6+ZPq27zZM4dOmr2I6uLZzSWfH+f6UBzzzXKYH
        eexYcObLEqHub9FPVJVYijMSDbWYi4oTAZmhYUbeAgAA
X-CMS-MailID: 20201102162227eucas1p11317000bee8117a3319cdfde281b3ebf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0
References: <CGME20201001135310eucas1p273e3799cec0ebb29891c1b7db38685e0@eucas1p2.samsung.com>
        <20200930143151.23961-1-l.stelmach@samsung.com>
        <20201001135254.28178-1-l.stelmach@samsung.com>
        <CANAwSgSvH+q21Tj9NijPa87ju+1LOJ07-is1Sucx1y5ggT6zCA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Anand,

On 01.11.2020 15:07, Anand Moon wrote:
> Hi Lukasz,
>
> On Thu, 1 Oct 2020 at 19:25, Łukasz Stelmach <l.stelmach@samsung.com> wrote:
>> Add a placeholder for a MAC address. A bootloader may fill it
>> to set the MAC address and override EEPROM settings.
>>
>> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
>> ---
>> Changes in v2:
>>   - use local-mac-address and leave mac-address to be added by a bootloader
>>
>>   arch/arm/boot/dts/exynos5422-odroidxu3.dts | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> index db0bc17a667b..d0f6ac5fa79d 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>> @@ -70,3 +70,21 @@ &pwm {
>>   &usbdrd_dwc3_1 {
>>          dr_mode = "peripheral";
>>   };
>> +
>> +&usbhost2 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +
>> +       hub@1 {
>> +               compatible = "usb8087,0024";
>> +               reg = <1>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               ethernet: usbether@1 {
>> +                       compatible = "usb0c45,6310";
>> +                       reg = <1>;
>> +                       local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
>> +               };
>> +       };
>> +};
>> --
>> 2.26.2
>>
> Thanks for this patch, can you share some example on how to set the
> mac address via u-boot bootargs

A little bit hacky script to set permanent board unique MAC address:

# setexp.b u0 *0x10000014; setexp.b u1 *0x10000015; setexp.b u2 
*0x10000016; setexp.b u3 *0x10000017; setenv ethaddr 
0:0:${u0}:${u1}:${u2}:${u3}; setenv usbethaddr ${ethaddr};

Then if there is proper ethernet0 alias set, u-boot will then 
automatically save the configured MAC address to the device tree. I've 
just check this on recent u-boot v2020.10 and Odroid U3 board.

Lukasz will send updated patch soon (with proper alias entry).

If you want to hack setting MAC address manually, this will work with 
the current patch:

# setexp.b u0 *0x10000014; setexp.b u1 *0x10000015; setexp.b u2 
*0x10000016; setexp.b u3 *0x10000017; fdt addr ${fdtaddr}; fdt set 
/soc/usb@12110000/hub@1/usbether@1 local-mac-address [ 0 0 ${u0} ${u1} 
${u2} ${u3} ]

> also can you update this patch for exynos5422-odroidxu3-lite.dts and
> exynos4412-odroidu3.dts.

Also odroid-x2 and odroid-xu. Lukasz will take care of them.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

