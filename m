From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] rtc: s3c: Document in binding that only s3c6410 needs a
 src clk
Date: Mon, 15 Feb 2016 10:58:34 -0300
Message-ID: <56C1D98A.8040408@osg.samsung.com>
References: <1455542202-13977-1-git-send-email-javier@osg.samsung.com>
 <20160215134535.GB15219@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160215134535.GB15219@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Alexandre,

On 02/15/2016 10:45 AM, Alexandre Belloni wrote:
> On 15/02/2016 at 10:16:42 -0300, Javier Martinez Canillas wrote :
>> Commit 43f3408261a2 ("rtc: s3c: Document required clocks in the DT
>
> I'm pretty sure you shouldn't refer to a commit that is in linux-next.
>

The commit comes from Rob's dt/linus branch that uses Linux 4.5-rc3 as
a base. I'm not a git expert but I thought that if the branch is not
rebased and used for the pull request then the resulting commit in
mainline would end with the same sha-1.

But I can remove the mention to the commit and "Fixes:" tag since the
commit is not yet in mainline, that should be more safe indeed.
  
>> binding") added to the S3C binding doc the required clocks needed
>> by the Real Time Clock but the S3C driver supports different HW IP
>> and only the s3c6410 needs a source clock.
>>
>> Fix the DT binding explaning that the second clock is only needed
>            explaining ^

Ok, I'll fix that typo.

>> by this IP block and not for the others.
>>
>> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Fixes: 43f3408261a2 ("rtc: s3c: Document required clocks in the DT binding")
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>
> Anyway, I'm fine with it, feel free to add my ack.
>

Thanks, I'll add it in v2.
  
Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
