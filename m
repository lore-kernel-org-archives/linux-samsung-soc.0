Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A629EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 11:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiGFLP3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 07:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiGFLP2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 07:15:28 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6CC27FC9
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 04:15:26 -0700 (PDT)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220706111524epoutp026c24b866dbb817f64a6fbaf89f6b96c8~-OT2hz2Xa1445514455epoutp02B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 11:15:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220706111524epoutp026c24b866dbb817f64a6fbaf89f6b96c8~-OT2hz2Xa1445514455epoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1657106124;
        bh=fVA9vmeiNCfAGKSbninc+hCCwM4vuhWmF7PGiVrwYKg=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=G/wlqCYr49hP3N3ViJdmcvJTQct8+QbforNLrIkOSTlOVhDrE/P8Qr3wnxQA6TxrN
         1Wb7DCCAyNLulLODfq6vjP23tv/GtiwPNn59L6AOVCZ1aphJ6nqn5dNOSw2KFu1Kw7
         PpW5on6pLX9km+5/+OU1idRQCBMbn4/Yc3JJhTNw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20220706111524epcas5p3d9a91c3071dfb07d600232722be3e4dd~-OT2RTu7p1444414444epcas5p32;
        Wed,  6 Jul 2022 11:15:24 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.183]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LdH5P5Trrz4x9Q2; Wed,  6 Jul
        2022 11:15:21 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CC.60.09662.5CE65C26; Wed,  6 Jul 2022 20:15:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20220706111516epcas5p24a5d81873174bdd98123ffc25b479678~-OTvJ4Eoz1484614846epcas5p2u;
        Wed,  6 Jul 2022 11:15:16 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220706111516epsmtrp1d5a1a21a5ac3e3f8ccf2fb1e0041fc59~-OTvJSlRR1463314633epsmtrp1C;
        Wed,  6 Jul 2022 11:15:16 +0000 (GMT)
X-AuditID: b6c32a49-885ff700000025be-a8-62c56ec5a426
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4E.36.08802.4CE65C26; Wed,  6 Jul 2022 20:15:16 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220706111516epsmtip17189010f33019d2b4794068c3db515f3~-OTuipOg41194211942epsmtip1T;
        Wed,  6 Jul 2022 11:15:16 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Chanho Park'" <chanho61.park@samsung.com>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>
Cc:     <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <021701d89126$c6e8f410$54badc30$@samsung.com>
Subject: RE: ExynosAutov9 SDAK UFS phy dtbs check error
Date:   Wed, 6 Jul 2022 16:45:15 +0530
Message-ID: <02d201d89129$ab9cb450$02d61cf0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJm4VubqEIWt0Qo4Lng+N+g3AcGPQJcMJCiAj3WOLUBlSjNnKwjFddg
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7bCmhu7RvKNJBs+mKVhc3q9tsff1VnaL
        Gef3MTkwe9y5tofNo2/LKkaPz5vkApijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUN
        LS3MlRTyEnNTbZVcfAJ03TJzgPYoKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpM
        CvSKE3OLS/PS9fJSS6wMDQyMTIEKE7IzZn69z1SwTKxi+9r3bA2MqwS7GDk5JARMJB5/m8zU
        xcjFISSwm1Hi/vOJjCAJIYFPjBLnLztDJD4zSkzv7WCB6Tj38AcLRGIXo8SE43OYIZyXjBIP
        pzWwglSxCehK7FjcxgZiiwhkSxzZeQDMZhZQl3h65CFQDQcHp4CVxMpXESCmsIC5xIYGeRCT
        RUBF4vVkYZBiXgFLia4Nt1khbEGJkzOfsEAM0ZZYtvA1M8Q5ChI/ny5jhVjkJnH11RpWiBpx
        iZdHj7CDXCYh8IhdYtHdH0wQDS4Sa/5tYoewhSVeHd8CZUtJvOxvYwe5QULAQ2LRHymIcIbE
        2+XrGSFse4kDV+awgJQwC2hKrN+lD7GKT6L39xMmiE5eiY42IYhqVYnmd1ehgSYtMbG7mxXC
        9pCYsn8CywRGxVlIHpuF5LFZSB6YhbBsASPLKkbJ1ILi3PTUYtMCw7zUcnhcJ+fnbmIEp0At
        zx2Mdx980DvEyMTBeIhRgoNZSYR31aSDSUK8KYmVValF+fFFpTmpxYcYTYGBPZFZSjQ5H5iE
        80riDU0sDUzMzMxMLI3NDJXEeb2ubkoSEkhPLEnNTk0tSC2C6WPi4JRqYGJwbLWfkas8XUhf
        tnTSrdXLJsttv6F7hpUr8b3E+sVLvndUzQ59lNDxb/Kdo2osFVN+Fpwx6Hj7xeWM6bsOljMf
        ilkVFM5dvbF65fekC0mb68Rtnjyeyxc+Y1XHbaEyaV5JLeajupERCfsOzfK9JDXl00aWo95S
        GwtiX7mqiO/KZZH9u+2n5ctbx4r+FPiyFhz4svRgpf1N90zj3ofnvNleZ5edz14974zBpPjb
        Br++2X7lUBFTmBF+JyTv3GUGe9dchtJsHQbLMq8yhpPcwTKFuqtnfN3U6FZ/JuvU1vNaSY8r
        WW9bmDdefcddYW5Sde1DfuzXbk/5Iys0fiq35ZyZ5KD3ffOyf/clHZxfvFNiKc5INNRiLipO
        BAAAp5ajCgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWy7bCSnO6RvKNJBiva9Cwu79e22Pt6K7vF
        jPP7mByYPe5c28Pm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBnTtlxgKvgsWjF7+wzGBsav
        Al2MnBwSAiYS5x7+YOli5OIQEtjBKDFl0y8WiIS0xPWNE9ghbGGJlf+es0MUPWeUmPvsKRtI
        gk1AV2LH4jYwW0QgW+LspYvMIDazgLrE0yMPWSEa3jNKrD/6AKibg4NTwEpi5asIEFNYwFxi
        Q4M8iMkioCLxerIwSCevgKVE14bbrBC2oMTJmU9YICZqS/Q+bGWEsZctfM0McZqCxM+ny1gh
        LnCTuPpqDStEjbjEy6NH2CcwCs9CMmoWklGzkIyahaRlASPLKkbJ1ILi3PTcYsMCo7zUcr3i
        xNzi0rx0veT83E2M4GjQ0trBuGfVB71DjEwcjIcYJTiYlUR4V006mCTEm5JYWZValB9fVJqT
        WnyIUZqDRUmc90LXyXghgfTEktTs1NSC1CKYLBMHp1QD02X3rcs7uDLdv35QXXLkG3Of/uFj
        WzfJ8U51zRdwPMtZE7cuos5P/Xy+lmPZZEaWSdOtrRS9841Edt34bSCbmTpbSCLmSK9Dblbi
        6YO2fxpdtDme/0iZuZilMbJHs0RvRkfuFwHV7x7K6+xi7rYJnglmvS8Wprrs9dJ1p232K7TY
        +Me1Bb5478HV+ejuMYNtrAFHOrhNW86881J+qK6+5M+Fo9rpK38HNbBdLPq4k0VuFYNiQPIU
        wXbRsH31e18KzvBqVmzw2PQjJ6F/29IrvU4PJLOe33qsbyZvu/DAtUodww18M5mFXBImPbvB
        Ov8rW+ziY9rSBxKUK1xTpBsqNaL+b+c8fn0j89xYsxNKLMUZiYZazEXFiQATMuuG9QIAAA==
