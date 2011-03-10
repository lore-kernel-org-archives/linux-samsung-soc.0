From: Giridhar Bachalli Maruthy <giridhar.maruthy@linaro.org>
Subject: Re: [PATCH] SAMSUNG: S5PV310: Add I2S playback support
Date: Thu, 10 Mar 2011 14:24:01 +0530
Message-ID: <AANLkTim25Yr+OXE48zmTMyLJEfR5NXHwaSrjHkCnfpWe@mail.gmail.com>
References: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
	<20110308113752.GA5892@sirena.org.uk>
	<AANLkTimYv-F-0VXzy9=Cb9GoSQzWs0RMd4y5rbpP+fCw@mail.gmail.com>
	<20110309102438.GE6923@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34624 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751249Ab1CJIyB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 03:54:01 -0500
Received: by iyb26 with SMTP id 26so1320231iyb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Mar 2011 00:54:01 -0800 (PST)
In-Reply-To: <20110309102438.GE6923@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Hi Mark

On 9 March 2011 15:54, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Mar 09, 2011 at 03:50:18PM +0530, Giridhar Bachalli Maruthy wrote:
>
>> Since WM8994 codec requires CONFIG_REGULATOR to be defined, would it
>> be appropriate to select REGULATOR also in [1] and remove the ifdef
>> CONFIG_REGULATOR?
>
> What makes you say that CONFIG_REGULATOR is required?
>

You are right...CONFIG_REGULATOR is not required, my mistake.

This patch will be useful when CONFIG_REGULATOR is defined.
I will resubmit the patch after necessary rework.

Regards,
Giridhar
