From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] usb: phy: samsung-usb2: Toggle HSIC GPIO from device tree
Date: Wed, 10 Jul 2013 21:01:49 -0300
Message-ID: <CAOMZO5AfXnxcCjiXY6f0xE=yr-=7nkTY3KJO=xqx1KD3qAvoRQ@mail.gmail.com>
References: <1373416455-30358-1-git-send-email-jwerner@chromium.org>
	<20130710052534.GB15674@arwen.pp.htv.fi>
	<CAODwPW9dmwpXeyBeVER9azsh2uW3NXLTbDtz3mJaXrvSwb6opg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:34845 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754741Ab3GKABu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jul 2013 20:01:50 -0400
In-Reply-To: <CAODwPW9dmwpXeyBeVER9azsh2uW3NXLTbDtz3mJaXrvSwb6opg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Julius Werner <jwerner@chromium.org>
Cc: balbi@ti.com, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Vivek Gautam <gautam.vivek@samsung.com>, Praveen Paneri <p.paneri@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olofj@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>

Hi Julius,

On Wed, Jul 10, 2013 at 2:42 PM, Julius Werner <jwerner@chromium.org> wrote:
> Hi Felipe,
>
> This is intended to pull down a reset signal line, not to switch power
> to the device. I could implement that with the regulator framework
> too, but I think that would just be confusing and harder to understand
> without providing any benefit. It's really just a plain old GPIO.

It seems that the reset gpio driver from Phillip Zabel would help in this case:
http://permalink.gmane.org/gmane.linux.drivers.devicetree/36830
