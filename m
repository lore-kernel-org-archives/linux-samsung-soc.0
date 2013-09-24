From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH V3 1/6] clk: exynos-audss: convert to platform device
Date: Tue, 24 Sep 2013 15:12:27 -0700
Message-ID: <CAL1qeaEpu=YRasZpSvrCTNwC6OGWZgECjwDSFgkAN07eWObmrg@mail.gmail.com>
References: <1379982078-23381-1-git-send-email-abrestic@chromium.org>
	<1380046016-5811-1-git-send-email-abrestic@chromium.org>
	<524200FB.8010004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <524200FB.8010004@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Rahul Sharma <rahul.sharma@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Tushar Behera <tushar.behera@linaro.org>, Doug Anderson <dianders@chromium.org>, Padmavathi Venna <padma.v@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead
List-Id: linux-samsung-soc@vger.kernel.org

>> +static int exynos_audss_clk_remove(struct platform_device *pdev)
>> +{
>> +       int i;
>> +
>> +       of_clk_del_provider(pdev->dev.of_node);
>> +
>> +       for (i = 0; i<  EXYNOS_AUDSS_MAX_CLKS; i++) {
>> +               if (!IS_ERR_OR_NULL(clk_table[i]))
>> +                       clk_unregister(clk_table[i]);
>> +       }
>
>
> Since we only get here if all the clocks are registered properly and we
> always register EXYNOS_AUDSS_MAX_CLKS clocks, couldn't this simply be:
>
>
>         for (i = 0; i < EXYNOS_AUDSS_MAX_CLKS; i++)
>                 clk_unregister(clk_table[i]);
>
> ?

Once support is added for Exynos5420, we won't always register
EXYNOS_AUDSS_MAX_CLKS clocks, so we'd still need the NULL check.

Thanks,
Andrew
