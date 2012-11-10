From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] ARM: S3C64XX: Staticly define parent clock of "camera"
 clock
Date: Sat, 10 Nov 2012 22:33:49 +0100
Message-ID: <509EC83D.8010704@gmail.com>
References: <1352556477-3700-1-git-send-email-y> <509e6047.a766980a.0f91.14f6@mx.google.com> <509EC391.9090506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:49241 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752451Ab2KJVdw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Nov 2012 16:33:52 -0500
Received: by mail-wg0-f44.google.com with SMTP id dr13so3330336wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Nov 2012 13:33:51 -0800 (PST)
In-Reply-To: <509EC391.9090506@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dron0gus@gmail.com, kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andrey Gusakov <dron_gus@mail.ru>

On 11/10/2012 10:13 PM, Sylwester Nawrocki wrote:
> On 11/10/2012 03:07 PM, dron0gus@gmail.com wrote:
>> From: Andrey Gusakov<dron_gus@mail.ru>
>>
>> The "camera" clock have only one parent. Define it staticly and

Forgot to point out a small typo here: staticly -> statically.

>> remove unused source clock list.
>>
>> Signed-off-by: Andrey Gusakov<dron0gus@gmail.com>
>
> Reviewed-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
