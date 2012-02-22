From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: ARM: Exynos: Mismatch in BogoMIPS values
Date: Wed, 22 Feb 2012 11:01:05 +0530
Message-ID: <CAK9yfHz9e5iEu=3ay0F_WVLeg=+6CtErqX2G4zq7Me+QtJSPWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f53.google.com ([209.85.216.53]:51045 "EHLO
	mail-qw0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750874Ab2BVFbG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 00:31:06 -0500
Received: by qafk1 with SMTP id k1so7928279qaf.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2012 21:31:05 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangwook Lee <sangwook.lee@linaro.org>
Cc: samsung@lists.linaro.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Hi,

The mismatch in BogoMIPS value between two cores (992 and 1992) is not
specific to Origen board.
The same is observed on SMDKV310 board as well. It looks like a common
Exynos machine problem.

Including the mailing list for wider dissemination.


On 21/02/2012, Sangwook Lee <sangwook.lee@linaro.org> wrote:
> Maybe, someone missed this.
[snip]

>
> On a side note, with linaro 3.1, when you cat /proc/cpuinfo, we get
> incorrect numbers for the BOGOMIPS for the 2 cores (900 and 1900),
> whereas on 3.0.4+ kernel, and the insignal kernel, we get the correct
> report of 1900 for both cores.
>


-- 
With warm regards,
Sachin
