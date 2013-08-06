From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/3] clk: exynos4: Make exynos4_plls static
Date: Tue, 6 Aug 2013 21:02:19 +0100
Message-ID: <20130806200219.GD23006@n2100.arm.linux.org.uk>
References: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Also note:

On Tue, Aug 06, 2013 at 05:01:13PM +0530, Sachin Kamat wrote:
> @@ -984,7 +984,7 @@ static __initdata struct of_device_id ext_clk_match[] = {

For the declaration above...

> -struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
> +static struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {

And this one... __initdata should come just before the '=', not at the
start, not in the middle and not before the variable.

The reasoning is that with how you have it above, the attributes are
applied to the structure.  You want to apply the attributes to the
declaration instead, so it should come after the variable name.

So, for example:

	struct foo *foo __attribute__((section(".foo"))) = (void *)1;

will place the "foo" variable into a section called ".foo", but:

	struct __attribute__((section(".foo"))) foo *foo = (void *)1;

will place "foo" into the normal .data section.

So, the rule with variable declarations is that the __ specifiers we
have as macros in the kernel always come after the variable name being
declared and nowhere else.  We consider anywhere else buggy.
