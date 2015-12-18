From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] PM / OPP: Fix parsing of opp-microvolt and
 opp-microamp properties
Date: Fri, 18 Dec 2015 07:21:35 +0530
Message-ID: <20151218015135.GD28277@ubuntu>
References: <1471955.ORlHo2b56O@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1471955.ORlHo2b56O@amdc1976>
Sender: linux-pm-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Stephen Boyd <sboyd@codeaurora.org>, nm@ti.com, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, Dmitry Torokhov <dtor@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Len Brown <len.brown@intel.com>, open list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>, Shawn Guo <shawnguo@kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 17-12-15, 19:04, Bartlomiej Zolnierkiewicz wrote:
> Commit 01fb4d3c39d3 ("PM / OPP: Parse 'opp-<prop>-<name>'
> bindings") broke support for parsing standard opp-microvolt and
> opp-microamp properties.  Fix it by setting 'name' string to
> proper value for !prop cases.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Fixes: 01fb4d3c39d3 ("PM / OPP: Parse 'opp-<prop>-<name> 'bindings")
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
> v2:
> - rework the changes as requested by Viresh

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
