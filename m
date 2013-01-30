From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/6] ARM: dts: Update MFC DT binding documentation
Date: Wed, 30 Jan 2013 11:19:29 +0530
Message-ID: <CAK9yfHzK_J5Xu9m8_-b65MrsOFP4oH2Z_+Ea5O7oBCzKmgw6SA@mail.gmail.com>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
	<1359432822-23846-2-git-send-email-sachin.kamat@linaro.org>
	<5107CF9D.6000200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:55631 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145Ab3A3Fta (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 00:49:30 -0500
Received: by mail-oa0-f43.google.com with SMTP id l10so1314980oag.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 21:49:29 -0800 (PST)
In-Reply-To: <5107CF9D.6000200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org, Arun Kumar K <arun.kk@samsung.com>

Hi Sylwester,

>> +Example:
>
> Maybe adding a comment that this is a SoC...
>
>> +mfc: codec@13400000 {
>> +     compatible = "samsung,mfc-v5";
>> +     reg = <0x13400000 0x10000>;
>> +     interrupts = <0 94 0>;
>> +};
>
> and the board specific part would make it more clear ?

Absolutely :)

>
>> +codec@13400000 {
>> +     samsung,mfc-r = <0x43000000 0x800000>;
>> +     samsung,mfc-l = <0x51000000 0x800000>;
>> +};
>
> Also please note that in the first node above you need
> status = "disabled"; line, so the MFC is disabled by default.
> Then in dts files for boards that use the codec it can be
> overridden to enable the device as needed.

Right.


-- 
With warm regards,
Sachin
