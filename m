From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] usb: dwc3-exynos fix unspecified suspend clk error handling
Date: Wed, 11 Jan 2017 08:13:38 +0530
Message-ID: <f32657c2-a0b7-b84c-e5d6-eb33f7705880@samsung.com>
References: <20170110022131.31042-1-shuahkh@osg.samsung.com>
 <8784459.rxWqZlDLVg@amdc3058>
 <28815306-e220-4847-99ce-b058baae0d07@osg.samsung.com>
 <CGME20170110170942epcas1p3decee28366d7d42b70e7b0669b97326f@epcas1p3.samsung.com>
 <5156028.4V9iLD3Qkj@amdc3058> <20170110182552.coom4p6dpdqo2ljv@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50985 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750953AbdAKCkx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 21:40:53 -0500
In-reply-to: <20170110182552.coom4p6dpdqo2ljv@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, balbi@kernel.org, gregkh@linuxfoundation.org, kgene@kernel.org, javier@osg.samsung.com, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Alim Akhtar <alim.akhtar@samsung.com>

Hi Krzysztof,

On Tuesday 10 January 2017 11:55 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 10, 2017 at 06:09:40PM +0100, Bartlomiej Zolnierkiewicz wrote:
>> BTW What is interesting is that the Exynos7 dts patch [2] has never
>> made it into upstream for some reason.  In the meantime however
>> Exynos5433 (similar to Exynos7 to some degree) became the user of
>> susp_clk.
>>
>> [1] https://lkml.org/lkml/2014/11/21/247
>> [2] https://patchwork.kernel.org/patch/5355161/
>>
> 
> +Cc Alim and Pankaj,
> 
> Anyone would like to resend [2] after rebasing and testing? Interrupt
> flags would have to be fixed and status=disabled added.
> 

Thanks for looping us into this thread.

Well I will be taking care of Exynos USB as Vivek has left Samsung.
I am currently working on adding Exynos7 USB support, as soon as patches
are ready for posting will post them. Will take care of review comments
given for Vivek's patchset [1].

Thanks,
Pankaj Dubey

> Best regards,
> Krzysztof
> 
> 
