From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 04/20] clocksource: samsung_pwm_timer: Do not use clocksource_mmio
Date: Mon, 22 Jul 2013 09:47:04 +0200
Message-ID: <19090469.Cf6sbb33Ke@flatron>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com> <1374278673-25615-6-git-send-email-tomasz.figa@gmail.com> <51ECAD60.1000109@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f48.google.com ([209.85.214.48]:60985 "EHLO
	mail-bk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755186Ab3GVHrK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 03:47:10 -0400
In-Reply-To: <51ECAD60.1000109@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

Hi Daniel,

On Monday 22 of July 2013 05:56:16 Daniel Lezcano wrote:
> On 07/20/2013 02:04 AM, Tomasz Figa wrote:
> > In case of Samsung PWM timer, clocksource MMIO can not be used,
> > because
> > custom suspend/resume callbacks are required.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > ---
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Thanks for review.

> Please in the future Cc me and Thomas Gleixner (clocksource/clockevent
> maintainers).

Oh, right, sorry. This series originally was not touching the clocksource 
driver and I just kept original recipient list.

Btw. Have you updated MAINTAINERS file? In latest linux-next I can still 
see only John Stultz and Thomas Gleixner as maintainers of 
drivers/clocksource.

Best regards,
Tomasz
