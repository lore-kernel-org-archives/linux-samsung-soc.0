From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [rtc-linux] RE: [PATCH 5/5] rtc: rtc-s3c: Fix debug message
 format on RTC
Date: Thu, 7 Oct 2010 16:28:56 -0700
Message-ID: <20101007162856.38b184ea.akpm@linux-foundation.org>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
	<1283837381-9575-6-git-send-email-kgene.kim@samsung.com>
	<4C86CAC1.2050205@fluff.org>
	<000601cb4fbb$f9fbab90$edf302b0$%kim@samsung.com>
	<AANLkTi=Jb04ySn1WaGktY-hJQQoGvRpr6kz9DcSHrBZA@mail.gmail.com>
	<000f01cb50dc$ba4a74a0$2edf5de0$%kim@samsung.com>
	<20100910162354.9b96f1df.akpm@linux-foundation.org>
	<00c101cb6675$bb8e67f0$32ab37d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:33717 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753057Ab0JGX3x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 19:29:53 -0400
In-Reply-To: <00c101cb6675$bb8e67f0$32ab37d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Wan ZongShun' <mcuos.com@gmail.com>, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>, a.zummo@towertech.it

On Fri, 08 Oct 2010 08:16:44 +0900
Kukjin Kim <kgene.kim@samsung.com> wrote:

> Updated patch 1/5 has been tested on S3C24XX and its working fine.
> Its remained issue is that Ben was wondering its working on S3C24XX.
> 
> And about the patch 4/5, I did address comments from Ben Dooks and Wan
> ZongShun.

ok...

> So could you please handle this series?
> If any problems, please kindly let me know.
> 
> They are since commit cb655d0f3d57c23db51b981648e452988c0223f9:
>   Linux 2.6.36-rc7 (2010-10-06 13:39:52 -0700)
> 
> are available in the git repository at:
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next-rtc-s3c

Can you please email them all out in the old-fashioned way?  Because a)
I don't manage patches with git and b) that way people will actually
look at the code.

Thanks.
