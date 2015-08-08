From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: exynos: Fix for memory leak in case SoC name
 does not match
Date: Sat, 8 Aug 2015 18:59:15 +0530
Message-ID: <20150808132915.GP6939@linux>
References: <04f401d0ce89$81073900$8315ab00$@kernel.org>
 <9283770.jQmuxWnYst@vostro.rjw.lan>
 <55C5B182.6000509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55C5B182.6000509@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kukjin Kim <kgene@kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>, shailendra.capricorn@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 08-08-15, 16:36, Krzysztof Kozlowski wrote:
> The cpufreq driver will be removed completely in v4.3 or v4.4 with
> patchset adding cpufreq-dt support for Exynos 4x12. This means that this
> patch makes sense only for 4.2 and as a stable backport (but it was not
> marked as such).
> 
> Anyone thinks that the patch will be worth stable back-porting?

Doesn't look worth enough to me..

-- 
viresh
