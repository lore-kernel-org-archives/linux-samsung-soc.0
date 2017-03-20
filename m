From: Hans Verkuil <hansverk@cisco.com>
Subject: Re: [PATCHv2 1/4] video: add hotplug detect notifier support
Date: Mon, 20 Mar 2017 15:41:17 +0100
Message-ID: <12f23e88-dec6-c2f8-5d17-8f283d09a541@cisco.com>
References: <1483366747-34288-1-git-send-email-hverkuil@xs4all.nl>
 <1483366747-34288-2-git-send-email-hverkuil@xs4all.nl>
 <20170320142616.GM21222@n2100.armlinux.org.uk>
 <20170320142727.GA11521@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170320142727.GA11521@n2100.armlinux.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/20/2017 03:27 PM, Russell King - ARM Linux wrote:
> On Mon, Mar 20, 2017 at 02:26:16PM +0000, Russell King - ARM Linux wrote:
>> On Mon, Jan 02, 2017 at 03:19:04PM +0100, Hans Verkuil wrote:
>>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>>
>>> Add support for video hotplug detect and EDID/ELD notifiers, which is used
>>> to convey information from video drivers to their CEC and audio counterparts.
>>>
>>> Based on an earlier version from Russell King:
>>>
>>> https://patchwork.kernel.org/patch/9277043/
>>>
>>> The hpd_notifier is a reference counted object containing the HPD/EDID/ELD state
>>> of a video device.
>>
>> I thought we had decided to drop the ELD bits?
>
> Ignore that - mailer wrapped around to the first message in my mailbox!
>

Just FYI: I've removed anything not needed for CEC in this git repo:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=exynos4-cec2

It compiles, but it's otherwise untested.

And I still need to think more about Daniel's comments. I hope to work on this
a bit more next week.

Regards,

	Hans
