From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 1/6] clk: exynos-audss: convert to platform device
Date: Mon, 23 Sep 2013 14:36:08 -0700
Message-ID: <CAL1qeaEGpYgM8kjgSCtBwLqahzvrbD9DVNPSb+qEY=-NmGsghA@mail.gmail.com>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
 <1530327.jvk44KuFQA@flatron>
 <CAL1qeaGjUTrfDaAr1rgsgDaZscjaV7tqi3Jd_-zo2sMtCCFSAQ@mail.gmail.com>
 <1736317.9RH9hT0fWO@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1736317.9RH9hT0fWO@flatron>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, linux-doc@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jiri Kosina <jkosina@suse.cz>, Stephen Boyd <sboyd@codeaurora>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Sep 23, 2013 at 2:30 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Monday 23 of September 2013 14:25:12 Andrew Bresticker wrote:
>> >> +static int __init exynos_audss_clk_init(void)
>> >> +{
>> >> +     return platform_driver_register(&exynos_audss_clk_driver);
>> >> +}
>> >> +core_initcall(exynos_audss_clk_init);
>> >
>> > Does it need to be core_initcall? Drivers depending on clocks provided
>> > by this driver should be able to defer probing if they are probed
>> > before this driver.
>>
>> Unfortunately there are a couple of issues with making this a
>> module_initcall: 1. On the Exynos5420, the AudioSS block provides the
>> apb_pclk gate for the ADMA bus, which is probed at postcore_initcall
>> time and does not support deferred probing, and
>
> Just out of curiosity, what is this ADMA bus?

It's the DMA controller used for PCM and I2S.  Looks like the DMA
nodes aren't in the 5420 device-tree yet...

-Andrew
