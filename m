Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208F6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jul 2022 00:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbiGGAqd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 20:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiGGAqc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 20:46:32 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E2D2CDCF
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 17:46:30 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220707004625epoutp01c77157fcea8172f30c0507955f5acd0f~-ZX9UXrYy0707507075epoutp01S
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Jul 2022 00:46:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220707004625epoutp01c77157fcea8172f30c0507955f5acd0f~-ZX9UXrYy0707507075epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1657154785;
        bh=NHwXwFqBwOGyH6A76S4pb8R+JE6m0Y46I17cSCJ1HFw=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=P6vN8KuILH2R4otRC/kzuuUBeitoimfh86GRS0pjby37WSwIN6htIgx2O7hjX7ROt
         uDpeR6K869YnZp0u5LJnSVv0mvwIYN9q5ITk3N662SCT4nb2AR1mZC6KaWO6j76yVf
         xFZXdObyXQluExcgG0Mz7ssEa27fvkpoXTZdtYiY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220707004624epcas2p2b39902343dc14dd46c7e589247624918~-ZX8m7DgW0375603756epcas2p2v;
        Thu,  7 Jul 2022 00:46:24 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.70]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Ldd5D2pjvz4x9Q7; Thu,  7 Jul
        2022 00:46:24 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        19.5B.09650.0EC26C26; Thu,  7 Jul 2022 09:46:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220707004623epcas2p125cebf35c8a57694fde56262a37c4a1d~-ZX71rrRq1776017760epcas2p17;
        Thu,  7 Jul 2022 00:46:23 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220707004623epsmtrp2e05b84ecf3f37d2b26bcf07257618410~-ZX71D2Bw2489624896epsmtrp2O;
        Thu,  7 Jul 2022 00:46:23 +0000 (GMT)
X-AuditID: b6c32a46-0b9ff700000025b2-c9-62c62ce0c85d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        49.47.08905.FDC26C26; Thu,  7 Jul 2022 09:46:23 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220707004623epsmtip2bccab689730afaf32ee8beda51def997~-ZX7t0wC03041830418epsmtip2G;
        Thu,  7 Jul 2022 00:46:23 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>
