From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] drm/exynos: fix infinite loop issue incurred by no pair
Date: Tue, 18 Nov 2014 11:53:42 +0100
Message-ID: <CABxcv=kBH5LsOKxLYKvwH747fEuembbHOA4mbke_VrJa19m+dA@mail.gmail.com>
References: <1416280832-24609-1-git-send-email-inki.dae@samsung.com>
	<1416297489.2480.5.camel@collabora.co.uk>
	<546B0169.4010602@samsung.com>
	<CABxcv=kPShghFWcy_M9FxZ0m3aYghkLVex857YpCWuiM+tSp3w@mail.gmail.com>
	<546B23EC.3070601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:51651 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752715AbaKRKxn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 05:53:43 -0500
Received: by mail-wi0-f173.google.com with SMTP id r20so1371206wiv.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2014 02:53:42 -0800 (PST)
In-Reply-To: <546B23EC.3070601@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>

Hello Andrzej,

On Tue, Nov 18, 2014 at 11:48 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
>> So we have two issues here and your patch is only a workaround for the later.
>
> This is the same issue Krzysztof reported two weeks ago and I answered
> him with my diagnosis[1].
>
> [1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/39804
>

Great, thanks a lot for finding the cause of this issue!

> Regards
> Andrzej
>

Best regards,
Javier
