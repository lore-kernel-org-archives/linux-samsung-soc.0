From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: s3c64xx: cpuidle - declare the states with the
 new api
Date: Sun, 20 May 2012 02:35:05 +0900
Message-ID: <4FB7D9C9.1020004@samsung.com>
References: <1337004377-17732-1-git-send-email-daniel.lezcano@linaro.org> <1337004377-17732-2-git-send-email-daniel.lezcano@linaro.org> <20120517122802.GG26337@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:56598 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753686Ab2ESRfM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 May 2012 13:35:12 -0400
Received: by pbbrp8 with SMTP id rp8so5230354pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 10:35:11 -0700 (PDT)
In-Reply-To: <20120517122802.GG26337@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

On 05/17/12 21:28, Mark Brown wrote:
> On Mon, May 14, 2012 at 04:06:16PM +0200, Daniel Lezcano wrote:
>> The states are now part of the cpuidle_driver structure, so we can
>> declare the states in this structure directly. That saves us an extra
>> variable declaration and a memcpy.
>
> Tested-by: Mark Brown<broonie@opensource.wolfsonmicro.com>

Thanks for testing, applied this series.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
