From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] iio: adc: Kconfig: exynos_adc depends on CONFIG_OF
Date: Fri, 15 Mar 2013 11:09:21 -0700
Message-ID: <CAD=FV=W90mKzmpg4cG_JJ6R6Of1jt=TxOe_1h-nvzs7KeAvDXQ@mail.gmail.com>
References: <1363364620-23597-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:51240 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753001Ab3COSJX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Mar 2013 14:09:23 -0400
Received: by mail-la0-f53.google.com with SMTP id fr10so4029311lab.40
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Mar 2013 11:09:22 -0700 (PDT)
In-Reply-To: <1363364620-23597-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-iio <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>

Naveen,

On Fri, Mar 15, 2013 at 9:23 AM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> As the exynos_adc driver only supports device tree registration.
> Making driver depend on CONFIG_OF solves possible errors during probe.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> ---
> Discussion thread for this patch can be found at
> http://www.gossamer-threads.com/lists/linux/kernel/1693284?page=last
>
>  drivers/iio/adc/Kconfig |    1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Doug Anderson <dianders@chromium.org>
