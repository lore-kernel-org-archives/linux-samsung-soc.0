From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 3/5] ARM: Exynos: switch to using generic cpufreq
 driver for Exynos4x12
Date: Mon, 3 Aug 2015 16:10:44 +0530
Message-ID: <20150803104044.GB21529@linux>
References: <1438368557-2352-1-git-send-email-b.zolnierkie@samsung.com>
 <5201904.0cZWHobiJs@amdc1976>
 <20150803102926.GA21529@linux>
 <4532306.AVvo5hem3c@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:32811 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751637AbbHCKkt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Aug 2015 06:40:49 -0400
Received: by pdbnt7 with SMTP id nt7so72468546pdb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Aug 2015 03:40:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4532306.AVvo5hem3c@amdc1976>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Chanwoo Choi <cw00.choi@samsung.com>, Kevin Hilman <khilman@linaro.org>, Javier Martinez Canillas <javier@dowhile0.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Anand Moon <linux.amoon@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>

On 03-08-15, 12:36, Bartlomiej Zolnierkiewicz wrote:
> I would really like it to be dependency not an option (+ I think
> that ideally it should be checked at runtime, IOW we should be
> checking from cpufreq-dt driver if the thermal support is enabled
> before enabling boost support).

I don't think boost has any dependency on thermal support. Yeah, it
may be true for your platform but we can't force it. People might have
different algorithms to control boost modes, thermal is just one
option they may look at. For few, enabling boost may not be a thermal
issue, but power. So, they want to allow it only when they want, but
that wouldn't burn their chip.

So, a platform can choose how it wants to have it. :)

-- 
viresh
