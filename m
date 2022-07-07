Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D2AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jul 2022 00:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiGGApY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 20:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiGGApY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 20:45:24 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4044F2CDCF
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 17:45:22 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220707004519epoutp03f05e60eb12aaf3cdae990bd7698e3746~-ZW-_DUpH1681516815epoutp03H
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Jul 2022 00:45:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220707004519epoutp03f05e60eb12aaf3cdae990bd7698e3746~-ZW-_DUpH1681516815epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1657154719;
        bh=xKMiyDNTYqb9MC6i6sCmLI2UWHDkyRXzIbNt7AdjH44=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=VDmYQQJf3OIFjfofzAFsnBcHK7kR9HjXUO60H7keTGVXfgdTNKvVXsVmVxuqWdrx9
         bmM+/2LhYIjCyXPkNgeIfP/V8GFN50GNwqrAvKlyrYB26Nwxrgi82PgpFJ+rrVV1KK
         +HfhXZEFdIY8i815SeQeJ/vM5P1vXnQiERlPjT8o=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220707004519epcas2p475d78de9162cecf024b7eced5897897b~-ZW-kFm172530325303epcas2p4t;
        Thu,  7 Jul 2022 00:45:19 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Ldd3y60Ckz4x9Q6; Thu,  7 Jul
        2022 00:45:18 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        0C.7A.09650.E9C26C26; Thu,  7 Jul 2022 09:45:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220707004517epcas2p30e17f670224281c03ef8b75bebd91512~-ZW_RUBUE2451724517epcas2p3z;
        Thu,  7 Jul 2022 00:45:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220707004517epsmtrp207485ac6b3774e051cfd9a80588ee285~-ZW_QcjQD2408324083epsmtrp2M;
        Thu,  7 Jul 2022 00:45:17 +0000 (GMT)
X-AuditID: b6c32a46-0b9ff700000025b2-70-62c62c9ed1d8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        33.27.08905.D9C26C26; Thu,  7 Jul 2022 09:45:17 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220707004517epsmtip1297a2f0dc770984a6ab581298ba00000~-ZW_GiF7R0116801168epsmtip1V;
        Thu,  7 Jul 2022 00:45:17 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>
