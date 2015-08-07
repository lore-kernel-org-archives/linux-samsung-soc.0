From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 11/11] drm/exynos: remove struct exynos_drm_encoder layer
Date: Fri, 7 Aug 2015 14:28:49 +0200
Message-ID: <CAKMK7uFsh=PN0Mvb2kzBsDZr-ZhDnbJqcWHLr3_sagETZ+xUhg@mail.gmail.com>
References: <1438817060-22164-10-git-send-email-gustavo@padovan.org>
	<1438867908-18975-1-git-send-email-gustavo@padovan.org>
	<1438867908-18975-2-git-send-email-gustavo@padovan.org>
	<55C49B8A.4090009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:36342 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752539AbbHGM2u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Aug 2015 08:28:50 -0400
Received: by obnw1 with SMTP id w1so77631834obn.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Aug 2015 05:28:50 -0700 (PDT)
In-Reply-To: <55C49B8A.4090009@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel <dri-devel@lists.freedesktop.org>

On Fri, Aug 7, 2015 at 1:50 PM, Inki Dae <inki.dae@samsung.com> wrote:
>
> Booting is locked up here. This patch looks good to me so I tried to
> find why locked up and I found the booting is locked up as soon as
> console_lock function is called. Can you and other guys look into this
> issue?

It's not locked up, you simply won't see any dmesg output after that.
Use Archit's Kconfig support in drm-misc to disable fbdev emulation
and try again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
