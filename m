From: Ayaka <ayaka@soulik.info>
Subject: Re: [PATCH] ASoC: samsung: make audio interface/controller explicitly
Date: Mon, 19 Sep 2016 17:41:50 +0800
Message-ID: <1BBB8B7D-0C1B-48E0-A516-402515A04568@soulik.info>
References: <1474207751-9804-1-git-send-email-ayaka@soulik.info> <1474207751-9804-2-git-send-email-ayaka@soulik.info> <20160919083342.GE10189@sirena.org.uk>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=big5
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kozue.soulik.info ([108.61.200.231]:57005 "EHLO
        kozue.soulik.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbcISJmF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Sep 2016 05:42:05 -0400
In-Reply-To: <20160919083342.GE10189@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, sbkim73@samsung.com, s.nawrocki@samsung.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org



從我的 iPad 傳送

> Mark Brown <broonie@kernel.org> 於 2016年9月19日 下午4:33 寫道：
> 
>> On Sun, Sep 18, 2016 at 10:09:11PM +0800, Randy Li wrote:
>> 
>> It is simple sound card time, we could assign different codec
>> to a interface without making a specific driver for it.
> 
>> config SND_SAMSUNG_AC97
>> -    tristate
>> +    tristate "Samsung AC97 controller support"
>>    select SND_SOC_AC97_BUS
> 
> Are you *sure* simple-card works for AC'97?
Not sure. I could hardly find a AC97 device in embedded market. If it didn't I could disable it. I have only tested simple sound card for i2s and SPDIF.
