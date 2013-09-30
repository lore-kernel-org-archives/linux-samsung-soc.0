From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH V2] ARM: EXYNOS: implement pm_power_off for EXYNOS5440
Date: Mon, 30 Sep 2013 13:56:39 +0530
Message-ID: <CAK9yfHyQdswnNXVo_Wwz7y40URGOzecJ0juqFeSAMsDO1K3Nmw@mail.gmail.com>
References: <003101cebd7c$ded3a610$9c7af230$%lee@samsung.com>
	<CAK9yfHywzpbuYag4RM_00Z5UdQ0qY3y0iDzyY1Yt8KYh83Z3pA@mail.gmail.com>
	<003401cebd9c$d29c75a0$77d560e0$%lee@samsung.com>
	<069501cebdae$357285a0$a05790e0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:33276 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752771Ab3I3I0j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Sep 2013 04:26:39 -0400
Received: by mail-oa0-f54.google.com with SMTP id n5so3676733oag.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2013 01:26:39 -0700 (PDT)
In-Reply-To: <069501cebdae$357285a0$a05790e0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Jungseok Lee <jays.lee@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 30 September 2013 12:55, Kukjin Kim <kgene@kernel.org> wrote:

>>
> I think current patch looks good to me, and in this case I don't have any
> idea why we should macro for just one time usage.

It is not the question of one time usage, it is just to make the code
more readable.

-- 
With warm regards,
Sachin