Cc:     <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <e9b0306b-4d4b-72b2-b12d-cea4c3754a58@linaro.org>
Subject: RE: ExynosAutov9 SDAK UFS phy dtbs check error
Date:   Thu, 7 Jul 2022 09:46:23 +0900
Message-ID: <000101d8919a$fb78d1e0$f26a75a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJm4VubqEIWt0Qo4Lng+N+g3AcGPQJcMJCiAj3WOLUBlSjNnAL7XUjNrAwejpA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7bCmme4DnWNJBq+XC1s8mLeNzWLv663s
        FjPO72NyYPa4c20Pm0ffllWMHp83yQUwR2XbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjq
        GlpamCsp5CXmptoqufgE6Lpl5gAtUlIoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQU
        mBfoFSfmFpfmpevlpZZYGRoYGJkCFSZkZ/T872Mu2MlcsfLxZqYGxtdMXYwcHBICJhI3znp2
        MXJxCAnsYJTon7ybCcL5xChx4tMpdgjnG6PE8rOrWbsYOcE6Ns7czgaR2Mso8eNdCwuE84JR
        Yubc2YwgVWwC+hIvO7aBdYgIZEosv/SWDcRmFlCXeHrkIVicU8BOov/ITbA7hAXMJTY0yIOE
        WQRUJBoanjGChHkFLCWezeAFCfMKCEqcnPmEBWKKvMT2t3OYIe5RkPj5dBnUJj+JD6tvM0PU
        iEjM7mxjBjlNQuAlu8S5DZ+ZIBpcJG51TYayhSVeHd/CDmFLSXx+t5cNwi6WWDrrExNEcwOj
        xOVtv6ASxhKznrWDHccsoCmxfpc+JBiVJY7cgrqNT6Lj8F92iDCvREebEESjusSB7dNZIGxZ
        ie45n1knMCrNQvLZLCSfzULywSyEXQsYWVYxiqUWFOempxYbFRjBozo5P3cTIzgFarntYJzy
        9oPeIUYmDsZDjBIczEoivLntR5OEeFMSK6tSi/Lji0pzUosPMZoCg3ois5Rocj4wCeeVxBua
        WBqYmJkZmhuZGpgrifN6pWxIFBJITyxJzU5NLUgtgulj4uCUamDK8vE+yLpRXrrv8PIXdya1
        hm3d5ZJ/SPPDt/dLHzW+nvhva4yVw6M5hx3PLLnfW9eh/e1MrP/zg7z7Zhs3yJd8r813VpZv
        kfCqPz+PY7KHiprx/Rlf/p/cr2V+8PWbx3ePiE2yfGdpzlCc9fJ91qk92eknJDLuujNJfVhZ
        zybf5b2w8olGkqXBCsmdpufWeEzYVJvudntJ1iHeilDe6O+TQn7+eyozSfwKx9Xl/oxfvRYa
        /hUzSHZKXcn64FLxwlW6LitX/Dgr0vvSr37dqdz6gzu5bjNIeW6fWNgW5qw/vSFA5WxwzT2+
        f8eM9YS6v/OGfnbOcTnDvOTjn462SUX+7D3qAqJS90Xnuz69OnuFEktxRqKhFnNRcSIAj58G
        ygoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsWy7bCSvO59nWNJBm9OG1o8mLeNzWLv663s
        FjPO72NyYPa4c20Pm0ffllWMHp83yQUwR3HZpKTmZJalFunbJXBl9PzvYy7YyVyx8vFmpgbG
        10xdjJwcEgImEhtnbmfrYuTiEBLYzSix/OUVRoiErMSzdzvYIWxhifstR1ghip4xSnzatI8N
        JMEmoC/xsmMbK4gtIpApcW9PF9hUZgF1iadHHkI1LGSSePh3BVgRp4CdRP+Rm0BFHBzCAuYS
        GxrkQcIsAioSDQ3PGEHCvAKWEs9m8IKEeQUEJU7OfMICMVJb4unNp1C2vMT2t3OYIW5TkPj5
        dBnUCX4SH1bfZoaoEZGY3dnGPIFReBaSUbOQjJqFZNQsJC0LGFlWMUqmFhTnpucWGxYY5qWW
        6xUn5haX5qXrJefnbmIER4SW5g7G7as+6B1iZOJgPMQowcGsJMKb2340SYg3JbGyKrUoP76o
        NCe1+BCjNAeLkjjvha6T8UIC6YklqdmpqQWpRTBZJg5OqQamFOMXovtSX0zWvPJJff/V9v7f
        VXnel9+U9UZlC3W8CZihG8klcPpTsH/CpLhHe7M2S3fyFk25feu4VYDGjnfJ5Tpz1f68eHVq
        Xk/ftjaH9duz/vLtk8r/Llp37bCJi8TF05dSrz941D+7+8zP3x+vf4p4s/X+RV/jO2IFUj0+
        l5v298r+chFKyLtdLPpnS+dejZd7g4+keHxavtwsL8/TuHi5gNGjC2knbJ79s/sSsumq8RId
        /eOJES8Vcq6yfQuRaiy4KOZT3XGpR/qLX+3NuW4m6/l0uq9tnC+w+UF50Ol9Bfdj1fQLk3Yf
        9jyusVdI+foso1txytEzhJgk+HoPH3N/PHWD4+R2fY7HYo/6lFiKMxINtZiLihMBzSSmV/cC
        AAA=
X-CMS-MailID: 20220707004623epcas2p125cebf35c8a57694fde56262a37c4a1d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220706095505epcas2p36afb722aa84d41c6d13c825280467258
References: <140c1c89-49a7-45bd-7f01-8a3ed1343437@linaro.org>
        <CGME20220706095505epcas2p36afb722aa84d41c6d13c825280467258@epcas2p3.samsung.com>
        <f1e03b78-f844-6eec-2ace-d177af59f0c9@linaro.org>
        <021701d89126$c6e8f410$54badc30$@samsung.com>
        <e9b0306b-4d4b-72b2-b12d-cea4c3754a58@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> You need:
> 1. new compatible

No need a new compatible.

> 2. min/maxItems in clocks/clock-names in "properties:" part.
> 3. allOf:if:then: adding constraints per variant to clocks and clock-names.
> 
> See:
> https://elixir.bootlin.com/linux/v5.18-
> rc2/source/Documentation/devicetree/bindings/clock/samsung,exynos7885-
> clock.yaml#L53

Great. Thanks for your help and I'll send a patch.

Best Regards,
Chanho Park

