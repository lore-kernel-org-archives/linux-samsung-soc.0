From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V2 1/6] clk: exynos-audss: convert to platform device
Date: Tue, 24 Sep 2013 11:20:05 +0200
Message-ID: <3549301.xmRx49e0Zc@amdc1227>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
 <1379982078-23381-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34008 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753162Ab3IXJUT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Sep 2013 05:20:19 -0400
In-reply-to: <1379982078-23381-1-git-send-email-abrestic@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Rahul Sharma <rahul.sharma@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Tushar Behera <tushar.behera@linaro.org>, Doug Anderson <dianders@chromium.org>, Padmavathi Venna <padma.v@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Andrew,

I'd like to ack this series, but there is one more thing that I think
should be fixed. Please see my comment inline.

On Monday 23 of September 2013 17:21:13 Andrew Bresticker wrote:
> @@ -128,8 +135,53 @@ static void __init exynos_audss_clk_init(struct device_node *np)
>  #endif
>  
>  	pr_info("Exynos: Audss: clock setup completed\n");

nit (not the thing I mentioned above): This (and possibly other uses of
pr_*() could be replaced with dev_*().

> +
> +	return 0;
> +}
> +
> +static int exynos_audss_clk_remove(struct platform_device *pdev)
> +{
> +	int i;
> +
> +	for (i = 0; i < EXYNOS_AUDSS_MAX_CLKS; i++) {
> +		if (clk_table[i])

I believe clk_register_* functions return ERR_PTR() in case of failure,
not NULL, so this should be accounted for either here or at probe time.
Possibly checking for registration error in probe() would be the best
solution, although bloating the code a bit (but what error path isn't?).

Best regards,
Tomasz
