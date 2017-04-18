From: Dave Airlie <airlied@gmail.com>
Subject: Re: [GIT PULL] exynos-drm-next
Date: Wed, 19 Apr 2017 09:35:02 +1000
Message-ID: <CAPM=9tx2prz3mKuaRwwLohQ4gX_PbCOnVwdRZJXAt3EHzrPe1Q@mail.gmail.com>
References: <CGME20170418020509epcas5p2e54f307dee164846dabf0470c5f134eb@epcas5p2.samsung.com>
 <1492481109-2863-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:34082 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757893AbdDRXfD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 19:35:03 -0400
Received: by mail-vk0-f68.google.com with SMTP id w6so579735vkd.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Apr 2017 16:35:03 -0700 (PDT)
In-Reply-To: <1492481109-2863-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Dave Airlie <airlied@linux.ie>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On 18 April 2017 at 12:05, Inki Dae <inki.dae@samsung.com> wrote:
> Hi Dave,
>
>    Some improvements, fixups and cleanups to Exynos DRM.
>
>    Ps. this pull-reuqest includes a merge tag from Krzysztof Kozlowski
>    who is a Exynos SoC maintainer, which includes dt patches because
>    these should be merged together with below one,
>       drm/exynos: dsi: Fix the parse_dt function
>
>    Please kindly let me know if there is any problem.

Hi Inki,

We closed the merge window at -rc6 for this release, due to some push
back from Linus,

It was mentioned in a few mails on dri-devel, so I'm going to have to
leave this pull req
until the next merge, unless there is something in here that will break badly.

Dave.
