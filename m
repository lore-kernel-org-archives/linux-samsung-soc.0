From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [RFC PATCH v3 1/4] drm/exynos: make kms drivers to be independent drivers
Date: Thu, 20 Nov 2014 15:06:54 +0100
Message-ID: <CABxcv=msvOkbzZdh3xQ-GUZVioNuLhX_QixCDP8MMs1d3fc4Rg@mail.gmail.com>
References: <1416479088-29371-1-git-send-email-inki.dae@samsung.com>
	<1416479088-29371-2-git-send-email-inki.dae@samsung.com>
	<546DEA66.8010605@samsung.com>
	<546DF329.20201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:35450 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139AbaKTOG4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 09:06:56 -0500
Received: by mail-wi0-f181.google.com with SMTP id r20so5491826wiv.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2014 06:06:55 -0800 (PST)
In-Reply-To: <546DF329.20201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

Hello Inki,

On Thu, Nov 20, 2014 at 2:56 PM, Inki Dae <inki.dae@samsung.com> wrote:
>> If you try to build exynosdrm as module you will receive errors due to
>> multiple definitions of init_module, ie module_init/module_*_driver
>> macros can be used once per module.
>
> Ah, right. we had ever tried same way before but failed in same problem.
> I didn't realize that. Anyway, I will try to find out a better way. I'd
> really like to remove all register codes of sub drivers from
> exynos_drm_drv somehow.
>

Maybe as an immediate fix we can move the platform driver registration
out of probe as suggested by Andrzej?

I posted an RFC patch a couple of days ago [0] that fixes both the
deadlock and the infinite loop bug so it would be great if you can
review/test so I can post a proper patch.

And then we can look how to better refactor the exynos drm driver.

Best regards,
Javier

[0]: http://www.spinics.net/lists/linux-samsung-soc/msg39106.html
