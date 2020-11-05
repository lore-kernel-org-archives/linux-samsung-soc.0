Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7766C55178
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 08:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 850AD206ED
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 08:18:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cJefCIKg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgKEISp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 03:18:45 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53681 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgKEISp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 03:18:45 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201105081833euoutp01bf5deb1dbd5b84ddd7108c85ca0bc48e~Ejr3LDIds2992729927euoutp01R
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2020 08:18:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201105081833euoutp01bf5deb1dbd5b84ddd7108c85ca0bc48e~Ejr3LDIds2992729927euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604564313;
        bh=NMK60xRFJUDlh99CHxUxHQfB82mzpqWqhXHPuf9XntA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=cJefCIKgF6oyFjabhyUuPuM8d2rDYehaUnF1VjC9sFe4URioTtr8gP4O7BlrzfWB6
         c9tHYVmi4vDhusIEI2wuP/hwqY2Bv72B/eG6iJu2x4PRlihTZeQYJMsbPpkrOpCLhV
         c3NP7Hjw3bpe84y069kLqvSRRuWm6k0c3X8dG6qw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201105081825eucas1p2edf8a2235cc36ffd94a9c48fa2e805bd~EjrwR46Dx2157521575eucas1p2e;
        Thu,  5 Nov 2020 08:18:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id D2.58.06456.155B3AF5; Thu,  5
        Nov 2020 08:18:25 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201105081825eucas1p2694c35782e89273166da44c593e72556~Ejrv7rU6X1870918709eucas1p2t;
        Thu,  5 Nov 2020 08:18:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201105081825eusmtrp11945a70f7cb872d6407407b815cd4279~Ejrv64dUR3154431544eusmtrp13;
        Thu,  5 Nov 2020 08:18:25 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-d1-5fa3b551ba0a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 0F.7F.06017.155B3AF5; Thu,  5
        Nov 2020 08:18:25 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201105081824eusmtip20006ca0ce7322a509f4b03275f5a5812~EjrvVAhSH2999429994eusmtip2n;
        Thu,  5 Nov 2020 08:18:24 +0000 (GMT)
Subject: Re: [PATCH v2] ARM: dts: exynos: Add a placeholder for a MAC
 address
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <71f06064-079c-1044-a51a-ce1ea7cc4049@samsung.com>
Date:   Thu, 5 Nov 2020 09:18:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CANAwSgR=20AOVxi=5L_ep=uK98dzL6Ent52Mux1_iviiK-XGPA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87qBWxfHG/w9pWaxccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrtF694j7A5cHjtn3WX32LSq
        k81j85J6j74tqxg9Pm+SC2CN4rJJSc3JLEst0rdL4Mr41/KFvWCRXMXzgzcZGxjXiXcxcnBI
        CJhInNnu0sXIxSEksIJR4tHDuUwQzhdGiVuPTzBCOJ8ZJVZ8vsXSxcgJ1rHj12kWiMRyRomj
        F7czgySEBN4zSqz7Gg9iCwv4S2xsu8oEYosIqElcebqCFcRmFpjOLLFoogqIzSZgKNH1tosN
        xOYVsJM49GIdO4jNIqAiMffobTBbVCBJ4u/nP8wQNYISJ2c+ATuCUyBQ4tWzr1Az5SWat85m
        hrDFJW49mQ/2goTAMXaJM3dWMUJc7SLR9nABG4QtLPHq+BZ2CFtG4vTkHhaIhmZGiYfn1rJD
        OD2MEpebZkB1W0vcOfeLDRRizAKaEut36UOEHSXar25hhQQkn8SNt4IQR/BJTNo2nRkizCvR
        0SYEUa0mMev4Ori1By9cYp7AqDQLyWuzkLwzC8k7sxD2LmBkWcUonlpanJueWmyYl1quV5yY
        W1yal66XnJ+7iRGYnk7/O/5pB+PXS0mHGAU4GJV4eB04FscLsSaWFVfmHmKU4GBWEuF1Ons6
        Tog3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5OqQbGMlOvzN0P
        j5xbIGxeyWvH8JJ31TKPQ/LTJm5hZuCe9FN9p37607U3r4acurowSatse8q+lml+hW525Xs3
        Wy68bsNyd5WvZzO33JaTyxaWNk3c4JyTsD+x9OgNvZx7H3f15Vzq4vh5SdTdaOI3i9U95Q61
        lvI+pnPvhWnntM+XS9Pgra1YsmqiEktxRqKhFnNRcSIA2o387EsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7qBWxfHG9y+zW2xccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrtF694j7A5cHjtn3WX32LSq
        k81j85J6j74tqxg9Pm+SC2CN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXS
        t7NJSc3JLEst0rdL0Mv41/KFvWCRXMXzgzcZGxjXiXcxcnJICJhI7Ph1mgXEFhJYyiixrz0F
        Ii4jcXJaAyuELSzx51oXWxcjF1DNW0aJ7efawBLCAr4Sfy7tYQOxRQTUJK48XcEKUsQsMJtZ
        4uHO70wQHS3MEhsuzgJbwSZgKNH1tgusg1fATuLQi3XsIDaLgIrE3KO3wWxRgSSJlxemMkHU
        CEqcnPkErJdTIFDi1bOvYJuZBcwk5m1+yAxhy0s0b50NZYtL3Hoyn2kCo9AsJO2zkLTMQtIy
        C0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIExue3Yzy07GLveBR9iFOBgVOLhdeBY
        HC/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQM9NZJYSTc4Hpou8knhD
        U0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MeWVHLoakx3+Zav54haVv
        01WWhb+j7/UyzvOfWhn+sS/qPXfL7Dvzf79+1H7uZaCA1BeFeaJx2qvdfy43dVVZcGj9bUbG
        tpX1QSFbcj6V8rnu0uxaZ7BXM6+x7/HvgFaXCZPbt7NOZdTmSO5baD4jV/Wbo8ISY7njzroh
        IQpnvgbF7JTLnPJLiaU4I9FQi7moOBEA3ss9Bd8CAAA=
