From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH] ARM: EXYNOS: mcpm: Don't rely on firmware's secondary_cpu_start
Date: Fri, 6 Jun 2014 15:46:41 -0700
Message-ID: <CAL1qeaFYqqDvYYhKMPwaP8TcyCtvr8afWi7GZN1E3d7ov6LJYA@mail.gmail.com>
References: <1402090985-8061-1-git-send-email-dianders@chromium.org>
	<alpine.LFD.2.11.1406061831310.25775@knanqh.ubzr>
	<CAD=FV=U6cUNd4tZ1q3WUMkNpU-O-1yEbnEPuGkctwi_8UkBEkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:62396 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752269AbaFFWqm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jun 2014 18:46:42 -0400
Received: by mail-vc0-f179.google.com with SMTP id id10so2179814vcb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jun 2014 15:46:41 -0700 (PDT)
In-Reply-To: <CAD=FV=U6cUNd4tZ1q3WUMkNpU-O-1yEbnEPuGkctwi_8UkBEkA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Inderpal Singh <inderpal.s@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Olof Johansson <olof@lixom.net>, Tushar Behera <trblinux@gmail.com>, Kevin Hilman <khilman@linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

>> If this is all that is needed to solve the problem being discussed in
>> the other thread I have absolutely no issue with such a workaround going
>> into mainline.
>
> This plus the CCI fix that Andrew is planning to post.

Right - we'll need a patch to enable the CCI port for the cluster we
booted on at boot and resume time since the first CPU up won't enter
through exynos_pm_power_up_setup().  I'll try to post something later
today or Monday.
