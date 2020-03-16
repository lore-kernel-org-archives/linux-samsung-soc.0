Return-Path: <SRS0=jGgw=5B=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12308C10DCE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Mar 2020 01:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CC9020674
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Mar 2020 01:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HXeeCx9Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbgCPBEy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 15 Mar 2020 21:04:54 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:32530 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbgCPBEy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 Mar 2020 21:04:54 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200316010450epoutp03201371c0b3d961aeb6bf039ea9d4f63a~8o0YhEZMO1352713527epoutp03G
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Mar 2020 01:04:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200316010450epoutp03201371c0b3d961aeb6bf039ea9d4f63a~8o0YhEZMO1352713527epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1584320690;
        bh=HwhpcH1Wgb6cRKyT3zCXEk0XyA2XROaQct1qZ62tPqk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=HXeeCx9YUILoqDFxtqv1VRKAW1PxNH/jGoXvq6v833vIfmAFiS5TPxXTSDYS4mK7C
         Q/LdZRCRiqvMgSHz+1Q4GIs3AVS9DeMpMatHpDeS0yrkHLT//khUTuv4EEFQsitLzJ
         oilkG9Y63thAMAYvEkJkQlSdSXRXhVn5nMuunmL0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200316010450epcas1p2c54911c0d4480b61501db29f37a7731d~8o0YOTEHb1982019820epcas1p2K;
        Mon, 16 Mar 2020 01:04:50 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.154]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 48gdPW0LBczMqYkj; Mon, 16 Mar
        2020 01:04:47 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        63.B3.04074.BA0DE6E5; Mon, 16 Mar 2020 10:04:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d~8o0RvO4Bl1042510425epcas1p3i;
        Mon, 16 Mar 2020 01:04:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200316010443epsmtrp11b02a751c320248b02cef03005016049~8o0RuoYam2938029380epsmtrp1Q;
        Mon, 16 Mar 2020 01:04:43 +0000 (GMT)
X-AuditID: b6c32a39-58bff70000000fea-a1-5e6ed0ab35c9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        4E.FF.04158.BA0DE6E5; Mon, 16 Mar 2020 10:04:43 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200316010443epsmtip120d86e92784c8ea045d5fc650742ad2c~8o0Rl-g1d0278702787epsmtip1y;
        Mon, 16 Mar 2020 01:04:43 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date:   Mon, 16 Mar 2020 10:09:17 +0900
