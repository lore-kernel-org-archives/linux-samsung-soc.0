From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH RFC 1/4] phy: Add new Exynos5 USB 3.0 PHY driver
Date: Mon, 11 Nov 2013 16:41:33 +0530
Message-ID: <5280BB65.5040305@ti.com>
References: <1383205544-32244-1-git-send-email-gautam.vivek@samsung.com> <1383205544-32244-2-git-send-email-gautam.vivek@samsung.com> <527744B2.4090303@ti.com> <030d01ced946$d6e23490$84a69db0$%debski@samsung.com> <52779D28.9000905@ti.com> <CAFp+6iH7vQ-OtMFL4pyr4tFDRchH4oh1Z0753WNgrHiUzj+kzw@mail.gmail.com> <00fe01ceda0a$941957a0$bc4c06e0$%debski@samsung.com> <000001ceda17$f41c2030$dc546090$%han@samsung.com> <000101ceda1f$04ca6f20$0e5f4d60$%han@samsung.com> <CAFp+6iFAZab35F-MOOZHcHpzSEOL=51gWBK2KZbOJS+0731GJQ@mail.gmail.com> <000301ceda84$1d648bf0$582da3d0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <000301ceda84$1d648bf0$582da3d0$%han@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Vivek Gautam' <gautamvivek1987@gmail.com>, 'Kamil Debski' <k.debski@samsung.com>, 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Linux USB Mailing List' <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 'Greg KH' <gregkh@linuxfoundation.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Felipe Balbi' <balbi@ti.com>, 'Julius Werner' <jwerner@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wednesday 06 November 2013 05:37 AM, Jingoo Han wrote:
> On Wednesday, November 06, 2013 2:58 AM, Vivek Gautam wrote:
>> On Tue, Nov 5, 2013 at 5:33 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> 
> [.....]
> 
>>> USB3.0 PHY consists of two blocks such as 3.0 block and 2.0 block.
>>> This USB3.0 PHY can support UTMI+ and PIPE3 interface for 3.0 block
>>> and 2.0 block, respectively.
>>>
>>> Conclusion:
>>>
>>>    1) USB2.0 PHY: USB2.0 HOST, USB2.0 Device
>>>                        Base address: 0x1213 0000
>>>
>>>    2) USB3.0 PHY: USB3.0 DRD (3.0 HOST & 3.0 Device)
>>>                        Base address: 0x1210 0000
>>>                        2.0 block(UTMI+) & 3.0 block(PIPE3)
>>
>> And this is of course the PHY used by DWC3 controller, which works at
>> both High speed as well as Super Speed.
>> Right ?
> 
> Right.
> 
> While 3.0 block(PIPE3) can be used for Super Speed, 2.0 block(UTMI+)
> can be used for High speed.

It should then come under *single IP muliple PHY* category similar to what
Sylwester has done.

Thanks
Kishon
