From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: Allow modular build of the Audio Subsystem
 CLKCON driver
Date: Wed, 13 Jul 2016 12:23:42 +0200
Message-ID: <578616AE.7010805@samsung.com>
References: <1467987300-31450-1-git-send-email-s.nawrocki@samsung.com>
 <146799700614.73491.6564650478987470074@resonance>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <146799700614.73491.6564650478987470074@resonance>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07/08/2016 06:56 PM, Michael Turquette wrote:
> Quoting Sylwester Nawrocki (2016-07-08 07:15:00)
>> > Any clock dependencies can be properly handled with deferred probing
>> > so we can remove core_initcall and switch to a proper loadable platform
>> > driver module.
>> > This change has been tested on Exynos4412 Odroid U3 based board.
>> > 
>> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>
> Looks good to me.

Thanks, I have added this patch to my tree, however at the moment
I have only two patches queued there. Please feel free to apply
this patch directly to clk-next.

-- 
Regards,
Sylwester
