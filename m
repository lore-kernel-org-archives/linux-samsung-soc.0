From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v5 2/2] ASoC: samsung: Add machine driver for
 Exynos5433 based TM2 board
Date: Tue, 30 Aug 2016 16:57:25 +0200
Message-ID: <65238f9c-bed0-7ad5-1961-fa2ff3848782@samsung.com>
References: <1470752514-11409-1-git-send-email-s.nawrocki@samsung.com>
 <1470752514-11409-2-git-send-email-s.nawrocki@samsung.com>
 <20160829150251.GU21682@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160829150251.GU21682-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/29/2016 05:02 PM, Charles Keepax wrote:
> On Tue, Aug 09, 2016 at 04:21:54PM +0200, Sylwester Nawrocki wrote:
>> ---
> <snip>
>> +static int tm2_suspend_late(struct device *dev)
>> +{
>> +	struct snd_soc_card *card = dev_get_drvdata(dev);
>> +
>> +	return tm2_stop_sysclk(card);
>> +}
>> +
>> +static int tm2_resume_early(struct device *dev)
>> +{
>> +	struct snd_soc_card *card = dev_get_drvdata(dev);
>> +
>> +	return tm2_start_sysclk(card);
>> +}
>> +
>> +const struct dev_pm_ops tm2_pm_ops = {
>> +	.suspend	= snd_soc_suspend,
>> +	.suspend_late	= tm2_suspend_late,
>> +	.resume		= snd_soc_resume,
>> +	.resume_early	= tm2_resume_early,
>> +	.freeze		= snd_soc_suspend,
>> +	.thaw		= snd_soc_resume,
>> +	.poweroff	= snd_soc_poweroff,
>> +	.restore	= snd_soc_resume,
>> +};
> 
> This bit still looks problematic to me, although admittedly I not
> sure exactly why you don't seem to be hitting any issues with
> it. Before you were effectively calling things from .suspend, now
> its .suspend_late.  As we are now later in the suspend process
> that means its even more likely the SPI will be unavailable when
> we try to talk to the CODEC. You need to run before the SPI
> has started suspending so you can still communicate with the
> CODEC, I still think prepare/complete are likely to be the best
> options for this, unless there are some complications there I
> have missed.
> 
> Aside from that and the clock stuff we are already discussing
> everything else looks totally fine to me.

Thanks for your review. First of all I'm testing system suspend
related changes on 4.1 kernel as there is no full support for the
exynos5433 SoC in mainline yet.
I will use prepare/complete as with late_suspend/early_resume power
sequences are wrong as you point out. I still need to debug why
there is no errors reported when the SPI controller is suspended
while there are supposed to be done SPI bus transfers.

It seems I missed the main point of making that pm_ops change, I
focused on the MCLK clock presence while the main issue was
communication with the codec over SPI bus.

I added some debug prints and below are logs when using
late_suspend/early_resume and prepare/complete. In both cases
tm2_stop_sysclk() returns 0.

I think suspend/resume sequences are still correct when snd_soc_pm_ops
are used thanks to order of linking drivers into kernel image and
adding device to dpm_list.

-------------------------------8<-----------------------------------
suspend_late/early_resume

# dmesg | grep "resume\|suspend\|arizona"

[   42.169691] Suspending console(s) (use no_console_suspend to debug)

[   42.211115] tm2-audio sound: snd_soc_suspend
[   42.213991] s3c64xx-spi 14d30000.spi: s3c64xx_spi_suspend

[   42.215097] PM: suspend of devices complete after 40.028 msecs
[   42.229764] tm2-audio sound: tm2_suspend_late: 0

[   42.231496] PM: late suspend of devices complete after 6.362 msecs
[   42.237318] PM: noirq suspend of devices complete after 5.804 msecs
[   42.819161] PM: noirq resume of devices complete after 62.500 msecs

[   43.063552] arizona spi1.0: FLL1: Timed out waiting for lock
[   43.063572] tm2-audio sound: tm2_resume_early: 0
[   43.066830] PM: early resume of devices complete after 247.302 msecs

[   43.078789] s3c64xx-spi 14d30000.spi: s3c64xx_spi_resume
[   43.080192] tm2-audio sound: snd_soc_resume
[   43.080212] tm2-audio sound: ASoC: starting resume work

[   43.319459] PM: resume of devices complete after 241.698 msecs
-------------------------------8<-----------------------------------


-------------------------------8<-----------------------------------
prepare/complete

# dmesg -c | grep "prepare\|complete\|suspend\|resume\|arizona"

[  172.398552] Suspending console(s) (use no_console_suspend to debug)
[  172.399431] tm2-audio sound: tm2_prepare: 0
[  172.441073] tm2-audio sound: snd_soc_suspend
[  172.443653] s3c64xx-spi 14d30000.spi: s3c64xx_spi_suspend

[  172.444766] PM: suspend of devices complete after 42.202 msecs
[  172.459500] PM: late suspend of devices complete after 6.407 msecs
[  172.465277] PM: noirq suspend of devices complete after 5.758 msecs
[  173.039052] PM: noirq resume of devices complete after 62.396 msecs
[  173.044578] PM: early resume of devices complete after 5.152 msecs

[  173.057042] s3c64xx-spi 14d30000.spi: s3c64xx_spi_resume
[  173.058423] tm2-audio sound: snd_soc_resume
[  173.058442] tm2-audio sound: ASoC: starting resume work

[  173.299428] PM: resume of devices complete after 243.393 msecs
[  173.329555] arizona spi1.0: Spurious HPDET IRQ
[  173.329704] arizona spi1.0: Mixer dropped sample
[  173.329758] tm2-audio sound: tm2_complete: 0
-------------------------------8<-----------------------------------


-- 
Thanks,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
