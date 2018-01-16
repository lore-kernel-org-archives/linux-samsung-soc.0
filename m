From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [3/3] i2c: exynos5: do not check TRANS_STATUS in case of
 Exynos7 variant
Date: Tue, 16 Jan 2018 10:40:36 +0100
Message-ID: <bddb6ff4-22cd-9f01-7a63-295b19eaef90@samsung.com>
References: <20171130143007.30258-4-a.hajda@samsung.com>
        <CGME20180115205339epcas1p24810c38f964d43cc1b8589d3c3cc3c73@epcas1p2.samsung.com>
        <20180115205334.6ciwq5pouthtj3kx@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36708 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750852AbeAPJkl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 04:40:41 -0500
In-reply-to: <20180115205334.6ciwq5pouthtj3kx@ninjato>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Andi Shyti <andi.shyti@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

On 15.01.2018 21:53, Wolfram Sang wrote:
> On Thu, Nov 30, 2017 at 03:30:07PM +0100, Andrzej Hajda wrote:
>> HSI2C_MASTER_ST_LOSE state is not documented properly, extensive tests
>> show that hardware is usually able to recover from this state without
>> interrupting the transfer. On the other side enforcing transfer repetition
>> in such case does not help in many situations, especially on busy systems
>> and causes -EAGAIN and -ETIMEOUT errors. Moreover documentation says that
>> such state can be caused by slave clock stretching, and should not be treated
>> as an error.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Can this be applied independently of my comments to patch 2?
>
Yes, please apply it alone. I will continue work on patch 2.

--
Regards
Andrzej
