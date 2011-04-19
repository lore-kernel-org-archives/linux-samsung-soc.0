From: David Anders <x0132446@ti.com>
Subject: Re: Cleanup Samsung stuff
Date: Tue, 19 Apr 2011 09:49:29 -0500
Message-ID: <4DADA0F9.7010104@ti.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com> <BANLkTimTuQ1YE8Xu04NyMZxF42KGDr_XBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:38124 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753144Ab1DSOuF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Apr 2011 10:50:05 -0400
In-Reply-To: <BANLkTimTuQ1YE8Xu04NyMZxF42KGDr_XBQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?EUC-KR?B?tOvAzrHi?= <inki.dae@samsung.com>, =?EUC-KR?B?x9S47cHW?= <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <rmk+kernel@arm.linux.org.uk>, LAK <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Greetings All,


i've been looking at a number of machine files for boards that are no
longer in production(mainly the ones i maintain), thoughts on removing them?


Dave

On 04/18/2011 09:23 PM, Kyungmin Park wrote:
> On Tue, Apr 19, 2011 at 10:46 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>   
>> Hi all,
>>
>> I think, you know about current situation of Linux ARM world.
>>
>> So...
>>
>> As Russell suggested, I also will focus on consolidations and bug fixes for
>> Samsung stuff for a while so don't complain about missing new stuff. In my
>> opinion, we can keep going it later...
>>
>> As a note, I'm doing(or preparing) following at the moment.
>>
>> - Removing some "mach-s5pxxxx"s
>>     
> Why not mach-s3c series? don't you think too much plat-{s3c, s5p,
> samsung}? how about to use the plat-samsung only?
>   
>> - Removing useless header files in include/{mach,plat} of Samsung
>> - Samsung GPIO stuff cleanup/consolidation
>> - Samsung DMA stuff consolidation?
>>     
>    -> Move to dmaengine and use it.
>   
>> - Device tree (with Linaro)
>> - and so on...
>>     
>    - Strange Samsung Clock and names consolidation.
>    - IRQ stuff (some parts are done by tglx but need to use the
> generic IRQ base instead of odd +32 magic)
>    - generic IOMMU consolidation.
>
> BTW, who works on this at LSI?
>
> Thank you,
> Kyungmin Park
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>   
