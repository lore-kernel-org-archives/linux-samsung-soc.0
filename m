From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 1/6] clk: exynos-audss: convert to platform device
Date: Wed, 25 Sep 2013 00:31:25 +0200
Message-ID: <524212BD.9070204@gmail.com>
References: <1379982078-23381-1-git-send-email-abrestic@chromium.org> <1380046016-5811-1-git-send-email-abrestic@chromium.org> <524200FB.8010004@gmail.com> <CAL1qeaEpu=YRasZpSvrCTNwC6OGWZgECjwDSFgkAN07eWObmrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaEpu=YRasZpSvrCTNwC6OGWZgECjwDSFgkAN07eWObmrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc
List-Id: linux-samsung-soc@vger.kernel.org

On 09/25/2013 12:12 AM, Andrew Bresticker wrote:
>>> +static int exynos_audss_clk_remove(struct platform_device *pdev)
>>> +{
>>> +       int i;
>>> +
>>> +       of_clk_del_provider(pdev->dev.of_node);
>>> +
>>> +       for (i = 0; i<   EXYNOS_AUDSS_MAX_CLKS; i++) {
>>> +               if (!IS_ERR_OR_NULL(clk_table[i]))
>>> +                       clk_unregister(clk_table[i]);
>>> +       }
>>
>>
>> Since we only get here if all the clocks are registered properly and we
>> always register EXYNOS_AUDSS_MAX_CLKS clocks, couldn't this simply be:
>>
>>
>>          for (i = 0; i<  EXYNOS_AUDSS_MAX_CLKS; i++)
>>                  clk_unregister(clk_table[i]);
>>
>> ?
>
> Once support is added for Exynos5420, we won't always register
> EXYNOS_AUDSS_MAX_CLKS clocks, so we'd still need the NULL check.

Then couldn't you use clk_data.clk_num in this loop instead of
EXYNOS_AUDSS_MAX_CLKS ? What I'm trying to avoid is assuming NULL as
an invalid clock. It's not correct, clock pointers should be only tested
with ERR_PTR(). Alternatively you could set the whole clk_table array to,
e.g. ERR_PTR(-EINVAL) beforehand, but that shouldn't be necessary when
clk_data.clk_num is used, unless there are holes in the array.

--
Regards,
Sylwester

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
