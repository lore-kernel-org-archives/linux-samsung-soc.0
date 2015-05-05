From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/3] ARM: s3c24xx: Add DMA resources for SDI and I2S
Date: Tue, 5 May 2015 12:39:49 +0900
Message-ID: <CAJKOXPfx8wyv5WHut2-uR=cT416FtSgTv65_LwKKj1++0TMg_w@mail.gmail.com>
References: <1430676910-30657-1-git-send-email-anarsoul@gmail.com>
	<1430676910-30657-2-git-send-email-anarsoul@gmail.com>
	<CAJKOXPewZb_26GgA27T8fkXvTrg3FEYMkErapqoaMaSHDNy3ug@mail.gmail.com>
	<CA+E=qVeyDvySOfLRL9PKYm5c9YkZhdt3OHrh4n1sXOusgy+qJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f53.google.com ([209.85.216.53]:43344 "EHLO
	mail-vn0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752431AbbEEDju (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 23:39:50 -0400
Received: by vnbg7 with SMTP id g7so16068018vnb.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2015 20:39:49 -0700 (PDT)
In-Reply-To: <CA+E=qVeyDvySOfLRL9PKYm5c9YkZhdt3OHrh4n1sXOusgy+qJw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

2015-05-05 3:10 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
> On Mon, May 4, 2015 at 6:45 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> 2015-05-04 3:15 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
>>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>>
>> "Add DMA resources for SDI and I2S".,.. what for? why? The commit
>> message would be appropriate place to put such details.
>
> Because SDI and I2S drivers need these resources to setup DMA channel properly.
> Would you like me to resend the patch with this explanation?

Yes, please resend. The new explanation above is sufficient.

Best regards,
Krzysztof
