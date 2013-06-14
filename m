From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] clocksource: samsung_pwm_timer: Do not request PWM mem
 region
Date: Fri, 14 Jun 2013 14:51:34 -0700
Message-ID: <20130614215134.GG17326@quad.lixom.net>
References: <1371151364-8121-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:53856 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751176Ab3FNVv2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 17:51:28 -0400
Received: by mail-pd0-f180.google.com with SMTP id 10so962902pdi.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2013 14:51:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1371151364-8121-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, john.stultz@linaro.org, tglx@linutronix.de

On Thu, Jun 13, 2013 at 09:22:44PM +0200, Tomasz Figa wrote:
> PWM registers are shared between clocksource and PWM drivers and so can
> not be claimed for exclusive use.
> 
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Acked-by: Olof Johansson <olof@lixom.net>
