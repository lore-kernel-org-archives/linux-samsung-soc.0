From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 2/4] mfd: Add Samsung Exynos Low Power
 Audio Subsystem driver
Date: Wed, 10 Aug 2016 10:36:00 +0200
Message-ID: <a66ab86f-d5da-0462-81c9-48469721d229@samsung.com>
References: <1467738804-31460-1-git-send-email-s.nawrocki@samsung.com>
 <20160809150502.GQ5243@dell>
 <61d700f7-ef66-8278-54ea-8e6e2f1a029e@samsung.com>
 <20160809205031.GD1581@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <20160809205031.GD1581@dell>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org, inki.dae@samsung.com, broonie@kernel.org, Beomho Seo <beomho.seo@samsung.com>, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 08/09/2016 10:50 PM, Lee Jones wrote:
> On Tue, 09 Aug 2016, Sylwester Nawrocki wrote:
> 
>> > On 08/09/2016 05:05 PM, Lee Jones wrote:
>>>> > >> +static SIMPLE_DEV_PM_OPS(lpass_pm_ops, exynos_lpass_suspend,
>>>>> > >> > +					exynos_lpass_resume);
>>> > > Put this up by the PM functions.
>> > 
>> > Sorry, I don't understand this comment, which PM functions do you
>> > mean exactly?
> *_suspend and *_resume.  PM == Power Management.
> 
> You also need to place the functions in side some CONFIG_PM_SLEEP
> guards.  Grep around, you'll see what I mean.

OK, but couldn't we just leave it with that SIMPLE_DEV_PM_OPS()
macro?  It saves us an #ifdef ugliness and if I actually grep
drivers/mfd most of the drivers use either SIMPLE_DEV_PM_OPS() or
SET_SYSTEM_SLEEP_PM_OPS. Are you asking me to change the above to:

static const struct dev_pm_ops exynos_lpass_pm_ops = {
#ifdef CONFIG_PM_SLEEP
	.suspend = exynos_lpass_suspend,
	.resume = exynos_lpass_resume,
	.freeze = exynos_lpass_suspend,
	.thaw = exynos_lpass_resume,
	.poweroff = exynos_lpass_suspend,
	.restore = exynos_lpass_resume,
#endif
}

or perhaps

static const struct dev_pm_ops exynos_lpass_pm_ops = {
	SET_SYSTEM_SLEEP_PM_OPS(exynos_lpass_suspend, exynos_lpass_resume)
}

?

I agree about the CONFIG_PM_SLEEP guards.  There is very little
chance though the LPASS driver will ever be used with
CONFIG_PM_SLEEP disabled. How about adding __maybe_unused attribute
to the *_suspend/*_resume functions then?  I can see this pattern
used already in drivers/mfd.

-- 
Thanks,
Sylwester
