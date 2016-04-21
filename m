From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [rtc-linux] [PATCH v2] rtc: s3c: Document in binding that only
 s3c6410 needs a src clk
Date: Thu, 21 Apr 2016 08:46:33 -0400
Message-ID: <5718CBA9.30801@osg.samsung.com>
References: <1455545466-25709-1-git-send-email-javier@osg.samsung.com>
 <20160328221915.GC2346@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160328221915.GC2346@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Alexandre,

On 03/28/2016 06:19 PM, Alexandre Belloni wrote:
> On 15/02/2016 at 11:11:06 -0300, Javier Martinez Canillas wrote :
>> The S3C binding doc says that the RTC and RTC source clocks are required
>> but the S3C driver supports different HW IP and only the s3c6410 needs a
>> source clock.
>>
>> Fix the binding explaining that the source clock is only needed for the
>> s3c6410-rtc compatible controller.
>>
>> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>>
>> ---
>> Hello,
>>
>> This patch depends on a previous one that was picked by Rob Herring so
>> this one has to go through his tree again and not through the RTC tree
>> to avoid conflicts.
>>
> 
> Well, I'm queuing that one in rtc-fixes for 4.6
> 

Are you still planning to push this fix for v4.6? I don't see the patch in
neither v4.6-rc4 nor linux-next.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
