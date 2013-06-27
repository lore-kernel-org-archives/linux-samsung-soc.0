From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Remove combiner_init declaration
Date: Thu, 27 Jun 2013 19:50:37 +0530
Message-ID: <CAK9yfHx2sQ38xHDM0CyS_+0HP_gLq+XnaJf5PNyLbOFM_LbR+g@mail.gmail.com>
References: <1372246597-32323-1-git-send-email-sachin.kamat@linaro.org>
	<201306261602.26800.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:47634 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569Ab3F0OUi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Jun 2013 10:20:38 -0400
Received: by mail-ob0-f176.google.com with SMTP id v19so776582obq.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Jun 2013 07:20:38 -0700 (PDT)
In-Reply-To: <201306261602.26800.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, tglx@linutronix.de, t.figa@samsung.com, patches@linaro.org

On 26 June 2013 19:32, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 26 June 2013, Sachin Kamat wrote:
>> Commit d243997f ("ARM: EXYNOS: Remove legacy interrupt initialization
>> code") removed the call to combiner_init(). Since there are no more
>> users in the machine code, remove the declaration as well.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>
> Hi,
>
> Your two patches look good to me, but I think there is more that
> can be cleaned up now. See below for my experimental patch.
> I have not gotten around to test or submit that, but feel
> free to take any contents for your own patches.

Thanks Arnd. Let me look into it.

-- 
With warm regards,
Sachin
