From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 2/3] ARM: s3c24xx: Add DMA resources for SDI and I2S
Date: Mon, 4 May 2015 21:10:27 +0300
Message-ID: <CA+E=qVeyDvySOfLRL9PKYm5c9YkZhdt3OHrh4n1sXOusgy+qJw@mail.gmail.com>
References: <1430676910-30657-1-git-send-email-anarsoul@gmail.com>
 <1430676910-30657-2-git-send-email-anarsoul@gmail.com> <CAJKOXPewZb_26GgA27T8fkXvTrg3FEYMkErapqoaMaSHDNy3ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:34080 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751935AbbEDSKt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 14:10:49 -0400
Received: by laat2 with SMTP id t2so110104564laa.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 May 2015 11:10:47 -0700 (PDT)
In-Reply-To: <CAJKOXPewZb_26GgA27T8fkXvTrg3FEYMkErapqoaMaSHDNy3ug@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Mon, May 4, 2015 at 6:45 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2015-05-04 3:15 GMT+09:00 Vasily Khoruzhick <anarsoul@gmail.com>:
>> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>
> "Add DMA resources for SDI and I2S".,.. what for? why? The commit
> message would be appropriate place to put such details.

Because SDI and I2S drivers need these resources to setup DMA channel properly.
Would you like me to resend the patch with this explanation?

> The patch itself looks good.
>
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
> Best regards,
> Krzysztof
