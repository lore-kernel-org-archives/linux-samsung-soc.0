From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [3/3] i2c: exynos5: do not check TRANS_STATUS in case of
 Exynos7 variant
Date: Fri, 26 Jan 2018 08:17:24 +0100
Message-ID: <5e27b754-17fa-3a98-0a99-ba93c16e5c0e@samsung.com>
References: <20171130143007.30258-4-a.hajda@samsung.com>
        <CGME20180115205339epcas1p24810c38f964d43cc1b8589d3c3cc3c73@epcas1p2.samsung.com>
        <20180115205334.6ciwq5pouthtj3kx@ninjato>
        <bddb6ff4-22cd-9f01-7a63-295b19eaef90@samsung.com>
        <20180117232307.aigvkl564p4jzms3@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <20180117232307.aigvkl564p4jzms3@ninjato>
Content-language: en-US
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Andi Shyti <andi.shyti@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 18.01.2018 00:23, Wolfram Sang wrote:
> On Tue, Jan 16, 2018 at 10:40:36AM +0100, Andrzej Hajda wrote:
>> On 15.01.2018 21:53, Wolfram Sang wrote:
>>> On Thu, Nov 30, 2017 at 03:30:07PM +0100, Andrzej Hajda wrote:
>>>> HSI2C_MASTER_ST_LOSE state is not documented properly, extensive tests
>>>> show that hardware is usually able to recover from this state without
>>>> interrupting the transfer. On the other side enforcing transfer repetition
>>>> in such case does not help in many situations, especially on busy systems
>>>> and causes -EAGAIN and -ETIMEOUT errors. Moreover documentation says that
>>>> such state can be caused by slave clock stretching, and should not be treated
>>>> as an error.
>>>>
>>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> Can this be applied independently of my comments to patch 2?
>>>
>> Yes, please apply it alone. I will continue work on patch 2.
> I just thought it might be nice to have a comment where you removed the
> code summarizing your findings. So we will remember about this in the
> future. Makes sense?
>
Forgive me delayed response - holiday.

The code removed was something extra, so I am not sure if it is
necessary to add comment to the code, git log should be enough.

Anyway I will post patches dealing with HSI2C_MASTER_ST_LOSE on
transaction start very soon, so I can add relevant comment there.


Regards

Andrzej
