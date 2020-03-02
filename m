Return-Path: <SRS0=h/HI=4T=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C1AC3F2D2
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Mar 2020 05:21:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8619246B6
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Mar 2020 05:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fh2lr15G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgCBFVf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Mar 2020 00:21:35 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:57478 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgCBFVe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Mar 2020 00:21:34 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200302052132epoutp03645c7c6c78ef16090560ae48d1a9128a~4ZSg1fgW40052200522epoutp03J
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Mar 2020 05:21:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200302052132epoutp03645c7c6c78ef16090560ae48d1a9128a~4ZSg1fgW40052200522epoutp03J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583126492;
        bh=46U7FU8gZqtWA3A/O3G8YSmsPVOISmwZ93BWStiusDo=;
        h=From:To:Cc:Subject:Date:References:From;
        b=fh2lr15GPGDIvOHw0mABhefnfErn3EWm/7q3K9m++pPH/crfnvMfLDoVpYJvPY5RU
         kFQay9n55gRp48BroI+rNfriNZvy6ju3YRry+2uZOTKCQOWg2dQ6pxVV7b6OkDWgDR
         6DN0FF9ETBG908gH+5ZlZJaNjh2F9EuT5uXXHVkc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200302052132epcas1p2faf1c9648f2f45967e1150ede67501c4~4ZSgrnnuO1418414184epcas1p2M;
        Mon,  2 Mar 2020 05:21:32 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.152]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 48W7m95QvQzMqYkq; Mon,  2 Mar
        2020 05:21:29 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        73.3F.48019.7D79C5E5; Mon,  2 Mar 2020 14:21:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200302052126epcas1p21d95dcf8a7e458a2332f0532cc2f6e3e~4ZSbQKrkC1172211722epcas1p2T;
        Mon,  2 Mar 2020 05:21:26 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200302052126epsmtrp17b372e373e82f0798dab0a384e6506a3~4ZSbPTtfr1145811458epsmtrp11;
        Mon,  2 Mar 2020 05:21:26 +0000 (GMT)
X-AuditID: b6c32a38-23fff7000001bb93-a0-5e5c97d74cd3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        03.D4.06569.6D79C5E5; Mon,  2 Mar 2020 14:21:26 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200302052126epsmtip2a547560c39c86dc5d6cd0f31c4de63fa~4ZSbCr3-Z1188611886epsmtip2O;
        Mon,  2 Mar 2020 05:21:26 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Mon,  2 Mar 2020 14:25:52 +0900
Message-Id: <1583126752-30477-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7bCmru716TFxBufeMFv0njvJZHHl63s2
        ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7JtMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
        DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
        LAv0ihNzi0vz0vWS83OtDA0MjEyBChOyM47MO8ZWMJGnYu+HbpYGxl6uLkYODgkBE4m9txK7
        GLk4hAR2MEps3PCXGcL5xChx4fBRdgjnG6NE26JTQA4nWEfz8rmsEIm9jBL3Ti9ng3C+MEos
        f9rMBlLFJqAqMXHFfTBbREBE4viyv2A2s4CbxJ+lZ1lAdgsLqEgcmMgHEmYBKt+4qQGshFfA
        RWLLmkPMEMvkJG6e6wQ7SULgJqvElb43UFe4SHyZdpgRwhaWeHV8C1RcSuJlfxs7REMzo8TE
        GaeZIJwORom7j6+zQFQZS+xfOpkJ5ApmAU2J9bv0IcKKEjt/z2WEOJRP4t3XHlZIIPFKdLQJ
        QZQoSRy7eANqr4TEhSUT2SBsD4mrSyEhJCQQK/Gjs5FxAqPsLIQFCxgZVzGKpRYU56anFhsW
        mCDH0iZGcOLRstjBuOeczyFGAQ5GJR7eHc+j44RYE8uKK3MPMUpwMCuJ8PpyAoV4UxIrq1KL
        8uOLSnNSiw8xmgKDbyKzlGhyPjAp5pXEG5oaGRsbW5gYmpkaGiqJ8z6M1IwTEkhPLEnNTk0t
        SC2C6WPi4JRqYNSzWsh/xEHlvU6pbtW0yZ9LTt4+phv6sp/1v0xTaFrl+ykcX/ds289i9ES/
        eq9uw+kvQk1Kye+mcD69OSXsZVAf31k/R8vudDaGZRrHPy00yDH+5D61SKxhUQan0+J4Jdt7
        C+yYDaUCY7TUGRxkm6I8zbefzazY/vr2bBYZ7ZBJ+an151KPKLEUZyQaajEXFScCAE9c/shS
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFJMWRmVeSWpSXmKPExsWy7bCSvO616TFxBvf3Clr0njvJZHHl63s2
        ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7hsUlJzMstSi/TtErgyjsw7xlYwkadi74dulgbG
        Xq4uRk4OCQETieblc1m7GLk4hAR2M0pc+rOKqYuRAyghIbFlKweEKSxx+HAxSLmQwCdGiSXr
        jUBsNgFViYkr7rOB2CICIhLHl/0Fs5kFPCTe71nNDtIqLKAicWAiH0iYBah846YGsBJeAReJ
        LWsOMUNcICdx81wn8wRGngWMDKsYJVMLinPTc4sNC4zyUsv1ihNzi0vz0vWS83M3MYJDQEtr
        B+OJE/GHGAU4GJV4eHc8j44TYk0sK67MPcQowcGsJMLrywkU4k1JrKxKLcqPLyrNSS0+xCjN
        waIkziuffyxSSCA9sSQ1OzW1ILUIJsvEwSnVwKjxa+PbIFbXmIkppsKHZJUdTOaXJmg+uGzQ
        vTlDMUUyuEC9QXrft1smyq/eChUXfGFdFC30aqlzKWPT+qnLOM/s8H1RrvPzwqSLZ4/rMtYc
        nzRV3k9D+2ND4J0vFyWPyBVJPX4zoyCxmmf5nEuibNeOvNWUfunb132J63rTzg33rjI5yz09
        fV6JpTgj0VCLuag4EQAas55s/QEAAA==
X-CMS-MailID: 20200302052126epcas1p21d95dcf8a7e458a2332f0532cc2f6e3e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200302052126epcas1p21d95dcf8a7e458a2332f0532cc2f6e3e
References: <CGME20200302052126epcas1p21d95dcf8a7e458a2332f0532cc2f6e3e@epcas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just three fixups - fix a kernel oops and regulator warning
   at booting time, and correct to print out an error message.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit f091bf39700dd086ab244c823f389556fed0c513:

  Merge tag 'drm-intel-fixes-2020-02-27' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-02-28 12:40:49 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.6-rc5

for you to fetch changes up to 3b6a9b19ab652efac7ad4c392add6f1235019568:

  drm/exynos: hdmi: don't leak enable HDMI_EN regulator if probe fails (2020-03-02 13:02:41 +0900)

----------------------------------------------------------------
Three fixups
- fix a kernel oops problem in case that driver is loaded as module.
- fix a regulator warning issue when I2C DDC adapter cannot be gathered.
- print out an error message only in error case excepting -EPROBE_DEFER.

----------------------------------------------------------------
Marek Szyprowski (3):
      drm/exynos: dsi: propagate error value and silence meaningless warning
      drm/exynos: dsi: fix workaround for the legacy clock name
      drm/exynos: hdmi: don't leak enable HDMI_EN regulator if probe fails

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 12 +++++++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c    | 22 ++++++++++++----------
 2 files changed, 19 insertions(+), 15 deletions(-)
