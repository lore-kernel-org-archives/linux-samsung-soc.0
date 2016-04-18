From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] regulator: s2mps11: Remove unused set_voltage_time_sel
Date: Mon, 18 Apr 2016 12:36:52 +0200
Message-ID: <5714B8C4.5070207@samsung.com>
References: <1460965378-5256-1-git-send-email-k.kozlowski@samsung.com>
 <20160418095713.GO3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41174 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860AbcDRKg5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Apr 2016 06:36:57 -0400
In-reply-to: <20160418095713.GO3217@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 04/18/2016 11:57 AM, Mark Brown wrote:
> On Mon, Apr 18, 2016 at 09:42:58AM +0200, Krzysztof Kozlowski wrote:
> 
>> On S2MPS11 and S2MPS14 devices the default implementation of
>> set_voltage_time_sel() for LDO regulators was not doing anything useful
>> because users did not provide ramp delay in Device Tree so the
>> set_voltage_time_sel() exited with status 0. This could be seen in
>> dmesg, e.g. on Odroid XU4:
> 
> That's not the bug, the bug is that the driver is providing the
> operation without providing a non-zero value for it.  The device tree
> configuration is to override what the driver is doing.

So your recommendation would be to set the ramp_delay value in
regulator_desc structure?

The problem is that value of 30 mv/us in datasheet looks untrustworthy
(copied from other pages) and vendor kernel (which should be a
reference) uses 12 mv/us. Anyway setting any value greater than 0 seems
like better idea than just sticking to 0...

Best regards,
Krzysztof
