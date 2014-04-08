From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: AFTR does not work on arndale 5250
Date: Tue, 08 Apr 2014 13:01:29 +0200
Message-ID: <5343D709.10708@samsung.com>
References: <533EAE57.1080202@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20284 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754698AbaDHLBf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 07:01:35 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3P00GK7LAJ7300@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Apr 2014 12:01:31 +0100 (BST)
In-reply-to: <533EAE57.1080202@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, Vikas Sajjan <vikas.sajjan@samsung.com>

Hi Daniel,

On 04.04.2014 15:06, Daniel Lezcano wrote:
>
> Hi,
>
> I tried to make the idle AFTR state working on arndale 5250 but that
> leads to a kernel reboot and crash.
>
> How to reproduce ?
>
> echo 0 > /sys/devices/system/cpu/cpu1/online
>
> Reproductible on v3.14 and samsung/for-next
>
> Any ideas ?

Added some people that I know that have been working with Arndale.

Best regards,
Tomasz
