From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] clocksource: exynos_mct: remove unneeded container_of()
Date: Mon, 29 Jun 2015 11:09:46 +0200
Message-ID: <55910B5A.2090407@linaro.org>
References: <1434322238.5390.16.camel@mtux> <1434919299.4096.1.camel@mtux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:35021 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752547AbbF2JJm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jun 2015 05:09:42 -0400
Received: by wgjx7 with SMTP id x7so62195278wgj.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2015 02:09:41 -0700 (PDT)
In-Reply-To: <1434919299.4096.1.camel@mtux>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexey Klimov <klimov.linux@gmail.com>, linux-samsung-soc@vger.kernel.org, k.kozlowski@samsung.com
Cc: sboyd@codeaurora.org, t.dakhran@gmail.com, kgene@kernel.org

On 06/21/2015 10:41 PM, Alexey Klimov wrote:
> Patch removes unneeded container_of() macro
> in exynos4_local_timer_setup(). Instead let's pass mevt pointer
> to setup and stop functions from exynos4_mct_cpu_notify()
> and let them get evt pointer.
>
> Tested on odroid-xu3.
>
> Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to my tree for 4.3.

Thanks !

   -- Daniel

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
