From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [next] Odroid XU3 easily over-heats
Date: Mon, 15 Feb 2016 10:58:43 +0530
Message-ID: <20160215052843.GA6334@vireshk-i7>
References: <56C01963.3080106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56C01963.3080106@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Lukasz Majewski <l.majewski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 14-02-16, 15:06, Krzysztof Kozlowski wrote:
> Hi all,
> 
> With recent addition of cpufreq-dt support to Exynos5422
> it is very easy to over-heat the Odroid XU3 leading to critical shutdown:

How were OPPs passed earlier? I failed to see them in kernel somehow.
You must have been using opp-v1 earlier, right?

You used boost-freqs then? You used cpufreq as a cooling device then?

> What about cpufreq as cooling device? Probably that part
> is missing now, right?

Maybe, how was that earlier though ?

-- 
viresh
