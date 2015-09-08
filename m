From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 3/4] cpufreq-dt: add suspend frequency support
Date: Tue, 8 Sep 2015 08:15:58 +0530
Message-ID: <20150908024558.GE26760@linux>
References: <1441640501-13613-1-git-send-email-b.zolnierkie@samsung.com>
 <1441640501-13613-4-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34185 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299AbbIHCqE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Sep 2015 22:46:04 -0400
Received: by padhy16 with SMTP id hy16so108091970pad.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Sep 2015 19:46:03 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1441640501-13613-4-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Tomasz Figa <tomasz.figa@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Chanwoo Choi <cw00.choi@samsung.com>, Kevin Hilman <khilman@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Anand Moon <linux.amoon@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 07-09-15, 17:41, Bartlomiej Zolnierkiewicz wrote:
> +#ifdef CONFIG_PM
> +	.suspend = cpufreq_generic_suspend,
> +#endif

I don't think there is any need of the #ifdef here.

-- 
viresh
