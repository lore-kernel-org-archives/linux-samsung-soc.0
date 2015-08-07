From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 0/6] cpufreq: use generic cpufreq drivers for
 Exynos4x12 platform
Date: Fri, 7 Aug 2015 17:26:27 +0530
Message-ID: <20150807115627.GH6939@linux>
References: <1438868514-8814-1-git-send-email-b.zolnierkie@samsung.com>
 <2061119.GBaoSb4YSL@amdc1976>
 <20150807113950.GG6939@linux>
 <2359635.Hxe4cb8zKm@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:36226 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752840AbbHGL4c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Aug 2015 07:56:32 -0400
Received: by pacrr5 with SMTP id rr5so51436578pac.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Aug 2015 04:56:31 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <2359635.Hxe4cb8zKm@amdc1976>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd.bergmann@linaro.org>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Michael Turquette' <mturquette@baylibre.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Lukasz Majewski' <l.majewski@samsung.com>, 'Heiko Stuebner' <heiko@sntech.de>, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kevin Hilman' <khilman@linaro.org>, 'Javier Martinez Canillas' <javier@dowhile0.org>, 'Tobias Jakobi' <tjakobi@math.uni-bielefeld.de>, 'Anand Moon' <linux.amoon@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 07-08-15, 13:47, Bartlomiej Zolnierkiewicz wrote:
> Hmm, wait.  Patch 6/6 depends on earlier changes.  I cannot remove
> the config option in question now as it is currently used by
> exynos-cpufreq specific boost support.  Patch 1/6 can be applied
> now but 6/6 needs to wait for patches 2-5 to be applied first.
> 
> Actually 6/6 is trivial and can be applied later in v4.3 cycle or
> even in v4.4 one.

Ack.

-- 
viresh
