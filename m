From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH RESEND v9 1/5] rtc: max77686: Allow the max77686 rtc to
 wakeup the system
Date: Fri, 12 Sep 2014 08:12:04 -0700
Message-ID: <CAD=FV=Vu3u=KfUNUpL6qcr0Fp42WbY8AqfOXyWr-D3KW1PucxA@mail.gmail.com>
References: <1410509864-10019-1-git-send-email-javier.martinez@collabora.co.uk>
	<1410509864-10019-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:47883 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751377AbaILPMG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 11:12:06 -0400
Received: by mail-vc0-f169.google.com with SMTP id ij19so832982vcb.28
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Sep 2014 08:12:04 -0700 (PDT)
In-Reply-To: <1410509864-10019-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alessandro Zummo <a.zummo@towertech.it>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Fri, Sep 12, 2014 at 1:17 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> From: Doug Anderson <dianders@chromium.org>
>
> The max77686 includes an RTC that keeps power during suspend.  It's
> convenient to be able to use it as a wakeup source.
>
> NOTE: due to wakeup ordering problems this patch alone doesn't work so
> well on exynos5250-snow.  You also need something that brings the i2c
> bus up before the max77686 wakeup runs.

This note made sense when the patch was first submitted, but no longer
does since the i2c change landed.  See:

b19c195 i2c: s3c2410: resume the I2C controller earlier
