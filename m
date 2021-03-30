Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D498EC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Mar 2021 08:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 925B561994
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Mar 2021 08:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhC3IVf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 Mar 2021 04:21:35 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:23489 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbhC3IVM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Mar 2021 04:21:12 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210330082110epoutp0315bd83f95b6c2f285943ce046ae8d80e~xEQisxN7T2995229952epoutp031
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Mar 2021 08:21:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210330082110epoutp0315bd83f95b6c2f285943ce046ae8d80e~xEQisxN7T2995229952epoutp031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617092470;
        bh=zpCMmn+mvExInJ6ttq2Xtm10uFwO5aq5J9mHbc50k9c=;
        h=From:To:Cc:Subject:Date:References:From;
        b=UFaq9EOJRYF4FlHa/W+eOGutsVH/me770dDY0bIbjaiVbYMlbmN+e3scSJ7xxkQuY
         gFIHK1kHOWdlCXZhG7190/rwooenSqCoFVZKOBsf8bSn7x/aYx5c9b7vjhxo/IuCYX
         ICCeHWZQkGactxa0h461DSmVoZK4Tn8F6PyjY9Cs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20210330082109epcas1p317d371223b062bc7b1ca871dba0b67fd~xEQiYqVPa0627106271epcas1p3E;
        Tue, 30 Mar 2021 08:21:09 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4F8j825l6Fz4x9Py; Tue, 30 Mar
        2021 08:21:06 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        B9.D6.23820.D6FD2606; Tue, 30 Mar 2021 17:21:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210330082100epcas1p14a343aa642e07f678d265cb4fd9e930a~xEQZ_BycK1132811328epcas1p1A;
        Tue, 30 Mar 2021 08:21:00 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210330082100epsmtrp1460cae76bbd08d8d0028db3ac118124a~xEQZ9QiL62020920209epsmtrp1E;
        Tue, 30 Mar 2021 08:21:00 +0000 (GMT)
X-AuditID: b6c32a37-a6fff70000015d0c-0a-6062df6d1989
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        1F.4D.08745.C6FD2606; Tue, 30 Mar 2021 17:21:00 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210330082100epsmtip20a665953c79b8467fa2dc398a904ccaf~xEQZ01_ma0872608726epsmtip23;
        Tue, 30 Mar 2021 08:21:00 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date:   Tue, 30 Mar 2021 17:29:58 +0900
