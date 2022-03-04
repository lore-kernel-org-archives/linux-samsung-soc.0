Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E2FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Mar 2022 08:41:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234652AbiCDImD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Mar 2022 03:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235454AbiCDIl4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 03:41:56 -0500
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B30819F454
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 00:40:33 -0800 (PST)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220304084030epoutp04feab3a88db41ac6a49869ce57dcc16af~ZINNMkClt2651526515epoutp04X
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Mar 2022 08:40:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220304084030epoutp04feab3a88db41ac6a49869ce57dcc16af~ZINNMkClt2651526515epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1646383230;
        bh=VHl2AEUxuvsgyp7Sk/GNkRfOZGbefQVMhocbOXscIXE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=uyCTjWdOW71tEz+Hjukep39w+ouvdCmnnvBp0VWqbQkc2Q+th7M5EnUohsyhGPgwV
         ur+rG5PuZDME/Qr5Wk6CLXwWWzeERKmt6SgLGxhEqwqiugRSrmtj7ZgyTT0qCI8ojb
         hRo7AjnAuT78h4/6C0IP2rJb+Y0AruXd90l6i4/c=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220304084030epcas1p17b48445ead80a8c147d705c5bbbd87dc~ZINM_COHz2880828808epcas1p1m;
        Fri,  4 Mar 2022 08:40:30 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.136]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4K91Ws0J4mz4x9Qd; Fri,  4 Mar
        2022 08:40:25 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        E6.11.64085.E60D1226; Fri,  4 Mar 2022 17:40:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20220304084014epcas1p3a58e06bdff6af99d20a4de5fbc7f1327~ZIM_L6sYx3141831418epcas1p3o;
        Fri,  4 Mar 2022 08:40:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220304084014epsmtrp155ef066513e9fc07cdaead25f8b35e20~ZIM_LRkF-0123801238epsmtrp1K;
        Fri,  4 Mar 2022 08:40:14 +0000 (GMT)
X-AuditID: b6c32a35-9c3ff7000000fa55-40-6221d06ed7ee
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        FF.AE.29871.E60D1226; Fri,  4 Mar 2022 17:40:14 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220304084014epsmtip28941387886f64c7fcff65f740cc27efa~ZIM_BMu8y0628806288epsmtip23;
        Fri,  4 Mar 2022 08:40:14 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, daniel.vetter@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next for v5.18
