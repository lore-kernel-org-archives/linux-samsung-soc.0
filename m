From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/6] ARM: dts: Add MFC codec support to SMDKV310 DT
Date: Wed, 30 Jan 2013 11:42:58 +0530
Message-ID: <CAK9yfHy8bp8-19jZ_bQQ8MDT3Bvpg_SyWMnA8PFnQuay4=pwMw@mail.gmail.com>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
	<1359432822-23846-4-git-send-email-sachin.kamat@linaro.org>
	<5107D167.4050209@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:38118 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751482Ab3A3GM6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 01:12:58 -0500
Received: by mail-oa0-f53.google.com with SMTP id m1so418979oag.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 22:12:58 -0800 (PST)
In-Reply-To: <5107D167.4050209@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org

Hi Sylwester,

>> +     codec@13400000 {
>> +             samsung,mfc-r = <0x43000000 0x800000>;
>> +             samsung,mfc-l = <0x51000000 0x800000>;
>
> With the change as I proposed in patch 2/6 you need to add:
>
>                 status = "okay";
>
> in this node and for all other boards in the further patches
> in this series.

Right. Will update the series with your comments and re-send it.
Thank you for reviewing.

-- 
With warm regards,
Sachin
