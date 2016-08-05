From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/8] ASoC: uda134x: Optionally initialize L3 ops to default
 GPIO ops
Date: Fri, 05 Aug 2016 10:48:19 +0200
Message-ID: <e2dbe62b-8767-d0a5-a133-e927cfce98d4@samsung.com>
References: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
 <1470317928-25365-4-git-send-email-s.nawrocki@samsung.com>
 <20160804210323.GK10383@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35918 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757779AbcHEIsb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Aug 2016 04:48:31 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBF005SFHSRAD20@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 05 Aug 2016 09:48:28 +0100 (BST)
In-reply-to: <20160804210323.GK10383@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: krzk@kernel.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/04/2016 11:03 PM, Mark Brown wrote:
> Does L3 actually support multiple devices?

>From the bus operation description in a few datasheets of the Philips'
UDA13XX codecs I have checked I would say it's possible to have multiple
devices working on same bus.  The slave devices are selectable by 6
most significant bits of the address byte and the device addresses
seem to be unique at first sight.

"In the event that the UDA1341TS receives a different address, it will
deselect its microcontroller interface logic." (ch. 7.19 [1])

However I can't answer yes for sure, I've never seen multiple device
operation mentioned explicitly in the datasheets nor such an hardware
configuration.

[1] http://www.nxp.com/documents/data_sheet/UDA1341TS.pdf
