From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: ARM: Exynos: Mismatch in BogoMIPS values
Date: Wed, 22 Feb 2012 11:37:47 +0530
Message-ID: <4F448633.5050101@linaro.org>
References: <CAK9yfHz9e5iEu=3ay0F_WVLeg=+6CtErqX2G4zq7Me+QtJSPWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:62736 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750877Ab2BVGHx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 01:07:53 -0500
Received: by daed14 with SMTP id d14so7737667dae.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2012 22:07:52 -0800 (PST)
In-Reply-To: <CAK9yfHz9e5iEu=3ay0F_WVLeg=+6CtErqX2G4zq7Me+QtJSPWQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Sangwook Lee <sangwook.lee@linaro.org>, samsung@lists.linaro.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 02/22/2012 11:01 AM, Sachin Kamat wrote:
> Hi,
> 
> The mismatch in BogoMIPS value between two cores (992 and 1992) is not
> specific to Origen board.
> The same is observed on SMDKV310 board as well. It looks like a common
> Exynos machine problem.
> 
> Including the mailing list for wider dissemination.
> 
While bisecting, I found that this problem came in between 3.0 and
3.1-rc1. I could not do much bisecting beyond that as the kernel doesn't
boot at many of the intermediate locations between them.

> 
> On 21/02/2012, Sangwook Lee <sangwook.lee@linaro.org> wrote:
>> Maybe, someone missed this.
> [snip]
> 
>>
>> On a side note, with linaro 3.1, when you cat /proc/cpuinfo, we get
>> incorrect numbers for the BOGOMIPS for the 2 cores (900 and 1900),
>> whereas on 3.0.4+ kernel, and the insignal kernel, we get the correct
>> report of 1900 for both cores.
>>
> 
> 


-- 
Tushar Behera
