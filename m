From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V3 4/9] cpufreq: exynos: Use 'index' only to index into
 policy->freq_table
Date: Mon, 06 Jun 2016 09:07:48 +0200
Message-ID: <57552144.10300@samsung.com>
References: <cover.1464960877.git.viresh.kumar@linaro.org>
 <e6621408b2a7748d6b984eb6c97d8ee13be96ad5.1464960877.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <e6621408b2a7748d6b984eb6c97d8ee13be96ad5.1464960877.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>, Kukjin Kim <kgene@kernel.org>
Cc: linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, steve.muckle@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Shawn Guo <shawn.guo@freescale.com>, Steven Miao <realmz6@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 06/03/2016 03:35 PM, Viresh Kumar wrote:
> Later patches would make changes in cpufreq core, after which
> policy->freq_table may be reordered by cpufreq core and it wouldn't be
> safe anymore to use 'index' for any other local arrays.
> 
> To prepare for that, use policy->freq_table[index].driver_data for other
> driver specific usage of 'index'. The 'driver_data' fields are already
> set properly by the driver.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/cpufreq/exynos5440-cpufreq.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

