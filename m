Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC61CC43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 02:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbiFBCH3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Jun 2022 22:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233266AbiFBCH2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Jun 2022 22:07:28 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013F31D92DB
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Jun 2022 19:07:26 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220602020723epoutp01f0e90ed8200ca7e1c3f8bcfdfa876475~0q5qISbFe1111911119epoutp01B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 02:07:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220602020723epoutp01f0e90ed8200ca7e1c3f8bcfdfa876475~0q5qISbFe1111911119epoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654135643;
        bh=t8U7FyS8vihQ8FtwpxDAeaFoHAyKx1rhnPcMrL9DDwI=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=lwcwWNM77KHe72A2mkcKKDcmvN+kFHjURFMS+NPSlvd3srzrHxWuZabYB9Kj10JeJ
         hWlOExfRpvODL6MEgc3VJpoU+SE8tXnXlGnT/6YB9Afzinu+S0qOw7/PnY1+TAk+YZ
         UnmerjeCS0jcw4rCiPJaqWXEKdXAJ/85UhJwDI+c=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220602020722epcas2p4fa2afb35727457095c1e273973f2d1b9~0q5pso3vD2593325933epcas2p4L;
        Thu,  2 Jun 2022 02:07:22 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LD8Xp0Tv9z4x9Q7; Thu,  2 Jun
        2022 02:07:22 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        96.0D.10028.95B18926; Thu,  2 Jun 2022 11:07:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220602020721epcas2p492069c84655d964c7dcc19c9876b8778~0q5ofL3VC2079320793epcas2p4X;
        Thu,  2 Jun 2022 02:07:21 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220602020721epsmtrp2a3cef8c4cdc0e91ff0af167ee9076d4d~0q5od75Pg3270532705epsmtrp2h;
        Thu,  2 Jun 2022 02:07:21 +0000 (GMT)
X-AuditID: b6c32a47-d98a8a800000272c-9d-62981b593b99
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        DF.79.11276.95B18926; Thu,  2 Jun 2022 11:07:21 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20220602020721epsmtip2f0111f531941768d7589d6a1f2da0322~0q5oQ7-gr1288312883epsmtip2g;
        Thu,  2 Jun 2022 02:07:21 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Rob Herring'" <robh+dt@kernel.org>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski+dt@linaro.org>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <b14c0d3a-8fe3-62b5-777d-883d95bc6fcc@linaro.org>
Subject: RE: [PATCH v3 0/2] syscon reboot/reboot_mode support for
 exynosautov9