Message-Id: <1617092998-23645-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7bCmrm7u/aQEg18XxSx6z51ksrjy9T2b
        xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6
        hpYW5koKeYm5qbZKLj4Bum6ZOUCLlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF
        lgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZGROmXWIqeMJTsbnpN1MD41+uLkZODgkBE4n1ix+y
        gthCAjsYJY53qHcxcgHZnxgllm64wAzhfGaU2DhvAiNMR3P/eyaIxC5GiU87/7JBOF8YJV6c
        eM0OUsUmoCoxccV9NhBbREBE4viyv2A2s4CbxJ+lZ1lAbGEBZYnd1/eB7WYBqp/yH6KeV8BF
        YkbDTlaIbXISN891gp0hIfCfTeLH9SlQCReJy0daoGxhiVfHt7BD2FISL/vb2CEamhklJs44
        zQThdDBK3H18nQWiylhi/9LJQAkOoJM0Jdbv0ocIK0rs/D2XEeJSPol3X3tYQUokBHglOtqE
        IEqUJI5dvAENCgmJC0smskHYHhJ3985gBykXEoiVODafawKj7CyE+QsYGVcxiqUWFOempxYb
        Fhgjx9ImRnDi0TLfwTjt7Qe9Q4xMHIyHGCU4mJVEeIUPJCYI8aYkVlalFuXHF5XmpBYfYjQF
        BthEZinR5Hxg6ssriTc0NTI2NrYwMTQzNTRUEudNMngQLySQnliSmp2aWpBaBNPHxMEp1cCU
        fECi4ZhK/KW9q305hDhX3BK9uKB17lr7lMNKa/uLFyiafLM/tvpc3K0/P+44TkyMTOfzz7G7
        Zvdj29ysi/o8xbHcc3js5tVyVS3V1yzw5b/Yot/0wNj9e7P50r9nd8++1sjlpWBVtlMr8ZHp
        9s/pOQl8viaXpu585FKyO9A5YfKMqKUh+yJ2LTS4u0bKesHpb/N6WSvCZxhmHpzqpiy77sHB
        R3YvRZvavLP3ts2MYnQ+u3VRcGiGZTvDnZOC66zbDePF9Z5WzX9+4OURkRmPyjNX7xS8PIW5
        +tntXf13TJe+jbp3+9npox8ZDPYwm5W9Wffj0s7NdrN3tbEfFV+kvilD7u6ywGiucJPY2ctN
        lViKMxINtZiLihMBpIIVX8UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPJMWRmVeSWpSXmKPExsWy7bCSvG7O/aQEg/m/tS16z51ksrjy9T2b
        xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUVw2Kak5mWWpRfp2CVwZE6ZdYip4wlOxuek3UwPj
        X64uRk4OCQETieb+90xdjFwcQgI7GCWWPe9n62LkAEpISGzZygFhCkscPlwMUfKJUWLn7S52
        kF42AVWJiSvus4HYIgIiEseX/QWzmQU8JN7vWQ1WIyygLLH7+j5WEJsFqH7Kf4h6XgEXiRkN
        O1khbpCTuHmuk3kCI88CRoZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjBYaCltYNx
        z6oPeocYmTgYDzFKcDArifAKH0hMEOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJ
        anZqakFqEUyWiYNTqoGJI361x8lfU3Kecr+/dc75YTez5TRjh7fquvxWiQnfiuPYlrkdrlm6
        7Wws+8vTE1Zel86vvVrD8Cp1obbD3kPKPy7O3K9kmv7s0NsjkkXzZ8yvOtzyWfZIvElvquWi
        fwGL828YvfrUEho2KeaQlucn7YIEzm26i6W8K9dHGuvXPCkSj1LVKy7LZV2Sd3fCiTU8uZOO
        HtvfGGpXZRgdcSZD92SPgVTnJ1PXzetjcnrrdPs+rpl99r6kRlfU2+2ftCRYzCXOVrzJPKWu
        vcZ69eYrx96Yzgu+FtzvcTGQV2/b3hbv34fu776XIt1+daHVGXmNnB+FcX/+35+2+EzVrysd
        6pM8JlixHPB3YOV+//qLEktxRqKhFnNRcSIA/Go/03ICAAA=
X-CMS-MailID: 20210330082100epcas1p14a343aa642e07f678d265cb4fd9e930a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210330082100epcas1p14a343aa642e07f678d265cb4fd9e930a
References: <CGME20210330082100epcas1p14a343aa642e07f678d265cb4fd9e930a@epcas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just one patch to clean up the use of request_irq funtion.

   This patch has a dependency of one patch[1] so merged it on top of
   tag 'irq-no-autoen-2021-03-25' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip after top of drm next branch.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?id=cbe16f35bee6880becca6f20d2ebf6b457148552

The following changes since commit 99e5730dd2b11fedc890bbc9c803f69aad24e3ca:

  Merge tag 'irq-no-autoen-2021-03-25' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip into exynos-drm-next (2021-03-29 20:35:13 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.13

for you to fetch changes up to a4e5eed2c6a689ef2b6ad8d7ae86665c69039379:

  drm/exynos: move to use request_irq by IRQF_NO_AUTOEN flag (2021-03-29 20:37:17 +0900)

----------------------------------------------------------------
One cleanup
- Based on the patch[1], clean up the use of request_irq function
  series.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?id=cbe16f35bee6880becca6f20d2ebf6b457148552

----------------------------------------------------------------
Tian Tao (1):
      drm/exynos: move to use request_irq by IRQF_NO_AUTOEN flag

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)
