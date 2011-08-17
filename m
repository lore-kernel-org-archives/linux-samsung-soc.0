From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Modify the devname for pl330 clock
Date: Wed, 17 Aug 2011 13:25:48 +0300
Message-ID: <CAMW3pwZXtDba6DsU5C-oLCcMLyXVaJQmLbzsvEwG97pO6YmdrA@mail.gmail.com>
References: <1313540801-12054-1-git-send-email-boojin.kim@samsung.com>
	<4E4B5CD9.7060703@mleia.com>
	<001601cc5cba$27b49400$771dbc00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:57192 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752133Ab1HQKZt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2011 06:25:49 -0400
Received: by yxj19 with SMTP id 19so612629yxj.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Aug 2011 03:25:49 -0700 (PDT)
In-Reply-To: <001601cc5cba$27b49400$771dbc00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Hi,

On Wed, Aug 17, 2011 at 11:46 AM, Boojin Kim <boojin.kim@samsung.com> wrote:
> Vladimir Zapolskiy wrote:
>> Hi,
>>
>> looks like it contains my series as a subset.
>
> As I replied on your patches, yes, I know that. I sent it before see your
> patch.
> Do you add the missing about s5p64x0 in your patch?
> If not, I will split up this patch to get missing about s5p64x0 in your
> patch.

No, I haven't added that. In my opinion it would be nice, if you can
split the patch and fix more incorrespondent device names for s5p64x0,
or probably it might be done at once replacing my version of the
change for s5p64x0 only.

Thank you a lot!

--
With best wishes,
Vladimir
