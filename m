From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [RESEND,v2] cpufreq: s5pv210: Don't flood kernel log after
 cpufreq change
Date: Mon, 24 Jun 2019 10:27:25 +0530
Message-ID: <20190624045725.mckcpb5kvkug33p6@vireshk-i7>
References: <20190621101043.10549-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190621101043.10549-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, krzk@kernel.org, rjw@rjwysocki.net, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 21-06-19, 12:10, Paweł Chmiel wrote:
> This commit replaces printk with pr_debug, so we don't flood kernel log.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> Changes from v1:
>   - Added Acked-by
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
