From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH v10] i2c: exynos5: add High Speed I2C controller driver
Date: Fri, 16 Aug 2013 10:28:23 +0530
Message-ID: <CAHfPSqBnj2OTHdbnW3SCRf7SL1maMsWau1+9DWFLYRBM+1HOJQ@mail.gmail.com>
References: <1354021236-28596-2-git-send-email-ch.naveen@samsung.com>
 <1371638905-30633-1-git-send-email-ch.naveen@samsung.com> <3925484.kHD24rQYyy@amdc1227>
 <20130815131226.GI17155@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:57233 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751128Ab3HPE6n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 00:58:43 -0400
In-Reply-To: <20130815131226.GI17155@katana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Tomasz Figa <t.figa@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Kukjin Kim <kgene.kim@samsung.com>, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, taeggyun.ko@samsung.com, balbi@ti.com, thomas.abraham@linaro.org

On 15 August 2013 18:42, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Mon, Jul 01, 2013 at 12:25:19PM +0200, Tomasz Figa wrote:
>> Hi Naveen,
>>
>> Looks mostly good, but see some comments inline.
>
> Ping?
Hello Wolfram,

I made a patch fixing your comments and from Thomas Figa as well.

Meanwhile, we hit a random crash in exynos5_i2c_irq function.
The "len" variable being is still being near the FIFO_MAX after this condition
 len = HSI2C_FIFO_MAX - fifo_level;
 +             if (len > i2c->msg->len)
 +                     len = i2c->msg->len;

Once, we fix this problem. i planned to rebase and submit.

Is it okey with you?

Thanks,
Naveen
>



-- 
Shine bright,
(: Nav :)
