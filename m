From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: RE: [PATCH] thermal: Add missing cpumask_clear
Date: Sat, 05 Jul 2014 08:37:53 +0900
Message-ID: <000101cf97e0$f9ba7a50$ed2f6ef0$@samsung.com>
References: <000001cf9771$e2f465c0$a8dd3140$@samsung.com>
 <CAK5sBcHDTgyj67xVWgtNH-Z7XU1Ykp6m650_mWBVp=Az2P6f=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55802 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753619AbaGDXhz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 19:37:55 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8700198OB5KY50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 05 Jul 2014 08:37:53 +0900 (KST)
In-reply-to: <CAK5sBcHDTgyj67xVWgtNH-Z7XU1Ykp6m650_mWBVp=Az2P6f=Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <spk.linux@gmail.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Eduardo Valentin' <eduardo.valentin@ti.com>, 'Jonghwa Lee' <jonghwa3.lee@samsung.com>, 'Lukasz Majewski' <l.majewski@samsung.com>, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>

On Fri, Jul 4, 2014 at 8:23 PM, Sachin Kamat <spk.linux@gmail.com> wrote:

> > Cpumasks should be cleared before using.
> 
> Please explain why and what is issue observed without this.
>

-> When I checked the mask value, I knew that unwanted bit is set.

Test code without cpumask_clear.

+       cpumask_set_cpu(0, &mask_val);
+       cpulist_scnprintf(buf, 64, &mask_val);
+       printk("--ID [ %d] = %s \n", id, buf);
+       th_zone->cool_dev[id] = cpufreq_cooling_register(&mask_val);


Console message-> 4.861157] [c6] --ID [ 1] = 0,4-5,7 (4,5,7 cpu bit was set.)

And when I tried to register two cooling devices with cpumask_set_cpu(0, &mask_val) and cpumask_set_cpu(4, &mask_val). 

I found that cpu 0 bit is also set in latter cpumask. (I hope latter cpumask has a cpu 4 bit.)

So I think that cpumask_clear should be inserted.

Thanks.
