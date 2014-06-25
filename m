From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/6] ARM: SAMSUNG: Restore Samsung PM Debug functionality
Date: Wed, 25 Jun 2014 13:41:43 +0200
Message-ID: <53AAB577.4010009@samsung.com>
References: <1403618235-19353-1-git-send-email-t.figa@samsung.com>
 <1403618235-19353-5-git-send-email-t.figa@samsung.com>
 <CAD8Lp46GpaGzq+2bkyujRtSVYJt7PWWT47NvjifoxzJk7aKs6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50347 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751598AbaFYLmK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:42:10 -0400
In-reply-to: <CAD8Lp46GpaGzq+2bkyujRtSVYJt7PWWT47NvjifoxzJk7aKs6A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

On 25.06.2014 12:09, Daniel Drake wrote:
> Hi Tomasz,
> 
> On Tue, Jun 24, 2014 at 2:57 PM, Tomasz Figa <t.figa@samsung.com> wrote:
>> Due to recently merged patches and previous merge conflicts, the Samsung
>> PM Debug functionality no longer can be enabled. This patch fixes
>> incorrect dependency of SAMSUNG_PM_DEBUG on an integer symbol and adds
>> missing header inclusion.
> 
> Testing against 3.16-rc2, this doesn't quite work for me.
> SAMSUNG_PM_DEBUG still doesn't appear in menuconfig.
> 
> HAVE_SAMSUNG_PM_DEBUG is 'n'. Looks like the select from
> DEBUG_S3C_UART is not working, but I'm not sure why.

I hastily changed this to something simpler in last minute before
sending without proper testing. Let me send something that works.

Best regards,
Tomasz
