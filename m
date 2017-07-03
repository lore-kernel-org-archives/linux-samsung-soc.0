From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] drm/exynos: dsi: move of_drm_find_bridge call into probe
Date: Mon, 3 Jul 2017 21:05:03 +0200
Message-ID: <CAJKOXPeYBYzJx13Z=+BVADMKyCGmc_QYf+6jn+qd+rStUtxiNQ@mail.gmail.com>
References: <CGME20170703072801epcas1p3cbabe54a8457771f906378b1036294b6@epcas1p3.samsung.com>
 <1499066879-13241-1-git-send-email-inki.dae@samsung.com> <1499066879-13241-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752057AbdGCTFE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Jul 2017 15:05:04 -0400
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com [209.85.223.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FD5822C86
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Jul 2017 19:05:04 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id z62so61138321ioi.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jul 2017 12:05:04 -0700 (PDT)
In-Reply-To: <1499066879-13241-2-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>

On Mon, Jul 3, 2017 at 9:27 AM, Inki Dae <inki.dae@samsung.com> wrote:
> This patch moves of_drm_find_bridge call into probe.
>
> It doesn't need to call of_drm_find_bridge function every time
> bind callback is called. It's enough to call this funcation
> at probe one time.
>
> Suggested-by: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>

Hi Inki,

Minor note: you're the author of this patch so you cannot suggest it. :)

Best regards,
Krzysztof
