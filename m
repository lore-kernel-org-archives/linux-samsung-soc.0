From: Yuvaraj Cd <yuvaraj.lkml@gmail.com>
Subject: Re: [PATCH V2] i2c: s3c2410 : Add polling mode support
Date: Mon, 6 Jan 2014 09:30:20 +0530
Message-ID: <CA+NduCDr4am5+Vyr9NTAzFGjg_zRLjYVRTM2Bj0Wxd0VBEzCpw@mail.gmail.com>
References: <1384168820-2986-1-git-send-email-yuvaraj.cd@samsung.com>
	<20140103161012.GH7132@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140103161012.GH7132@katana>
Sender: linux-doc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-doc@vger.kernel.org, "ks.giri@samsung.com" <ks.giri@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Vasanth Ananthan <vasanth.a@samsung.com>, Rob Herring <rob.herring@calxeda.com>, aditya.ps@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, ben-linux@fluff.org, Vasanth Ananthan <vasanthananthan@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 3, 2014 at 9:40 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> Hi,
>
> On Mon, Nov 11, 2013 at 04:50:20PM +0530, Yuvaraj Kumar C D wrote:
>> From: Vasanth Ananthan <vasanthananthan@gmail.com>
>>
>> This patch adds polling mode support for i2c-s3c2410 driver.The
>> SATA PHY controller's CMU and TRSV block's are of I2C register
>> map in exynos5250.These blocks can be configured using i2c.
>>
>> But i2c controller instance on which these block's sits lacks an
>> interrupt line.Also the current i2c-s3c2410 driver is only interrupt
>> driven, thus a polling mode support is required in the driver for
>> supporting this controller. This patch adds this support to the driver.
>>
>> Changes from V1:
>>       1.Changed the is_ack() to have even period b/w polls and
>>         used usleep_range() instead of udelay().
>
> Mileages vary, but I'd like to see revision changes after the "---".
>
>>       ret = devm_request_irq(&pdev->dev, i2c->irq, s3c24xx_i2c_irq, 0,
>> -                            dev_name(&pdev->dev), i2c);
>> +                             dev_name(&pdev->dev), i2c);
>
> Unrelated change.
>
> Rest looks good, so I'll fix up the things for you and apply to
> for-next, thanks!
Thanks Wolfram.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
