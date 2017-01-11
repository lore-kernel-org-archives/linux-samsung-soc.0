From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] usb: dwc3-exynos fix axius clock error path to do cleanup
Date: Tue, 10 Jan 2017 21:32:31 -0300
Message-ID: <006ab225-6e16-b1d7-567c-d1f236702589@osg.samsung.com>
References: <20170110230528.7612-1-shuahkh@osg.samsung.com>
 <e4f0b77a-d827-08fa-c4f6-950197c54358@osg.samsung.com>
 <c1938cd9-9bcf-d28b-48fd-be6a22a1f3f7@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:37104
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1758416AbdAKAck (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 19:32:40 -0500
In-Reply-To: <c1938cd9-9bcf-d28b-48fd-be6a22a1f3f7@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>, balbi@kernel.org, gregkh@linuxfoundation.org, kgene@kernel.org, krzk@kernel.org
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Shuah,

On 01/10/2017 09:30 PM, Shuah Khan wrote:

[snip]

>>>  	clk_disable_unprepare(exynos->axius_clk);
>>> +axius_clk_err:
>>
>> This label isn't consistent with the others, I know the errN aren't great
>> so what about changing those to meaningful names in a preparatory patch?
>>
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> Best regards,
>>
> 
> Javier,
> 
> Right they aren't consistent. Changing them all to a better naming scheme
> will have be done in another cleanup patch in my opinion. I don't want to
> include cleanup in this fix.
>

I didn't mean to be done in the same patch, that's why I said in another
preparatory patch.
 
> thanks,
> -- Shuah
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
