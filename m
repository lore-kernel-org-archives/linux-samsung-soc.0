Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58262C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 11:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234842AbiEWL2Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 07:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234851AbiEWL2O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 07:28:14 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B964D270
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 04:28:11 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220523112805epoutp04c4094a17bdd60992d5bf6cbffd9c376d~xuGXa_9uV2956229562epoutp04P
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 11:28:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220523112805epoutp04c4094a17bdd60992d5bf6cbffd9c376d~xuGXa_9uV2956229562epoutp04P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653305285;
        bh=y6ZMVCa01CPM6lfjRWZ2yKQL7rl8kIG3p2hCQTmMo20=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=kAmxsaGDZ2B9OatkztIimlvSNJdyW51IXjSTKfEEvE6Knul4yfLL9U9JbmkjcCTKT
         P1JTgAMOww+DX4295H6Qj1dtMfaIUfeAB18BgXNCgQ1Bbm+hH5MsKNQeZAYKwAUdNA
         2N5WzG1E5pOYYQBKlcSaEnq4fThzCcDbCdWO3Chc=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220523112804epcas2p2ee7765de8b81e27076ca51be3421d3e4~xuGWerx5O1014210142epcas2p2b;
        Mon, 23 May 2022 11:28:04 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.102]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4L6FSL2BGnz4x9Pr; Mon, 23 May
        2022 11:28:02 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        CE.AA.09694.2CF6B826; Mon, 23 May 2022 20:28:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220523112801epcas2p3e1fa41baee05ad60afc8e602886d653e~xuGTW3ZZB2296622966epcas2p3g;
        Mon, 23 May 2022 11:28:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220523112801epsmtrp13d85ff3dafafc968a496760f1562c4a4~xuGTWGRRy2214222142epsmtrp1l;
        Mon, 23 May 2022 11:28:01 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-f3-628b6fc2700c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        16.58.08924.1CF6B826; Mon, 23 May 2022 20:28:01 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220523112801epsmtip23c971abca10dee6af67846366350d9e3~xuGTL9z2k2057520575epsmtip23;
        Mon, 23 May 2022 11:28:01 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <0a924446-7ced-79cf-2183-10df81c0e450@linaro.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: soc: add samsung,boot-mode
 definitions
