From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 0/2] Add missing fixed regulators on Origen board
Date: Mon, 31 Dec 2012 08:23:22 +0530
Message-ID: <50E0FE22.8070406@linaro.org>
References: <1356683670-30451-1-git-send-email-tushar.behera@linaro.org> <CAOesGMi_bmm9ZpiMzVHN=YUmsLSvyiUyvKRq5DxDmxnMu+Z-tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:57195 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716Ab2LaCx3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 Dec 2012 21:53:29 -0500
Received: by mail-pa0-f51.google.com with SMTP id fb11so6881981pad.38
        for <linux-samsung-soc@vger.kernel.org>; Sun, 30 Dec 2012 18:53:28 -0800 (PST)
In-Reply-To: <CAOesGMi_bmm9ZpiMzVHN=YUmsLSvyiUyvKRq5DxDmxnMu+Z-tQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 12/30/2012 11:55 AM, Olof Johansson wrote:
> Hi,
> 
> On Fri, Dec 28, 2012 at 12:34 AM, Tushar Behera
> <tushar.behera@linaro.org> wrote:
>> This patchset adds vmmc and hdmi-en regulators for Origen board.
>>
>> Tushar Behera (2):
>>   ARM: EXYNOS: Add vmmc regulator for Origen board
>>   ARM: EXYNOS: Add hdmi-en regulator for Origen board
> 
> The vmmc one seems to already be there in the dts file for origen. It
> looks like the HDMI one is still needed though.
> 

DT enablement patches for HDMI driver were posted sometime back, but
they have not yet been merged in trunk. So HDMI regulator entry for DT
will be added after that.

> Please move to using DT board files instead of expanding the legacy board files.
> 

Sure, the focus would be on adding DT support.

Legacy board support for Origen is pretty much complete with support for
various multimedia drivers, so it provides a good environment for
testing different features. It would be good to get these patches in for
enabling HDMI support, which otherwise would be broken if
REGULATOR_DUMMY is not defined.

> 
> -Olof
> 


-- 
Tushar Behera