X-CMS-MailID: 20201105081825eucas1p2694c35782e89273166da44c593e72556
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
        <5ecd2e6d-6aaf-bff5-c000-2c56086ed95b@samsung.com>
        <CANAwSgR=20AOVxi=5L_ep=uK98dzL6Ent52Mux1_iviiK-XGPA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Anand,

On 05.11.2020 09:06, Anand Moon wrote:
> On Mon, 2 Nov 2020 at 21:53, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 01.11.2020 15:07, Anand Moon wrote:
>>> On Thu, 1 Oct 2020 at 19:25, Łukasz Stelmach <l.stelmach@samsung.com> wrote:
>>>> Add a placeholder for a MAC address. A bootloader may fill it
>>>> to set the MAC address and override EEPROM settings.
>>>>
>>>> Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
>>>> ---
>>>> Changes in v2:
>>>>    - use local-mac-address and leave mac-address to be added by a bootloader
>>>>
>>>>    arch/arm/boot/dts/exynos5422-odroidxu3.dts | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>>>> index db0bc17a667b..d0f6ac5fa79d 100644
>>>> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>>>> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
>>>> @@ -70,3 +70,21 @@ &pwm {
>>>>    &usbdrd_dwc3_1 {
>>>>           dr_mode = "peripheral";
>>>>    };
>>>> +
>>>> +&usbhost2 {
>>>> +       #address-cells = <1>;
>>>> +       #size-cells = <0>;
>>>> +
>>>> +       hub@1 {
>>>> +               compatible = "usb8087,0024";
>>>> +               reg = <1>;
>>>> +               #address-cells = <1>;
>>>> +               #size-cells = <0>;
>>>> +
>>>> +               ethernet: usbether@1 {
>>>> +                       compatible = "usb0c45,6310";
>>>> +                       reg = <1>;
>>>> +                       local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
>>>> +               };
>>>> +       };
>>>> +};
>>>> --
>>>> 2.26.2
>>>>
>>> Thanks for this patch, can you share some example on how to set the
>>> mac address via u-boot bootargs
>> A little bit hacky script to set permanent board unique MAC address:
>>
>> # setexp.b u0 *0x10000014; setexp.b u1 *0x10000015; setexp.b u2
>> *0x10000016; setexp.b u3 *0x10000017; setenv ethaddr
>> 0:0:${u0}:${u1}:${u2}:${u3}; setenv usbethaddr ${ethaddr};
>>
> OK this command worked for me.
>
>> Then if there is proper ethernet0 alias set, u-boot will then
>> automatically save the configured MAC address to the device tree. I've
>> just check this on recent u-boot v2020.10 and Odroid U3 board.
>>
>> Lukasz will send updated patch soon (with proper alias entry).
>>
>> If you want to hack setting MAC address manually, this will work with
>> the current patch:
>>
>> # setexp.b u0 *0x10000014; setexp.b u1 *0x10000015; setexp.b u2
>> *0x10000016; setexp.b u3 *0x10000017; fdt addr ${fdtaddr}; fdt set
>> /soc/usb@12110000/hub@1/usbether@1 local-mac-address [ 0 0 ${u0} ${u1}
>> ${u2} ${u3} ]
>>
> So do we need a similar patch for u-boot ?

I've not sure that this ethaddr hack/workaround should be added to 
mainline uboot. Some other exynos based board have proper MAC address 
stored in EEPROM (for example Odroid XU4/HC1). I would leave it for the 
users to add it manually if it is really needed for now.

> I am getting following error on Odroid U3+ and U-Boot 2020.10
>
> Odroid #  setexp.b u0 *0x10000014; setexp.b u1 *0x10000015; setexp.b
> u2 *0x10000016; setexp.b u3 *0x10000017; fdt addr ${fdtaddr}; fdt set
> /soc/usb@12110000/hub@1/usbether@1 local-mac-address [ 0 0 ${u0} ${u1}
> ${u2} ${u3} ]
> No FDT memory address configured. Please configure
> the FDT address via "fdt addr <address>" command.
> Aborting!
>
> Also added these command to boot.scr but still observing the failure

You need to use proper env for setting fdt address (the "fdt addr 
${fdtaddr}" command). For some versions it was ${fdt_addr}, the other 
used ${fdtaddr}. Please check which one is used for loading dtb and 
adjust the script.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