Cc:     <linux-samsung-soc@vger.kernel.org>
In-Reply-To: <02d201d89129$ab9cb450$02d61cf0$@samsung.com>
Subject: RE: ExynosAutov9 SDAK UFS phy dtbs check error
Date:   Thu, 7 Jul 2022 09:45:17 +0900
Message-ID: <000001d8919a$d40a1010$7c1e3030$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJm4VubqEIWt0Qo4Lng+N+g3AcGPQJcMJCiAj3WOLUBlSjNnAJ7pWdLrBAcF9A=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmhe48nWNJBpuaBC0ezNvGZrH39VZ2
        ixnn9zE5MHvcubaHzaNvyypGj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
        DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
        zAv0ihNzi0vz0vXyUkusDA0MjEyBChOyMxo2TGAqOMRcsfHIB/YGxutMXYycHBICJhIzDu9h
        6WLk4hAS2MEo8ffKSiYI5xOjxJ1HM9ghnG+MEi1X+1hgWs4veM4GkdjLKPFx9SWolheMEg9O
        PmEEqWIT0Jd42bGNFcQWEciU2Pn9CzuIzSygLvH0yEOwOKeAlcTflY1AcQ4OYQFziQ0N8iBh
        FgEVie9HvoMt4xWwlNg0tZcJwhaUODnzCQvEGHmJ7W/nMEMcpCDx8+kyqFV+Eg2Pf7NB1IhI
        zO5sYwa5TULgEbvEvd9zoD5wkVhw7RE0AIQlXh3fwg5hS0l8freXDcIullg66xMTRHMDo8Tl
        bb+gEsYSs561M4IczSygKbF+lz6IKSGgLHHkFtRtfBIdh/+yQ4R5JTrahCAa1SUObJ8OdYGs
        RPecz6wTGJVmIflsFpLPZiH5YBbCrgWMLKsYxVILinPTU4uNCozgkZ2cn7uJEZwGtdx2ME55
        +0HvECMTB+MhRgkOZiUR3tz2o0lCvCmJlVWpRfnxRaU5qcWHGE2BYT2RWUo0OR+YiPNK4g1N
        LA1MzMwMzY1MDcyVxHm9UjYkCgmkJ5akZqemFqQWwfQxcXBKNTCFPOs9fTHhPus6O+vUwsRF
        t17VGs3KU9q/4biA8sfAupvdi/jdc5OP27g/buV4pHll26xZydP1/25/9TXcsFTEao2GCdtk
        toDMY057dtZw55zb1Znr3LqEpaaZrTslWebal4Jpkw3483edE9pSHrld/sl277X/YmN2z3tv
        MsPvtFQVl8e5Kacnfci3bz8Y906u3GTy+o8/Thu7uhhrblE3OXA8rVLiTUymxx3Zu1tUs1qn
        ng7pOd3TZ3j97eT5FR+Sv08/qcO3dUXTsvyMMi9nN7nr6fbBU/sNu6z27rpuO0PtoP7fV9Nj
        2AX5JysW3NwWEuxX7L268V///UdL+7cEWh6s+XR3Y36WxZp7G68rsRRnJBpqMRcVJwIAoiNK
        0gwEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSnO5cnWNJBlsXaVk8mLeNzWLv663s
        FjPO72NyYPa4c20Pm0ffllWMHp83yQUwR3HZpKTmZJalFunbJXBlNGyYwFRwiLli45EP7A2M
        15m6GDk5JARMJM4veM7WxcjFISSwm1Fi5tUPrBAJWYln73awQ9jCEvdbjoDFhQSeMUo0nawE
        sdkE9CVedmwDi4sIZEp8f74dzGYWUJd4euQhVP1cJokNdzxBbE4BK4m/KxuBZnJwCAuYS2xo
        kAcJswioSHw/8p0FxOYVsJTYNLWXCcIWlDg58wkLxEhtiac3n0LZ8hLb385hhjhNQeLn02VQ
        J/hJNDz+zQZRIyIxu7ONeQKj8Cwko2YhGTULyahZSFoWMLKsYpRMLSjOTc8tNiwwzEst1ytO
        zC0uzUvXS87P3cQIjgctzR2M21d90DvEyMTBeIhRgoNZSYQ3t/1okhBvSmJlVWpRfnxRaU5q
        8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1MfratC87tucL7dmehvpDSrzualqdN
        8v778rAWFRYskPzEtqsxYoPM+hBJvqUH+JdMPfHgJK9vtMPTxi+fLp1uFi+VTuliT9H5E9tf
        FrjDmjU2sJetNP7STzX5tTcPz7FqeeYmyXPw4orH7HE8WuF8F2ae4bWdvqdbr9W3J9O46uzn
        9RUZWRklFy5rHbjwhMdZWkx/22leNdmWlzdOVzq3sOd3L/1k3Moq09I+eb+ObZZ2gFl3ksHD
        Ldse3RdL+6N01vK0qnT6uod6p3jPdjpJ9374uexbg+PF030mwrvn8a+NWKBs8XNG4a3I40de
        Gkm6/9z60jNeI8VeaYmwZGbJmYLDj+ZLTn9zyqBFd6oSS3FGoqEWc1FxIgCT7LkK9gIAAA==
X-CMS-MailID: 20220707004517epcas2p30e17f670224281c03ef8b75bebd91512
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
        <02d201d89129$ab9cb450$02d61cf0$@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> >I'm looking into how I can fix the warning.
> >I simply made below patch but I'm not sure which is better between
> >minItems/maxItems and oneOf selection.
> >
> Thanks Chanho for the patch
> 
> Using "if - then" is better here, because that will be selecting what is
> needed for SoC in question
> 
> Let me know if you will be sending a patch for that.

I'll send a patch. Thanks for your comments :)

Best Regards,
Chanho Park