Date:   Thu, 2 Jun 2022 11:07:21 +0900
Message-ID: <000001d87625$7e664a10$7b32de30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJI/1XL/Ftv3dSoSrqqSUbcnMeiJQLcHzXTAdQC+4kBRCF0xqwqqbwQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRmVeSWpSXmKPExsWy7bCmmW6U9Iwkg9NVFg/mbWOzuP7lOavF
        /CPnWC36Xjxkttj7eiu7xYzz+5gsWvceYbd43rePyYHDY9OqTjaPO9f2sHn0bVnF6PF5k1wA
        S1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QFUoK
        ZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9vNQSK0MDAyNToMKE
        7Ixpk8wKPjJWnLx4hqmBcSNjFyMnh4SAicSM9Q/BbCGBHYwS1+5wdTFyAdmfGCXWz7zFBuF8
        Y5RoXrKACabj2e2X7BCJvYwSRz9fZoRwXjBKHNm7nAWkik1AX+JlxzZWkISIwGJGieNd28Bm
        MQucY5SY8G092CxOATuJS6+/MoPYwgIBEhOmzGEHsVkEVCQ+rTsFdhWvgKXEgcPrWCFsQYmT
        M5+AbWAWkJfY/nYOM8RNChI/ny4DqxERcJM49m8TVI2IxOzONmaQxRICEzkkfj95BtXgIvHj
        6Syoh4QlXh3fwg5hS0l8freXDcIullg66xMTRHMDo8Tlbb+gEsYSs561A13HAbRBU2L9Ln0Q
        U0JAWeLILai9fBIdh/+yQ4R5JTrahCAa1SUObJ/OAmHLSnTP+cw6gVFpFpLPZiH5bBaSD2Yh
        7FrAyLKKUSy1oDg3PbXYqMAYHtvJ+bmbGMEpVMt9B+OMtx/0DjEycTAeYpTgYFYS4S3ZNTVJ
        iDclsbIqtSg/vqg0J7X4EKMpMKwnMkuJJucDk3heSbyhiaWBiZmZobmRqYG5kjivV8qGRCGB
        9MSS1OzU1ILUIpg+Jg5OqQamjJTILRP4avYuVlooku1ZLSkz1ZND4P8VtdsZUTevWe8ot9FU
        ZrF+UGQnu+nF4UN6hT83fnmlt/uKSYt1qaHI5nh3E+v8FobMoo9lS8+1yqecf1x+tZklpzt1
        7oL9rKwZqrtnGhz0Uu/XiIqLMfu/YAIjy7ETp5t6g6ZteXp2TYyjU4uRMQ/rvkyeSi7mybee
        dLS9fLTr9xKxZbqGGZXbj5S8LjjuwJ2gWugV9XLKhu3Ht+tkv7xqfPmubsF/c/0dqzTWru0w
        55dQPlp/hCH+9fflXS9dnU9l+B3zeeD+p+WCUbWbEnNkzbm78U5vN0UG7ZOYtNpw1uWl9pMn
        P7M939IUylvzYXldrv+hMFUlluKMREMt5qLiRAC4CPWhKgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeLIzCtJLcpLzFFi42LZdlhJXjdSekaSwYeN0hYP5m1js7j+5Tmr
        xfwj51gt+l48ZLbY+3oru8WM8/uYLFr3HmG3eN63j8mBw2PTqk42jzvX9rB59G1ZxejxeZNc
        AEsUl01Kak5mWWqRvl0CV8a0SWYFHxkrTl48w9TAuJGxi5GTQ0LAROLZ7ZfsXYxcHEICuxkl
        DnSdY4ZIyEo8e7eDHcIWlrjfcoQVougZo0Tn9DlgRWwC+hIvO7aBJUQEFjNK7J90iRUkwSxw
        iVHi5DVPiI4PjBILzk4GS3AK2Elcev0VqJuDQ1jAT6J/WilImEVAReLTulNgJ/EKWEocOLyO
        FcIWlDg58wkLxExtiac3n0LZ8hLb386BulRB4ufTZWD1IgJuEsf+bYKqEZGY3dnGPIFReBaS
        UbOQjJqFZNQsJC0LGFlWMUqmFhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIEx5OW5g7G7as+
        6B1iZOJgPMQowcGsJMJbsmtqkhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNT
        UwtSi2CyTBycUg1MiTslSyJOzpDWnJ96wSHulHTl7NUfDTVzU2Sf7lgrHvXFJsRTQjai/2HA
        EbfIfT/yKrb7bYzi+rA675dW2onKrKILGknuaRKfozZvq6o+1PEnx/p0Cjdzz95PhscFfnDw
        n2N3+cq1/N7encv8Q4uvez48dMw2KEG46rjB1jcTjXq/5bAUzf94t+TqniSRdG6v3lU9kyc3
        ex1rN+ePLt0y/df73El9sxVWryyXP/VKYMm633KHuw6v/HLLVzN1/rLzNVu8cpzVmN+nmO1c
        H1UZqxOye5+EV0BFypRDCdzdN5VcDNz+ZXDuDrws/15gk/LkRtNX7Dvvhcw+ZbVw98P3rWcD
        8qZcWcVonbUh8c8EJZbijERDLeai4kQAZ1yWfhYDAAA=
X-CMS-MailID: 20220602020721epcas2p492069c84655d964c7dcc19c9876b8778
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220523121210epcas2p11d0b4f27edd5a403b2fd7d3833d577ff
References: <CGME20220523121210epcas2p11d0b4f27edd5a403b2fd7d3833d577ff@epcas2p1.samsung.com>
        <20220523121244.67341-1-chanho61.park@samsung.com>
        <013401d874eb$05f55390$11dffab0$@samsung.com>
        <b14c0d3a-8fe3-62b5-777d-883d95bc6fcc@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> > Could you review below v3 patchset in your free time? :)
> 
> I looked at it before and it is fine. It's a merge window so I am not
> taking any new patches before rc1.

Got it. Sorry to rush you :)

Best Regards,
Chanho Park

