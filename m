From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH v2 2/4] Thermal: exynos: Support for TMU regulator defined
 at device tree
Date: Thu, 25 Apr 2013 18:29:41 +0200
Message-ID: <20130425182941.63ecff30@amdc308.digital.local>
References: <1366389493-8239-1-git-send-email-l.majewski@samsung.com>
 <1366893045-31586-1-git-send-email-l.majewski@samsung.com>
 <1366893045-31586-3-git-send-email-l.majewski@samsung.com>
 <CADGdYn6g5Lggkcbq9WMMfbqN-NBb_14_b1bfcd=7+CJrxJcquA@mail.gmail.com>
 <20130425152934.5041cc98@amdc308.digital.local> <51794F48.5040401@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21322 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757966Ab3DYQ3t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Apr 2013 12:29:49 -0400
In-reply-to: <51794F48.5040401@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Eduardo Valentin <eduardo.valentin@ti.com>
Cc: amit daniel kachhap <amit.daniel@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Zhang Rui <rui.zhang@intel.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, t.figa@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Eduardo,

> Amit, Lukasz,
> 
> On 25-04-2013 09:29, Lukasz Majewski wrote:
> > Hi Amit,
> >  
> >> Hi Lukasz Majewski,
> >>
> >> Sorry for late review but I am currently working on restructuring
> >> the whole exynos thermal driver and this support of LDO can be
> >> added as feature as not all socs support this. This is also
> >> suggested by Eduardo. All your other patches looks fine.  
> >
> > But this is how it is already done. The VDD_TS is optional, so
> > Exynos5440 and Exynos4210 will not be broken.
> >
> > This shall preserve the correct behavior of the thermal driver.
> >  
> 
> If you guys plan to move to feature based approach, like suggested in 
> V1, then Id recommend adding a /* TODO: */ entry in your driver.

Ok, nice idea.

> 
> Amit, are you including this LDO support on your rework?



-- 
Best regards,

Lukasz Majewski

Samsung R&D Poland (SRPOL) | Linux Platform Group
