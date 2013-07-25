From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: exynos4: Add CLK_GET_RATE_NOCACHE flag for the
 Exynos4x12 ISP clocks
Date: Thu, 25 Jul 2013 13:23:37 -0700
Message-ID: <20130725202337.7598.20912@quantum>
References: <1372099374-21008-1-git-send-email-s.nawrocki@samsung.com>
 <51ED2230.8080100@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51ED2230.8080100@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2013-07-22 05:14:40)
> On 06/24/2013 08:42 PM, Sylwester Nawrocki wrote:
> > The ISP clock registers belong to the ISP power domain and may change
> > their values if this power domain is switched off/on. Add
> > CLK_GET_RATE_NOCACHE flags to ensure we do not rely on invalid cached
> > data when setting or getting frequency of those clocks.
> > 
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Mike,
> 
> would you consider queueing that patch for current -rc cycle ?

Sylwester,

Can you rebase this onto -rc2? It does not apply cleanly onto my -fixes
branch.

Regards,
Mike

> 
> Thanks,
> Sylwester
