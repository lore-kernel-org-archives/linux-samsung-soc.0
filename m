Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F760C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 May 2021 03:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03F1B611AE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 May 2021 03:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhETDjt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 May 2021 23:39:49 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:20001 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhETDjs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 May 2021 23:39:48 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210520033826epoutp03b8b3c6a9c9f707d8d70013061dea4177~AqTPrJmAl2520225202epoutp03x
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 May 2021 03:38:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210520033826epoutp03b8b3c6a9c9f707d8d70013061dea4177~AqTPrJmAl2520225202epoutp03x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1621481906;
        bh=8HAuScdh4maJm0CF5JoM42EssYC7fa4abwITfojD65U=;
        h=From:To:Cc:Subject:Date:References:From;
        b=qRY1NjHY8ZvC/Ieir84I0FKK1cwmGe5QK+oY6QlZf9rdQ83idPhAiz39QIZqjv2wD
         Aa8lW2x90Ln4H7F7Gj8HRHJC+IBuXF5ljXvxu/eUmaBiJyCtaA8faFSoAG1f6yxjgP
         aOGzOzcdHqqPmLMFK35L6wyXFJUN3XxjKIrCfTng=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20210520033825epcas1p4363742fa3ecb57c6e78a31c50e6cc259~AqTPMpU8c0150001500epcas1p40;
        Thu, 20 May 2021 03:38:25 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.155]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4FlwSH3t5Jz4x9Pp; Thu, 20 May
        2021 03:38:23 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        1C.57.09578.CA9D5A06; Thu, 20 May 2021 12:38:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20210520033819epcas1p4aef9997d933b28551b7bd2db754328b8~AqTJRoru42833528335epcas1p48;
        Thu, 20 May 2021 03:38:19 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210520033819epsmtrp289405dc7da5c2be19e0bd856ec8da5f0~AqTJRD9iw2092420924epsmtrp2-;
        Thu, 20 May 2021 03:38:19 +0000 (GMT)
X-AuditID: b6c32a35-fcfff7000000256a-2b-60a5d9ac0f33
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        47.BC.08637.BA9D5A06; Thu, 20 May 2021 12:38:19 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210520033819epsmtip2175e134985a93019c91ca308191951d0~AqTJIm2Mj2547125471epsmtip2h;
        Thu, 20 May 2021 03:38:19 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Thu, 20 May 2021 12:47:47 +0900
