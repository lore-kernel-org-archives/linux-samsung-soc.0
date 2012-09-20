From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/6] pinctrl: samsung: Various fixes
Date: Thu, 20 Sep 2012 23:29:13 +0900
Message-ID: <505B2839.1040600@samsung.com>
References: <1348131104-24828-1-git-send-email-t.figa@samsung.com> <CACRpkdbTPQvGSHJU_odGFtr5snb=U+L2Yuo-AhgX55hF6V5Lqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43739 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755400Ab2ITO3V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Sep 2012 10:29:21 -0400
Received: by pbbrr4 with SMTP id rr4so327956pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Sep 2012 07:29:21 -0700 (PDT)
In-Reply-To: <CACRpkdbTPQvGSHJU_odGFtr5snb=U+L2Yuo-AhgX55hF6V5Lqw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com

On 09/20/12 19:25, Linus Walleij wrote:
> On Thu, Sep 20, 2012 at 10:51 AM, Tomasz Figa<t.figa@samsung.com>  wrote:
>
>> This patch series contains various fixes of problems and nitpicks spotted when
>> working on adding support for Exynos4x12. See each patch for more detailed
>> information.
>
> This all looks good, do you want me to take this into the pinctrl tree
> or will it go through Samsung ARM SoC (Kyungmin)?
>
> In the latter case, Acked-by: Linus Walleij<linus.walleij@linaro.org>
> for all, else poke me and I'll apply them.
>
Linus, thanks for your ack and looks OK to me. Since now pinctrl-exynos 
driver is in my tree so let me pick this series on top of it into 
Samsung tree with your ack.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
