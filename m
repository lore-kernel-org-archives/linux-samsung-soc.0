Return-Path: <SRS0=OkOd=7C=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE9EC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 May 2020 05:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D808206C3
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 May 2020 05:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D359glu6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgETF2K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 May 2020 01:28:10 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:33189 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgETF2J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 May 2020 01:28:09 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20200520052806epoutp01db3dd3bfa347a18c2d627221fb37e2e8~QpVzbXLSK1857018570epoutp01K
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2020 05:28:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20200520052806epoutp01db3dd3bfa347a18c2d627221fb37e2e8~QpVzbXLSK1857018570epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589952486;
        bh=Lz7nCXlEgsTVeJh88UTu2H9uXAqQ44317OPlgguwk/U=;
        h=From:To:Cc:Subject:Date:References:From;
        b=D359glu6uj3VcYnQEKKzCvtEt7ASvhmnOhV+ZS4Fr/1offc3hbPPX2Rzcg2GETSyl
         8m0vAWS9ivC+k6C1peBEDnlbIO99/cCyxC+lvkC12rEM0M7iv5GcWrVhGl6pTFrINM
         pd7shvj1DaaJziHnvTyjmiUamNojt9j5C59dIAhE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200520052806epcas1p15ee74e2c1822ccad80d29d5202872020~QpVzKyMOB0593705937epcas1p12;
        Wed, 20 May 2020 05:28:06 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.158]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 49Rh945wpPzMqYkh; Wed, 20 May
        2020 05:27:52 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        6D.71.04658.1DFB4CE5; Wed, 20 May 2020 14:27:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200520052745epcas1p3ea5ad049aa682f5afbeaaeec9df8d835~QpVfRuZrD2083220832epcas1p3E;
        Wed, 20 May 2020 05:27:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200520052745epsmtrp1eccd10d7398ea3dd7a5a6ccc22e17171~QpVfQ_TZ92439924399epsmtrp1R;
        Wed, 20 May 2020 05:27:45 +0000 (GMT)
X-AuditID: b6c32a39-a81ff70000001232-13-5ec4bfd111c1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        BC.04.18461.0DFB4CE5; Wed, 20 May 2020 14:27:44 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200520052744epsmtip2464798424fb91f6e27dadb79accef04e~QpVfHH1OU0574105741epsmtip2F;
        Wed, 20 May 2020 05:27:44 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc:     linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date:   Wed, 20 May 2020 14:33:05 +0900
Message-Id: <1589952785-24210-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7bCmnu6l/UfiDBYuY7ToPXeSyeLK1/ds
        FjPO72NyYPbY/u0Bq8f97uNMHp83yQUwR2XbZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjq
        GlpamCsp5CXmptoqufgE6Lpl5gAtUlIoS8wpBQoFJBYXK+nb2RTll5akKmTkF5fYKqUWpOQU
        WBboFSfmFpfmpesl5+daGRoYGJkCFSZkZ9yYdJe14IhoxdIXZxgbGI8LdjFyckgImEhsPvOf
        rYuRi0NIYAejxKZTH1kgnE+MEo+fnoByvjFKrHr0mgWmZeOU61Atexkl7j9YywrhfGGUaG1Z
        wghSxSagKjFxxX02EFtEwFSiY9JSsG5moPi/9X+YQWxhAWWJ3df3ATVzcLAAxW/slQYxeQVc
        JFZv84PYJSdx81wnM8h4CYFmdokXTWcYIRIuEs1ztkEdJCzx6vgWdghbSuJlfxs7VAOjxMQZ
        p5kgnA5GibuPr0N1GEvsXzqZCWQbs4CmxPpd+hBhRYmdv+cyQtzJJ/Huaw/YbRICvBIdbUIQ
        JUoSxy7egLpBQuLCkolsELaHxPmGBWDThQRiJQ7/vMw4gVF2FsKCBYyMqxjFUguKc9NTiw0L
        TJFjaRMjOPFoWe5gPHbO5xCjAAejEg/vjZ2H44RYE8uKK3MPMUpwMCuJ8E54cShOiDclsbIq
        tSg/vqg0J7X4EKMpMPAmMkuJJucDk2JeSbyhqZGxsbGFiaGZqaGhkjjv1Os5cUIC6Yklqdmp
        qQWpRTB9TBycUg2MlS5tvaJBj0QerA1+IqF5bdtuxabbas++3NpswjnF+s6U69Pmd8dHnldd
        U7IwrGr2sXoGteNB5zwnOB+bn+anOX+O+lKFnPmJpjqJZR4bdCf3SfOVCO/7/7bMoGhCwdl1
        zoYpTJ3/f0yX1v91W/J3oLSHy4a3+1YuqfzplNz1jnH68utJO1hclViKMxINtZiLihMBGhI4
        RVIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLJMWRmVeSWpSXmKPExsWy7bCSvO6F/UfiDD702Fj0njvJZHHl63s2
        ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7hsUlJzMstSi/TtErgybky6y1pwRLRi6YszjA2M
        xwW7GDk5JARMJDZOuc7WxcjFISSwm1Hiwf9fTF2MHEAJCYktWzkgTGGJw4eLIUo+MUocOL6Q
        EaSXTUBVYuKK+2wgtoiAucSJi7fB4sxA8X/r/zCD2MICyhK7r+9jBZnDAhS/sVcaxOQVcJFY
        vc0P4gI5iZvnOpknMPIsYGRYxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHAJamjsY
        t6/6oHeIkYmD8RCjBAezkgjvhBeH4oR4UxIrq1KL8uOLSnNSiw8xSnOwKInz3ihcGCckkJ5Y
        kpqdmlqQWgSTZeLglGpgqjUMd2/UmrytIvfRJJPHRhHP/RXdOO7vqT5nZV/F+fnD9G+fz+X9
        fjV5m+Kl7EN9c3lfLPla+viu7z62p9Y7tvxicN0QvqLsvvfjY+/WVc9wmTv7b0VHmXj/96xP
        d6fNVVgr1mCfIMd0TDd5hvbk5PVzZq/kdAr8vn2O3Nm6qwVfutObp9zXcHkTLHRv7fFEFcP+
        1un1XHu+RRp/ctPxCDm1tXDRkaPL5tXXuIYvfdlbu96bTf6S5+5eY7mv2laN7h93pUUqqNvf
        e3rs2l6/ice4mgOz507e5HZ537uyk+ZP1+mv2bnR/d32rqeW6Z+3fOM8W1DSWbFlgwrj81Yh
        6z3B/KcPuf/ddtGywHbLq1tKLMUZiYZazEXFiQDEzPIkcAIAAA==
