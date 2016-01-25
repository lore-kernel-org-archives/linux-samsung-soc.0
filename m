From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5 3/5] driver core: handle -EPROBE_DEFER from
 bus_type.match()
Date: Mon, 25 Jan 2016 07:56:44 +0100
Message-ID: <56A5C72C.4010705@samsung.com>
References: <1450868368-5650-1-git-send-email-m.szyprowski@samsung.com>
 <1450868368-5650-4-git-send-email-m.szyprowski@samsung.com>
 <20160104163100.GK19062@n2100.arm.linux.org.uk>
 <20160104171215.GB25961@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44849 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153AbcAYG4s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2016 01:56:48 -0500
In-reply-to: <20160104171215.GB25961@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Greg,

On 2016-01-04 18:12, Greg Kroah-Hartman wrote:
> On Mon, Jan 04, 2016 at 04:31:00PM +0000, Russell King - ARM Linux wrote:
>> On Wed, Dec 23, 2015 at 11:59:26AM +0100, Marek Szyprowski wrote:
>>> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>
>>> Allow implementations of the match() callback in struct bus_type to
>>> return errors and if it's -EPROBE_DEFER then queue the device for
>>> deferred probing.
>>>
>>> This is useful to buses such as AMBA in which devices are registered
>>> before their matching information can be retrieved from the HW
>>> (typically because a clock driver hasn't probed yet).
>>>
>>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>> [changed if-else code structure, adjusted documentation to match the code,
>>> extended comments]
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>> This patch _really_ needs an ack from Greg before I can merge it.
>>
>> DRIVER CORE, KOBJECTS, DEBUGFS, KERNFS AND SYSFS
>> M:      Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> T:      git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.gitS:      Supported
>> F:      Documentation/kobject.txt
>> F:      drivers/base/
>>
>> alternatively, the whole series should be taken by Greg, with my ack
>> for the amba and ARM bits.
>>
>> Given that Greg is unlikely to respond this close to the merge window
>> (he's not responded to my messages about the amba-pl011 driver having
>> been messed up by the wrong patch set being taken...) I think this has
>> basically missed the 4.5 merge window.  Sorry.
> I've been on vacation, so give me a week or so to catch up on
> everything...
>
> And yes, this missed the 4.5 merge window, that closed last week for my
> trees.

Could you take a look into this patch?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
