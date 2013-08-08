From: Arun Kumar K <arunkk.samsung@gmail.com>
Subject: Re: [PATCH] [media] exynos-gsc: fix s2r functionality
Date: Thu, 8 Aug 2013 07:44:00 +0530
Message-ID: <CALt3h7_s2K4Kh5MGghBFHO_id+eA_fwJ2+B1FeSmV0J80d9Dqg@mail.gmail.com>
References: <1375879984-19052-1-git-send-email-arun.kk@samsung.com>
	<52027B9C.7020704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f49.google.com ([209.85.212.49]:34403 "EHLO
	mail-vb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932506Ab3HHCOB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 22:14:01 -0400
In-Reply-To: <52027B9C.7020704@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: LMML <linux-media@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, prathyush.k@samsung.com, arun.m@samsung.com

Hi Sylwester,


On Wed, Aug 7, 2013 at 10:23 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 08/07/2013 02:53 PM, Arun Kumar K wrote:
>> From: Prathyush K <prathyush.k@samsung.com>
>>
>> When gsc is in runtime suspended state, there is no need to call
>> m2m_suspend during suspend and similarily, there is no need to call
>
> s/similarily/similarly. I'll fix that typo when applying.
>

Thanks.

>> m2m_resume during resume if already in runtime suspended state. This
>> patch adds the necessary conditions to achieve this.
>>
>> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
>> Signed-off-by: Arun Mankuzhi <arun.m@samsung.com>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>
> Thanks, that looks good. I'll queue it for 3.12. We actually have
> similar patch for the exynos4-is fimc-is-i2c driver.
>
> However this is sort of things that IMO should ideally be handled
> in the PM core.
>

Yes indeed.

Regards
Arun