X-CMS-MailID: 20200520052745epcas1p3ea5ad049aa682f5afbeaaeec9df8d835
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200520052745epcas1p3ea5ad049aa682f5afbeaaeec9df8d835
References: <CGME20200520052745epcas1p3ea5ad049aa682f5afbeaaeec9df8d835@epcas1p3.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just several fixups and cleanups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 1493bddcca4d601ca6f3dd27f2226f37a0f39732:

  Merge tag 'drm-misc-next-2020-05-14' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2020-05-15 12:23:25 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.8

for you to fetch changes up to f84e1ba336a4f47ae251e4d2d8a694902571b0df:

  drm/exynos-vidi: convert platform driver to use dev_groups (2020-05-18 13:19:18 +0900)

----------------------------------------------------------------
Check imported buffer mapping in generic way
- This patch reworks exynos_drm_gem_prime_import_sg_table function,
  which checks if the imported buffer has been mapped as contiguous
  or not in generic way, and flag a exynos gem buffer type properly
  according to the mapped way.

Fixups
- Drop a reference count to in_bridge_node correctly.
- Enable the runtime power management correctly.
  . The runtime pm should be enabled before calling compont_add().

Cleanups
- Do not register "by hand" a sysfs file, and use dev_groups instead.
- Drop internal 'pages' array which aren't needed.
- Remove dead-code.
- Correct type casting.
- Drop unnecessary error messages.

----------------------------------------------------------------
Bernard Zhao (1):
      drm/exynos: make pointer to const data const type

Christophe JAILLET (1):
      drm/exynos: dsi: Remove bridge node reference in error handling path in probe function

Emil Velikov (1):
      drm/exynos-vidi: convert platform driver to use dev_groups

Marek Szyprowski (4):
      drm/exynos: gem: Remove dead-code
      drm/exynos: gem: rework scatter-list contiguity check on prime import
      drm/exynos: gem: Get rid of the internal 'pages' array
      drm/exynos: mixer: Fix enabling of the runtime power management

Markus Elfring (1):
      drm/exynos: Delete an error message in three functions

 drivers/gpu/drm/exynos/exynos_drm_drv.c     |   1 -
 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  26 ++--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c   |  28 +----
 drivers/gpu/drm/exynos/exynos_drm_gem.c     | 182 ++++++++++------------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h     |  16 +--
 drivers/gpu/drm/exynos/exynos_drm_mic.c     |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c  |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  26 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c       |   6 +-
 10 files changed, 103 insertions(+), 192 deletions(-)
