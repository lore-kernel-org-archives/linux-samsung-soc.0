From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] usb: phy: samsung-usb2: Toggle HSIC GPIO from device tree
Date: Tue, 13 Aug 2013 14:11:27 +0530
Message-ID: <CAHbNUh0Sa-atYMHbhEUX2vnVAcsdBJxw9RRzAp+6vqE8hi=p1w@mail.gmail.com>
References: <1373416455-30358-1-git-send-email-jwerner@chromium.org>
	<20130710052534.GB15674@arwen.pp.htv.fi>
	<CAODwPW9dmwpXeyBeVER9azsh2uW3NXLTbDtz3mJaXrvSwb6opg@mail.gmail.com>
	<20130712065734.GE31802@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:43014 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755274Ab3HMIl2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Aug 2013 04:41:28 -0400
Received: by mail-ob0-f170.google.com with SMTP id eh20so10275245obb.29
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Aug 2013 01:41:28 -0700 (PDT)
In-Reply-To: <20130712065734.GE31802@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: Julius Werner <jwerner@chromium.org>, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>, Praveen Paneri <p.paneri@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olofj@chromium.org>, Vincent Palatin <vpalatin@chromium.org>

On 12 July 2013 12:27, Felipe Balbi <balbi@ti.com> wrote:
> Hi,
>
> On Wed, Jul 10, 2013 at 10:42:27AM -0700, Julius Werner wrote:
>> Hi Felipe,
>>
>> This is intended to pull down a reset signal line, not to switch power
>> to the device. I could implement that with the regulator framework
>> too, but I think that would just be confusing and harder to understand
>> without providing any benefit. It's really just a plain old GPIO.
>
> alright, in that case how about using drivers/reset/ ?
>

IIUC, reset-gpio driver only provides APIs for reset controls (reset,
assert, deassert). We still need to find out the location from where
we would be calling the reset function.

-- 
Tushar Behera
