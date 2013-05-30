From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Update defconfig for Arndale and Origen board
Date: Thu, 30 May 2013 20:58:39 +0530
Message-ID: <CAHbNUh35vdhX4F7=QeXD9RMNKq42Vu-1yjx3LSKnbd_TH_+vrw@mail.gmail.com>
References: <1368168599-28507-1-git-send-email-tushar.behera@linaro.org>
	<87sj1qzaov.fsf@linaro.org>
	<5191AA89.6010901@linaro.org>
	<20130528231740.GA28879@quad.lixom.net>
	<51A57D39.8030506@linaro.org>
	<CAOesGMh50Dzr_jczHZC5_txfW=6a+7EgFKvgZgj9MhUcVUTJ1Q@mail.gmail.com>
	<51A5C16D.20408@linaro.org>
	<000001ce5c4f$839f4cb0$8adde610$@samsung.com>
	<3D99F44C56954EC59167436E26BE91F6@sisodomain.com>
	<CAHbNUh0kWxqDMvLwE-_PKQVassDJvbgiCiDDNSHn9AW3md=A5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:40234 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933196Ab3E3P2k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 May 2013 11:28:40 -0400
Received: by mail-ob0-f170.google.com with SMTP id ef5so864867obb.29
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 May 2013 08:28:39 -0700 (PDT)
In-Reply-To: <CAHbNUh0kWxqDMvLwE-_PKQVassDJvbgiCiDDNSHn9AW3md=A5A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, lkml <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Patch Tracking <patches@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Julius Werner <jwerner@chromium.org>

Resending in plain-text mode.

On 30 May 2013 20:56, Tushar Behera <tushar.behera@linaro.org> wrote:
>>>
>> We do have a driver for USB3503 in upstream now, which has enough
>> infrastructure for us to use.
>> We just want to handle states of HUB_CONNECT line or RESET_N line, which
>> should just be fine with this driver.
>>
>> Am I missing something ?
>>

The USB3503 driver is an I2C client driver. In case of Arndale, the SDA and
SCL lines for SMSC3503 chip are sorted, hence there are no I2C channels that
the driver can register to. So effectively we can't use that driver for
Arndale.

-- 
Tushar Behera