Message-Id: <1584320957-9442-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAKsWRmVeSWpSXmKPExsWy7bCmvu7qC3lxBsc+q1j0njvJZHHl63s2
        ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
        DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
        LAv0ihNzi0vz0vWS83OtDA0MjEyBChOyM+5cfctesE6w4uI5rwbGbXxdjJwcEgImEg+W7mfs
        YuTiEBLYwSjRsHQrG4TziVFi7aYD7BDON0aJF/PfMsO0LHz+nBUisZdR4uLOk8wQzhdGiZ07
        nzGBVLEJqEpMXHGfDcQWERCROL7sL5jNLOAm8WfpWRYQW1hAWWL39X2sIDYLUP3WNbcYQWxe
        AWeJrncQtoSAnMTNc53MEHFBiZMzn7BAzJGXaN46G2yxhEAHm8Tkhp0sEA0uEhMevWSCsIUl
        Xh3fwg5hS0m87G9jh2hoZpSYOOM0E1Q3o8Tdx9ehuo0l9i+dDJTgAFqhKbF+lz5EWFFi5++5
        jBCb+STefe1hBSmREOCV6GgTgihRkjh28QbU0RISF5ZMZIOwPSTmP9gPdo+QQKzEgUPXWSYw
        ys9C8s8sJP/MQli8gJF5FaNYakFxbnpqsWGBKXK0bmIEpzYtyx2Mx875HGIU4GBU4uGVSMuL
        E2JNLCuuzD3EKMHBrCTC21GTHSfEm5JYWZValB9fVJqTWnyI0RQY3BOZpUST84FpN68k3tDU
        yNjY2MLE0MzU0FBJnHfq9Zw4IYH0xJLU7NTUgtQimD4mDk6pBsazZtWn3bjKrnz9phr/LvB/
        zouZLuaPZa/+9n1kLnOpfurnKnWl0ujA+k92D1yLNtv/q9oWySt6staeveP7mu8te7c7tj17
        EOOaJDc9rL+Vc1nfF66Q6SqMO/4VHXv6YQ/Py3yTlNLWBv5ZRjP1rjsu+NBkW+t7PFxH503D
        feFNE/o+GiqZNSuxFGckGmoxFxUnAgBQ5rPmgwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSnO7qC3lxBs87uC16z51ksrjy9T2b
        xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUVw2Kak5mWWpRfp2CVwZd66+ZS9YJ1hx8ZxXA+M2
        vi5GTg4JAROJhc+fs3YxcnEICexmlPi3pJWpi5EDKCEhsWUrB4QpLHH4cDFEySdGib7Vl1lB
        etkEVCUmrrjPBmKLCIhIHF/2F8xmFvCQeL9nNTuILSygLLH7+j6wehag+q1rbjGC2LwCzhJd
        7yBsCQE5iZvnOpkh4oISJ2c+YQHZyyygLrF+nhDESHmJ5q2zmScw8s9CUjULoWoWkqoFjMyr
        GCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCA1JLawfjiRPxhxgFOBiVeHgl0vLihFgT
        y4orcw8xSnAwK4nwdtRkxwnxpiRWVqUW5ccXleakFh9ilOZgURLnlc8/FikkkJ5YkpqdmlqQ
        WgSTZeLglGpgdEvyabo5neWK5rozLEq3y1zWrZ5yl4GH5d3Gtgu359724DXJPrrvE/tbpWdb
        tm89mhvcJ7wm24YjdtPWKw6Jf+3bFyxYr6rEO99DL+zjsUwbY6fu/cuyHvr5xlWvOe+8v55h
        z4/g1TOm+4p7vFbhaBJb8+LeoabiODG1dEfdrEscTFaXz17pU2Ipzkg01GIuKk4EADd5eFJE
        AgAA
X-CMS-MailID: 20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d
References: <CGME20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d@epcas1p3.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

	Just two cleanups - one is to mask encoder bitmask using
	drm_encoder_mask(), and other is to use mode->clock
	instead of calculating it again.

	Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 69ddce0970d9d1de63bed9c24eefa0814db29a5a:

  Merge tag 'amd-drm-next-5.7-2020-03-10' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-03-13 09:09:11 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.7

for you to fetch changes up to 0c9a609ca444298e438ee9c6daaf53c14277f1ad:

  drm/exynos: Use mode->clock instead of reverse calculating it from the vrefresh (2020-03-16 09:50:28 +0900)

----------------------------------------------------------------
Two cleanups
. Replace the hand rolled encoder bitmask thing with drm_encoder_mask()
. Use mode->clock instead of reverse calculating it from the vrefresh

----------------------------------------------------------------
Inki Dae (1):
      Merge tag 'exynos-drm-fixes-for-v5.6-rc5-v2' of git://git.kernel.org/.../daeinki/drm-exynos into exynos-drm-next

Marek Szyprowski (1):
      drm/exynos: Fix cleanup of IOMMU related objects

Ville Syrjälä (2):
      drm/exynos: Use drm_encoder_mask()
      drm/exynos: Use mode->clock instead of reverse calculating it from the vrefresh

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  7 ++++---
 drivers/gpu/drm/exynos/exynos_drm_dma.c       | 28 ++++++++++++++++++---------
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  5 ++---
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +++--
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 ++++--
 drivers/gpu/drm/exynos/exynos_mixer.c         |  7 +++++--
 12 files changed, 56 insertions(+), 33 deletions(-)
