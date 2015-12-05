From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: Re: [PATCH 2/3] Add support for monitoring gpio switches
Date: Sat, 05 Dec 2015 10:42:44 +0000
Message-ID: <5662BFA4.1010304@collabora.co.uk>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk> <1449250275-23435-3-git-send-email-martyn.welch@collabora.co.uk> <20151204185713.GA22925@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20151204185713.GA22925@kroah.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



On 04/12/15 18:57, Greg Kroah-Hartman wrote:
> On Fri, Dec 04, 2015 at 05:31:14PM +0000, Martyn Welch wrote:
>> Select Chromebooks have gpio attached to switches used to cause the
>> firmware to enter alternative modes of operation and/or control other
>> device characteristics (such as write protection on flash devices). This
>> patch adds a driver that exposes a read-only interface to allow these
>> signals to be read from user space.
>>
>> This functionality has been generalised to provide support for any device
>> with device tree support which needs to identify a gpio as being used for a
>> specific task.
>>
>> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
>> ---
>>   drivers/misc/Kconfig       |  11 ++++
>>   drivers/misc/Makefile      |   1 +
>>   drivers/misc/gpio-switch.c | 160 +++++++++++++++++++++++++++++++++++++++++++++
>
> Why isn't this in drivers/gpio/ ?
>
> why make it a misc driver?
>

I thought all the drivers in /drivers/gpio were gpio drivers, rather 
than users of the gpio framework. Is that not the case?

Happy to move it if the consensus is that that's the correct place to 
put it.

Martyn

> thanks,
>
> greg k-h
>