Date:   Fri,  4 Mar 2022 17:52:20 +0900
Message-Id: <20220304085220.324245-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDKsWRmVeSWpSXmKPExsWy7bCmvm7eBcUkg1+dBha9504yWSx8eJfZ
        4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
        yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
        I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvj/9NmpoLjnBVNLw8wNTC+Z+9i
        5OSQEDCRuDjtBJDNxSEksINRonP1P1YI5xOjxJYvbSwQzjdGiWtdP5lhWq7sm8EMkdjLKNH+
        D8b5wijx69tSJpAqNgFViYkr7rN1MXJwiAjoSLw4UwASZhZwk/iz9CwLiC0soCtxft96VpAS
        FqDyuw/FQMK8AlYScx70MEHskpeYeek7O0RcUOLkzCcsEGPkJZq3zgZbKyFwiF1i5crtrBAN
        LhJven9AHSos8er4Fqg/pSRe9rexQzRMZpS4c30FC4Qzg1Hi8M/rjBBVxhL7l05mArmIWUBT
        Yv0ufYiwosTO33MZITbzSbz72gN2tIQAr0RHmxBEiZLEsYs3oKZISFxYMpENwvaQeNq6G8wW
        EoiVuLjwBcsERvlZSP6ZheSfWQiLFzAyr2IUSy0ozk1PLTYsMITHanJ+7iZGcLLTMt3BOPHt
        B71DjEwcjIcYJTiYlUR4LTUVkoR4UxIrq1KL8uOLSnNSiw8xmgIDeCKzlGhyPjDd5pXEG5pY
        GpiYGRmbWBiaGSqJ866adjpRSCA9sSQ1OzW1ILUIpo+Jg1Oqgclj5TKzf2t73CdfranYX3Dh
        17XkaafPZOz/2Xk2xuxiyhmF2DlhWt5nWxNVRafcLN/3t/qNzv28c/c68uZdyFFjfvMzzV2G
        edfxvbc7rX6LVkYs0f3gMOOq4aHimRe7VHz+ZujvvshS9fD2uViP/RFvjZ52hgdOsfEQzLBZ
        wbiOd1eX1efvWd5x1pZCJ7mFtzR3v2nM2X//5ttNwjkJZYwxNZOleaabLvOPZjhbnph+YPui
        6isHzj1VWK4sLy/yb9eyta+WvmW5Jf31pOD7P3W9a9T0nRoe1LMkr2p09KlZlho661a4WGGL
        mkXoLWPB5oToXOFJ2adKovmWJe3a/fyXp1bK3jyl0IQvT6y6jiuxFGckGmoxFxUnAgAUm9rh
        /wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWy7bCSvG7eBcUkg0O98ha9504yWSx8eJfZ
        4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCWKyyYlNSezLLVI3y6BK+P/02am
        guOcFU0vDzA1ML5n72Lk5JAQMJG4sm8GcxcjF4eQwG5GiZNdS4AcDqCEhMSWrRwQprDE4cPF
        ECWfGCUurrnDCtLLJqAqMXHFfTYQW0RAT6Kt4xTYTGYBD4n3e1aD2cICuhLn961nBZnDAlR/
        96EYSJhXwEpizoMeJogT5CVmXvrODhEXlDg58wkLSDmzgLrE+nlCEBPlJZq3zmaewMg/C0nV
        LISqWUiqFjAyr2KUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECA5SLc0djNtXfdA7xMjE
        wXiIUYKDWUmE11JTIUmINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZqakFqUUw
        WSYOTqkGphaN1/96t3EoTF9+9qXc3i1/zpf/+XJZZpmUjOqmSSlPYsON23xXFTxVd6w0ffqC
        R+X54/qVwmv/99qcc5oRPJPhEuvB//vyjrYW5B7Ikg17n377FeOpZYXJPZ4fp3vuFPr75taE
        /NKKLw0PmnWZuV+LF16taO1NT3X2EOG9toMjcGbjjPJA58p7Qt5GVszMF4Xsj/i8ndPuw+1R
        tdZbIDLqzoLi3Zdm/67sTzvltCr/klPvw6CvJp0Cn/JP2QiuuXnD/dqB7G0ub5Q3C7/bdJbx
        voc3wxXldfMz6r++XJCy6vIXxn+7LmooFE5yOv/SbeJZ2Y1HSlsW8L002tn+YSef+5TEJj1F
        q5hX3y2uKSqxFGckGmoxFxUnAgDU/Hh2wQIAAA==
X-CMS-MailID: 20220304084014epcas1p3a58e06bdff6af99d20a4de5fbc7f1327
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220304084014epcas1p3a58e06bdff6af99d20a4de5fbc7f1327
References: <CGME20220304084014epcas1p3a58e06bdff6af99d20a4de5fbc7f1327@epcas1p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave and Daniel,

   Just adding BGR pixel format support per a plane.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit fedc89821990013608bc210c9aef5bb33a1345a7:

  drm/exynos: Search for TE-gpio in DSI panel's node (2022-03-04 17:13:51 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-v5.18

for you to fetch changes up to 2d684f4e155c1e80ff63bd503930171c460eac5b:

  drm/exynos: fimd: add BGR support for exynos4/5 (2022-03-04 17:13:52 +0900)

----------------------------------------------------------------
New feature
- Add BGR pixel format support for FIMD device. As for this,
  this patch uses undocumented register, WIN_RGB_ORDER, but
  it is safe because product kernels have been using same
  register.

----------------------------------------------------------------
Martin Jücker (1):
      drm/exynos: fimd: add BGR support for exynos4/5

 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 42 ++++++++++++++++++++++++++++++--
 include/video/samsung_fimd.h             |  4 +++
 2 files changed, 44 insertions(+), 2 deletions(-)
