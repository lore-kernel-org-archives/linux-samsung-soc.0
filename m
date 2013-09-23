From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 1/6] clk: exynos-audss: convert to platform device
Date: Mon, 23 Sep 2013 14:25:12 -0700
Message-ID: <CAL1qeaGjUTrfDaAr1rgsgDaZscjaV7tqi3Jd_-zo2sMtCCFSAQ@mail.gmail.com>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
 <1530327.jvk44KuFQA@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1530327.jvk44KuFQA@flatron>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, linux-doc@vger.kernel.org, Padmavathi Venna <padma.v@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, Jiri Kosina <jkosina@suse.cz>Stephe
List-Id: linux-samsung-soc@vger.kernel.org

Hi Tomasz,

>> +static int exynos_audss_clk_remove(struct platform_device *pdev)
>> +{
>> +     of_clk_del_provider(pdev->dev.of_node);
>> +
>> +     return 0;
>>  }
>
> Don't we need to unregister all the registered clocks in remove? This also
> leads to another question: Do we even need removal support for this
> driver?

Agreed - I don't think we should support removal of this device, but
it looks like __device_release_driver() just ignores the lack of a
remove callback or the return value from remove.  I suppose we could
just yell that removal is not supported if it is ever attempted.

>> +static int __init exynos_audss_clk_init(void)
>> +{
>> +     return platform_driver_register(&exynos_audss_clk_driver);
>> +}
>> +core_initcall(exynos_audss_clk_init);
>
> Does it need to be core_initcall? Drivers depending on clocks provided by
> this driver should be able to defer probing if they are probed before this
> driver.

Unfortunately there are a couple of issues with making this a module_initcall:
    1. On the Exynos5420, the AudioSS block provides the apb_pclk gate
for the ADMA bus, which is probed at postcore_initcall time and does
not support deferred probing, and
    2. the common clock framework doesn't differentiate between the
clock not being specified at all and the clock being specified, but
the provider not being registered yet (i.e. the case where probe
deferral would be appropriate) - it just returns ENOENT in both cases.
Given that this driver has no dependencies other than the core clock
controller, it should be fine to initialize at core_initcall time.
Both of these issues could be fixed, though.

Thanks,
Andrew
