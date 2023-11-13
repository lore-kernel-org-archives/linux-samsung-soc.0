Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78732C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Nov 2023 16:53:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjKMQxb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Nov 2023 11:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjKMQxa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 11:53:30 -0500
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9969510EC
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Nov 2023 08:53:24 -0800 (PST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231113165321euoutp02729832f03d0d65b5c084327d7265423a~XPPOl2dhb1140011400euoutp02r
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Nov 2023 16:53:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231113165321euoutp02729832f03d0d65b5c084327d7265423a~XPPOl2dhb1140011400euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699894401;
        bh=u4mxWGKAexxHUZePyFAQIRd6210AvjaVWN2yT9WBs6I=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=FstB8Znff0PJPnkRIXu1CGCR9FZl8QLJVWxNgg9LkbllrHAck5NSV25KR64hMPELT
         zI6OG7YNEhN+eLTO6PzJrwm4Z/bTWqt94dUuLfGG25Va9vIGv2pi7xQzi0h3jU4vWo
         rgj5WqEoIGg/nY4XOUHK8RBZGJ/iwPEfXjVEElwQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231113165321eucas1p18adf16e6c8d96650d25357a898ba16ac~XPPOc2XhF0396603966eucas1p1r;
        Mon, 13 Nov 2023 16:53:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 7E.54.09539.18452556; Mon, 13
        Nov 2023 16:53:21 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231113165321eucas1p1362468122062652fb092080baa69a46e~XPPOOQszF0396603966eucas1p1q;
        Mon, 13 Nov 2023 16:53:21 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231113165321eusmtrp280b0ac035c0611a8a8cb5c85246d7044~XPPONwJVU0209102091eusmtrp2M;
        Mon, 13 Nov 2023 16:53:21 +0000 (GMT)
X-AuditID: cbfec7f2-52bff70000002543-8d-655254810e7e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7A.54.09146.18452556; Mon, 13
        Nov 2023 16:53:21 +0000 (GMT)
Received: from AMDN4416 (unknown [106.120.50.67]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20231113165320eusmtip167c3f373479664b6556efd20f092d181~XPPNzNEIz2909829098eusmtip1_;
        Mon, 13 Nov 2023 16:53:20 +0000 (GMT)
From:   "Sylwester Nawrocki/Kernel \(PLT\) /SRPOL/Staff Engineer/Samsung
        Electronics" <s.nawrocki@samsung.com>
To:     "'Petr Vorel'" <pvorel@suse.cz>,
        <linux-samsung-soc@vger.kernel.org>
Cc:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>
In-Reply-To: <20231108085630.7767-1-pvorel@suse.cz>
Subject: RE: [PATCH 1/1] MAINTAINERS: Remove snawrocki's git tree
Date:   Mon, 13 Nov 2023 17:53:19 +0100
Message-ID: <000001da1651$e88567f0$b99037d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGGNfEoOH90AZAqdq15P2glhK2gsQHfQabJsRE84fA=
Content-Language: pl
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djP87qNIUGpBs+WCls8mLeNzeL6l+es
        Fntfb2W3mHF+H5PFj1s3WCxW7frD6MDmsXPWXXaPO9f2sHn0bVnF6HFmwRF2j8+b5AJYo7hs
        UlJzMstSi/TtErgy/p08ylawnrHiXPMflgbGHsYuRk4OCQETiX3L7rOC2EICKxglFuzT62Lk
        ArK/MEp8ePaRBcL5zCix7eFqZpiOdcfPQCWWM0ps2dPFCOE8Y5TY0DGbCaSKTSBPYsezPWC2
        iICHxKoZ01lBipgF9jFKzL22F2wUp4CxxNOVD8CWCws4SkzqXwZmswioSmxbcwismVfAUuLd
        hkdQtqDEyZlPWEBsZgF5ie1v50CdpCDx8ylEr4iAlcSuGROgakQkbjxqAbtOQuABh8TfPTNY
        IBpcJPqXzWSCsIUlXh3fwg5hy0j83zmfCaJhOqPE5lXPWSGc9YwS/97dgOqwljh3cyJQBwfQ
        Ck2J9bv0QUwJoA8+7xKDMPkkbrwVhLiBT2LStunMEGFeiY42IYgZKhK/V01nmsCoPAvJZ7OQ
        fDYLyQezEFYtYGRZxSieWlqcm55abJiXWq5XnJhbXJqXrpecn7uJEZh6Tv87/mkH49xXH/UO
        MTJxMB5ilOBgVhLhzdMMSBXiTUmsrEotyo8vKs1JLT7EKM3BoiTOq5oinyokkJ5YkpqdmlqQ
        WgSTZeLglGpgqrLP3vSjV9X/a8r3Rb9UNwUEsvJXJ67mK9z5+UmV3exL2jv8t13errr93V3e
        MKaAn3fXB5ica9vx7YjoOokIz/U39Pzf7b8g031/zbY0fZvPJu+ETsz0s7O8W3bqy6GebIUX
        l8KCJs3d0L6WQWj7tOLSuZvtXwlmNDEenX6uzeNx6KsJgm1Z+ssDpeet0tlQqKC66PuLe8UX
        Ii3UjwmoPTy48U+1qpDwr721b9edPjf75ZuavNTZL5XeL3VbdrLtTPFht44Tk6f9YFI6LhsR
        +GW+4Ivck48WXxCxTuJ/MPtU3PGrO6dl/O9nPtvFXbzjR+xShQTvCWW22pW5k0Sudog4xCVN
        DU88bWCiv/bEqmAlluKMREMt5qLiRABUY0U9rAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7qNIUGpBotXs1g8mLeNzeL6l+es
        Fntfb2W3mHF+H5PFj1s3WCxW7frD6MDmsXPWXXaPO9f2sHn0bVnF6HFmwRF2j8+b5AJYo/Rs
        ivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy/p08ylaw
        nrHiXPMflgbGHsYuRk4OCQETiXXHz7B0MXJxCAksZZSY82EtkMMBlJCSmN+iBFEjLPHnWhcb
        RM0TRolJX5+xgyTYBHIkFq5YywZiiwh4Sexb84ARpIhZ4ACjxP0XR6GmtjBKrPm0hhWkilPA
        WOLpygdgtrCAo8Sk/mVgNouAqsS2NYeYQGxeAUuJdxseQdmCEidnPgG7iFlAT6JtI9jVzALy
        EtvfzmGGuE5B4udTiDEiAlYSu2ZMYIGoEZG48aiFcQKj8Cwkk2YhTJqFZNIsJB0LGFlWMYqk
        lhbnpucWG+oVJ+YWl+al6yXn525iBEbgtmM/N+9gnPfqo94hRiYOxkOMEhzMSiK8eZoBqUK8
        KYmVValF+fFFpTmpxYcYTYE+m8gsJZqcD0wBeSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJ
        JanZqakFqUUwfUwcnFINTAYrPYV5X3/+7vG6/+Ht1IsP/s48zJJa7bpx2e6ETL4ivvnMFTfO
        Hr76/Ijx56Xvwtcu/Gcb9/9pSgf/2+e5MombHLu2fl3sy3g7MUV265GsjMTvP/ev9Jt/eppK
        WT1r6vyXpxRjfjJXqNdOyFPabjDded7ms49n5ZevSGHrWjNhRs6xUEEfM1N2FYd53Gx2qg/2
        WTblJYZnXtwqESVhuPDGq4xNO1w+en58z/2SIelolEuH5aYmt9vBni52rp0l1b871y1OXq9m
        yLXtr+BZo0Wuf7w9+55cClbYeqX8V+UqHvUz1a2dIawLy09v4P0ocTYjUEbvwBfx/+/zvlr+
        MavTfVOQ9r357nLdiKNi6UosxRmJhlrMRcWJAKdiuclJAwAA
X-CMS-MailID: 20231113165321eucas1p1362468122062652fb092080baa69a46e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231108085644eucas1p151ccbf0cf191149c8ade410bfca6acc5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231108085644eucas1p151ccbf0cf191149c8ade410bfca6acc5
References: <CGME20231108085644eucas1p151ccbf0cf191149c8ade410bfca6acc5@eucas1p1.samsung.com>
        <20231108085630.7767-1-pvorel@suse.cz>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.11.2023 09:56, Petr Vorel wrote:
> There is already krzk/linux.git listed, which is currently used.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>





