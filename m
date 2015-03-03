From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH v2 3/3] ARM: dts: exynos5420: add async-bridge clocks
 to disp1 power domain
Date: Tue, 03 Mar 2015 09:12:20 +0100
Message-ID: <54F56CE4.8000704@collabora.co.uk>
References: <54D48701.10105@collabora.co.uk> <1423220154-5333-1-git-send-email-a.hajda@samsung.com> <54D4A534.8060004@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34275 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500AbbCCIMZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Mar 2015 03:12:25 -0500
In-Reply-To: <54D4A534.8060004@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Liquid.Acid@gmx.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

Hello Kukjin,

On 02/06/2015 12:27 PM, Javier Martinez Canillas wrote:
> Hello Andrzej,
> 
> On 02/06/2015 11:55 AM, Andrzej Hajda wrote:
>> FIMD and MIXER IPs in disp1 power domain have async-bridges (to GSCALER),
>> therefore their clocks should be enabled during power domain switch.
>> 
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>> Hi,
>> 
>> This is 2nd version of the patch. After decrypting manual and discussion
>> with Marek I guess this set of clocks is more apropriate - async-bridges
>> are present in MIXER and FIMD, so their clocks should be enabled.
>>
> 
> I just tested this version on my Exynos5420 Peach Pit and the power domain
> failed error does not happen anymore even after enabling and disabling the
> HDMI display several times.
> 
> Thanks a lot for fixing this since the dependency was not clear to me from
> reading the manual.
> 
>> The 1st version worked for me due to fact I have forgot to remove
>> clk_ignore_unused kernel boot option during tests ;)
>>
> 
> Yes, that has bitten me too many times as well :)
> 
>> Regards
>> Andrzej
>> ---
> 
> Best regards,
> Javier
> 

Could you please pick this patch and patches 1/2 and 2/3 from the series [0]?

These are needed to fix DISP1 power domain issues and HDMI on Exynos542x.

Thanks a lot and best regards,
Javier

[0]: https://lkml.org/lkml/2015/2/5/265
