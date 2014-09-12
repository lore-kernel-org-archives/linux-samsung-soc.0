From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH RESEND v9 1/5] rtc: max77686: Allow the max77686 rtc to
 wakeup the system
Date: Fri, 12 Sep 2014 09:03:50 -0700
Message-ID: <CAD=FV=W3soOh2yf0pDcP0cXVGvxcbyTkO7z-1k0rV7DJAyhf=g@mail.gmail.com>
References: <1410509864-10019-1-git-send-email-javier.martinez@collabora.co.uk>
	<1410509864-10019-2-git-send-email-javier.martinez@collabora.co.uk>
	<CAD=FV=Vu3u=KfUNUpL6qcr0Fp42WbY8AqfOXyWr-D3KW1PucxA@mail.gmail.com>
	<5413173A.9070705@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:51442 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751944AbaILQDv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 12:03:51 -0400
Received: by mail-vc0-f178.google.com with SMTP id hy4so885735vcb.23
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2014 09:03:50 -0700 (PDT)
In-Reply-To: <5413173A.9070705@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alessandro Zummo <a.zummo@towertech.it>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Fri, Sep 12, 2014 at 8:54 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> You are right, I completely forgot to check if that actually landed and to
> remove the note in that case...
>
> Maybe when the set is applied the note can be removed from this patch or do
> you think that I should re-spin the series for that?

This seems like something a maintainer could handle removing, but I
guess it's totally up to the maintainer.  If I were the maintainer I'd
rather remove the note myself then see a whole spin of a 5-part series
just to fix this.  ;)


-Doug
