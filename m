From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Remove mau_pd node for Exynos5420
Date: Tue, 22 Apr 2014 13:51:18 +0530
Message-ID: <CAHbNUh2T8gOdGxDGm995vbj0oiJkyDwW9C9J7VV_o7mudfKjEw@mail.gmail.com>
References: <1398145155-4615-1-git-send-email-tushar.behera@linaro.org>
	<CAGOxZ52CDOXyXDpy8h3NQ8=26Wn8jF=6_vzb+t370_GbPiHG0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:60820 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755063AbaDVIVS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 04:21:18 -0400
Received: by mail-ig0-f178.google.com with SMTP id hn18so2703345igb.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Apr 2014 01:21:18 -0700 (PDT)
In-Reply-To: <CAGOxZ52CDOXyXDpy8h3NQ8=26Wn8jF=6_vzb+t370_GbPiHG0g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On 22 April 2014 13:08, Alim Akhtar <alim.akhtar@gmail.com> wrote:
> Hi Tushar
>
> On Tue, Apr 22, 2014 at 11:09 AM, Tushar Behera
> <tushar.behera@linaro.org> wrote:
>> MAU powerdomain provides clocks for Audio sub-system block. This block
>> comprises of the I2S audio controller, audio DMA blocks and Audio
>> sub-system clock registers.
>>
>> Right now, there is no way to hook up power-domains with clock providers.
>> During late boot when this power-domain gets disabled, we get following
>> external abort.
> ?? which abort?? Can you please mention it here?
>>

Thanks Alim for spotting this ... I somehow missed adding this.

<<<<
Unhandled fault: imprecise external abort (0x1406) at 0x00000000
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
>>>>

Kukjin,

Let me know if I need to resend the patch.

-- 
Tushar Behera
