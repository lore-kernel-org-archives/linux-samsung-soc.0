From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos7: Add clocks for MSCL block
Date: Mon, 22 Dec 2014 15:57:47 +0100
Message-ID: <5498316B.9050906@samsung.com>
References: <1418801617-7593-1-git-send-email-tony.kn@samsung.com>
 <549450A6.9020205@samsung.com> <000901d01ddc$eac0d120$c0427360$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:29806 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754975AbaLVO5x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Dec 2014 09:57:53 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NGZ000W4OF7MZ60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Dec 2014 15:01:55 +0000 (GMT)
In-reply-to: <000901d01ddc$eac0d120$c0427360$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tony K Nadackal <tony.kn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, a.kesavan@samsung.com, bhushan.r@samsung.com

On 22/12/14 12:46, Tony K Nadackal wrote:
>>> diff --git a/Documentation/devicetree/bindings/clock/exynos7-clock.txt
>>> > > b/Documentation/devicetree/bindings/clock/exynos7-clock.txt
>>> > > index 6d3d5f8..d0e048c 100644
>>> > > --- a/Documentation/devicetree/bindings/clock/exynos7-clock.txt
>>> > > +++ b/Documentation/devicetree/bindings/clock/exynos7-clock.txt
>>> > > @@ -34,6 +34,7 @@ Required Properties for Clock Controller:
>>> > >  	- "samsung,exynos7-clock-peris"
>>> > >  	- "samsung,exynos7-clock-fsys0"
>>> > >  	- "samsung,exynos7-clock-fsys1"
>>> > > +	- "samsung,exynos7-clock-mscl"
>> > 
>> > I can't see anything controversial in the patch, but I've got some doubts
>> > regarding the compatible string. Is there a SoC named just "Exynos7"?
>
> Yes, We have an SoC named Exynos7.
> Please refer http://www.spinics.net/lists/linux-samsung-soc/msg36765.html

I've queued this patch for 3.20. Would be nice to have a Reviewed-by tag
from someone else who has access to the SoC documentation though.

Is Exynos7420 User Manual applicable to this?
Exynos 7 (Octa?) seems like a marketing name to me. In technical documents
there are usually more specific names used, like exynos7410 or exynos7420.

-- 
Regards,
Sylwester
