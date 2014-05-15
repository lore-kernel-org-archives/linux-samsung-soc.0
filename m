From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 0/4] Adds PMU and S2R support for exynos5420
Date: Thu, 15 May 2014 23:22:41 +0200
Message-ID: <53753021.5050801@gmail.com>
References: <1399982522-27928-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:48446 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752811AbaEOVWx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 17:22:53 -0400
Received: by mail-ee0-f41.google.com with SMTP id t10so1009849eei.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2014 14:22:52 -0700 (PDT)
In-Reply-To: <1399982522-27928-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, vikas.sajjan@samsung.com, t.figa@samsung.com

Hi Abhilash,

On 13.05.2014 14:01, Abhilash Kesavan wrote:
> Rebased on
> 1] Kukjin Kim's tree for-next branch (which has Sachin Kamat's SYSRAM
> patches merged) with Tomasz Figa's samsung clock tree (samsung-next branch)
> merged. 
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
> 2] Pankaj Dubey's v4 PMU patchset
> https://lkml.org/lkml/2014/5/10/29

I think this patch is not safe to base on yet. I need to find time to
review the latest version and share my latest view on this with Pankaj,
as I have a bit different design in mind.

In general, I don't like the fact that you end up with using regmap to
access registers that are used exclusively by PMU driver or for accesses
happening at late suspend or early resume, where concurrent accesses
from other drivers simply can't occur.

Best regards,
Tomasz
