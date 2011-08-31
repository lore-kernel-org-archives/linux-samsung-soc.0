From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: Add clkdev support to HSMMC
Date: Wed, 31 Aug 2011 14:56:32 +0200
Message-ID: <4E5E2F80.3010005@samsung.com>
References: <0LQO00HOLZVZDW20@ms6.samsung.com> <4E5DF40A.1040707@samsung.com>
 <CAJuYYwRmEdvo684vP+pRo2XyyPbyxNOMobMVr4TFLUDCv9HHew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56845 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755625Ab1HaNDm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 09:03:42 -0400
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LQS00K55MY4FL00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 14:03:40 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LQS00EFZMM9WK@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 13:56:33 +0100 (BST)
In-reply-to: <CAJuYYwRmEdvo684vP+pRo2XyyPbyxNOMobMVr4TFLUDCv9HHew@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: banajit.g@samsung.com, RAJESHWARI S SHINDE <rajeshwari.s@samsung.com>, PADMAVATHI VENNA <padma.v@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Thomas,

On 08/31/2011 12:13 PM, Thomas Abraham wrote:
> 
> [...]
> 
> 
>>> 3) In the proposed implementation where we create connection ids only for the
>>> bus clocks we are creating an extra node for the same in the clkdev table,
>>
>>> where as the clock is getting registered only once with the kernel.
>>
>> I don't agree with this last statement, the same struct clk is added to
>> the list of clocks known by the system twice, in s3c24xx_register_clocks()
>> and clkdev_add_table(). This is only what I have been pointing out.
>> Please correct me, if I missed anything.
> 
> s3c24xx_register_clock and clkdev_add_table add one instance of
> "struct clk_lookup" each (with different connections ids) but both of
> these "struct clk_lookup" instances point to the same "struct clk"
> instance.

Yes, that's what happens in Banajit's code.

> 
> So, is two instances of "struct clk_lookup" pointing to the same
> "struct clk" instance the concern in this case?

No, I don't see this as a problem. Just wanted to get things clarified.

And to suggest that we could avoid having re-created struct clk and struct
clk_clksrc arrays for s3c24xx_register_clocks() and s3c_register_clksrc()
functions. However I don't consider this a significant issue.

--
Regards,
Sylwester
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
