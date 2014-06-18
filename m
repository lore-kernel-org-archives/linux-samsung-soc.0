From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: MMC regression with linux-next on Exynos5250
Date: Wed, 18 Jun 2014 13:13:26 +0200
Message-ID: <CAPDyKFp2c8mtCZHHDTgpAHt6t0bh-7O8ugbMxN30L2hfh6-kXA@mail.gmail.com>
References: <CAK5sBcEVEWwyHLj_y1=eTqWNELuahMUwrtyX2W_YzLe70Dsa4A@mail.gmail.com>
	<53A167DB.2000701@samsung.com>
	<CAK5sBcHwteYZBf4S=m8WvL68_qkPqO=BVC6yWMfK3x17a9p5-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:65263 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965421AbaFRLN1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 07:13:27 -0400
Received: by mail-qg0-f43.google.com with SMTP id z60so567604qgd.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2014 04:13:27 -0700 (PDT)
In-Reply-To: <CAK5sBcHwteYZBf4S=m8WvL68_qkPqO=BVC6yWMfK3x17a9p5-A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>, "tgih.jun@samsung.com" <tgih.jun@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 18 June 2014 13:10, Sachin Kamat <sachin.kamat@samsung.com> wrote:
> Hi Jaehoon,
>
> On Wed, Jun 18, 2014 at 3:50 PM, Jaehoon Chung <jh80.chung@samsung.com> wrote:
>> Hi, Sachin.
>>
>> Did you check the below patch?
>> https://patchwork.kernel.org/patch/4346781/
>
> Thanks for the patch. But even with this patch, I continue to get the
> aforementioned crash.

Hi Sachin / Jaehoon,

Until we sorted out the problem, I will drop the related patch from my mmc tree.

Kind regards
Uffe
