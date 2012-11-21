From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH] regulator: max8997: skip gpio dvs setup if not used
Date: Wed, 21 Nov 2012 23:31:16 +0900
Message-ID: <CAJ0PZbT-RD_jMpAesm9aegjpfzsimN-hAUX3ck7vJBOHH7EV5A@mail.gmail.com>
References: <1353507795-3516-1-git-send-email-thomas.abraham@linaro.org>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:57772 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754384Ab2KUObS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Nov 2012 09:31:18 -0500
In-Reply-To: <1353507795-3516-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, broonie@opensource.wolfsonmicro.com, linux-samsung-soc@vger.kernel.org

On Wed, Nov 21, 2012 at 11:23 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> If gpio based voltage selection for buck 1/2/5 are not used, then the execution
> of gpio dvs setup code during probe can be skipped completly.

Even if GPIO-DVS feature is turned off, you need to setup BUCKxDVS1 anyway.
Otherwise, you may get "unspecified" behavior from the BUCK1/2/5,
which may incur unstable system.


Cheers,
MyungJoo


-- 
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
