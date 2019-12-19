Return-Path: <SRS0=HBcY=2J=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2189BC43603
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 00:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE79E21D7D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Dec 2019 00:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JvWh/Yka"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfLSADd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Dec 2019 19:03:33 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:61521 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfLSADd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 19:03:33 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20191219000330epoutp04a9bf753e0e1604eea197e318481e7637~hnNtLqhp41443814438epoutp04D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2019 00:03:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20191219000330epoutp04a9bf753e0e1604eea197e318481e7637~hnNtLqhp41443814438epoutp04D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576713810;
        bh=8fBB6QGYPy5ReA5RF7QCokohjlPLmZAX7X63ZJd8vl4=;
        h=From:To:Cc:Subject:Date:References:From;
        b=JvWh/Ykajyc8G2pXdlYkyWfFJ4viioaR/yNC7UYPeZmFhojebeDWmyl3066Tc895k
         6Hpo/abwn2nWoqkmXgqWlS5b7LQ65F+mBrMbd4UYapk1AvEHkwzaQbX8Jz1gmZxMLA
         REqXVi6HDD7VnTrvXpCVaXVBuYEyc8mFMzlgjJN4=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20191219000329epcas1p4c46feb601ebbde135308116d56ef86f3~hnNs8Y-pJ0419304193epcas1p4q;
        Thu, 19 Dec 2019 00:03:29 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 47dXCM2QhZzMqYkV; Thu, 19 Dec
        2019 00:03:27 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        94.B9.52419.B4EBAFD5; Thu, 19 Dec 2019 09:03:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20191219000323epcas1p4e611fadbe0280766b75ac01af5c68587~hnNmslCs-0417204172epcas1p4d;
        Thu, 19 Dec 2019 00:03:23 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191219000323epsmtrp1b6e57ff6af3fccff90f693a83bbccbec~hnNmsCHI61786117861epsmtrp1v;
        Thu, 19 Dec 2019 00:03:23 +0000 (GMT)
X-AuditID: b6c32a37-59fff7000001ccc3-ea-5dfabe4bbc8c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        CE.32.06569.B4EBAFD5; Thu, 19 Dec 2019 09:03:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191219000323epsmtip292808a3f730e320754c48f51706e5cd4~hnNmj3ZZb3112031120epsmtip2x;
        Thu, 19 Dec 2019 00:03:23 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Thu, 19 Dec 2019 09:06:53 +0900
Message-Id: <1576714013-3788-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7bCmvq73vl+xBl9eqVj0njvJZHHl63s2
        ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
        DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
        LAv0ihNzi0vz0vWS83OtDA0MjEyBChOyM9bf385S8I29YsaDy8wNjCfZuhg5OSQETCTW7F7K
        2MXIxSEksINRYkvPP2YI5xOjxNT2fhYI5xujRNO6o0AZDrCWru++EPG9jBKzL/yCav/CKPHm
        wnpGkLlsAqoSE1fcB9shIiAicXzZXzCbWcBN4s/Ssywgg4QFVCQOTOQDCbMAlT99v5MJxOYV
        cJZ4vuotO8R5chI3z3UyQ9g3WSX+7+WGsF0kJm45zAphC0u8Or4Fql5K4mV/G5RdLvHs3TMW
        iJtrJL7NrYAwjSUurkgBMZkFNCXW79KHKFaU2Pl7LiPEjXwS7772sEJU80p0tAlBlChJHLt4
        gxHClpC4sGQiNAg9JO5Pvg0WFxKIlXh24SzLBEbZWQgLFjAyrmIUSy0ozk1PLTYsMEaOoE2M
        4HSjZb6DccM5n0OMAhyMSjy8P1x/xQqxJpYVV+YeYpTgYFYS4b3d8TNWiDclsbIqtSg/vqg0
        J7X4EKMpMOQmMkuJJucDU2FeSbyhqZGxsbGFiaGZqaGhkjgvx4+LsUIC6YklqdmpqQWpRTB9
        TBycUg2MyY5s+v8je13jrY6XTw87culo/myb7fdcT7xLPMKbE1r9avOFb0d3/K9iOi1eUt/0
        3GTP5gX5Bx+LpU042Hhr+cUj+e6XGWUK55rNnPj0WFLY45qQ82HXo6632on+iPovvb7v7Der
        igD5lrOm9RGlqlOvJwdzqP497PPuwdvzTuVfX8REz44TU2Ipzkg01GIuKk4EAIvhA/9NAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJJMWRmVeSWpSXmKPExsWy7bCSvK73vl+xBvcm8Fv0njvJZHHl63s2
        ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7hsUlJzMstSi/TtErgy1t/fzlLwjb1ixoPLzA2M
        J9m6GDk4JARMJLq++3YxcnIICexmlHj9zgUiLCGxZSsHhCkscfhwcRcjF1DFJ0aJOSueM4GU
        swmoSkxccZ8NxBYREJE4vuwvmM0s4CHxfs9qdpBeYQEViQMT+UDCLEDlT9/vBGvlFXCWeL7q
        LTuILSEgJ3HzXCfzBEaeBYwMqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxggNAS2sH
        44kT8YcYBTgYlXh4f7j+ihViTSwrrsw9xCjBwawkwnu742esEG9KYmVValF+fFFpTmrxIUZp
        DhYlcV75/GORQgLpiSWp2ampBalFMFkmDk6pBkaNvZ0GK2Vdqvan2nLMy2f+ft7pye3TvFzz
        5izNcZC7YmG3ew2j8qutSdrSi31MNu9nvTBzKqftppUKgmet7Dq32Hj1FlZKLJPmD5oZ6maa
        EV3m8JrR9nzEWg411tdXdTbO+6yyz/TQ7OfW863W7ynMLDvJ9vam3ibJrR+kEjm+/GvJNpAx
        nqXEUpyRaKjFXFScCAAUZ/ki/AEAAA==
X-CMS-MailID: 20191219000323epcas1p4e611fadbe0280766b75ac01af5c68587
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191219000323epcas1p4e611fadbe0280766b75ac01af5c68587
References: <CGME20191219000323epcas1p4e611fadbe0280766b75ac01af5c68587@epcas1p4.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,
   Just one bug fixup which makes sure to unregister a component
   for Exynos gscaler driver.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.5-rc3

for you to fetch changes up to 84c92365b20a44c363b95390ea00dfbdd786f031:

  drm/exynos: gsc: add missed component_del (2019-12-19 08:52:42 +0900)

----------------------------------------------------------------
Just one bug fixup
. Make sure to unregister a component for Exynos gscaler driver
  when the driver is removed.

----------------------------------------------------------------
Chuhong Yuan (1):
      drm/exynos: gsc: add missed component_del

 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 1 +
 1 file changed, 1 insertion(+)
