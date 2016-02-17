From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5 RESEND 4/5] ARM: amba: Move reading of periphid to
 amba_match()
Date: Wed, 17 Feb 2016 08:52:36 +0100
Message-ID: <56C426C4.7040907@samsung.com>
References: <1455101250-11327-1-git-send-email-m.szyprowski@samsung.com>
 <1455101250-11327-5-git-send-email-m.szyprowski@samsung.com>
 <20160215175250.GJ10826@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:40237 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756607AbcBQHws (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Feb 2016 02:52:48 -0500
In-reply-to: <20160215175250.GJ10826@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

On 2016-02-15 18:52, Russell King - ARM Linux wrote:
> On Wed, Feb 10, 2016 at 11:47:29AM +0100, Marek Szyprowski wrote:
>> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>
>> Reading the periphid when the Primecell device is registered means that
>> the apb pclk must be available by then or the device won't be registered
>> at all.
>>
>> By reading the periphid in amba_match() we can return -EPROBE_DEFER if
>> the apb pclk isn't there yet and the device will be retried later.
> I've just realised, we can't do this.  We need to read the peripheral
> ID at registration time, because that's published to userspace via
> (a) a sysfs attribute, and (b) as part of the uevent, which will be
> used by udev to locate the driver module.
>
> So, this will have the side effect of breaking systems which have
> AMBA primecell devices configured as modules.
>
> Sorry, I can't apply this.  We can't regress existing platforms for
> the sake of introducing new platforms to this code.

Then the only solution right now I see is to get back to v1:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/388199.html
which at least handles correctly device registration when power domain 
driver
is available. You pointed that the patch cannot be applied, because failure
of dev_pm_domain_attach() will be fatal for device registration. Right now
lack of such call is fatal for the whole system, so there is really not a
big difference. Please also note that amba_get_enable_pclk() calls 
clk_get(),
which also might return -EPROBE_DEFER, which already breaks device
registration the same way.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