Message-Id: <20210520034747.257687-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIKsWRmVeSWpSXmKPExsWy7bCmru6am0sTDJ5MYrfoPXeSyeLK1/ds
        FjPO72NyYPbY/u0Bq8f97uNMHp83yQUwR2XbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjq
        GlpamCsp5CXmptoqufgE6Lpl5gAtUlIoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQU
        WBboFSfmFpfmpesl5+daGRoYGJkCFSZkZ+x9/pG54DZXxZ4Vj9kaGH9wdDFyckgImEhM/fee
        vYuRi0NIYAejREPPa2YI5xOjxM/1/9ggnG+MEpN+vGSGaXk25y0jRGIvo8SLrmYWCOcLo8T8
        A6+YQKrYBFQlJq64zwZiiwiISBxf9hfMZhZwk/iz9CxQAweHsICKxIGJfCBhFqDy25tPgLXy
        ClhJdO3tZIdYJi8x89J3doi4oMTJmU9YIMbISzRvnQ110CJ2iW+rRSBsF4m+SXegeoUlXh3f
        AmVLSXx+txfsGwmBZkaJiTNOM0E4HYwSdx9fZ4GoMpbYv3QyE8hxzAKaEut36UOEFSV2/p7L
        CLGYT+Ld1x5WkBIJAV6JjjYhiBIliWMXbzBC2BISF5ZMZIMo8ZB4+UwSJCwkECtx/MlVlgmM
        8rOQfDMLyTezEPYuYGRexSiWWlCcm55abFhgiBypmxjBaU3LdAfjxLcf9A4xMnEwHmKU4GBW
        EuHd7r04QYg3JbGyKrUoP76oNCe1+BCjKTB8JzJLiSbnAxNrXkm8oamRsbGxhYmhmamhoZI4
        b7pzdYKQQHpiSWp2ampBahFMHxMHp1QDk+3vy4xivjvU1DeWddnKGHidnfYlWuNy/Q3/zX/r
        GFPdKo+c4TnL8bVQ9e3CuilJv2ffVzEJWte1Jzmq3S5v2bOZon07AiLFJzI/PO7zVunvm8oK
        4zrx1F0cen7ztCeZLPBf7qDzf2FeUZhGIIdww43E5voTvlYd+l6+q9r3y4ozZPLMrPyhr1bn
        8zOUYf/fSev3+xjZqU5YtTVd3FnBp+XGi0If/0qWm0f/Fz2N47BJWf1Y6swtjSvhh1KbZ147
        Zlk85/aRzm2qGtGTCpOF2zqTLcOchDTEPgsr+828mnPx+lv/0qm3RP2mGW40NrhvsFR3NZOt
        nEtdLcv1o5tCa9knfnNzN5ygejbMylCJpTgj0VCLuag4EQAYcuMO9AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LZdlhJXnf1zaUJBj0t4ha9504yWVz5+p7N
        Ysb5fUwOzB7bvz1g9bjffZzJ4/MmuQDmKC6blNSczLLUIn27BK6Mvc8/Mhfc5qrYs+IxWwPj
        D44uRk4OCQETiWdz3jJ2MXJxCAnsZpQ4924DexcjB1BCQmLLVg4IU1ji8OFiiJJPjBJfzi9m
        A+llE1CVmLjiPpgtIiAicXzZXzCbWcBD4v2e1WBjhAVUJA5M5AMJswCV3958ggnE5hWwkuja
        28kOcYK8xMxL39kh4oISJ2c+YYEYIy/RvHU28wRGvllIUrOQpBYwMq1ilEwtKM5Nzy02LDDM
        Sy3XK07MLS7NS9dLzs/dxAgOMi3NHYzbV33QO8TIxMF4iFGCg1lJhHe79+IEId6UxMqq1KL8
        +KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGph4DH617b2v5lgWc/aJtk6J
        +pR1PaJ8Rvzvpl0WuRIqdn3f5wN7BbJuJvM7xXr3dkzin1rrIyjhcH1Gg/zaDpW4tOx3B1am
        l3KbLVxwOShsddtXt8OnQg5t5jxWPWGaVesM9iutswKuiZvsq30sp58wUcR/ouAjX5Grp2t0
        wrz/cFw/ordxCg/rgnTNCAPesvZ0+3WfFt9ps3t0/kz4Dl/x94K3WqI8HKckLmXbtshI51if
        QvaOhVMPvHdYytvszmk68/hL4as3+91Loto/sGnP6WAwmK3ZnMI6acK2E3aymjVFTfum24ey
        fA7W/KrIfdr6kerzuG/hFp/n7macsnZxF/NjAfnAqYduzJn455oSS3FGoqEWc1FxIgBhWnDY
        oQIAAA==
X-CMS-MailID: 20210520033819epcas1p4aef9997d933b28551b7bd2db754328b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210520033819epcas1p4aef9997d933b28551b7bd2db754328b8
References: <CGME20210520033819epcas1p4aef9997d933b28551b7bd2db754328b8@epcas1p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just one fixup to kerneldoc and two cleanups to drop redundant error
   messages.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc:

  Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.13-rc3

for you to fetch changes up to a470c5665b3b918c31bcc912234862803b10ba00:

  drm/exynos/decon5433: Remove redundant error printing in exynos5433_decon_probe() (2021-05-17 20:31:39 +0900)

----------------------------------------------------------------
Fixup
- Correct kerneldoc of fimd_shadow_protect_win function.

Cleanup
- Drop redundant error messages.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      drm/exynos: correct exynos_drm_fimd kerneldoc

Zhen Lei (2):
      drm/exynos: Remove redundant error printing in exynos_dsi_probe()
      drm/exynos/decon5433: Remove redundant error printing in exynos5433_decon_probe()

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 4 +---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)
