From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: SAMSUNG: Add device definition for HSMMC3
Date: Sun, 04 Jul 2010 11:22:59 +0200
Message-ID: <4C3052F3.4080208@gmail.com>
References: <1278115660-20969-1-git-send-email-kgene.kim@samsung.com> <1278115660-20969-2-git-send-email-kgene.kim@samsung.com> <4C2E81AC.3090707@gmail.com> <009501cb1a4e$04f57ec0$0ee07c40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:57482 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754945Ab0GDJXE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Jul 2010 05:23:04 -0400
Received: by eya25 with SMTP id 25so45671eya.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2010 02:23:01 -0700 (PDT)
In-Reply-To: <009501cb1a4e$04f57ec0$0ee07c40$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Hyuk Lee' <hyuk1.lee@samsung.com>

 Op 03-07-10 03:21, Kukjin Kim schreef:
> Maurus Cuelenaere wrote:
>>  Op 03-07-10 02:07, Kukjin Kim schreef:
>>
>>>  /* S3C6400 SDHCI setup */
>>>
>>> @@ -264,10 +267,22 @@ static inline void s5pv210_default_sdhci2(void)
>>>  static inline void s5pv210_default_sdhci2(void) { }
>>>  #endif /* CONFIG_S3C_DEV_HSMMC2 */
>>>
>>> +#ifdef CONFIG_S3C_DEV_HSMMC3
>>> +static inline void s5pv210_default_sdhci3(void)
>>> +{
>>> +	s3c_hsmmc3_def_platdata.clocks = s5pv210_hsmmc_clksrcs;
>>> +	s3c_hsmmc3_def_platdata.cfg_gpio = s5pv210_setup_sdhci3_cfg_gpio;
>>> +	s3c_hsmmc3_def_platdata.cfg_card = s5pv210_setup_sdhci_cfg_card;
>>> +}
>>> +#else
>>> +static inline void s5pv210_default_sdhci3(void) { }
>>> +#endif /* CONFIG_S3C_DEV_HSMMC3 */
>> This could be simplified by putting the #ifdef inside the function.
> Yeah, you're right..but used same style with others in this file.
> ...so will modify it as your comment with others soon.

Hmm yes, I guess it's just a matter of personal taste.

-- 
Maurus Cuelenaere
