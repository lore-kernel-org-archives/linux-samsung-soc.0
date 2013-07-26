From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2] clk: exynos4: Add CLK_GET_RATE_NOCACHE flag for the
 Exynos4x12 ISP clocks
Date: Fri, 26 Jul 2013 15:19:02 -0700
Message-ID: <20130726221902.7598.22707@quantum>
References: <1374786425-6697-1-git-send-email-sylvester.nawrocki@gmail.com>
 <20130726203026.7598.21711@quantum> <51F2F26E.4090909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51F2F26E.4090909@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2013-07-26 15:04:30)
> On 07/26/2013 10:30 PM, Mike Turquette wrote:
> > Quoting Sylwester Nawrocki (2013-07-25 14:07:05)
> >> From: Sylwester Nawrocki<s.nawrocki@samsung.com>
> >>
> >> The ISP clock registers belong to the ISP power domain and may change
> >> their values if this power domain is switched off/on. Add
> >> CLK_GET_RATE_NOCACHE flags to ensure we do not rely on invalid cached
> >> data when setting or getting frequency of those clocks.
> >>
> >> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
> >> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> >
> > Thanks for the fix. I've taken into clk-fixes. Is there a specific
> > regression this fixes (besides just having wrong clock rates). I can
> > amend the changelog if you have an example (e.g. device X explodes).
> 
> Hmm, yes, this fixes a pretty serious problem. There is a companion
> commit [1] already in Linus' tree, more details can be found there.
> 
> Perhaps something like this could be added:
> 
> "Otherwise the FIMC-IS Cortex-A5 core and AXI bus clocks have
> incorrect frequencies, which breaks the ISP operation and starting
> the video pipeline fails with timeouts reported by the FIMC-IS
> firmware.
> 
> See related commit 722a860ecb29aa34ec6f7d7f32b949209e8
> "[media] exynos4-is: Fix FIMC-IS clocks initialization" for more
> details."

That's great.

Thanks,
Mike

> 
> [1] 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit?id=722a860ecb29aa34ec6f7d7f32b949209e86a2f3
> 
> Thanks,
> Sylwester
