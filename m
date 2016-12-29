From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 7/8] ARM: s3c64xx: Drop initialization of unused struct
 s3c_audio_pdata fields
Date: Thu, 29 Dec 2016 11:30:49 +0100
Message-ID: <0bb15f0e-7033-4cb3-5aba-0bb61fdfc467@samsung.com>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
 <1478791076-19528-8-git-send-email-s.nawrocki@samsung.com>
 <20161228175344.3krz2hqrem56ypg6@kozik-lap>
 <CGME20161229103055epcas1p1dc69aec56d462e8c1605fe9e47ded562@epcas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58428 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752380AbcL2KbC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 05:31:02 -0500
In-reply-to: <20161228175344.3krz2hqrem56ypg6@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: vinod.koul@intel.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On 12/28/2016 06:53 PM, Krzysztof Kozlowski wrote:
> On Thu, Nov 10, 2016 at 04:17:55PM +0100, Sylwester Nawrocki wrote:
>> Remove initialization of dma_{filter, playback, capture, capture_mic}
>> fields where it is not used any more.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> ---
>>  arch/arm/mach-s3c64xx/dev-audio.c | 19 -------------------
>>  1 file changed, 19 deletions(-)
>>
> Sylwester,
> 
> This and 8/8 should be safe to apply, right?

Yes, I think both patches can be applied safely now.
Thanks for getting back to this.
