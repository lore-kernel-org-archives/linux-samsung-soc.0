From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] i2c: s3c2410: Remove class based instantiation
Date: Tue, 03 Jun 2014 14:18:22 +0200
Message-ID: <538DBD0E.1070504@gmail.com>
References: <1401786022-29587-1-git-send-email-sachin.kamat@samsung.com> <20140603100546.GA12261@katana> <CAK5sBcEkCy0kDL_bG_RsDJ6nwuqZeAGN0fXpPV-MJkHugxuubw@mail.gmail.com> <538DB979.1030305@gmail.com> <20140603121712.GB2713@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:44600 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932109AbaFCMSl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jun 2014 08:18:41 -0400
In-Reply-To: <20140603121712.GB2713@katana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ch.naveen@samsung.com, Olof Johansson <olof@lixom.net>

On 03.06.2014 14:17, Wolfram Sang wrote:
> 
>> Couldn't it be made configurable with a Kconfig entry? E.g. "Enable
>> deprecated class-based instantiation" under Drivers / I2C? Turning it
>> off could make the code ignore the class field completely.
> 
> Technically, yes. But we could also wait another cycle and just be done
> with it :)
> 

OK, if it's just one cycle, then it wouldn't make sense indeed. Thanks
for clarification.

Best regards,
Tomasz
