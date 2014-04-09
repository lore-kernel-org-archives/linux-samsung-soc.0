From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Add facility to toggle vbus gpio
 on/off
Date: Wed, 09 Apr 2014 14:38:06 +0200
Message-ID: <53453F2E.40606@samsung.com>
References: <1397044485-26483-1-git-send-email-gautam.vivek@samsung.com>
 <534538F6.2010009@samsung.com>
 <CAFp+6iHf5Ndt3yNbdAaayXi08-A54Sk8LDTiASm4RTw09GuWvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAFp+6iHf5Ndt3yNbdAaayXi08-A54Sk8LDTiASm4RTw09GuWvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kishon <kishon@ti.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Jingoo Han <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 09.04.2014 14:24, Vivek Gautam wrote:
> Hi Sylwester,
>
>
> On Wed, Apr 9, 2014 at 5:41 PM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> Hi Vivek,
>>
>> On 09/04/14 13:54, Vivek Gautam wrote:
>>> Adding support to enable/disable VBUS hooked to a gpio
>>> to enable vbus supply on the port.
>>
>> Does the GPIO control a fixed voltage regulator ? If so, shouldn't
>> it be modelled by the regulator API instead ?
>
> No, this GPIO controls a 'current limiting power distribution switch',
> which gives the output vbus to usb controller.
> Should i model this as a fixed regulator ?

If I understand this correctly, this is just a switch that lets you 
control whether vbus is provided to the USB connector or not. If so, 
this doesn't look like an Exynos-specific thing at all and should rather 
be modeled on higher level.

Best regards,
Tomasz
