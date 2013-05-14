From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen
 board
Date: Tue, 14 May 2013 08:37:53 +0530
Message-ID: <5191AA89.6010901@linaro.org>
References: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org> <87sj1qzaov.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:59819 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755376Ab3ENDH7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 May 2013 23:07:59 -0400
Received: by mail-pa0-f45.google.com with SMTP id lj1so106098pab.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 May 2013 20:07:59 -0700 (PDT)
In-Reply-To: <87sj1qzaov.fsf@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, olof@lixom.net, dianders@chromium.org, patches@linaro.org

On 05/14/2013 05:36 AM, Kevin Hilman wrote:
> Tushar Behera <tushar.behera@linaro.org> writes:
> 
>> It updates following drivers for EXYNOS based DT platform.
>>
>> * S5M8767 driver
>> * MAX8997 driver
>> * MMC SDHCI driver
>>
>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> 
> I tested this using v3.10-rc1 on Arndale, but still don't get any
> support for the wired network.  Do you know if this is a Kconfig issue,
> or a missing driver?
> 
> I suspect it may be related to the various "unable to find transceiver
> of type USB2 PHY" messages I'm seeing?
> 

Yes, right. The missing USB-PHY components are one of the issues (they
were there in linux-next when I last tested).

Also, on Arndale board, we need to reset the USB hub during EHCI
initialization (a couple of those patches are required, which I am not
sure if we would be able to upstream).

I am collecting a minimal set of patches that would enable USB and wired
network on Arndale with 3.10-rc1 kernel. Once done, I will let you know.

> Thanks,
> 
> Kevin
> 

Thanks for testing.


-- 
Tushar Behera