X-CMS-MailID: 20220706111516epcas5p24a5d81873174bdd98123ffc25b479678
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220706095505epcas2p36afb722aa84d41c6d13c825280467258
References: <140c1c89-49a7-45bd-7f01-8a3ed1343437@linaro.org>
        <CGME20220706095505epcas2p36afb722aa84d41c6d13c825280467258@epcas2p3.samsung.com>
        <f1e03b78-f844-6eec-2ace-d177af59f0c9@linaro.org>
        <021701d89126$c6e8f410$54badc30$@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



>-----Original Message-----
>From: Chanho Park =5Bmailto:chanho61.park=40samsung.com=5D
>Sent: Wednesday, July 6, 2022 4:25 PM
>To: 'Krzysztof Kozlowski' <krzysztof.kozlowski=40linaro.org>; 'Alim Akhtar=
'
><alim.akhtar=40samsung.com>
>Cc: linux-samsung-soc=40vger.kernel.org
>Subject: RE: ExynosAutov9 SDAK UFS phy dtbs check error
>
>> > When running dtbs_check I found:
>> > arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy=4017e04000:
>clocks:
>> > =5B=5B10=5D=5D is too short
>> >
>> > 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-
>> phy.yaml
>> >
>> > arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy=4017e04000:
>> > clock-names: =5B'ref_clk'=5D is too short
>> >
>> > 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-
>> phy.yaml
>> >
>> >
>> > and so on. It seems you miss there clocks.
>>
>> +Cc Alim.
>>
>> Tesla FSD has the same problem:
>> tesla/fsd-evb.dtb: ufs-phy=4015124000: clocks: =5B=5B35, 2=5D=5D is too =
short
>>
>
>Thanks for the report.
>Ufs-phy clock of Fsd and Exynos Auto v9 shall be 'ref' clock only unlike p=
revious
>exynos7's ufs-phy.
>
>I'm looking into how I can fix the warning.
>I simply made below patch but I'm not sure which is better between
>minItems/maxItems and oneOf selection.
>
Thanks Chanho for the patch

Using =22if - then=22 is better here, because that will be selecting what i=
s needed for SoC in question

Let me know if you will be sending a patch for that.

>--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
>+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
>=40=40 -28,17 +28,23 =40=40 properties:
>
>   clocks:
>     items:
>-      - description: PLL reference clock
>-      - description: symbol clock for input symbol ( rx0-ch0 symbol clock=
)
>-      - description: symbol clock for input symbol ( rx1-ch1 symbol clock=
)
>-      - description: symbol clock for output symbol ( tx0 symbol clock)
>+      minItems: 1
>+      maxItems: 4
>+      items:
>+        - description: PLL reference clock
>+        - description: symbol clock for input symbol ( rx0-ch0 symbol clo=
ck)
>+        - description: symbol clock for input symbol ( rx1-ch1 symbol clo=
ck)
>+        - description: symbol clock for output symbol ( tx0 symbol clock)
>
>   clock-names:
>-    items:
>-      - const: ref_clk
>-      - const: rx1_symbol_clk
>-      - const: rx0_symbol_clk
>-      - const: tx0_symbol_clk
>+    oneOf:
>+      - items:
>+          - const: ref_clk
>+          - const: rx1_symbol_clk
>+          - const: rx0_symbol_clk
>+          - const: tx0_symbol_clk
>+      - items:
>+          - const: ref_clk
>
>   samsung,pmu-syscon:
>     =24ref: '/schemas/types.yaml=23/definitions/phandle-array'
>
>Best Regards,
>Chanho Park


