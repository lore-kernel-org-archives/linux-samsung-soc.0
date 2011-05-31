From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix secondary CPU boot after wake-up
Date: Tue, 31 May 2011 10:30:52 +0530
Message-ID: <4DE47604.6070405@ti.com>
References: <1306746781-21511-1-git-send-email-inderpal.s@samsung.com> <4DE36589.4080709@ti.com> <20110530215404.GB21382@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog102.obsmtp.com ([74.125.149.69]:50676 "EHLO
	na3sys009aog102.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751102Ab1EaFBA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 May 2011 01:01:00 -0400
Received: by yib18 with SMTP id 18so1679069yib.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 May 2011 22:00:59 -0700 (PDT)
In-Reply-To: <20110530215404.GB21382@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Inderpal Singh <inderpal.singh@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Inderpal Singh <inderpal.s@samsung.com>, kgene.kim@samsung.com, samsung@lists.linaro.org, patches@linaro.org

On 5/31/2011 3:24 AM, Russell King - ARM Linux wrote:
> On Mon, May 30, 2011 at 03:08:17PM +0530, Santosh Shilimkar wrote:
>> When do you plan to fix the SGI usage as discussed
>> in above thread. I thought SGI1 usage was ok for OMAP,
>> realview/versatile and MSM.
>
> I'd like the use of the arbitary SGI1 to fade away, to be replaced with
> something a little saner (eg, SGI0 being the first SGI).  That just
> means you'll end up with a warning about SGI0 instead.  Let's just
> ignore them for the time being (but please change to SGI0 anyway.)

I mean SGIO. SGI1 was typo. Ignoring that warning isn't good idea.
Platforms which do aggressive CPU offline/online, will keep
getting this noise and hence need to be fixed.

How about my patch which was marking this as a wakeup
IPI instead of unknown one. Ofcourse with wakeup SGI
being used will be SGI0 instead of current SGI1.

If you are ok with it I can send an RFC patch ?

Regards
Santosh
