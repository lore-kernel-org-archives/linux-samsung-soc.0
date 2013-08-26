From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFC] cleanup mach-s5p*
Date: Mon, 26 Aug 2013 13:54:59 +0200
Message-ID: <521B4213.8040601@samsung.com>
References: <1f7b01cea1f6$9560aa10$c021fe30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37982 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524Ab3HZLzE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 07:55:04 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MS400M4EZQ30G90@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Aug 2013 12:55:01 +0100 (BST)
In-reply-to: <1f7b01cea1f6$9560aa10$c021fe30$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, =?UTF-8?B?IlRvbWFzeiBGaWdhLw==?= =?UTF-8?B?U1JQT0wtS2VybmVsICYgU3lzdGVtIEZyYW1ld29yayAoU1NEKS8uL+yCvOyEseyghA==?= =?UTF-8?B?7J6QIg==?= <t.figa@samsung.com>, =?UTF-8?B?IlN5bHdlc3RlciBOYXdy?= =?UTF-8?B?b2NraS9TUlBPTC1LZXJuZWwgJiBTeXN0ZW0gRnJhbWV3b3JrIChTU0QpLy4v7IK8?= =?UTF-8?B?7ISx7KCE7J6QIg==?= <s.nawrocki@samsung.com>, m.krawczuk@partner.samsung.com

Hi Kukjin,

On 8/26/2013 2:52 AM, Kukjin Kim wrote:
> Hi all,
>
> I have a plan to remove supporting following SoCs in mainline in the near
> future.
> - s5pc100 - smdkc100
> - s5pv210(s5c110) - aquial, goni, smdkc110, smdkv210, torbreck
> - s5p64x0(s5p6440, s5p6450)- smdk6440, smdk6450
>
> I think users don't seem to use that any more with mainline. If so, we are
> able to consider, it is not right now though.
>
> How do you think?

I am against removing support for S5PC110/S5PV210. We still use it for some
of our internal development. DT support patches will be posted soon (pinctrl
and clocks). Support for S5PC100 can be easily added the same way (we also
have DT patches almost ready). S5PV210, S5PC100 and the older S3C64xx can
all be handled by the same Samsung-DT 'machine file'.

However we don't have any s5p64x0 based boards to develop DT support for
them.

Best regards
-- 
Marek Szyprowski
Samsung R&D Institute Poland
