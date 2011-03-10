From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH v4 1/3] ARM: S5P: Add s5p_timer support for HRT
Date: Thu, 10 Mar 2011 13:48:22 +0900
Message-ID: <002d01cbdede$65e19660$31a4c320$@com>
References: <1299636813-4869-1-git-send-email-sbkim73@samsung.com>
 <1299636813-4869-2-git-send-email-sbkim73@samsung.com>
 <20110309141016.GB2737@pulham.picochip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9334 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455Ab1CJEsb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 23:48:31 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHT00DKRS0S5V10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 13:48:28 +0900 (KST)
Received: from DOSBKIM7301 ([12.23.103.65])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHT0056OS0SJQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 13:48:28 +0900 (KST)
In-reply-to: <20110309141016.GB2737@pulham.picochip.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jamie Iles' <jamie@jamieiles.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Hi Jamie,

As you said, .shift		= 32, is useless line.

And Do you mean that Is needed error handling of clk_enable  like below?

	clk_enable(timerclk);

	if (IS_ERR(timerclk)){
		clk_put(timerclk)
		panic("failed to enable timers clock");
	}

There is no another clk_enable for timerclk.
I will add clk_enable error handling code.

Thanks and regards,
S.B. Kim

On Wednesday, March 09, 2011 11:10 PM, Jamie Iles <Jamie@jamieiles.com>
wrote

> -----Original Message-----
> > +static struct clock_event_device time_event_device = {
> > +	.name		= "s5p_event_timer",
> > +	.features	= CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
> > +	.rating		= 200,
> > +	.shift		= 32,
> 
> You are using clockevents_calc_mult_shift so you don't need to specify
> .shift here.
> 
> > +	unsigned long event_id = timer_source.event_id;
> > +	unsigned long source_id = timer_source.source_id;
> > +
> > +	timerclk = clk_get(NULL, "timers");
> > +	if (IS_ERR(timerclk))
> > +		panic("failed to get timers clock for timer");
> > +
> > +	clk_enable(timerclk);
> 
> clk_enable() can fail, should you be checking the return here and the
> other clk_enable() calls?
> 
> Jamie
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