Date:   Mon, 23 May 2022 20:28:01 +0900
Message-ID: <003e01d86e98$29456e10$7bd04a30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGssqSxaaXm4cUlMOTTa+hx2Iw/oAJ0q7a8AdKRbCwBQlsbWq1XfOAg
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRmVeSWpSXmKPExsWy7bCmme6h/O4kg/+f2S0ezNvGZnH9y3NW
        i/lHzrFa9L14yGyx9/VWdosZ5/cxWbTuPcJu8bxvH5MDh8emVZ1sHneu7WHz6NuyitHj8ya5
        AJaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoDOU
        FMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQXmBXrFibnFpXnpenmpJVaGBgZGpkCF
        CdkZC77vYi04ylXx/VJhA+NRji5GTg4JAROJt4+2MXUxcnEICexglPh8tocNwvnEKHF8zn1G
        COczo0Tbsf3sMC1vjk+DatnFKPFk7wOoqheMErsmb2EDqWIT0Jd42bGNFSQhIrAYaFbXNrDB
        zALnGCUmfFvPBFLFKWAnsfP8TkYQW1ggUOLcwVagHRwcLAKqEn2/zEFMXgFLiXeL5UAqeAUE
        JU7OfMICYjMLyEtsfzuHGeIiBYmfT5exgtgiAm4Sby/dZoaoEZGY3dnGDLJWQmAqh8T0xTtZ
        IBpcJK6ffAtlC0u8Or4F6jUpiZf9bVB2scTSWZ+YIJobGCUub/vFBpEwlpj1rJ0R5DhmAU2J
        9bv0QUwJAWWJI7egbuOT6Dj8lx0izCvR0SYE0agucWD7dKitshLdcz6zTmBUmoXks1lIPpuF
        5INZCLsWMLKsYhRLLSjOTU8tNiowgUd2cn7uJkZwCtXy2ME4++0HvUOMTByMhxglOJiVRHi3
        J3YkCfGmJFZWpRblxxeV5qQWH2I0BYb0RGYp0eR8YBLPK4k3NLE0MDEzMzQ3MjUwVxLn9UrZ
        kCgkkJ5YkpqdmlqQWgTTx8TBKdXA5FvMusuG5eyHSV0dv17mv+zaE3UhqFSkI7C017PVlGWz
        o/a0O8rNHaKdIil9+4+9/xN16prYtVhjUYfFctsfrNRawJgfz3Ll3k/RO2+WTlv1akN15aE/
        HiebTr/i9PKK3PW7hsv1xaqCk++Wq33galznxljZJb1V755krJu4/p+jT19/+BQxmWGOtCGv
        j97JVq2MHL+s5ZFe7TMUJZ8fLr1VtOvFOd8DsptfOu8tPxNqwfkq6rP1tTS/BwIHPrUX/Yv4
        /0ap/SlPF/vJnWZR4ZzXGBKcmAI98mNidyat/655Oj1Z4oaV0KGZTvoTLerqH+cUT4osYXXZ
        zbgnMOJrnlL5dPaEY81PmydUNB5XYinOSDTUYi4qTgQAGD137ioEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpikeLIzCtJLcpLzFFi42LZdlhJXvdgfneSwZ8VEhYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8WM8/uYLFr3HmG3eN63j8mBw2PTqk42jzvX9rB59G1ZxejxeZNc
        AEsUl01Kak5mWWqRvl0CV8aC77tYC45yVXy/VNjAeJSji5GTQ0LAROLN8WlMXYxcHEICOxgl
        +l49YYVIyEo8e7eDHcIWlrjfcoQVougZo8SL/T1gCTYBfYmXHdvAEiICixkl9k+6BNbNLHCJ
        UeLkNU+Ijq+MElv272QDSXAK2EnsPL+TEcQWFvCXaFmzGGgSBweLgKpE3y9zEJNXwFLi3WI5
        kApeAUGJkzOfsECM1JbofdjKCGHLS2x/O4cZ4jgFiZ9Pl4GtFRFwk3h76TYzRI2IxOzONuYJ
        jMKzkIyahWTULCSjZiFpWcDIsopRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIziatLR2
        MO5Z9UHvECMTB+MhRgkOZiUR3u2JHUlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhP
        LEnNTk0tSC2CyTJxcEo1MJ37cGb3R6Gb5vzey+a2ifDO3Z5Y+YJ3b7THHY42nkb2Ii7v+ZOS
        /scFLGtXP/+m49sBm8kBeuxXdlevfnz/Xb3O30m+JkuqDjgLaWRdnHPCQ8RsVkmt3faGOYyX
        F5ieXLJMMsIi4OKFEwlmEVv0G/q2LzzWyeLcL6E79XCfZeOMdP51c34WXjXsl1c+4cX0Omvv
        0WW/Bfkle1QlVkQf2mSx6LNzpSrH0YZnMev7DMqvPfI80nRfM56XLd+q3YVHdXNuUOLct1eY
        hA24Dszo+ezw9PSNqpmT3tV/faRV3dO39O4XrqOWallLX/9YsN+g6XHc6ZM97S05TEk5fZcZ
        suQveR06ZzxBgzu44t51FyWW4oxEQy3mouJEAMVwJVYVAwAA
X-CMS-MailID: 20220523112801epcas2p3e1fa41baee05ad60afc8e602886d653e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520115216epcas2p20de68c07071435ae33b50c7b664a20eb
References: <20220520115250.57785-1-chanho61.park@samsung.com>
        <CGME20220520115216epcas2p20de68c07071435ae33b50c7b664a20eb@epcas2p2.samsung.com>
        <20220520115250.57785-2-chanho61.park@samsung.com>
        <0a924446-7ced-79cf-2183-10df81c0e450@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> > Adds samsung,boot-mode.h header file which contains boot mode
> > definitions for bootloader. As for now, there are only boot mode
> > definitions for Exynos Auto v9 SoC.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > ---
> >  include/dt-bindings/soc/samsung,boot-mode.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >  create mode 100644 include/dt-bindings/soc/samsung,boot-mode.h
> >
> > diff --git a/include/dt-bindings/soc/samsung,boot-mode.h
> > b/include/dt-bindings/soc/samsung,boot-mode.h
> > new file mode 100644
> > index 000000000000..f1d03d96f45c
> > --- /dev/null
> > +++ b/include/dt-bindings/soc/samsung,boot-mode.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> 
> Dual license:
> GPL-2.0-only OR BSD-2-Clause

Okay. I'll update this on v3.

> 
> > +
> > +#ifndef __SAMSUNG_BOOT_MODE_H
> 
> __DT_BINDINGS_SAMSUNG_BOOT_MODE_H
> 
> > +#define __SAMSUNG_BOOT_MODE_H
> > +
> > +/* Boot mode definitions for Exynos Auto v9 SoC */
> > +
> > +#define EXYNOSAUTOV9_BOOT_FASTBOOT	(0xfa)
> > +#define EXYNOSAUTOV9_BOOT_BOOTLOADER	(0xfc)
> > +#define EXYNOSAUTOV9_BOOT_RECOVERY	(0xff)
> 
> No need for ().

Thanks. Will be removed on v3.

Best Regards,
Chanho Park

