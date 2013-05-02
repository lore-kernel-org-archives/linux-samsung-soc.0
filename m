From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 8/9] s3c2410fb: Remove redundant platform_set_drvdata()
Date: Thu, 02 May 2013 22:11:07 +0200
Message-ID: <5182C85B.7090305@gmail.com>
References: <1367006543-5458-1-git-send-email-sylvester.nawrocki@gmail.com> <1367006543-5458-9-git-send-email-sylvester.nawrocki@gmail.com> <000001ce46f6$54f27cc0$fed77640$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f178.google.com ([209.85.215.178]:35216 "EHLO
	mail-ea0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753284Ab3EBULM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 May 2013 16:11:12 -0400
In-Reply-To: <000001ce46f6$54f27cc0$fed77640$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: kgene.kim@samsung.com, FlorianSchandinat@gmx.de, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi Jingoo,

On 05/02/2013 07:31 AM, Jingoo Han wrote:
> On Saturday, April 27, 2013 5:02 AM, Sylwester Nawrocki wrote:
>> >  driver_data field is being cleared by the driver core since
>> >  commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
>> >  device-core: Ensure drvdata = NULL when no driver is bound
>> >  hence there is no need to do it in the driver's remove() callback.

> How about eliminating platform_set_drvdata(pdev, NULL)
> in s3c24xxfb_probe() as well as s3c2410fb_remove()?

Ah, thanks for pointing out. Indeed, that could be dropped too, I've
overlooked it somehow. Will update and resend this patch shortly.

Regards,
Sylwester
