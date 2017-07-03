From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: mic: add a bridge at probe
Date: Mon, 03 Jul 2017 12:37:20 +0200
Message-ID: <f1e52e1b-3e02-185d-3647-3d14e82344c9@samsung.com>
References: <1499066879-13241-1-git-send-email-inki.dae@samsung.com>
 <CGME20170703072802epcas5p2137cf0009888a6b7b6bc31c416e5c4a2@epcas5p2.samsung.com>
 <1499066879-13241-3-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17678 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753413AbdGCKhZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Jul 2017 06:37:25 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OSI00IBGG6BIN30@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Jul 2017 11:37:23 +0100 (BST)
In-reply-to: <1499066879-13241-3-git-send-email-inki.dae@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org

On 03.07.2017 09:27, Inki Dae wrote:
> This patch moves drm_bridge_add call into probe.
>
> This change is required by DSI driver so that
> the brige can be bound at DSI driver's probe.
>
> Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej
