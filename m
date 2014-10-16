From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL 2/2] Samsung defconfig updates for v3.18
Date: Fri, 17 Oct 2014 08:00:47 +0900
Message-ID: <54404E1F.7040607@samsung.com>
References: <543DB158.7030303@samsung.com> <CAOesGMgRBq93diDmA-21UYkFQTZu+LiF9gV+A==GS5uGW9n-Vg@mail.gmail.com> <1413380267.4565.1.camel@collabora.co.uk> <00e601cfe8dc$abf25bb0$03d71310$@kernel.org> <CABxcv==HK5F5vv7g7XXBLofTVxx9Q8ZYj6bPfeMS7rWKTMb5pg@mail.gmail.com> <014e01cfe917$20adbb90$620932b0$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:36259 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106AbaJPXAy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 19:00:54 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so4013053pdi.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Oct 2014 16:00:54 -0700 (PDT)
In-Reply-To: <014e01cfe917$20adbb90$620932b0$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Javier Martinez Canillas' <javier@dowhile0.org>, 'Olof Johansson' <olof@lixom.net>, 'Arnd Bergmann' <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Chanwoo Choi' <cw00.choi@samsung.com>

On 10/16/14 16:59, Kukjin Kim wrote:
> Javier Martinez Canillas wrote:
>>
>> Hello Kukjin,
>>
> Hi,
>
>> On Thu, Oct 16, 2014 at 3:01 AM, Kukjin Kim<kgene@kernel.org>  wrote:
>>> Sjoerd Simons wrote:
>>>>> On Tue, 2014-10-14 at 23:32 -0700, Olof Johansson wrote:
>>>>> On Tue, Oct 14, 2014 at 4:27 PM, Kukjin Kim<kgene.kim@samsung.com>  wrote:
>>>>>>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>>>>>> tags/samsung-defconfig
>>>>>>
>>>>>> for you to fetch changes up to 508423bebcda29eb0ba7c627f895387dad7cdcd6:
>>>>>>
>>>>>>    ARM: exynos_defconfig: enable USB gadget support (2014-09-25 18:20:18
>>>>>> +0900)
>>>>>
>>>>> Merged, thanks.
>>>>
>>>> Hrm, enabling USB gadget support will actually regress USB on Exynos
>>>> peach boards and Arndale Octa without some of the DT fixes that landed
>>>> in armsoc next/late branch. Specifically:
>>>>
>>>> 5c42acdbffff9bab595482b966b22ab5e2f6f359
>>>> dbb62ef9ade6e92737d3fac199665b8b7c455959
>>>>
>>> Yeah...I've missed it. Sorry.
>>>
>>>> Might be good to cherry-pick those into for-next at this point (they're
>>>> rather trivial)
>>>>
>>> So...Olof, can you please cherry pick them into arm-soc/fixes? Or shall I send
>>> pull-request for them again?
>>>
>>
> + Arnd, Olof and regarding MLs
>
>> There are other bugfixes for 3.18 that ended in next/late so it would
>> be good if you do a new pull request to include those as well.
>>
>> The commits (with hashes from linux-next) are:
>>
>> 3f3d046 ARM: dts: Remove display timings node from exynos5250-snow
>> dd12ac7 ARM: dts: Fix chip select GPIO on exynos5250-smdk5250
>
Above patches are not required because there is no my wrong merge ;)

>> c04c92e ARM: dts: Add rtc_src clk for s3c-rtc on exynos5250-snow
>> 8bd43b6 ARM: dts: Add rtc_src clk for s3c-rtc on exynos Peach boards
>>
> I checked its dependent clock patches have been merged into mainline just now.
> As you know, the patches blocked dt patches in this time :( Anyway, I'll try
> to send a pull-request with including above patches tonight.
>
Hmm...

+ Chanwoo

I didn't look at the Chanwoo's patch closely at that time but I think we 
don't need to register rtc_src clock for all other Samsung stuff if we 
don't want to gate the clock for rtc driver. So the rtc driver would be 
fixed like below for all Samsung stuff...

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index a6b1252..84f3cbd 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -535,13 +535,14 @@ static int s3c_rtc_probe(struct platform_device *pdev)
  	}
  	clk_prepare_enable(info->rtc_clk);

-	info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
-	if (IS_ERR(info->rtc_src_clk)) {
-		dev_err(&pdev->dev, "failed to find rtc source clock\n");
-		return PTR_ERR(info->rtc_src_clk);
+	if (info->data->needs_src_clk)
+		info->rtc_src_clk = devm_clk_get(&pdev->dev, "rtc_src");
+		if (IS_ERR(info->rtc_src_clk)) {
+			dev_err(&pdev->dev, "failed to find rtc source clock\n");
+			return PTR_ERR(info->rtc_src_clk);
+		}
+		clk_prepare_enable(info->rtc_src_clk);
  	}
-	clk_prepare_enable(info->rtc_src_clk);
-

  	/* check to see if everything is setup correctly */
  	if (info->data->enable)


> Thanks for your gentle reminder.
>
> Olof, I think it makes sense because it is related fixes for 3.18 ;)
>
> Sorry for late noise...
>
> Thanks,
> Kukjin
