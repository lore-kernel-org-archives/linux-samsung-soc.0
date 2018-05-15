From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] USB: dwc3: get extcon device by OF graph bindings
Date: Tue, 15 May 2018 09:31:59 +0200
Message-ID: <CAJKOXPffEz9Qn1FsGhKKHZqPo79J5svAhNSSHrHwsLjjgWkbNA@mail.gmail.com>
References: <20180131155718.5237-1-a.hajda@samsung.com> <CGME20180131155734eucas1p2b55ad1aab1d5086566dad7a79b25ccf3@eucas1p2.samsung.com>
 <20180131155718.5237-2-a.hajda@samsung.com> <878t8l9y6j.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <878t8l9y6j.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 15, 2018 at 9:26 AM, Felipe Balbi <balbi@kernel.org> wrote:
> Andrzej Hajda <a.hajda@samsung.com> writes:
>
>> extcon device is used to detect host/device connection. Since extcon
>> OF property is deprecated, alternative method should be added.
>> This method uses OF graph bindings to locate extcon.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>> Hi all,
>>
>> This patch implements alternative method to get extcon from DWC3.
>> The code works but is hacky, as DWC3 must traverse different DT nodes
>> to get extcon, in case of TM2 it is USB-PHY and MUIC, but other
>> platforms can have different paths.
>> I would be glad if it can be merged as is for now, but additional work
>> must be done to make it generic.
>> I guess on DT binding side it is OK. So the problem should be addressed
>> in the code.
>> My rough idea is to implement kind of extcon aliases/forwarder mechanism,
>> ie. USB-PHY will expect on its output remote port extcon, and it should register
>> extcon-forwarder pointing to this extcon. This way DWC3 can look for the extcon
>> on its PHY phandle, and it will receive via forwarding mechanism extcon
>> exposed by MUIC.
>> As I said this is rough idea for discussion, other propositions are welcome.
>>
>> Regards
>> Andrzej
>
> I need someone from devicetree to review and ack patch2 before I can
> apply them. Either way, this doesn't apply:

The DTS patch will go through arm-soc tree, I'll take it. The DTS
patches are independent from drivers and shall not usually go through
regular trees.

Best regards,
Krzysztof
