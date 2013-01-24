From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: DTS: exynos5250-arndale: Add initial board support
 file
Date: Thu, 24 Jan 2013 14:52:05 +0530
Message-ID: <5100FD3D.7080206@linaro.org>
References: <1359008188-23395-1-git-send-email-tushar.behera@linaro.org> <CAGOxZ53VsXE_as6aNk85jdxVG2FAg-SqWc8svTHpgrcttE_q0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:57609 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752529Ab3AXJWN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jan 2013 04:22:13 -0500
Received: by mail-pa0-f44.google.com with SMTP id hz11so5383510pad.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jan 2013 01:22:12 -0800 (PST)
In-Reply-To: <CAGOxZ53VsXE_as6aNk85jdxVG2FAg-SqWc8svTHpgrcttE_q0w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org, Girish K S <ks.giri@samsung.com>

On 01/24/2013 12:21 PM, Alim Akhtar wrote:

>> +
>> +       i2c@12CC0000 {
>> +               status = "disabled";
>> +       };
>> +
>> +       i2c@12CD0000 {
>> +               status = "disabled";
>> +       };
>> +
>> +       i2c@121D0000 {
>> +               status = "disabled";
>> +       };
>> +
> 
> Why to disable these i2c devices here? Any particular reason?
> You can moves these to exynos5250.dtsi which is suppose to be common
> for all the exynos5250 platforms.
> Please see the exynos4.dtsi for reference.
> 

Agreed. There was a discussion going on in [1] related to this. Since
there was no consensus on that, I preferred to go with the current
approach that is followed for other EXYNOS5250 based scripts.

If it is agreed by Kukjin to move to Exynos4 style, then I can submit
patches for that.

[1]
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg15013.html

-- 
Tushar Behera
