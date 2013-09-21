From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] clk: exynos-audss: allow input clocks to be specified in device tree
Date: Sat, 21 Sep 2013 17:12:04 +0200
Message-ID: <9856196.dhfL7qQoq1@flatron>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org> <1379711637-5226-2-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379711637-5226-2-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Yadwinder Singh Brar <yadi.brar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Leela
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrew,

On Friday 20 of September 2013 14:13:53 Andrew Bresticker wrote:
> This allows the input clocks to the Exynos AudioSS block to be
> specified via device-tree bindings.  Default names will be used
> when an input clock is not given.
[snip]
> +Optional Properties:
> +
> +- clocks:
> +  - pll_ref: Fixed rate PLL reference clock, parent of mout_audss.
> "fin_pll" +    is used if not specified.
> +  - pll_in: Input PLL to the AudioSS block, parent of mout_audss.
> "fout_epll" +    is used if not specified.
> +  - cdclk: External i2s clock, parent of mout_i2s. "cdclk0" is used if
> not +    specified.
> +  - sclk_audio: Audio bus clock, parent of mout_i2s. "sclk_audio0" is
> used if +    not specified.
> +  - sclk_pcm_in: PCM clock, parent of sclk_pcm.  "sclk_pcm0" is used if
> not +    specified.
> +
> +- clock-names: Aliases for the above clocks. They should be "pll_ref",
> +  "pll_in", "cdclk", "sclk_audio", and "sclk_pcm_in" respectively.

I'd say that it should be preferred to specify all the input clocks 
appropriate for particular SoCs to fully represent the hardware. So the 
properties above should be marked as required (depending on SoC probably).

The fallback to default names in the driver should stay, though, to 
support older device trees.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
