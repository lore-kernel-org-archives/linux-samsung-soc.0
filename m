From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH V2 1/6] clk: exynos-audss: convert to platform device
Date: Tue, 24 Sep 2013 11:47:45 +0200
Message-ID: <52415FC1.4070400@samsung.com>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
 <1379982078-23381-1-git-send-email-abrestic@chromium.org>
 <3549301.xmRx49e0Zc@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <3549301.xmRx49e0Zc@amdc1227>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Leela Krishna Amudala <l.krishna@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>, Jiri Kosina <jkosina@suse.cz>, Stephen Boyd <sboyd@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Sachin Kamat <sachin.kamat@linaro>
List-Id: linux-samsung-soc@vger.kernel.org

On 24/09/13 11:20, Tomasz Figa wrote:
>> +static int exynos_audss_clk_remove(struct platform_device *pdev)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < EXYNOS_AUDSS_MAX_CLKS; i++) {
>> +		if (clk_table[i])
> 
> I believe clk_register_* functions return ERR_PTR() in case of failure,
> not NULL, so this should be accounted for either here or at probe time.
> Possibly checking for registration error in probe() would be the best
> solution, although bloating the code a bit (but what error path isn't?).

After registering all clocks a loop iterating over all entries of the
clk_table[] array could be added and if any of the entries is ERR_PTR()
either an error could be just logged or the successfully registered
clocks could be freed and probe() could fail. It doesn't really seems
much additional code.

--
Thanks,
Sylwester
