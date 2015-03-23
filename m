From: Paul Osmialowski <p.osmialowsk@samsung.com>
Subject: Re: exynos4412: misc issues on Hardkernel Odroid boards
Date: Mon, 23 Mar 2015 17:30:31 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1503231633470.22232@AMDC1262.digital.local>
References: <54D779FB.9070306@math.uni-bielefeld.de>
 <54D86913.2050109@samsung.com> <54DF9089.8050204@math.uni-bielefeld.de>
 <CAJKOXPcSRjO__ywh0QVDex8zKZ2FEvgCt4JsPs78_kHzCtqZBA@mail.gmail.com>
 <71afa85252e1c95251e696749172757b@math.uni-bielefeld.de>
 <550B75F4.2000901@gmx.net>
 <CAJKOXPeD86vmrKm8tYgccxzTQrshXbU981tMxwBvbDUK9-6-Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32727 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752967AbbCWQbF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Mar 2015 12:31:05 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NLO00J7PBEKE1B0@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Mar 2015 16:35:08 +0000 (GMT)
In-reply-to: <CAJKOXPeD86vmrKm8tYgccxzTQrshXbU981tMxwBvbDUK9-6-Lw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tobias Jakobi <liquid.acid@gmx.net>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Paul Osmialowski <p.osmialowsk@samsung.com>

On Fri, 20 Mar 2015, Krzysztof Kozlowski wrote:

> 2015-03-20 2:20 GMT+01:00 Tobias Jakobi <liquid.acid@gmx.net>:
>> Hello!
>>
>> Tobias Jakobi wrote:
>>> Hello Krzysztof,
>>>
>>> On 2015-02-17 14:24, Krzysztof Kozlowski wrote:
>>>> Looking at the backtrace this seems very likely however I have
>>>> troubles reproducing this. Any special tree or config is required
>>>> (except MMC_CLKGATE and DEBUG_ATOMIC_SLEEP)?
>>>>
>>>> Best regards,
>>>> Krzysztof
>>> The kernel was build with this config:
>>> https://github.com/tobiasjakobi/odroid-environment/blob/master/sourcecode/system/vanilla-3.19-debug.conf
>>>
>>>
>>> I didn't have DEBUG_ATOMIC_SLEEP enabled back then, but I could try to
>>> reproduce it again.
>> This issue is still happening with 4.0.0-rc4.
>>
>> [    7.336824] BUG: sleeping function called from invalid context at
>> kernel/locking/mutex.c:97
>
> Hi,
>
> Yes, Pawel Osmialowski's patch fixed one such issue but the rest still
> exists. I looked at this and it was not quite easy fix. I don't have
> spare time now for this issue so if anyone is interested in fixing
> this then it would be great.
>
> BTW Tobias, the OOPS/dmesg of yours is wrapped around 72 char. It is
> harder to read it this way.
>
> Best regards,
> Krzysztof
>

Hi Guys,

Unfortunately, I'm not on Trats2 devices anymore, however, I found some 
time to have a quick look at the problem. And it looks like solving this 
would require more fundamental/general approach.

My patch which solves problem with call to clk_set_rate() uses the same 
approach as found in sdhci_set_power() function: unlock host->lock 
spinlock before doing operation which may sleep (e.g. while trying to 
acquire mutex).

For this new bug following fix probably would be sufficient, as 
sdhci_s3c_consider_clock() is also called with spinlock acquired in 
sdhci_do_set_ios(), which should be released before calling 
clk_round_rate():

--- sdhci-s3c.c.old	2015-03-23 16:55:09.933609335 +0100
+++ sdhci-s3c.c	2015-03-23 17:02:15.497610082 +0100
@@ -105,10 +105,11 @@
   * @src: The source clock index.
   * @wanted: The clock frequency wanted.
   */
-static unsigned int sdhci_s3c_consider_clock(struct sdhci_s3c *ourhost,
+static unsigned int sdhci_s3c_consider_clock(struct sdhci_host *host,
  					     unsigned int src,
  					     unsigned int wanted)
  {
+	struct sdhci_s3c *ourhost = to_s3c(host);
  	unsigned long rate;
  	struct clk *clksrc = ourhost->clk_bus[src];
  	int shift;
@@ -121,7 +122,9 @@
  	 * speed possible with selected clock source and skip the 
division.
  	 */
  	if (ourhost->no_divider) {
+		spin_unlock_irq(&host->lock);
  		rate = clk_round_rate(clksrc, wanted);
+		spin_lock_irq(&host->lock);
  		return wanted - rate;
  	}

@@ -171,7 +174,7 @@
  	}

  	for (src = 0; src < MAX_BUS_CLK; src++) {
-		delta = sdhci_s3c_consider_clock(ourhost, src, clock);
+		delta = sdhci_s3c_consider_clock(host, src, clock);
  		if (delta < best) {
  			best = delta;
  			best_src = src;

(Again, currently I have no device to test it).

Thing is, from quick look at the code I can't say what would happend in 
two other places where clk_round_rate() is called (and fortunately, 
clk_set_rate() call addressed by my previous patch is called from one 
place only). And what about other clk_ functions called from sdhci-s3c.c 
functions? Few lines below sdhci_s3c_consider_clock() call which we know 
is called with host->lock spinlock held we have calls 
to clk_prepare_enable() / clk_disable_unprepare() - will they fail too? 
Internally, they also call clk_prepare_lock() which causes all of the 
toruble.

Wrapping all of such places with spin_unlock_irq(&host->lock) / 
spin_lock_irq(&host->lock) seems for me like asking for troubles. IMHO 
more general approach should be proposed.

Best regards,
Paul
