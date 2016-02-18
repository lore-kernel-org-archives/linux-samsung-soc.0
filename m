From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [RFT] regulator: s2mps11: Simplify expression used in BUILD_BUG_ON
 for some of preprocessors
Date: Thu, 18 Feb 2016 09:25:37 +0900
Message-ID: <56C50F81.8030202@samsung.com>
References: <1455696653-27023-1-git-send-email-k.kozlowski@samsung.com>
 <02874ECE860811409154E81DA85FBB58579A1F19@ORSMSX115.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:27279 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161199AbcBRAZo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Feb 2016 19:25:44 -0500
In-reply-to: <02874ECE860811409154E81DA85FBB58579A1F19@ORSMSX115.amr.corp.intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Keller, Jacob E" <jacob.e.keller@intel.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>

On 18.02.2016 05:37, Keller, Jacob E wrote:
> Hi,
> 
>> -----Original Message-----
>> From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-
>> owner@vger.kernel.org] On Behalf Of Krzysztof Kozlowski
>> Sent: Wednesday, February 17, 2016 12:11 AM
>> To: Sangbeom Kim <sbkim73@samsung.com>; Krzysztof Kozlowski
>> <k.kozlowski@samsung.com>; Liam Girdwood <lgirdwood@gmail.com>;
>> Mark Brown <broonie@kernel.org>; linux-kernel@vger.kernel.org; linux-
>> samsung-soc@vger.kernel.org
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Subject: [RFT] regulator: s2mps11: Simplify expression used in
>> BUILD_BUG_ON for some of preprocessors
>>
>> Apparently some preprocessors have problems with interpreting
>> BUILD_BUG_ON such as:
>> 	var = ARRAY_SIZE(s2mps15_regulators);
>> 	BUILD_BUG_ON(S2MPS_REGULATOR_MAX < var);
>> so let make it more obvious for them.
>>
> 
> Doesn't have much to do with the preprocessor, but rather exactly how the compiler optimizes the variable. Some kernel configurations also impact this, and it heavily depends on whether the compiler actually optimizes away the variable. BUILD_BUG_ON may work a lot of the time, depending heavily on the compiler.
> 
> BUILD_BUG_ON only works for constant expressions, so it is safer to put the value in directly, because using a variable will only work if the compiler optimizes the use of a variable away entirely. In this case it is somewhat surprising that it doesn't, but would depend on what compiler version and what kernel build rules you were using. For example allmodconfig ends up selecting everything yes if it's not a module for kernel build options and results in some BUILD_BUG_ON failures because of that)

Right, thanks for detailed explanation. Arnd confirmed that patch fixes
encountered issue (gcc 4.9 with UBSAN).

I'll change the commit message and re-submit.

Best regards,
Krzysztof
