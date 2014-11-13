From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Enable max77802 rtc and clock drivers
Date: Thu, 13 Nov 2014 09:45:09 +0100
Message-ID: <CABxcv=kaOa1+6a1n_+GjoH=PgG=LzAnXLU7U_E5NvYYP-0WedA@mail.gmail.com>
References: <1414401440-10972-1-git-send-email-javier.martinez@collabora.co.uk>
	<04e101cff29f$4021ea00$c065be00$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:40291 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932097AbaKMIpK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 03:45:10 -0500
Received: by mail-wi0-f175.google.com with SMTP id l15so3543072wiw.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2014 00:45:09 -0800 (PST)
In-Reply-To: <04e101cff29f$4021ea00$c065be00$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Kevin Hilman <khilman@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Kukjin,

On Tue, Oct 28, 2014 at 12:06 PM, Kukjin Kim <kgene@kernel.org> wrote:
> Javier Martinez Canillas wrote:
>> Commit 6e80e3d87549 ("ARM: exynos_defconfig: Enable MAX77802")
>> enabled support for the max77802 regulators but the PMIC also
>> has a Real-Time-Clock (RTC) and 2-channel 32kHz clock outputs.
>>
>
> I'll apply this, thanks.
>
> - Kukjin
>

You say that you will apply this patch but I can't find it in any of
your branches.

Best regards,
Javier
